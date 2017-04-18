int needlestate = 0;
int lastneedlestate = 0;
bool rstate; //state of slatted rotary encoder
bool lastrstate;

int stateZeroCount = 0;
int stateOneCount = 0;
int stateTwoCount = 0;
int stateThreeCount = 0;

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
pinMode(8, INPUT_PULLUP);
pinMode(9, INPUT_PULLUP);
pinMode(10, INPUT_PULLUP);
  rstate = digitalRead(10); //read state of rotary encoder
  lastrstate = rstate;

}

void loop() {
  // put your main code here, to run repeatedly:
  bool s1 = digitalRead(8); //read state of cam encoder 1
  bool s2 = digitalRead(9); //read state of cam encoder 2
  rstate = digitalRead(10); //read state of rotary encoder
  
  if(!s1 && !s2) needlestate = 0; //High
  if(!s1 && s2) needlestate = 1; //Descending
  if(s1 && s2) needlestate = 2; // Low
  if(s1 && !s2) needlestate = 3; //Ascending
  
  if(rstate != lastrstate){
    if(needlestate == 0) stateZeroCount++;
    if(needlestate == 1) stateOneCount++;
    if(needlestate == 2) stateTwoCount++;
    if(needlestate == 3) stateThreeCount++;
  }
  lastrstate = rstate;
         Serial.print(needlestate);
    Serial.print("\t");
    Serial.print(stateZeroCount);
    Serial.print("\t");
    Serial.print(stateOneCount);
    Serial.print("\t");
    Serial.print(stateTwoCount);
    Serial.print("\t");
    Serial.println(stateThreeCount);
    delay(2); 
 
  if(needlestate != lastneedlestate){
    //set the state count to 0 if we just changed to that state
    if(needlestate == 0) stateZeroCount = 0;
    if(needlestate == 1) stateOneCount = 0;
    if(needlestate == 2) stateTwoCount = 0;
    if(needlestate == 3) stateThreeCount = 0;

  }
  lastneedlestate = needlestate;
  
}

