// LIBRARY
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;
import processing.opengl.*;
import java.util.*;


// HEMESH CLASSES & OBJECTS  セレクターも宣言している点に注意
HE_Mesh MESH,MESH2; // Our mesh object
WB_Render RENDER; // Our render object
//HEC_Cube creator; // Our creator object
HE_Selection SELECTION; //セレクター

boolean meshappeared = false;

// CAM
import peasy.*;
PeasyCam CAM;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 600, OPENGL);
  CAM = new PeasyCam(this, 150);  

  //クリエイターを作る 球形
  HEC_Sphere creator = new HEC_Sphere();
  
  //クリエイターのパラメーターを設定する。 大きさ20, 縦の分割線20,横の分割線20
  creator.setRadius(60).setUFacets(20).setVFacets(20);
  
  //クリエイターをメッシュにする。
  MESH = new HE_Mesh(creator);  // ADD OUR CREATOR PARAMETERS TO OUR MESH
  
  //どのメッシュの面をセレクターで選択するのかを指定します。
  SELECTION = new HE_Selection( MESH );

  // モディファイアを設定する
  Iterator<HE_Face> fItr = MESH.fItr(); //イテレータ(メッシュの中の面を数えられる、仮想の番号みたいなの)を宣言します。
  HE_Face f; //面を選択するので、HE_Faceを宣言します。
  while(fItr.hasNext()){ //次の番号がある間
    f = fItr.next(); //次の番号の面へ、対象の面を移動します。
    if(random(200)<50){ //適当な200以下のランダムな数字を生成し、それが50以下なら
      SELECTION.add(f); //その面をセレクターに加え、選択している扱いにします。
    }
  }
  
  // 格子のモディファイア
  HEM_Lattice lat = new HEM_Lattice().setDepth(2).setWidth(1).setFuse(true);
  MESH.modifySelected(lat,SELECTION); //MESH.modiftSelected(モディファイアの名前、セレクター)とすることで、対象の面にだけモディファイアをかけることができます。
  
  HEM_Slice sli = new HEM_Slice().setPlane(new WB_Plane(0,0,0,1,0,1));
  MESH.modify(sli);
  /*
  HEM_ChamferCorners cham = new HEM_ChamferCorners().setDistance(1);
  MESH.modify(cham); MESH.modify(cham);
  */
  
  //重い場合は下の二行はコメントアウトしてください。
  HES_Smooth cc = new HES_Smooth();
  MESH.subdivide(cc);
  
  //MESH2 = new HE_Mesh(new HEC_Box().setWidth(500).setHeight(500).setDepth(500));
  //レンダリング用
  RENDER = new WB_Render(this); // RENDER MESH
}

/////////////////////////// DRAW ////////////////////////////
void draw() {
  background(255);
  //CAMERA
  CAM.beginHUD(); // this method disables PeasyCam for the commands between beginHUD & endHUD
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  CAM.endHUD();
  
  
  //ここからレンダリング
  stroke(0, 0, 255);
  strokeWeight( 1 );
  //fill(0,0,255);
   RENDER.drawEdges( MESH ); //Draw MESH edges
   if(meshappeared){
     noStroke();
     fill(0,255,0);
     RENDER.drawFaces(MESH);
     //RENDER.drawFaces(MESH2);
     //ここまで
   }
}

// eキーでstl保存
void keyPressed() {

  if (key == 'e') {
    // stlで書き出し
    MESH.triangulate();
    HET_Export.saveToSTL(MESH, sketchPath("export"), "test");
  }
  if(key == 'f'){
    meshappeared = true;
  }
}