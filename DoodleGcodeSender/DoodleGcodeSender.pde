// Declare two arrays with 50 elements.
int[] xpos = new int[200]; 
int[] ypos = new int[200];
int startX = 0;
int startY = 0;
int drawstart = 0; //start position for draw loop
int timesince = 0;

int nextdist = 500;
int msPerPix = 60;

import java.awt.event.KeyEvent;
import javax.swing.JOptionPane;
import processing.serial.*;
Serial port = null;
String portname = null;

boolean streaming = false;
float speed = 1;
String[] gcode;
int i = 0;

void setup(){
    size(displayWidth / 3,displayHeight / 3);
    for (int i = 0; i < xpos.length; i ++ ) {
      xpos[i] = 0; 
      ypos[i] = 0;
    }
    openSerialPort();
    selectSerialPort();
    //initialize binary Serial
    binaryPort = new Serial(this, "COM5", 115200);
    bin = new int[8];
    aniPosX = 50;
    aniPosY = height - 150;

 
}

void draw(){
 // while(!portOpened) background(0);
  background(255);
  readMachineState(); //read machine state must be called before check needle
  drawMachineState();
  checkNeedle();
  drawNeedleState();

  for(int i = 0; i < xpos.length - 1; i++){
     stroke(210);
     line(xpos[i],ypos[i],xpos[i+1],ypos[i+1]);

   }
  for (int i = 0; i < drawstart; i ++ ) {
    strokeWeight(4);
    stroke(0);
    line(xpos[i],ypos[i],xpos[i+1],ypos[i+1]);
   }
   
   fill(0);
   text("array position: " + drawstart, 20, height - 20);
   text("y position: " + ypos[drawstart], 20, height - 30);
   text("x position: " + xpos[drawstart], 20, height - 40);
   if(drawstart < 199){
     text("y distance: " + (ypos[drawstart] - ypos[drawstart + 1]), 20, height - 55);
     text("x distance: " + (xpos[drawstart] - xpos[drawstart + 1]), 20, height - 65);
     nextdist = int(dist(xpos[drawstart], ypos[drawstart], xpos[drawstart + 1], ypos[drawstart + 1]));
     text("total dist: " + nextdist, 20, height - 80);
   }
   text("Needle position: " + needlestate, 20, height - 100);
   rect(0, 0, (nextdist * msPerPix) - (millis() - timesince), 20);
   
   if(!mousePressed){
    if(drawstart < xpos.length - 1 && (millis() - timesince) >= nextdist * msPerPix){ 
      drawstart++; //increment drawing
      if(drawstart < 199 && drawstart > 0){
        port.write("G91\nG00X" + (xpos[drawstart] - xpos[drawstart + 1]) + "Y" + (ypos[drawstart] - ypos[drawstart + 1]) + "\n");
        println("G91\nG00X" + (xpos[drawstart] - xpos[drawstart + 1]) + "Y" + (ypos[drawstart] - ypos[drawstart + 1]) + "\n");
      }
      timesince = millis();
      
    }
  }
}

void mousePressed(){ //on mousePressed, reset the index to 0, set entire array to mousePress coordinates
    drawstart = 0;
    for (int i = 0; i < xpos.length; i ++ ) {
      xpos[i] = mouseX; 
      ypos[i] = mouseY;
      startX = mouseX;
      startY = mouseY;
    }
  
}

void mouseReleased(){
   for(int i = 0; i < xpos.length - 1; i++){
    if(xpos[i] == startX && xpos[i] != 0) drawstart++;
    else break;
  }
}

void mouseDragged() {
  // Shift array values
  for (int i = 0; i < xpos.length-1; i ++ ) {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  // New location
  xpos[xpos.length-1] = mouseX; // Update the last spot in the array with the mouse location.
  ypos[ypos.length-1] = mouseY;
  
  // Draw everything
 
}

void openSerialPort()
{
  if (portname == null) return;
  if (port != null) port.stop();
  
  port = new Serial(this, portname, 115200);
  
  port.bufferUntil('\n');
}

void selectSerialPort()
{
  String result = (String) JOptionPane.showInputDialog(this,
    "Select the serial port that corresponds to your Arduino board.",
    "Select serial port",
    JOptionPane.PLAIN_MESSAGE,
    null,
    Serial.list(),
    0);
    
  if (result != null) {
    portname = result;
    openSerialPort();
  }
}

void stream()
{
  if (!streaming) return;
  
  while (true) {
    if (i == gcode.length) {
      streaming = false;
      return;
    }
    
    if (gcode[i].trim().length() == 0) i++;
    else break;
  }
  
  println(gcode[i]);
  port.write(gcode[i] + '\n');
  i++;
}
/*
void serialEvent(Serial p)
{
  String s = p.readStringUntil('\n');
  println(s.trim());
  
  if (s.trim().startsWith("ok")) stream();
  if (s.trim().startsWith("error")) stream(); // XXX: really?
}*/

