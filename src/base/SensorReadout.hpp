#ifndef SENSORREADOUT_HPP
#define SENSORREADOUT_HPP

#include <SparkFunBME280.h>
#include "SensorMeasurement.hpp"

class SensorReadout
{
#define MAX_READ_BUFFER 64

public:
  SensorReadout();
  
  bool Update();
  float GetValue(bool remote, SensorMeasurement value);
private:
  struct SensorData
  {
    float pressure, temp, humidity;
  };
  
  char buf[MAX_READ_BUFFER];
  size_t pos = 0;
  SensorData remoteData, localData;
  BME280 bme;

  bool parseData();
  void readLocal();
};

#endif
