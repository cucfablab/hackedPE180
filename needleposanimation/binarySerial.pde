int[] bin;
int dec = 0;
int rem = 1;
int pow = 0;
boolean portOpened = false;

Serial binaryPort;

void readMachineState(){
  if(binaryPort.available() > 0){
    dec = binaryPort.read();
    portOpened = true;
     //println(dec);
  //set the binary bins to all 0
     for(int c = 0; c < 8; c++){
        bin[c] = 0;
      }
    
      //fil each bin with a corresponding remainder
      
      while(dec>0){
        rem = dec % 2;
        dec = floor(dec / 2);
        if(pow < 8){
          bin[pow] = rem;
          pow++;
        }
      }
      pow = 0;
      rem = 1;
      
      println(bin[7], bin[6], bin[5], bin[4], bin[3], bin[2], bin[1], bin[0]);
      
      
    }
  
}

void drawMachineState(){
  for(int j = 0; j < 8; j++){
        if(boolean(bin[j])) fill(255);
        else fill(0);
        ellipse(width - (50 * (j + 1)), height - 50, 30, 30);
     }
}
