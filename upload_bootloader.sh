#!/bin/bash
avrdude -c usbtiny -p atmega328p -U flash:w:arduino-1.8.6/hardware/arduino/avr/bootloaders/optiboot/optiboot_atmega328.hex
