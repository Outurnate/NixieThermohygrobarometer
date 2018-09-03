#ifndef NIXIEDISPLAY_HPP
#define NIXIEDISPLAY_HPP

#include "SensorMeasurement.hpp"

class NixieDisplay
{
public:
  NixieDisplay();

  void ShowValue(SensorMeasurement mode, float value);
private:
};

#endif
