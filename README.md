# デジタルファブリケーション(コード)
初回3回分の授業はここを元に進めていきます。
[processing](https://processing.org/)を使って、2D,3Dを描画していきます。
上の"Clone or download"→"Download ZIP"で使うファイルをダウンロードしてください。

+ processingとは → [Processing とは - Processing 学習ノート](http://www.d-improvement.jp/learning/processing/class/about-processing.html)
 * オープンソースで開発されているプログラミング言語&統合開発環境
 * 視覚的な表現（イメージの生成、アニメーション、インタラクション）が他のプログラミング言語に比べてやりやすい
 * 開発環境の設定が簡単
 * ライブラリが豊富
+ githubとは
 * Gitを利用できるDropbox的なwebサービス
 * バージョン管理ができる → Gitだから[サルでもわかるGit入門](http://www.backlog.jp/git-guide/intro/intro1_1.html)
 * 基本的に作ったプログラムは公開される

## processingを触ってみる
1. processingを開く
1. とりあえず矢印ボタン"実行する"を押してみる → ちっさいグレーの画面が出る
1. ファイル → サンプル → "Basics"の中から好きなプログラムを開いてみる(Color,Input,Shapeあたりが面白い？)

## 基本
### プログラミングの基本
1. 変数
  + "数字"とか"文字"とかが入る箱
  + 変数はint(整数), float(浮動小数), String(文字列)とかがある
  + [http://www9.plala.or.jp/sgwr-t/c/sec02.html#s2-2](http://www9.plala.or.jp/sgwr-t/c/sec02.html#s2-2)
1. 演算子
  + 変数を計算するときに使う
  + "+", "-", "\*", "/", "%", "="とかがある。
  + [http://www9.plala.or.jp/sgwr-t/c/sec03.html](http://www9.plala.or.jp/sgwr-t/c/sec03.html)
1. 関数
  + 変数とか他の関数とかが入ってる"でかい箱"
  + プログラムを処理する部分
1. 制御文
  + プログラムを場合分けとか繰り返しとかしてくれる
  + ifとかforとかwhileとかがある。
  + [http://www9.plala.or.jp/sgwr-t/c/sec06.html](http://www9.plala.or.jp/sgwr-t/c/sec06.html)

## 2Dのデータを作る
processingの初歩をまず最初にやって、最終的に2DのデータをSVGで書き出します。
### processingで何か書く
/sample_firstと/sample_drawを参照してください。
### マウス
/sample_mouseと/sample_mouse_2を参照してください。
### 波形の描画
/sample_waveを参照してください。
### マイク
/sample_soundを参照してください。
### SVGの書き出し
/sample_svgと/sample_svg_v2を参照してください。

processingの[reference](https://processing.org/reference/)とか見るのが一番捗ると思います。
## 3Dのデータを作る
(久恒)
