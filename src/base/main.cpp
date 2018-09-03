#include <Arduino.h>
#include "SensorReadout.hpp"
#include "PanelControls.hpp"
#include "NixieDisplay.hpp"
#include "Debug.hpp"

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

  DPRINT("START");
  delay(10000);
  DPRINT("START9");
  
  SensorReadout dat;
  PanelControls panel;
  NixieDisplay display;

  while (true)
  {
    bool datUpdate = dat.Update();
    bool panelUpdate = panel.Update();
    DPRINT("Update values");
    DPRINT(datUpdate);
    DPRINT(panelUpdate);
    DPRINT("Update values end");
    if (datUpdate || panelUpdate)
      display.ShowValue(panel.GetMode(), dat.GetValue(!panel.GetLocalRemote(), panel.GetMode()));

    delay(1000);
  }
  
  return 0;
}
