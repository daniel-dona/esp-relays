EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ESP Relays"
Date "2019-08-19"
Rev "C"
Comp "Daniel Doña"
Comment1 "Licensed under GNU GPL v3"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 5C68473A
P 1350 1500
F 0 "J1" H 1456 1778 50  0000 C CNN
F 1 "UART" H 1456 1687 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1350 1500 50  0001 C CNN
F 3 "~" H 1350 1500 50  0001 C CNN
	1    1350 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J2
U 1 1 5C6873F5
P 1400 2150
F 0 "J2" H 1320 1825 50  0000 C CNN
F 1 "AC IN" H 1320 1916 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 1400 2150 50  0001 C CNN
F 3 "~" H 1400 2150 50  0001 C CNN
	1    1400 2150
	-1   0    0    1   
$EndComp
$Comp
L powermodule:PowerModule PW101
U 1 1 5C688E9F
P 3400 1500
F 0 "PW101" H 3400 1850 50  0001 C CIN
F 1 "PowerModule" H 3400 1773 50  0000 C CNN
F 2 "PowerModule:PowerModule" H 3400 1850 50  0001 C CNN
F 3 "" H 3400 1850 50  0001 C CNN
	1    3400 1500
	1    0    0    -1  
$EndComp
Text GLabel 3550 3750 2    50   Input ~ 0
GND
$Comp
L RF_Module:ESP-12F U1
U 1 1 5C68441E
P 3500 3050
F 0 "U1" H 3500 4028 50  0000 C CNN
F 1 "ESP-12F" H 3500 3937 50  0000 C CNN
F 2 "RF_Module:ESP-12E" H 3500 3050 50  0001 C CNN
F 3 "http://wiki.ai-thinker.com/_media/esp8266/esp8266_series_modules_user_manual_v1.1.pdf" H 3150 3150 50  0001 C CNN
	1    3500 3050
	1    0    0    -1  
$EndComp
Text GLabel 3900 1600 2    50   Input ~ 0
GND
Wire Wire Line
	3800 1600 3900 1600
Text GLabel 3900 1400 2    50   Input ~ 0
3V3
Wire Wire Line
	3800 1400 3900 1400
Text GLabel 3600 2250 2    50   Input ~ 0
3V3
Wire Wire Line
	3500 2250 3600 2250
Wire Wire Line
	3500 3750 3550 3750
Text GLabel 1600 1400 2    50   Input ~ 0
GND
Wire Wire Line
	1550 1600 1600 1600
Text GLabel 2950 1400 0    50   Input ~ 0
L
Text GLabel 2950 1600 0    50   Input ~ 0
N
Wire Wire Line
	3000 1400 2950 1400
Wire Wire Line
	3000 1600 2950 1600
Text GLabel 1700 1900 2    50   Input ~ 0
L
Text GLabel 1700 2250 2    50   Input ~ 0
N
Wire Wire Line
	1600 1900 1700 1900
Wire Wire Line
	1600 2250 1700 2250
Text GLabel 1600 1500 2    50   Input ~ 0
UART_TX
Text GLabel 1600 1600 2    50   Input ~ 0
UART_RX
Text GLabel 4200 2550 2    50   Input ~ 0
UART_TX
Text GLabel 4200 2750 2    50   Input ~ 0
UART_RX
Wire Wire Line
	4100 2550 4200 2550
Wire Wire Line
	4200 2750 4100 2750
Wire Wire Line
	1550 1400 1600 1400
Wire Wire Line
	1550 1500 1600 1500
$Comp
L Relay:Y14x-1C-xxDS K1
U 1 1 5C687123
P 6050 2250
F 0 "K1" H 6480 2296 50  0000 L CNN
F 1 "RL1" H 6480 2205 50  0000 L CNN
F 2 "PowerModule:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 6500 2200 50  0001 L CNN
F 3 "http://www.hsinda.com.cn/en/imgdown.asp?FileName=UploadFiles/201431310240386.pdf" H 6050 2250 50  0001 C CNN
	1    6050 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1900 5850 1950
$Comp
L Device:D D1
U 1 1 5C68759C
P 5400 2250
F 0 "D1" V 5354 2329 50  0000 L CNN
F 1 "D" V 5445 2329 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5400 2250 50  0001 C CNN
F 3 "~" H 5400 2250 50  0001 C CNN
	1    5400 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 1950 5400 1950
Wire Wire Line
	5400 1950 5400 2100
Connection ~ 5850 1950
Wire Wire Line
	5400 2400 5400 2550
Wire Wire Line
	5400 2550 5850 2550
Text GLabel 5850 2700 3    50   Input ~ 0
3V3
Text GLabel 5150 1700 0    50   Input ~ 0
IO1
Text GLabel 5850 1400 1    50   Input ~ 0
GND
Wire Wire Line
	5850 2550 5850 2700
Connection ~ 5850 2550
$Comp
L Connector:Screw_Terminal_01x03 J3
U 1 1 5C688497
P 1400 2800
F 0 "J3" H 1320 2475 50  0000 C CNN
F 1 "RL1 CON" H 1320 2566 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 1400 2800 50  0001 C CNN
F 3 "~" H 1400 2800 50  0001 C CNN
	1    1400 2800
	-1   0    0    1   
$EndComp
Text GLabel 1600 2800 2    50   Input ~ 0
COM1
Text GLabel 1600 2700 2    50   Input ~ 0
NO1
Text GLabel 1600 2900 2    50   Input ~ 0
NC1
Text GLabel 6250 2550 3    50   Input ~ 0
COM1
Text GLabel 6150 1950 1    50   Input ~ 0
NC1
Text GLabel 6350 1950 1    50   Input ~ 0
NO1
$Comp
L Relay:Y14x-1C-xxDS K2
U 1 1 5C689369
P 6050 4500
F 0 "K2" H 6480 4546 50  0000 L CNN
F 1 "RL2" H 6480 4455 50  0000 L CNN
F 2 "PowerModule:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 6500 4450 50  0001 L CNN
F 3 "http://www.hsinda.com.cn/en/imgdown.asp?FileName=UploadFiles/201431310240386.pdf" H 6050 4500 50  0001 C CNN
	1    6050 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4150 5850 4200
$Comp
L Device:D D2
U 1 1 5C68937C
P 5400 4500
F 0 "D2" V 5354 4579 50  0000 L CNN
F 1 "D" V 5445 4579 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 5400 4500 50  0001 C CNN
F 3 "~" H 5400 4500 50  0001 C CNN
	1    5400 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 4200 5400 4200
Wire Wire Line
	5400 4200 5400 4350
Connection ~ 5850 4200
Wire Wire Line
	5400 4650 5400 4800
Wire Wire Line
	5400 4800 5850 4800
Text GLabel 5150 3950 0    50   Input ~ 0
IO2
Wire Wire Line
	5850 4800 5850 4950
Connection ~ 5850 4800
Text GLabel 6250 4800 3    50   Input ~ 0
COM2
Text GLabel 6150 4200 1    50   Input ~ 0
NC2
Text GLabel 6350 4200 1    50   Input ~ 0
NO2
$Comp
L Connector:Screw_Terminal_01x03 J4
U 1 1 5C6898FB
P 1400 3450
F 0 "J4" H 1320 3125 50  0000 C CNN
F 1 "RL2 CON" H 1320 3216 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-3_P5.00mm" H 1400 3450 50  0001 C CNN
F 3 "~" H 1400 3450 50  0001 C CNN
	1    1400 3450
	-1   0    0    1   
$EndComp
Text GLabel 1600 3450 2    50   Input ~ 0
COM2
Text GLabel 1600 3350 2    50   Input ~ 0
NO2
Text GLabel 1600 3550 2    50   Input ~ 0
NC2
Text GLabel 4200 3050 2    50   Input ~ 0
IO2
Text GLabel 4200 3150 2    50   Input ~ 0
IO1
Wire Wire Line
	4200 3050 4100 3050
Wire Wire Line
	4100 3150 4200 3150
Text GLabel 2900 2650 0    50   Input ~ 0
3V3
$Comp
L Switch:SW_Push SW1
U 1 1 5C68C11D
P 1750 4100
F 0 "SW1" H 1750 4385 50  0000 C CNN
F 1 "SW_Push" H 1750 4294 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 1750 4300 50  0001 C CNN
F 3 "" H 1750 4300 50  0001 C CNN
	1    1750 4100
	1    0    0    -1  
$EndComp
Text GLabel 1550 4100 0    50   Input ~ 0
GND
Text GLabel 1550 4350 0    50   Input ~ 0
3V3
$Comp
L Device:R R4
U 1 1 5C68C428
P 1750 4350
F 0 "R4" V 1543 4350 50  0000 C CNN
F 1 "R" V 1634 4350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1680 4350 50  0001 C CNN
F 3 "~" H 1750 4350 50  0001 C CNN
	1    1750 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 4350 1550 4350
Wire Wire Line
	1950 4100 2050 4100
Wire Wire Line
	2050 4100 2050 4350
Wire Wire Line
	2050 4350 1900 4350
Text GLabel 2250 4100 2    50   Input ~ 0
FLASH
Wire Wire Line
	2050 4100 2250 4100
Connection ~ 2050 4100
Text GLabel 4200 2450 2    50   Input ~ 0
FLASH
Wire Wire Line
	4100 2450 4200 2450
Text GLabel 1550 5050 0    50   Input ~ 0
3V3
$Comp
L Device:R R6
U 1 1 5C68DEAB
P 1750 5050
F 0 "R6" V 1543 5050 50  0000 C CNN
F 1 "R" V 1634 5050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1680 5050 50  0001 C CNN
F 3 "~" H 1750 5050 50  0001 C CNN
	1    1750 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 5050 1550 5050
Text GLabel 2250 5050 2    50   Input ~ 0
BOOT2
Wire Wire Line
	1900 5050 2250 5050
Text GLabel 1550 4700 0    50   Input ~ 0
GND
$Comp
L Device:R R5
U 1 1 5C6912D9
P 1750 4700
F 0 "R5" V 1543 4700 50  0000 C CNN
F 1 "R" V 1634 4700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1680 4700 50  0001 C CNN
F 3 "~" H 1750 4700 50  0001 C CNN
	1    1750 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 4700 1550 4700
Text GLabel 2250 4700 2    50   Input ~ 0
BOOT1
Wire Wire Line
	1900 4700 2250 4700
Text GLabel 4200 3350 2    50   Input ~ 0
BOOT1
Text GLabel 4200 2650 2    50   Input ~ 0
BOOT2
Wire Wire Line
	4200 2650 4100 2650
Wire Wire Line
	4200 3350 4100 3350
$Comp
L Transistor_FET:IRLZ44N Q1
U 1 1 5D3B8B45
P 5750 1700
F 0 "Q1" H 5955 1746 50  0000 L CNN
F 1 "IRLZ44N" H 5955 1655 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 6000 1625 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irlz44n.pdf" H 5750 1700 50  0001 L CNN
	1    5750 1700
	1    0    0    1   
$EndComp
$Comp
L Transistor_FET:IRLZ44N Q2
U 1 1 5D3B8BED
P 5750 3950
F 0 "Q2" H 5955 3996 50  0000 L CNN
F 1 "IRLZ44N" H 5955 3905 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 6000 3875 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irlz44n.pdf" H 5750 3950 50  0001 L CNN
	1    5750 3950
	1    0    0    1   
$EndComp
Wire Wire Line
	5850 1400 5850 1500
Wire Wire Line
	5150 3950 5550 3950
Wire Wire Line
	5150 1700 5550 1700
Text GLabel 5850 4950 3    50   Input ~ 0
3V3
Text GLabel 5850 3650 1    50   Input ~ 0
GND
Wire Wire Line
	5850 3750 5850 3650
$EndSCHEMATC
