#!/bin/bash
avrdude -c usbtiny -p atmega328p -U lfuse:w:0xFF:m -U hfuse:w:0xD6:m -U efuse:w:0xFE:m
avrdude -c usbtiny -p atmega328p -U flash:w:./build/transmitter.hex
