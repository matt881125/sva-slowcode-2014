/*
Requires shapes3d, geomerative and hemesh libraries:

http://lagers.org.uk/s3d4p/index.html
http://www.ricardmarxer.com/geomerative/
http://hemesh.wblut.com

Extruded 3D type code adapted from creativeapplications:

http://www.creativeapplications.net/processing/generative-typography-processing-tutorial/

-=-

josh sucher - josh@thingswemake.com - 2014.09.11

*/

import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;
import geomerative.*;
import wblut.processing.*;
import wblut.hemesh.*;   
import wblut.geom.*;    

Toroid t;
Toroid t2;
RFont font; 
WB_Render render;
HE_Mesh mesh;     
String input = "TARGET";   


void setup() {
  size(600,600,P3D);
  smooth(8);
  background(255);
 
   // Geomerative
  RG.init(this); // initialize the Geomerative library
  RCommand.setSegmentator(RCommand.UNIFORMSTEP); // settings for the generated shape density
  RCommand.setSegmentStep(2); // settings for the generated shape density
  font = new RFont("HelveticaBold.ttf", 96); // create the font used by Geomerative

  // Hemesh
  render = new WB_Render(this); // setup the hemesh render class for displaying shapes

  // call the two methods (see below) that do the actual work in this sketch 
  mesh = createHemeshFromString(input); // create a 3D mesh from an input string (using Geomerative & Hemesh)
   
  t = new Toroid(this, 20, 30);
  t2 = new Toroid(this, 20, 30);
  t.setRadius(40,30,100);
  t.rotateToX(radians(70));
  t.rotateToZ(radians(-20));
  t.moveTo(300,275,100);
  t.fill(color(255,0,0));
  t.stroke(color(0));
  t.strokeWeight(0);
  
  t2.setRadius(30,20,0);
  t2.rotateToX(radians(70));
  t2.rotateToZ(radians(-20));
  t2.moveTo(300,275,100);
  t2.fill(color(255,0,0));
  t2.stroke(color(0));
  t2.strokeWeight(0);

  ambientLight(200,200,200);
  directionalLight(128, 128, 128, -10, -3.5f, -1);
  t.drawMode(Shape3D.SOLID);
  t.draw();
  t2.drawMode(Shape3D.SOLID);
  t2.draw();

 perspective(PI/3.0, (float) width/height, 1, 1000000); // wide clipping planes
 

//rotateX(-PI/7);
//rotateY(PI/6);

 rotateY(radians(25));

 lights(); // add general Processing lights

  translate(325, 525);
  //rotateY(frameCount * 0.01); // rotate around the Y axis

  // display the mesh using colored faces and subtle edge lines
  strokeWeight(0);
  for (HE_Face face : mesh.getFacesAsArray ()) {
    fill(255,0,0);
    // draw the face using Hemesh's render class
    render.drawFace(face, false);
  }
}

// Turn a string into a 3D HE_Mesh
HE_Mesh createHemeshFromString(String s) {
  
  // Geomerative
  RMesh rmesh = font.toGroup(s).toMesh(); // create a 2D mesh from a text
  rmesh.translate(-rmesh.getWidth()/2, rmesh.getHeight()/2); // center the mesh

  // Geomerative & Hemesh
  ArrayList <WB_Triangle> triangles = new ArrayList <WB_Triangle> (); // holds the original 2D text mesh
  ArrayList <WB_Triangle> trianglesFlipped = new ArrayList <WB_Triangle> (); // holds the flipped 2D text mesh
  RPoint[] pnts;
  WB_Triangle t, tFlipped;
  WB_Point a, b, c;
  // extract the triangles from geomerative's 2D text mesh, then place them
  // as hemesh's 3D WB_Triangle's in their respective lists (normal & flipped)
  for (int i=0; i<rmesh.strips.length; i++) {
    pnts = rmesh.strips[i].getPoints();
    for (int j=2; j<pnts.length; j++) {
      a = new WB_Point(pnts[j-2].x, pnts[j-2].y, 0);
      b = new WB_Point(pnts[j-1].x, pnts[j-1].y, 0);
      c = new WB_Point(pnts[j].x, pnts[j].y, 0);
      if (j % 2 == 0) {
        t = new WB_Triangle(a, b, c);
        tFlipped = new WB_Triangle(c, b, a);
      } else {
        t = new WB_Triangle(c, b, a);
        tFlipped = new WB_Triangle(a, b, c);
      }
      // add the original and the flipped triangle (to close the 3D shape later on) to their respective lists
      triangles.add(t);
      trianglesFlipped.add(tFlipped);
    }
  }

  // Hemesh
  // Creating a quality extruded 3D HE_Mesh in 4 steps
  
  // 1. create the base 3D HE_Mesh from the triangles of the 2D text shape
  // (at this point you basically have a 2D text shape stored in a 3D HE_Mesh)
  HE_Mesh tmesh = new HE_Mesh(new HEC_FromTriangles().setTriangles(triangles));
  
  // 2. extrude the base mesh by a certain distance
  // (at this point you have an extruded shape, but it is open on the side where the original 2D base shape was!)
  tmesh.modify(new HEM_Extrude().setDistance(20));
  
  // 3. add the flipped faces to the extruded base mesh
  // (at this point we add the flipped faces to closes the mesh, the flipping ensures correct, outward normals) 
  tmesh.add(new HE_Mesh(new HEC_FromTriangles().setTriangles(trianglesFlipped)));
  
  // 4. create a quality internal structure (useful for the mesh manipulations in subsequent examples)
  tmesh.clean();
  
  // Done! Return the HE_Mesh...
  return tmesh;
  
}

void draw() {
} 

