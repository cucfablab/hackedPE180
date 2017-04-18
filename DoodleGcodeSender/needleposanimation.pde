import processing.serial.*;


float sides;
float degree = TWO_PI / 360;

float x;
float y;
float roll;
float radius;
int d;

int aniPosX;
int aniPosY;


void drawNeedleState(){
  
  stroke(0);
  for(d = 315; d <= 405; d++){
  if(needlestate == 2) stroke(255);
  else stroke (0);
  line((sin(degree * i) * 20) + aniPosX,
       (cos(degree * i) * 20) + aniPosY,
       (sin(degree * i) * 40) + aniPosX,
       (cos(degree * i) * 40) + aniPosY);
  }

  for(d = 46; d <= 136; d++){
  if(needlestate == 3) stroke(255);
  else stroke (0);
  line((sin(degree * i) * 20) + aniPosX,
       (cos(degree * i) * 20) + aniPosY,
       (sin(degree * i) * 40) + aniPosX,
       (cos(degree * i) * 40) + aniPosY);
  }
  
  for(d = 137; d <= 227; d++){
  if(needlestate == 0) stroke(255);
  else stroke (0);
  line((sin(degree * i) * 20) + aniPosX,
       (cos(degree * i) * 20) + aniPosY,
       (sin(degree * i) * 40) + aniPosX,
       (cos(degree * i) * 40) + aniPosY);
  }
  
  for(d = 228; d <= 314; d++){
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

  
  

