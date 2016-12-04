
#include <SoftwareSerial.h>

int sensorPin = 0;

float sensor[] = {0};

void setup(){
Serial.begin(9600);
};

void loop(){
sensor[0] = analogRead(sensorPin);

Serial.print(",");
Serial.print(sensor[0]);
delay(100);
}
