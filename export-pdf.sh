#!/bin/bash
# ブラウザ表示に近いPDFを生成（Chrome必須）
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
OUTPUT="${DIR}/presentation.pdf"
PORT=8765
HTML="http://127.0.0.1:${PORT}/index.html?export=$(date +%s)"

CHROME=""
for candidate in \
  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  "/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary" \
  "google-chrome" \
  "chromium"; do
  if [ -x "$candidate" ] || command -v "$candidate" >/dev/null 2>&1; then
    CHROME="$candidate"
    break
  fi
done

if [ -z "$CHROME" ]; then
  echo "Google Chrome が見つかりません。Chrome で index.html を開き、印刷 → PDFに保存してください。"
  exit 1
fi

# ローカルHTTPで配信（file:// だとフォント・アイコンが読み込まれないことがある）
python3 -m http.server "$PORT" --directory "$DIR" >/dev/null 2>&1 &
SERVER_PID=$!
cleanup() {
  kill "$SERVER_PID" 2>/dev/null || true
}
trap cleanup EXIT

sleep 1

echo "PDFを生成しています: ${OUTPUT}"
"$CHROME" \
  --headless=new \
  --disable-gpu \
  --disable-application-cache \
  --disk-cache-size=0 \
  --run-all-compositor-stages-before-draw \
  --virtual-time-budget=15000 \
  --no-pdf-header-footer \
  --print-to-pdf="${OUTPUT}" \
  "${HTML}"

echo "完了: ${OUTPUT}"
