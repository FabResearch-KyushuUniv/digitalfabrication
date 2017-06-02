// LIBRARY
import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;
import processing.opengl.*;
import java.util.*;


// HEMESH CLASSES & OBJECTS
HE_Mesh MESH,MESH2; // Our mesh object
WB_Render RENDER; // Our render object
//HEC_Cube creator; // Our creator object
HE_Selection SELECTION;

boolean meshappeared = false;

// CAM
import peasy.*;
PeasyCam CAM;

/////////////////////////// SETUP ////////////////////////////

void setup() {
  size(800, 600, OPENGL);
  CAM = new PeasyCam(this, 150);  

  //クリエイターを作る
  HEC_Dodecahedron creator = new HEC_Dodecahedron().setOuterRadius(25); // Our creator 
  
  //クリエイターのパラメーターを設定する。
  //creator.setEdge(60); 
  //クリエイターをメッシュにする。
  MESH = new HE_Mesh(creator);  // ADD OUR CREATOR PARAMETERS TO OUR MESH
  
  SELECTION = new HE_Selection( MESH );

  // モディファイアを設定する
  HEM_ChamferCorners cham = new HEM_ChamferCorners().setDistance(1);
  MESH.modify(cham); MESH.modify(cham);
  
  
  
  WB_Plane[] planes = new WB_Plane[5];
  for(int i=0;i<5;i++){
    planes[i] = new WB_Plane(random(-50,50),random(-50,50),random(-50,50),
                              random(-1,1),random(-1,1),random(-1,1));
    HEM_SliceSurface mss = new HEM_SliceSurface().setPlane(planes[i]);
    MESH.modify(mss);
  }
  Iterator<HE_Face> fItr = MESH.fItr();
  HE_Face f;
  while(fItr.hasNext()){
    f = fItr.next();
    if(random(200) < 50){
       SELECTION.add(f);
    }
  }
  
  HEM_Lattice lat = new HEM_Lattice().setDepth(2).setWidth(1).setFuse(true);
  MESH.modifySelected(lat,SELECTION);
  
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