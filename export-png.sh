#!/bin/bash
# Canva 向け: 各スライドを 1920×1080 PNG に書き出し（レイアウト崩れ防止）
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
PDF="${DIR}/presentation.pdf"
OUT_DIR="${DIR}/slides-canva"
PREFIX="slide"

if ! command -v pdftoppm >/dev/null 2>&1; then
  echo "pdftoppm が見つかりません。Homebrew: brew install poppler"
  exit 1
fi

if [ ! -f "$PDF" ] || [ "${1:-}" = "--refresh-pdf" ]; then
  echo "PDF を生成しています..."
  bash "${DIR}/export-pdf.sh"
fi

mkdir -p "$OUT_DIR"
rm -f "${OUT_DIR}/${PREFIX}-"*.png

echo "Canva 用 PNG を生成しています: ${OUT_DIR}/"
pdftoppm -png -scale-to-x 1920 -scale-to-y 1080 "$PDF" "${OUT_DIR}/${PREFIX}"

count=$(ls -1 "${OUT_DIR}/${PREFIX}-"*.png 2>/dev/null | wc -l | tr -d ' ')
echo "完了: ${count} 枚 → ${OUT_DIR}/"
echo ""
echo "Canva での使い方:"
echo "  1. 新規デザイン → プレゼンテーション（16:9）"
echo "  2. slides-canva/ 内の PNG をスライドごとにアップロード"
echo "  3. 各画像をスライド全面に配置（PDF の取り込みは使わない）"
