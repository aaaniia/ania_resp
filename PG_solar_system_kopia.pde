import peasy.*;
float angle = 0;
//float x=-500, y=-300, z=300;
PeasyCam cam;
PShape s, s2, globe, sun, spaceship ;
PImage tex, tex_sun, img;

void setup() {
  size(1152, 720, P3D);
  cam = new PeasyCam(this,700);
  
  spaceship = loadShape("alien interceptor flying.obj");
  s = loadShape("3d-model.obj");
  s2 = loadShape("laska.obj");
  tex = loadImage("earth.jpg");
  tex_sun = loadImage("sun.jpg");
  img = loadImage("space.jpg");
  
  noStroke();
  noFill();
  sun = createShape(SPHERE, 35);
  sun.setTexture(tex_sun);
  
  globe = createShape(SPHERE, 10);
  globe.setTexture(tex);
}
void draw() {
   background(img);
  lights();
  shape(sun);
  pointLight(255, 255, 255, 0, 0, 0);
  ambientLight(30,30,30);

  
//----------PLANET #1-------------------------------------------------------------------
  // The planet #1 rotates around the sun
  pushMatrix();
   stroke(255);
  noFill();
  ellipse(0,0,140,140);
  rotate(angle*2.2);
  translate(70, 0);
  noStroke();
  shape(globe);
  //sphere(10);


  // Moon #1   PL#1
  pushMatrix(); 
  rotate(-angle*15);
  translate(27, 0);
  fill(50, 255, 200);
  shininess(140.0); 
  sphere(5);
  popMatrix();

  // Moon #2   PL#1
  pushMatrix();
  rotate(angle*10);
  translate(17, 0);
  fill(50, 0, 200);
  shininess(90.0); 
  sphere(4);
  popMatrix();

  popMatrix();
  
  //-----PLANET #2-------------------------------------------------------------------

  pushMatrix();
  stroke(255);
  noFill();
  ellipse(0,0,320,320);
  noStroke();
  rotate(angle);
  translate(160, 0);
  spotLight(255, 0, 0, 0, 0, 0, 40, 0, 0, PI/3, 0.1);
  fill(130, 35, 255);
  shininess(1.7); 
  sphere(13);
 

  // Moon #1   PL#2
  pushMatrix(); 
  rotate(-angle*3);
  translate(43, 0);
  fill(110, 100, 120);
  shininess(20.0); 
  box(25, 25, 25);
  popMatrix();

  // Moon #2   PL#2
  pushMatrix();
  rotate(-angle*14);
  translate(20, 0);
  fill(210, 44, 100);
  shininess(190.0); 
  sphere(7); 
  popMatrix();

  popMatrix();
  
  //-------PLANET #3------------------------------------------------------------------------

  pushMatrix();
  stroke(255);
  noFill();
  ellipse(0,0,540,540);
  noStroke();
  rotate(-angle*0.7);
  translate(270, 0);
  fill(240, 50, 205);
  shininess(17.0); 
  sphere(13);

  // Moon #1   PL#3
  pushMatrix(); 
  rotate(-angle*5);
  translate(30, 0);
  fill(133, 100, 200);
  scale(2); 
  shape(s, 0, 0);
  popMatrix();

  // Moon #2   PL#3
  pushMatrix();
  rotate(angle*4);
  translate(54, 0);
  fill(150, 155, 0);
  shininess(4.0); 
  sphere(7);
  popMatrix();

  // Moon #3   PL#3
  pushMatrix();
  rotate(-angle*3);
  translate(75, 0);
  fill(200);
  shininess(2.2); 
  sphere(7);
  popMatrix();

  popMatrix();

//--------PLANET #4---------------------------------------------------------------------

  pushMatrix();
  stroke(255);
  noFill();
  ellipse(0,0,760,760);
  noStroke();
  rotate(angle/2);
  translate(380, 0);
  fill(10, 130, 215);
  shininess(11.0); 
  sphere(22);

  // Moon #1 PL#4
  pushMatrix(); 
  rotate(-angle*10);
  translate(40, 0);
  fill(0, 255, 10);
  shininess(2.6); 
  sphere(11);
  popMatrix();
  
  pushMatrix(); 
  rotate(-angle*3);
  translate(60, 0);
  fill(255, 0, 0);
  scale(0.009); 
  shape(s2, 0, 0);
  popMatrix();

  popMatrix();
  
  //pushMatrix();
  //scale(0.5);
 // translate(x,y,z);
 // shape(spaceship, 0, 0);
 // popMatrix();
  
  angle += 0.01;
}