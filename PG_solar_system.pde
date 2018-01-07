import peasy.*;
float angle = 0;
int directionX = 0;
int directionY = 0;
float x=-200, y=-200, z=0;
PeasyCam cam;
PShape s, s2, globe, sun, spaceship ;
PImage tex, tex_sun, img;

void setup() {
  size(1152, 720, P3D);
  cam = new PeasyCam(this,700);
  
  spaceship = loadShape("Luminaris.obj");
 // s = loadShape("3d-model.obj");
 // s2 = loadShape("laska.obj");
  tex = loadImage("earth.jpg");
  tex_sun = loadImage("sun.jpg");
  img = loadImage("space.jpg");
  
  noStroke();
  noFill();
  sun = createShape(SPHERE, 35);
  sun.setTexture(tex_sun);
  //spaceship.setTexture(tex_sun);
  
 // globe = createShape(SPHERE, 10);
 // globe.setTexture(tex);
}
void draw() {
  
  
   background(img);
  lights();
  shape(sun);
  pointLight(255, 255, 255, 0, 0, 0);
  ambientLight(30,30,30);
  
  x += directionX * 3;
  y += directionY * 3;
  
  pushMatrix();
  //rotateX();
 // rotateY();
  
  translate(x, y, z);
  rotateZ(PI);
  shape(spaceship, 0, 0);
  popMatrix();
  
//----------PLANET #1-------------------------------------------------------------------
  // The planet #1 rotates around the sun
  pushMatrix();
   stroke(255);
  noFill();
  ellipse(0,0,140,140);
  rotate(angle*2.2);
  translate(70, 0);
  noStroke();
  //shape(globe);
  fill(230,12,15);
  sphere(10);


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
  

  
  //pushMatrix();
  //scale(0.5);
 // translate(x,y,z);
  
 // popMatrix();
  
  angle += 0.01;
}

void keyPressed() {
// wcisniete lewo/prawo
  if (key != CODED && keyCode == 'A' || key == CODED && keyCode == LEFT)
    directionX = -1;
    
  else if (key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT)
   directionX = 1;
   
   else if (key != CODED && keyCode == 'W' || key == CODED && keyCode == UP)
   directionY = -1;
   
   else if (key != CODED && keyCode == 'S' || key == CODED && keyCode == DOWN)
   directionY = 1;
}

void keyReleased() {
// puszczone lewo prawo
  if (key != CODED && keyCode == 'A' || key == CODED && keyCode == LEFT
    || key != CODED && keyCode == 'D' || key == CODED && keyCode == RIGHT
    )
    directionX = 0;
    
    if(key != CODED && keyCode == 'W' || key == CODED && keyCode == UP
    || key != CODED && keyCode == 'S' || key == CODED && keyCode == DOWN)
    directionY = 0;
}