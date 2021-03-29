PImage bg;
PImage soil;
PImage life;
PImage hog;
PImage soldier;
PImage robot;

float block = 80;
float soldierX = 0;

int robotPosition = (int)random(2, 8);
int robotFloor = (int)random(2, 5);
int soldierPosition = (int)random(2, 7);

float laserOffsetX = 25;
float laserOffsetY = 42;
float laserSpeed = 0;
float laserWidth = 0;

void setup() {
  size(640, 480, P2D);
  // loadImage
  bg = loadImage("img/bg.jpg");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  hog = loadImage("img/groundhog.png");
  soldier = loadImage("soldier.png");
  robot = loadImage("img/robot.png");
}

void draw() {
  // bg, soil
  background(bg);
  image(soil, 0, block*2);
  // grass
  fill(124, 204, 25);
  noStroke();
  rect(0, block*2-15, width, 15);
  // sun
  fill(253, 184, 19);
  stroke(255, 255, 0);
  strokeWeight(5);
  ellipse(width-50, 50, 120, 120);
  // life
  image(life, 10, 10);
  image(life, block, 10);
  image(life, block*2-10, 10);

  //groundhog
  image(hog, width/2-block/2, block, block, block);

  //soldier
  soldierX += 2;
  soldierX %= block*9 ;
  image(soldier, soldierX - block, block*soldierPosition, block, block);

  //robot, Laser
  stroke(255, 0, 0);
  //noStroke();
  laserSpeed -= 2;
  if (laserSpeed <= -(block*2)) laserSpeed = 0;
  laserWidth -= 2;
  if (laserWidth <= -40)laserWidth = -40;
  if (laserSpeed == 0)laserWidth = 0;
  //rect(block*robotPosition + laserOffsetX + laserSpeed, block*robotFloor+laserOffsetY-5, laserWidth, 10, 5);
  strokeWeight(10);
  line(block*robotPosition + laserOffsetX + laserSpeed, block*robotFloor+laserOffsetY-5, 
    block*robotPosition + laserOffsetX + laserSpeed + laserWidth - 10, block*robotFloor+laserOffsetY-5);

  image(robot, block*robotPosition, block*robotFloor, block, block);

  //grid 
  /*
  noFill();
   stroke(0,255,0);
   for (int i = 0; i<9; i++) {
   rect(block*i, block, block, height);
   }*/
}
