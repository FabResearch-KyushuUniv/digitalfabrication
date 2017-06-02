// LIBRARY
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;
import processing.opengl.*;


// HEMESH CLASSES & OBJECTS
HE_Mesh MESH; // Our mesh object
WB_Render RENDER; // Our render object
//HEC_Cube creator; // Our creator object
HEM_Bend bend3;
int bendCounter;

// CAM
import peasy.*;
PeasyCam CAM;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 600, OPENGL);
  CAM = new PeasyCam(this, 150);  

  //クリエイターを作る
  HEC_Grid creator = new HEC_Grid(20,30,20,30); // Our creator 
  
  //クリエイターのパラメーターを設定する。
  //creator.setEdge(60); 
  //クリエイターをメッシュにする。
  MESH = new HE_Mesh(creator);  // ADD OUR CREATOR PARAMETERS TO OUR MESH

  // モディファイアを設定する
  //HEM_Bendモディファイアは、メッシュを曲げる機能です。使う前に曲げるために必要な平面とベクトルが必要になります。
  //WB_Planeで平面を生成します。WB_Plane(x1,y1,z1,x2,y2,z2)
  //.setBendAxis(x1,y1,z1,x2,y2,z2)でベクトルを指定します。.setAngleFactor()で角度を指定します。
  //僕も正直どう設定すればどう曲がるか、わかってない部分もあるので、自分でいじくり回してみてください。
  
  WB_Plane plane = new WB_Plane(0,0,0,1,1,0);
  HEM_Bend bend = new HEM_Bend().setGroundPlane(plane).setBendAxis(1,1,1,-1,-1,-1).setAngleFactor(4);
  WB_Plane plane2 = new WB_Plane(1,1,0,0,0,-1);
  HEM_Bend bend2 = new HEM_Bend().setGroundPlane(plane2).setBendAxis(-1,1,0,1,0,-1).setAngleFactor(-4);


  //HEM_Transformは、拡大、縮小のできるモディファイアです。
  //これも同様、モディファイアの前にWB_Transformという、どのように拡大縮小するのかを指定するための物を宣言する必要があります。
  //今回は５倍してます。

  WB_Transform wtra = new WB_Transform().addScale(5);
  HEM_Transform tra = new HEM_Transform(wtra);
  
  
  // モディファイアをメッシュに適用する。
  //MESH.modify( chamfer ); // ADD OUR MODIFIER TO THE MESH
  //MESH.modify( edges );
  //MESH.modify(ex);
  MESH.modify(bend);
  MESH.modify(bend2);
  //MESH.modify(bend3);
  MESH.modify(tra);
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
  
  bendCounter++;
  
  WB_Plane plane3 = new WB_Plane(0,0,1,-1,0,-1);
  bend3 = new HEM_Bend().setGroundPlane(plane3).setBendAxis(0,-1,1,0,0,-1).setAngleFactor((mouseX/2 - mouseX) * 0.0001);
  MESH.modify(bend3);
  //ここからレンダリング
  stroke(0, 0, 255);
  strokeWeight( 1 );
  //fill(0,0,255);
   RENDER.drawEdges( MESH ); //Draw MESH edges
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