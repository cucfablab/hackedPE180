int[] bin;
int dec = 0;
int rem = 1;
int i = 0;

import processing.serial.*;
Serial myPort;

void setup(){
  myPort = new Serial(this, "COM5", 115200);
  bin = new int[8];

  size(900, 100);

}
void draw(){
  //read new byte
  readMachineState();
  
}

void readMachineState(){
  if(myPort.available() > 0){
    dec = myPort.read();
     //println(dec);
  //set the binary bins to all 0
     for(int c = 0; c < 8; c++){
        bin[c] = 0;
      }
    
      //fil each bin with a corresponding remainder
      
      while(dec>0){
        rem = dec % 2;
        dec = floor(dec / 2);
        if(i < 8){
          bin[i] = rem;
          i++;
        }
      }
      i = 0;
      rem = 1;
      println(bin[7], bin[6], bin[5], bin[4], bin[3], bin[2], bin[1], bin[0]);
      
      for(int j = 0; j < 8; j++){
        if(boolean(bin[j])) fill(255);
        else fill(0);
        ellipse(900 - (100 * (j + 1)), 50, 75, 75);
      }
    }
}
