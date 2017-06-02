# デジタルファブリケーション - processing（2D,3D）
平成29年度前期の集中講義「デジタルファブリケーション コード・マシン・ハンド」のprocessingの授業はここを元に進めていきます。

[28年度の作品（2D,3D）](https://goo.gl/photos/uz35vBEnawPBh1JL8)

平成28年度では[processing](https://processing.org/)を使って、2D,3Dを描画しました。平成29年度では2Dをprocessing、3Dを[openSCAD](https://github.com/FabResearch-KyushuUniv/digifab17_openscad)で描画します。
右上の"Clone or download"→"Download ZIP"で使うファイルをダウンロードしてください。

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
2. 演算子
  + 変数を計算するときに使う
  + "+", "-", "\*", "/", "%", "="とかがある。
  + [http://www9.plala.or.jp/sgwr-t/c/sec03.html](http://www9.plala.or.jp/sgwr-t/c/sec03.html)
3. 関数
  + 変数とか他の関数とかが入ってる"でかい箱"
  + プログラムを処理する部分
4. 制御文
  + プログラムを場合分けとか繰り返しとかしてくれる
  + ifとかforとかwhileとかがある。
  + [http://www9.plala.or.jp/sgwr-t/c/sec06.html](http://www9.plala.or.jp/sgwr-t/c/sec06.html)

## 2Dのデータを作る
processingの初歩をまず最初にやって、最終的に2DのデータをSVGで書き出します。
### ・ processingで何か書く
/sample01_firstと/sample02_drawを参照してください。
### ・ マウス、if文
/sample03_mouseを参照してください。
### ・ for文、乱数の生成
/sample04_randomを参照してください。
### ・ SVGの書き出し
/sample05_svgと/sample06_svg_v2を参照してください。

### (以下、余裕があれば見てみてください)
#### ・ 配列
/sample07_mouse_2を参照してください。
#### ・ マイク
/sample08_soundを参照してください。
#### ・ 波形の描画
/sample09_waveを参照してください。

processingの[reference](https://processing.org/reference/)とか見るのが一番捗ると思います。

## 3Dのデータを作る
1. 必要なソフトウェア
    + [Processing](https://processing.org/)
    + [MeshMixer](http://www.meshmixer.com/)
1. 必要なライブラリ
    + [HE_MESH](http://wblut.com/hemesh/hemesh-latest.zip)
    + [controlp5](https://github.com/sojamo/controlp5/releases/download/v2.2.5/controlP5-2.2.5.zip)
    + [PeasyCAM](http://mrfeinberg.com/peasycam/peasycam_202.zip)
1. 本日のスライド
    + [Processingで3Dモデリング](https://docs.google.com/presentation/d/1LprM52UdkLDuXwQy9uJExOAAFGkIJyMmZ6EiOyBZwLs/edit?usp=sharing)

### サンプルについて
1. sample_3Dmodeling_01
    + HEC->HE->HEMの流れを説明しているサンプルです。ここではBox(直方体)を作り(HEC)、メッシュ化(HE)しその頂点をカット(HEM)し、しています。
2. sample_Mesh
    + ソリッドモデルではなく、サーフェイスを出力しています。編集する物と編集が変わっただけで流れは先程と変わりません。サーフェイスを元に厚み付けしたい時はこちらをベースにすると良いと思います。
3. sample_Slice
    + 正十二面体をランダムな平面でカットし、カットされた正十二面体のランダムな面の穴を開け、Lattice(格子状)の編集をかけた後、スムーズの編集をしたサンプルです。偶にスムーズが上手くいかないときがあるので、その場合は停止し、再度実行してください。
