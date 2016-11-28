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

// CAM
import peasy.*;
PeasyCam CAM;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 600, OPENGL);
  CAM = new PeasyCam(this, 150);  

  //クリエイターを作る
  HEC_Cylinder creator = new HEC_Cylinder(); // Our creator 

  //クリエイターのパラメーターを設定する。
  //creator.setEdge(60); 
  //クリエイターをメッシュにする。
  MESH = new HE_Mesh(creator);  // ADD OUR CREATOR PARAMETERS TO OUR MESH

  // モディファイアを設定する
  //HEM_ChamferCorners chamfer = new HEM_ChamferCorners().setDistance(20);
  //HEM_ChamferEdges edges = new HEM_ChamferEdges().setDistance(5);
  //HEM_Extrude sp = new HEM_Extrude().setDistance(20);
  HEM_Crocodile cro = new HEM_Crocodile().setDistance(60);
  HEM_ChamferCorners cor = new HEM_ChamferCorners().setDistance(30);
  HEM_SmoothInset lat = new HEM_SmoothInset().setOffset(20);

  // モディファイアをメッシュに適用する。
  //MESH.modify( chamfer ); // ADD OUR MODIFIER TO THE MESH
  //MESH.modify( edges );
  //MESH.modify(ex);
  //MESH.modify(sp);
  MESH.modify(cro);
  MESH.modify(cor);
  MESH.modify(lat);
  

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
  strokeWeight( 2 );
  //fill(0,0,255);
   RENDER.drawEdges( MESH ); //Draw MESH edges
   //ここまで
}

// eキーでstl保存
void keyPressed() {

  if (key == 'e') {
    // stlで書き出し
    MESH.triangulate();
    HET_Export.saveToSTL(MESH, sketchPath("export.stl"), "test");
  }
}