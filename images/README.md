# プロダクト画像の置き方

説明スライド（Forest / recolle / Nostargia / beercheers）の**右側**に、各4枚のスクリーンショットが表示されます。  
ガクチカ（18祭）スライドの**右側**に、2枚の写真が表示されます。  
beercheers 説明スライドは **3枚** のスクリーンショットです（他作品は4枚）。

## フォルダ構成

```
images/
  18fes/       … ガクチカ（18祭）写真（2枚）
  forest/      … Forest 説明
  recolle/     … recolle 説明
  nostargia/   … Nostargia 説明
  beercheers/  … beercheers 説明
```

### 18fes（ガクチカ）

| ファイル | 表示位置（右側グリッド） |
|---------|-------------------------|
| `01.png` | 左 |
| `02.png` | 右 |

### beercheers（3枚）

| ファイル | 表示位置（右側グリッド） |
|---------|-------------------------|
| `01.png` | 左上 |
| `02.png` | 右上 |
| `03.png` | 下段中央 |

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

## 技術スタックアイコン（PNG）

タイトル横・技術スタックまとめスライドで使うロゴは `images/tech-icons/` に PNG で配置します。

| ファイル | 用途 |
|---------|------|
| `flutter.png` | Forest / recolle / まとめ |
| `dart.png` | Forest / recolle |
| `supabase.png` | Forest / recolle / Nostargia / まとめ |
| `react.png` | Nostargia / まとめ |
| `threejs.png` | Nostargia / まとめ |
| `typescript.png` | Nostargia / まとめ |
| `swift.png` | beercheers / まとめ |
| `firebase.png` | beercheers / まとめ |

### 各プロダクトの表示アイコン

| プロダクト | 表示するアイコン（左から） |
|-----------|---------------------------|
| Nostargia | react → threejs → typescript → supabase |
| Forest | flutter → dart → supabase |
| recolle | flutter → dart → supabase |
| beercheers | swift → firebase |

- 推奨サイズ: 正方形 64×64px 以上（透過 PNG）
- カラーロゴのまま配置できます
