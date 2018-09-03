#include "NixieDisplay.hpp"

#include <Arduino.h>
#include "Pins.hpp"
#include "Debug.hpp"

NixieDisplay::NixieDisplay()
{
  pinMode(NIXIE_DATA_PIN, OUTPUT);
  pinMode(NIXIE_CLOCK_PIN, OUTPUT);
  pinMode(NIXIE_LATCH_PIN, OUTPUT);
}

void NixieDisplay::ShowValue(SensorMeasurement mode, float value)
{
  const size_t BCD_WIDTH = 4; // number of bits in a single BCD digit
  const size_t BCD_DIGITS = 4; // count of BCD digits
  
  char valueBuffer[11]; // one for sign, one for decimal, four for left of decimal, four for right, one for nul char
  dtostrf(min(abs(value), 9999.0F), 6, 4, valueBuffer); // four on the left, four on the right
  
  uint16_t outputValue = 0;
  
  unsigned outputPosition = 0;
  char* current = valueBuffer;
  while (outputPosition < BCD_WIDTH)
  {
    if (*current != '.')
      outputValue += (*current - '0') << (((BCD_DIGITS - 1) * BCD_WIDTH) - (outputPosition++ * BCD_WIDTH)); // starting from the left, right shift BCD digits into outputValue
    current += sizeof(char);
  }

  uint8_t outputFlags = 0;

  // assign decimal point output flag
  switch (valueBuffer[0] == '0' ? 0 : (strchr(valueBuffer, '.') - valueBuffer)) // if first digit zero, no decimals.  otherwise, count digits on the left of decimal
  {
    case 3:
      outputFlags |= 0x01;
      break;
      
    case 2:
      outputFlags |= 0x02;
      break;
      
    case 1:
      outputFlags |= 0x04;
      break;
  }

  // assign negative output flag
  outputFlags |= value < 0 ? 0x80 : 0x00;

  // assign mode output flag
  switch (mode)
  {
    case SensorMeasurement::Temperature:
      outputFlags |= 0x40;
      break;
      
    case SensorMeasurement::Pressure:
      outputFlags |= 0x20;
      break;
      
    case SensorMeasurement::Humidity:
      outputFlags |= 0x10;
      break;
  }

  DPRINT("Display Values: ");
  DPRINT(outputFlags);
  DPRINT(outputValue);
  
  digitalWrite(NIXIE_LATCH_PIN, LOW);
  shiftOut(NIXIE_DATA_PIN, NIXIE_CLOCK_PIN, MSBFIRST, outputFlags); //U7
  shiftOut(NIXIE_DATA_PIN, NIXIE_CLOCK_PIN, MSBFIRST, (uint8_t)(outputValue >> 8)); //U6
  shiftOut(NIXIE_DATA_PIN, NIXIE_CLOCK_PIN, MSBFIRST, (uint8_t)(outputValue >> 0)); //U5
  digitalWrite(NIXIE_LATCH_PIN, HIGH);
}
