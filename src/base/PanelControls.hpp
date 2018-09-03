#ifndef PANELCONTROLS_HPP
#define PANELCONTROLS_HPP

#include "SensorMeasurement.hpp"

class PanelControls
{
public:
  PanelControls();

  bool Update();
  bool GetLocalRemote();
  SensorMeasurement GetMode();
private:
  bool local;
  bool modeState;
  SensorMeasurement mode = SensorMeasurement::Temperature;
};

#endif
