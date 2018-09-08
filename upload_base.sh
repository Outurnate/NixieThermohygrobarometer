#!/bin/bash
avrdude -c usbtiny -p atmega328p -U flash:w:./build/base.hex
