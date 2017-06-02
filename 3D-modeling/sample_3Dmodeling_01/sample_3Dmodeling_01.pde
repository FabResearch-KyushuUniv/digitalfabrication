// LIBRARY (いじらなくて大丈夫)
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;
import processing.opengl.*;


// HEMESH CLASSES & OBJECTS グローバルでメッシュとレンダラーをまず宣言
HE_Mesh MESH; // Our mesh object
WB_Render RENDER; // Our render object
//HEC_Cube creator; // Our creator object

// CAM カメラ用のライブラリと宣言
import peasy.*;
PeasyCam CAM;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 600, OPENGL);
  CAM = new PeasyCam(this, 150);  //カメラ用

/***********************************
********   HEC  *******************
************************************/
  //クリエイターを作る
  HEC_Box creator = new HEC_Box(); // Our creator 

  //クリエイターのパラメーターを設定する。それぞれの固有の命令はProcessing/libraries/hemesh/references/index.htmlを見て下さい。
  creator.setWidth(200);
  creator.setHeight(100);
  creator.setDepth(150);
  
  /*
  ちなみに上の命令は重ねて、 creator.setWidth(200).setHeight(100).setDepth(50);とすることもできます！
  */
  
/***********************************
********   HE  *******************
************************************/
  //HEの部分　 クリエイターをメッシュにする。
  MESH = new HE_Mesh(creator);  // ADD OUR CREATOR PARAMETERS TO OUR MESH


/***********************************
********   HEM  *******************
************************************/

  // モディファイアを設定する
  // 今回はBoxを各頂点から20の距離の平面でカットする。
  HEM_ChamferCorners chamfer = new HEM_ChamferCorners();
  chamfer.setDistance(20);

  // モディファイアをメッシュに適用する。
  MESH.modify(chamfer);
  

  //レンダリング用
  RENDER = new WB_Render(this); // RENDER MESH
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  //CAMERA用
  CAM.beginHUD(); // this method disables PeasyCam for the commands between beginHUD & endHUD
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  CAM.endHUD();
  
  
  //ここからレンダリング
  stroke(0, 0, 255);
  strokeWeight( 2 );
  noFill();
  //fill(0,0,255);
   RENDER.drawEdges( MESH ); //辺を青色、太さ２で描く
   noStroke();
   fill(0,255,0);
   RENDER.drawFaces(MESH); //面を緑で描く
   //ここまで
}

// eキーでstl保存
void keyPressed() {

  if (key == 'e') {
    // stlで書き出し
    MESH.triangulate();
    HET_Export.saveToSTL(MESH, sketchPath("export"), "test");
  }
}