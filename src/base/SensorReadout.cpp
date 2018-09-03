#include "SensorReadout.hpp"

#include <Wire.h>

SensorReadout::SensorReadout()
{
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
}

float SensorReadout::GetValue(bool remote, SensorMeasurement value)
{
  if (remote)
    switch(value)
    {
      case SensorMeasurement::Pressure:
        return remoteData.pressure;
      case SensorMeasurement::Temperature:
        return remoteData.temp;
      case SensorMeasurement::Humidity:
        return remoteData.humidity;
    }
  else
    switch(value)
    {
      case SensorMeasurement::Pressure:
        return localData.pressure;
      case SensorMeasurement::Temperature:
        return localData.temp;
      case SensorMeasurement::Humidity:
        return localData.humidity;
    }

  return 42.0F; // just to make the compiler happy
}

void SensorReadout::readLocal()
{
  localData.pressure = bme.readFloatPressure();
  localData.temp = bme.readTempC();
  localData.humidity = bme.readFloatHumidity();
}

bool SensorReadout::parseData()
{
  size_t commaCount = 0;
  for (size_t i = 0; i < pos; ++i)
  {
    if (!(buf[i] == '0' ||
          buf[i] == '1' ||
          buf[i] == '2' ||
          buf[i] == '3' ||
          buf[i] == '4' ||
          buf[i] == '5' ||
          buf[i] == '6' ||
          buf[i] == '7' ||
          buf[i] == '8' ||
          buf[i] == '9' ||
          buf[i] == ',' ||
          buf[i] == '.' ||
          buf[i] == '-'))
      return false;
    else if (buf[i] == ',')
      ++commaCount;
  }
  if (commaCount != 2)
    return false;

  char* firstComma = strchr(buf, ',');
  char* lastComma = strrchr(buf, ',');
  *firstComma = 0x00;
  *lastComma = 0x00;
  remoteData.pressure = atof(buf);
  remoteData.temp = atof(firstComma + 1);
  remoteData.humidity = atof(lastComma + 1);
  
  return true;
}

bool SensorReadout::Update()
{
  bool dirty = false;
  while (Serial.available() > 0)
  {
    char nextByte = Serial.read();
    if (nextByte == '!')
      pos = 0;
    else if (nextByte == '*')
    {
      buf[pos] = 0x00;
      dirty |= parseData();
      if (dirty)
        readLocal();
      pos = 0;
    }
    else
    {
      buf[pos] = nextByte;
      if (++pos == MAX_READ_BUFFER)
        pos = 0;
    }
  }

  return dirty;
}
