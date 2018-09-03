#include "PanelControls.hpp"

#include <Arduino.h>
#include "Pins.hpp"

PanelControls::PanelControls()
{
  pinMode(PANEL_OUTDOOR_TOGGLE_PIN, INPUT);
  pinMode(PANEL_MODE_TOGGLE_PIN, INPUT);

  Update();
  mode = SensorMeasurement::Temperature;
}

bool PanelControls::Update()
{
  bool previousLocal = local;
  bool previousModeState = modeState;
  
  local = digitalRead(PANEL_OUTDOOR_TOGGLE_PIN) == LOW;
  modeState = digitalRead(PANEL_MODE_TOGGLE_PIN) == HIGH;

  if (previousModeState != modeState)
    mode = static_cast<SensorMeasurement>((mode + 1) % 3);

  return previousLocal != local || previousModeState != modeState;
}

bool PanelControls::GetLocalRemote()
{
  return local;
}

SensorMeasurement PanelControls::GetMode()
{
  return mode;
}
