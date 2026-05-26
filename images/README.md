# プロダクト画像の置き方

説明スライド（Forest / recolle / Nostargia）の**右側**に、各4枚のスクリーンショットが表示されます。

## フォルダ構成

```
images/
  forest/     … slide5（Forest 説明）
  recolle/    … slide8（recolle 説明）
  nostargia/  … slide11（Nostargia 説明）
```

## ファイル名

| ファイル | 表示位置（右側グリッド） |
|---------|-------------------------|
| `01.png` | 左上 |
| `02.png` | 右上 |
| `03.png` | 左下 |
| `04.png` | 右下 |

`.jpg` を使う場合は `index.html` の該当 `src` の拡張子を合わせて変更してください。

## 推奨

- スマホのキャプチャ（縦長）でも `object-fit: contain` で収まります
- 配置後は `./export-pdf.sh` で PDF を再生成してください
