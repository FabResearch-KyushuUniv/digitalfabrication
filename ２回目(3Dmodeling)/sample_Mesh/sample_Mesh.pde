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
  HEC_Grid creator = new HEC_Grid(20,30,20,30); // Our creator 
  
  //クリエイターのパラメーターを設定する。
  //creator.setEdge(60); 
  //クリエイターをメッシュにする。
  MESH = new HE_Mesh(creator);  // ADD OUR CREATOR PARAMETERS TO OUR MESH

  // モディファイアを設定する
  //HEM_ChamferCorners chamfer = new HEM_ChamferCorners().setDistance(20);
  //HEM_ChamferEdges edges = new HEM_ChamferEdges().setDistance(5);
  //HEM_Extrude sp = new HEM_Extrude().setDistance(20);
  WB_Plane plane = new WB_Plane(0,0,0,1,1,0);
  HEM_Bend bend = new HEM_Bend().setGroundPlane(plane).setBendAxis(1,1,1,-1,-1,-1).setAngleFactor(4);
  WB_Plane plane2 = new WB_Plane(1,1,0,0,0,-1);
  HEM_Bend bend2 = new HEM_Bend().setGroundPlane(plane2).setBendAxis(-1,1,0,1,0,-1).setAngleFactor(-4);
  WB_Plane plane3 = new WB_Plane(0,0,1,-1,0,-1);
  HEM_Bend bend3 = new HEM_Bend().setGroundPlane(plane3).setBendAxis(0,-1,1,0,0,-1).setAngleFactor(6);

  WB_Transform wtra = new WB_Transform().addScale(5);
  HEM_Transform tra = new HEM_Transform(wtra);
  // モディファイアをメッシュに適用する。
  //MESH.modify( chamfer ); // ADD OUR MODIFIER TO THE MESH
  //MESH.modify( edges );
  //MESH.modify(ex);
  MESH.modify(bend);
  MESH.modify(bend2);
  MESH.modify(bend3);
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
    HET_Export.saveToSTL(MESH, sketchPath("export.stl"), "test");
  }
}