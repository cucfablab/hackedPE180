void setup() {
  Serial.begin(115200);
  // put your setup code here, to run once:
  pinMode(8, INPUT_PULLUP); // cam 1
  pinMode(9, INPUT_PULLUP); // cam 2
  pinMode(10, INPUT_PULLUP); //rotary encoder
  pinMode(11, INPUT_PULLUP); //y limit
  pinMode(12, INPUT_PULLUP); //x limit
}
void loop() {
  // put your main code here, to run repeatedly:
  int c = 0;
  if(digitalRead(8)) c += 1;
  if(digitalRead(9)) c += 2;
  if(digitalRead(10)) c += 4;
  if(digitalRead(11)) c += 8;
  if(digitalRead(12)) c += 16;
  Serial.write(c);
  delay(25);
}
