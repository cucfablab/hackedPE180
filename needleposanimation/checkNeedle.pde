int needlestate = 0;
int lastneedlestate = 0;
boolean rstate; //state of slatted rotary encoder
boolean lastrstate;

int stateZeroCount = 0;
int stateOneCount = 0;
int stateTwoCount = 0;
int stateThreeCount = 0;

void checkNeedle(){
  boolean s1 = boolean(bin[2]);
  boolean s2 = boolean(bin[3]);
  if(!s1 && !s2) needlestate = 0; //High
  if(!s1 && s2) needlestate = 1; //Descending
  if(s1 && s2) needlestate = 2; // Low
  if(s1 && !s2) needlestate = 3; //Ascending
}
