import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
//import peasy.test.*;

PShape sh;
float scaleFactor = 2;
 
 PeasyCam cam;
 
 float globalPtich = 0;
 float globalYaw = 0;
 

 
 
void setup() {
  size(600,400, P3D);
  cam = new PeasyCam(this, 800);
  cam.setMinimumDistance(360);
  cam.setLeftDragHandler(new PeasyDragHandler(){
     public void handleDrag(final double dx, final double dy){
       if(globalPtich+dy*0.01>=0&&globalPtich+dy*0.01<=PI/2.0){
         globalPtich+=dy*0.008;
       }
       globalYaw+=dx*0.008;
     }
  });
  
  sh = loadShape("Mii.obj");  
}
 
void draw() {
  background(0);
  ambientLight(255, 255, 255);
  
  pushMatrix();

  rotateX(PI-globalPtich);
  rotateY(PI-globalYaw);
  translate(0,-300,0);
  scale(scaleFactor);  //(4)
  shape(sh);  //(7)

  popMatrix();
  
}
 
 

 
