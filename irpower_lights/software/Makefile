###################################################################
#          This file is machine-generated - Do NOT edit!          #
# Written by: Paulo H. "Taka" Torrens <paulo_torrens@hotmail.com> #
###################################################################

CC = avr-gcc $(CPP_FLAGS)
LD = avr-gcc $(LD_FLAGS)
AR = avr-ar $(AR_FLAGS)
OBJCP = avr-objcopy
SIZE = avr-size --format=avr --mcu=$(MCU)
AVRDUDE = avrdude

LIBRARIES = IRRemote.a M8_Arduino.a MsTimer2.a Rfm70.a
OBJECTS = src/IRSensorRecv.o src/PowerController.o src/IRPowerControl.o src/PowerChannel.o src/main.o
INCLUDES = -I"/usr/lib/avr/include/avr" -I"./include/util/avr-stl" -I"./include/util/HashMap" -I"./include/irpower" -I"src" -I"lib/IRRemote" -I"lib/M8_Arduino" -I"lib/MsTimer2" -I"lib/Rfm70"
DEFINES = -DF_CPU=$(F_CPU) -DARDUINO=101 -DSANYO_DECODER

CPP_FLAGS = -Wall -Os -fno-exceptions -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -mmcu=$(MCU) $(DEFINES) $(INCLUDES)
LD_FLAGS = -Os -Wl,--gc-sections -mmcu=$(MCU)
AR_FLAGS = rcs

MCU = atmega8
F_CPU = 8000000UL
FORMAT = ihex

OUTPUT = main

all: $(LIBRARIES) $(OUTPUT).hex

IRRemote.a: lib/IRRemote/IRremote.o
	$(AR) IRRemote.a lib/IRRemote/IRremote.o

lib/IRRemote/IRremote.o: lib/IRRemote/IRremote.cpp
	$(CC) -c lib/IRRemote/IRremote.cpp -o lib/IRRemote/IRremote.o

M8_Arduino.a: lib/M8_Arduino/Print.o lib/M8_Arduino/CDC.o lib/M8_Arduino/wiring_pulse.o lib/M8_Arduino/new.o lib/M8_Arduino/HID.o lib/M8_Arduino/WString.o lib/M8_Arduino/Stream.o lib/M8_Arduino/WInterrupts.o lib/M8_Arduino/IPAddress.o lib/M8_Arduino/WMath.o lib/M8_Arduino/wiring_digital.o lib/M8_Arduino/Tone.o lib/M8_Arduino/wiring_shift.o lib/M8_Arduino/USBCore.o lib/M8_Arduino/wiring.o lib/M8_Arduino/wiring_analog.o lib/M8_Arduino/HardwareSerial.o
	$(AR) M8_Arduino.a lib/M8_Arduino/Print.o
	$(AR) M8_Arduino.a lib/M8_Arduino/CDC.o
	$(AR) M8_Arduino.a lib/M8_Arduino/wiring_pulse.o
	$(AR) M8_Arduino.a lib/M8_Arduino/new.o
	$(AR) M8_Arduino.a lib/M8_Arduino/HID.o
	$(AR) M8_Arduino.a lib/M8_Arduino/WString.o
	$(AR) M8_Arduino.a lib/M8_Arduino/Stream.o
	$(AR) M8_Arduino.a lib/M8_Arduino/WInterrupts.o
	$(AR) M8_Arduino.a lib/M8_Arduino/IPAddress.o
	$(AR) M8_Arduino.a lib/M8_Arduino/WMath.o
	$(AR) M8_Arduino.a lib/M8_Arduino/wiring_digital.o
	$(AR) M8_Arduino.a lib/M8_Arduino/Tone.o
	$(AR) M8_Arduino.a lib/M8_Arduino/wiring_shift.o
	$(AR) M8_Arduino.a lib/M8_Arduino/USBCore.o
	$(AR) M8_Arduino.a lib/M8_Arduino/wiring.o
	$(AR) M8_Arduino.a lib/M8_Arduino/wiring_analog.o
	$(AR) M8_Arduino.a lib/M8_Arduino/HardwareSerial.o

lib/M8_Arduino/Print.o: lib/M8_Arduino/Print.cpp
	$(CC) -c lib/M8_Arduino/Print.cpp -o lib/M8_Arduino/Print.o

lib/M8_Arduino/CDC.o: lib/M8_Arduino/CDC.cpp
	$(CC) -c lib/M8_Arduino/CDC.cpp -o lib/M8_Arduino/CDC.o

lib/M8_Arduino/wiring_pulse.o: lib/M8_Arduino/wiring_pulse.c
	$(CC) -c lib/M8_Arduino/wiring_pulse.c -o lib/M8_Arduino/wiring_pulse.o

lib/M8_Arduino/new.o: lib/M8_Arduino/new.cpp
	$(CC) -c lib/M8_Arduino/new.cpp -o lib/M8_Arduino/new.o

lib/M8_Arduino/HID.o: lib/M8_Arduino/HID.cpp
	$(CC) -c lib/M8_Arduino/HID.cpp -o lib/M8_Arduino/HID.o

lib/M8_Arduino/WString.o: lib/M8_Arduino/WString.cpp
	$(CC) -c lib/M8_Arduino/WString.cpp -o lib/M8_Arduino/WString.o

lib/M8_Arduino/Stream.o: lib/M8_Arduino/Stream.cpp
	$(CC) -c lib/M8_Arduino/Stream.cpp -o lib/M8_Arduino/Stream.o

lib/M8_Arduino/WInterrupts.o: lib/M8_Arduino/WInterrupts.c
	$(CC) -c lib/M8_Arduino/WInterrupts.c -o lib/M8_Arduino/WInterrupts.o

lib/M8_Arduino/IPAddress.o: lib/M8_Arduino/IPAddress.cpp
	$(CC) -c lib/M8_Arduino/IPAddress.cpp -o lib/M8_Arduino/IPAddress.o

lib/M8_Arduino/WMath.o: lib/M8_Arduino/WMath.cpp
	$(CC) -c lib/M8_Arduino/WMath.cpp -o lib/M8_Arduino/WMath.o

lib/M8_Arduino/wiring_digital.o: lib/M8_Arduino/wiring_digital.c
	$(CC) -c lib/M8_Arduino/wiring_digital.c -o lib/M8_Arduino/wiring_digital.o

lib/M8_Arduino/Tone.o: lib/M8_Arduino/Tone.cpp
	$(CC) -c lib/M8_Arduino/Tone.cpp -o lib/M8_Arduino/Tone.o

lib/M8_Arduino/wiring_shift.o: lib/M8_Arduino/wiring_shift.c
	$(CC) -c lib/M8_Arduino/wiring_shift.c -o lib/M8_Arduino/wiring_shift.o

lib/M8_Arduino/USBCore.o: lib/M8_Arduino/USBCore.cpp
	$(CC) -c lib/M8_Arduino/USBCore.cpp -o lib/M8_Arduino/USBCore.o

lib/M8_Arduino/wiring.o: lib/M8_Arduino/wiring.c
	$(CC) -c lib/M8_Arduino/wiring.c -o lib/M8_Arduino/wiring.o

lib/M8_Arduino/wiring_analog.o: lib/M8_Arduino/wiring_analog.c
	$(CC) -c lib/M8_Arduino/wiring_analog.c -o lib/M8_Arduino/wiring_analog.o

lib/M8_Arduino/HardwareSerial.o: lib/M8_Arduino/HardwareSerial.cpp
	$(CC) -c lib/M8_Arduino/HardwareSerial.cpp -o lib/M8_Arduino/HardwareSerial.o

MsTimer2.a: lib/MsTimer2/MsTimer2.o
	$(AR) MsTimer2.a lib/MsTimer2/MsTimer2.o

lib/MsTimer2/MsTimer2.o: lib/MsTimer2/MsTimer2.cpp
	$(CC) -c lib/MsTimer2/MsTimer2.cpp -o lib/MsTimer2/MsTimer2.o

Rfm70.a: lib/Rfm70/Rfm70.o
	$(AR) Rfm70.a lib/Rfm70/Rfm70.o

lib/Rfm70/Rfm70.o: lib/Rfm70/Rfm70.cpp
	$(CC) -c lib/Rfm70/Rfm70.cpp -o lib/Rfm70/Rfm70.o

src/IRSensorRecv.o: src/IRSensorRecv.cpp
	$(CC) -c src/IRSensorRecv.cpp -o src/IRSensorRecv.o

src/PowerController.o: src/PowerController.cpp
	$(CC) -c src/PowerController.cpp -o src/PowerController.o

src/IRPowerControl.o: src/IRPowerControl.cpp
	$(CC) -c src/IRPowerControl.cpp -o src/IRPowerControl.o

src/PowerChannel.o: src/PowerChannel.cpp
	$(CC) -c src/PowerChannel.cpp -o src/PowerChannel.o

src/main.o: src/main.cpp
	$(CC) -c src/main.cpp -o src/main.o

$(OUTPUT).elf: $(OBJECTS) $(LIBRARIES)
	$(LD) $(OBJECTS) $(LIBRARIES) -lm -o $(OUTPUT).elf

$(OUTPUT).hex: $(OUTPUT).elf
	$(OBJCP) -O ihex -R .eeprom $(OUTPUT).elf $(OUTPUT).hex
	$(SIZE) $(OUTPUT).elf
  
.PHONY: upload clean

upload: all
	$(AVRDUDE) -p$(MCU) -cusbasp -Uflash:w:$(OUTPUT).hex:a

clean:
	@rm -f $(LIBRARIES) $(OUTPUT).elf $(OUTPUT).hex $(shell find . -follow -name "*.o")
  
Makefile: scripts/make.rb $(shell find src -follow -not -type f -newer Makefile)
	@scripts/make.rb
