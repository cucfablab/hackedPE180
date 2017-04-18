import processing.serial.*;


float sides;
float degree;
float x;
float y;
float roll;
float radius;
int i;

int aniPosX;
int aniPosY;

/*void setup(){
  
  fill(255);
  size(500, 500);
  aniPosX = width / 2;
  aniPosY = height / 2;
  radius = height / 2.2;
  strokeWeight(5);
  stroke(255);
  degree = TWO_PI / 360;
  frameRate = 1;
  
  binaryPort = new Serial(this, "COM5", 115200);
  bin = new int[8];
  
  
    
  
}*/

void drawNeedleState(){
  stroke(0);
  for(i = 315; i <= 405; i++){
  if(needlestate == 2) stroke(255);
  else stroke (0);
  line((sin(degree * i) * 20) + aniPosX,
       (cos(degree * i) * 20) + aniPosY,
       (sin(degree * i) * 40) + aniPosX,
       (cos(degree * i) * 40) + aniPosY);
  }

  for(i = 46; i <= 136; i++){
  if(needlestate == 3) stroke(255);
  else stroke (0);
  line((sin(degree * i) * 20) + aniPosX,
       (cos(degree * i) * 20) + aniPosY,
       (sin(degree * i) * 40) + aniPosX,
       (cos(degree * i) * 40) + aniPosY);
  }
  
  for(i = 137; i <= 227; i++){
  if(needlestate == 0) stroke(255);
  else stroke (0);
  line((sin(degree * i) * 20) + aniPosX,
       (cos(degree * i) * 20) + aniPosY,
       (sin(degree * i) * 40) + aniPosX,
       (cos(degree * i) * 40) + aniPosY);
  }
  
  for(i = 228; i <= 314; i++){
  if(needlestate == 1) stroke(255);
  else stroke (0);
  line((sin(degree * i) * 20) + aniPosX,
       (cos(degree * i) * 20) + aniPosY,
       (sin(degree * i) * 40) + aniPosX,
       (cos(degree * i) * 40) + aniPosY);
  }
  noFill();
  stroke(0);
  ellipse(aniPosX, aniPosY, 82, 82);
  ellipse(aniPosX, aniPosY, 38, 38);
}

  
  
}
