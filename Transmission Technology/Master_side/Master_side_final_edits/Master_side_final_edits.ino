// Include Arduino Wire library for I2C
#include <Wire.h>
 
// Define Slave I2C Address
#define SLAVE_PIN 9
int IRSENSOR = 2;
 
// Define counter to count bytes in response
int bcount;
 
// Define array for return data
byte distance[4];
 
void setup()
{
  pinMode (IRSENSOR, INPUT);
  Wire.begin();
  Serial.begin(9600);
}
 
byte readI2C(int address) {
  // Define a variable to hold byte of data
  byte bval ;
  long entry = millis();
  // Read one byte at a time
  Wire.requestFrom(address, 1); 
  // Wait 100 ms for data to stabilize
  while (Wire.available() == 0 && (millis() - entry) < 100)  Serial.print("Waiting");
  // Place data into byte
  if  (millis() - entry < 100) bval = Wire.read();
  return bval;
}
 
void loop()
{
   int statusSensor = digitalRead (IRSENSOR);
   Serial.println(statusSensor);
  
   if (statusSensor == 0)
  {
    while (readI2C(SLAVE_PIN) < 255) {
  // Until first byte has been received print a waiting message
    Serial.println("Waiting"); 
    }
  for (bcount = 0; bcount < 4; bcount++) {
    distance[bcount] = readI2C(SLAVE_PIN);
  }
  for (int i = 0; i < 4; i++) {
    Serial.print(distance[i]);
    Serial.print("\t");
  }
  Serial.println();
  delay(200);
  }
  else {
  Serial.println(statusSensor);
  }
 }
