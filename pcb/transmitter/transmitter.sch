EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:SparkFun-Switches
LIBS:SparkFun-Sensors
LIBS:SparkFun-Resistors
LIBS:SparkFun-RF
LIBS:SparkFun-PowerSymbols
LIBS:SparkFun-LED
LIBS:SparkFun-Jumpers
LIBS:SparkFun-IC-Special-Function
LIBS:SparkFun-IC-Power
LIBS:SparkFun-IC-Microcontroller
LIBS:SparkFun-IC-Memory
LIBS:SparkFun-IC-Logic
LIBS:SparkFun-IC-Conversion
LIBS:SparkFun-IC-Comms
LIBS:SparkFun-IC-Amplifiers
LIBS:SparkFun-Hardware
LIBS:SparkFun-GPS
LIBS:SparkFun-Fuses
LIBS:SparkFun-Electromechanical
LIBS:SparkFun-Displays
LIBS:SparkFun-DiscreteSemi
LIBS:SparkFun-Connectors
LIBS:SparkFun-Coils
LIBS:SparkFun-Clocks
LIBS:SparkFun-Capacitors
LIBS:SparkFun-Boards
LIBS:SparkFun-Batteries
LIBS:SparkFun-Aesthetics
LIBS:transmitter-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Weather Sensor Transmitter"
Date "2018-04-15"
Rev "1"
Comp "Joe Dillon"
Comment1 "BME280 weather condition broadcast chip"
Comment2 "Requires external 3v3 power source"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L XBEE H2
U 1 1 5ABED811
P 8700 5100
F 0 "H2" H 8100 5610 45  0000 L BNN
F 1 "XBEE" H 8100 4490 45  0000 L BNN
F 2 "SparkFun:XBEE" H 8730 5250 20  0001 C CNN
F 3 "XB24-AWI-001-ND" H 8850 5650 60  0000 C CNN
	1    8700 5100
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x04_Female H1
U 1 1 5ABED89A
P 8450 3050
F 0 "H1" H 8450 3250 50  0000 C CNN
F 1 "Conn_01x04_Female" H 8450 2750 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x04_Pitch2.54mm" H 8450 3050 50  0001 C CNN
F 3 "" H 8450 3050 50  0001 C CNN
	1    8450 3050
	1    0    0    -1  
$EndComp
$Comp
L ATMEGA328-PU U1
U 1 1 5ABED930
P 5550 4300
F 0 "U1" H 4800 5550 50  0000 L BNN
F 1 "ATMEGA328-PU" H 5950 2900 50  0000 L BNN
F 2 "SparkFun:DIP28" H 5550 4300 50  0001 C CIN
F 3 "" H 5550 4300 50  0001 C CNN
	1    5550 4300
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5AC15738
P 6650 2900
F 0 "R1" V 6730 2900 50  0000 C CNN
F 1 "10k" V 6650 2900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6580 2900 50  0001 C CNN
F 3 "" H 6650 2900 50  0001 C CNN
	1    6650 2900
	-1   0    0    1   
$EndComp
$Comp
L Crystal Y1
U 1 1 5AC169DE
P 7400 4050
F 0 "Y1" H 7400 4200 50  0000 C CNN
F 1 "16MHz" H 7400 3900 50  0000 C CNN
F 2 "Crystals:Crystal_HC49-U_Vertical" H 7400 4050 50  0001 C CNN
F 3 "" H 7400 4050 50  0001 C CNN
	1    7400 4050
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5AC16A57
P 7150 4350
F 0 "C1" H 7175 4450 50  0000 L CNN
F 1 "22pF" H 7175 4250 50  0000 L CNN
F 2 "Capacitors_THT:C_Axial_L5.1mm_D3.1mm_P7.50mm_Horizontal" H 7188 4200 50  0001 C CNN
F 3 "" H 7150 4350 50  0001 C CNN
	1    7150 4350
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5AC16AB2
P 7650 4350
F 0 "C2" H 7675 4450 50  0000 L CNN
F 1 "22pF" H 7675 4250 50  0000 L CNN
F 2 "Capacitors_THT:C_Axial_L5.1mm_D3.1mm_P7.50mm_Horizontal" H 7688 4200 50  0001 C CNN
F 3 "" H 7650 4350 50  0001 C CNN
	1    7650 4350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 5AD2573C
P 4500 5650
F 0 "#PWR01" H 4500 5400 50  0001 C CNN
F 1 "GND" H 4500 5500 50  0000 C CNN
F 2 "" H 4500 5650 50  0001 C CNN
F 3 "" H 4500 5650 50  0001 C CNN
	1    4500 5650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5AD25B78
P 7900 5800
F 0 "#PWR02" H 7900 5550 50  0001 C CNN
F 1 "GND" H 7900 5650 50  0000 C CNN
F 2 "" H 7900 5800 50  0001 C CNN
F 3 "" H 7900 5800 50  0001 C CNN
	1    7900 5800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5AD26556
P 7150 4500
F 0 "#PWR03" H 7150 4250 50  0001 C CNN
F 1 "GND" H 7150 4350 50  0000 C CNN
F 2 "" H 7150 4500 50  0001 C CNN
F 3 "" H 7150 4500 50  0001 C CNN
	1    7150 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5AD2657E
P 7650 4500
F 0 "#PWR04" H 7650 4250 50  0001 C CNN
F 1 "GND" H 7650 4350 50  0000 C CNN
F 2 "" H 7650 4500 50  0001 C CNN
F 3 "" H 7650 4500 50  0001 C CNN
	1    7650 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5AD26967
P 8050 3550
F 0 "#PWR05" H 8050 3300 50  0001 C CNN
F 1 "GND" H 8050 3400 50  0000 C CNN
F 2 "" H 8050 3550 50  0001 C CNN
F 3 "" H 8050 3550 50  0001 C CNN
	1    8050 3550
	1    0    0    -1  
$EndComp
Text Label 8100 3150 0    60   ~ 0
SDA
Text Label 8100 3250 0    60   ~ 0
SCL
Text Label 8100 3050 0    60   ~ 0
3v3
Text Label 8100 2950 0    60   ~ 0
GND
Wire Wire Line
	6550 4800 8000 4800
Wire Wire Line
	6550 4900 8000 4900
Wire Wire Line
	6550 4650 6650 4650
Connection ~ 4650 3200
Connection ~ 4650 3500
Wire Wire Line
	7650 3800 7650 4200
Wire Wire Line
	7650 4050 7550 4050
Wire Wire Line
	7250 4050 7150 4050
Wire Wire Line
	7150 3900 7150 4200
Wire Wire Line
	6550 3900 7150 3900
Connection ~ 7150 4050
Wire Wire Line
	6550 3800 7650 3800
Connection ~ 7650 4050
Wire Wire Line
	4650 2650 4650 3800
Connection ~ 4650 2650
Wire Wire Line
	4650 5400 4500 5400
Wire Wire Line
	4500 5400 4500 5650
Wire Wire Line
	4650 5500 4500 5500
Connection ~ 4500 5500
Wire Wire Line
	8000 5600 7900 5600
Wire Wire Line
	7900 5600 7900 5800
Wire Wire Line
	7900 4700 8000 4700
Wire Wire Line
	8250 3050 7900 3050
Wire Wire Line
	6550 4450 6750 4450
Wire Wire Line
	6750 4450 6750 3150
Wire Wire Line
	6750 3150 8250 3150
Wire Wire Line
	6550 4550 6850 4550
Wire Wire Line
	6850 4550 6850 3250
Wire Wire Line
	6850 3250 8250 3250
Wire Wire Line
	8250 2950 8050 2950
Wire Wire Line
	8050 2950 8050 3550
Wire Wire Line
	7900 2650 7900 4700
Connection ~ 7900 3050
$Comp
L Conn_01x02_Female J1
U 1 1 5AD38403
P 3750 2650
F 0 "J1" H 3750 2750 50  0000 C CNN
F 1 "Conn_01x02_Female" H 3750 2450 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02_Pitch2.54mm" H 3750 2650 50  0001 C CNN
F 3 "" H 3750 2650 50  0001 C CNN
	1    3750 2650
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5AD385CC
P 4300 2950
F 0 "#PWR06" H 4300 2700 50  0001 C CNN
F 1 "GND" H 4300 2800 50  0000 C CNN
F 2 "" H 4300 2950 50  0001 C CNN
F 3 "" H 4300 2950 50  0001 C CNN
	1    4300 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2750 4300 2750
Wire Wire Line
	4300 2750 4300 2950
Wire Wire Line
	6650 4650 6650 3050
Wire Wire Line
	3950 2650 7900 2650
Wire Wire Line
	6650 2750 6650 2650
Connection ~ 6650 2650
Wire Wire Line
	6550 4150 6950 4150
Wire Wire Line
	6950 3050 6950 5500
Wire Wire Line
	6950 5500 8000 5500
$Comp
L R R2
U 1 1 5B43E5EE
P 6950 2900
F 0 "R2" V 7030 2900 50  0000 C CNN
F 1 "10k" V 6950 2900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6880 2900 50  0001 C CNN
F 3 "" H 6950 2900 50  0001 C CNN
	1    6950 2900
	-1   0    0    1   
$EndComp
Connection ~ 6950 4150
Wire Wire Line
	6950 2750 6950 2650
Connection ~ 6950 2650
$EndSCHEMATC
