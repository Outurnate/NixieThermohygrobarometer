#include <Arduino.h>
#include "LowPower.h"
#include "src/SparkFunBME280.h"
#include "Wire.h"

#define WAIT_PERIODS 8
#define XBEE_WAKE_PIN 9

void transmitReading()
{
  BME280 bme;

  pinMode(XBEE_WAKE_PIN, OUTPUT);
  digitalWrite(XBEE_WAKE_PIN, LOW);
  
  Serial.begin(9600);
  delay(10);
  
  Wire.begin();
  bme.beginI2C();

  bme.setFilter(0);
  bme.setStandbyTime(0);

  bme.setTempOverSample(1);
  bme.setPressureOverSample(1);
  bme.setHumidityOverSample(1);
  
  bme.setMode(MODE_NORMAL);
  
  delay(50);

  Serial.print("!");
  Serial.print(bme.readFloatPressure());
  Serial.print(",");
  Serial.print(bme.readTempC());
  Serial.print(",");
  Serial.print(bme.readFloatHumidity());
  Serial.print("*");

  Serial.end();

  pinMode(XBEE_WAKE_PIN, INPUT);
  digitalWrite(XBEE_WAKE_PIN, HIGH);
}

int atexit(void (* /*func*/ )()) { return 0; }

void initVariant() __attribute__((weak));
void initVariant() { }

void setupUSB() __attribute__((weak));
void setupUSB() { }

int main(void)
{
  init();
  initVariant();

#if defined(USBCON)
  USBDevice.attach();
#endif
  
  for (;;)
  {
    transmitReading();
    
    if (serialEventRun)
      serialEventRun();
    
    for (int i = 0; i < WAIT_PERIODS; ++i)
      LowPower.powerDown(SLEEP_8S, ADC_OFF, BOD_OFF);
  }
  
  return 0;
}
