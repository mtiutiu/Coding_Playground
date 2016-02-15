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

LIBRARIES = Arduino.a ByteBuffer.a CapSense.a
OBJECTS = src/TouchLamp.o src/main.o src/PowerLedDimmer.o src/TouchSensor.o
INCLUDES = -I"/usr/lib/avr/include/avr" -I"./include" -I"src" -I"lib/Arduino" -I"lib/ByteBuffer" -I"lib/CapSense"
DEFINES = -DF_CPU=$(F_CPU)UL -DARDUINO=100 

CPP_FLAGS = -g -Wall -Os -w -fno-exceptions -ffunction-sections -fdata-sections -mmcu=$(MCU) $(DEFINES) $(INCLUDES)
LD_FLAGS = -Os -Wl,--gc-sections -mmcu=$(MCU)
AR_FLAGS = rcs

MCU = atmega8
F_CPU = 8000000UL
FORMAT = ihex

OUTPUT = main

all: $(LIBRARIES) $(OUTPUT).hex

Arduino.a: lib/Arduino/wiring_shift.o lib/Arduino/WString.o lib/Arduino/wiring_pulse.o lib/Arduino/HardwareSerial.o lib/Arduino/HID.o lib/Arduino/wiring_digital.o lib/Arduino/wiring.o lib/Arduino/Tone.o lib/Arduino/Stream.o lib/Arduino/Print.o lib/Arduino/CDC.o lib/Arduino/WInterrupts.o lib/Arduino/IPAddress.o lib/Arduino/wiring_analog.o lib/Arduino/USBCore.o lib/Arduino/WMath.o lib/Arduino/new.o
	$(AR) Arduino.a lib/Arduino/wiring_shift.o
	$(AR) Arduino.a lib/Arduino/WString.o
	$(AR) Arduino.a lib/Arduino/wiring_pulse.o
	$(AR) Arduino.a lib/Arduino/HardwareSerial.o
	$(AR) Arduino.a lib/Arduino/HID.o
	$(AR) Arduino.a lib/Arduino/wiring_digital.o
	$(AR) Arduino.a lib/Arduino/wiring.o
	$(AR) Arduino.a lib/Arduino/Tone.o
	$(AR) Arduino.a lib/Arduino/Stream.o
	$(AR) Arduino.a lib/Arduino/Print.o
	$(AR) Arduino.a lib/Arduino/CDC.o
	$(AR) Arduino.a lib/Arduino/WInterrupts.o
	$(AR) Arduino.a lib/Arduino/IPAddress.o
	$(AR) Arduino.a lib/Arduino/wiring_analog.o
	$(AR) Arduino.a lib/Arduino/USBCore.o
	$(AR) Arduino.a lib/Arduino/WMath.o
	$(AR) Arduino.a lib/Arduino/new.o

lib/Arduino/wiring_shift.o: lib/Arduino/wiring_shift.c
	$(CC) -c lib/Arduino/wiring_shift.c -o lib/Arduino/wiring_shift.o

lib/Arduino/WString.o: lib/Arduino/WString.cpp
	$(CC) -c lib/Arduino/WString.cpp -o lib/Arduino/WString.o

lib/Arduino/wiring_pulse.o: lib/Arduino/wiring_pulse.c
	$(CC) -c lib/Arduino/wiring_pulse.c -o lib/Arduino/wiring_pulse.o

lib/Arduino/HardwareSerial.o: lib/Arduino/HardwareSerial.cpp
	$(CC) -c lib/Arduino/HardwareSerial.cpp -o lib/Arduino/HardwareSerial.o

lib/Arduino/HID.o: lib/Arduino/HID.cpp
	$(CC) -c lib/Arduino/HID.cpp -o lib/Arduino/HID.o

lib/Arduino/wiring_digital.o: lib/Arduino/wiring_digital.c
	$(CC) -c lib/Arduino/wiring_digital.c -o lib/Arduino/wiring_digital.o

lib/Arduino/wiring.o: lib/Arduino/wiring.c
	$(CC) -c lib/Arduino/wiring.c -o lib/Arduino/wiring.o

lib/Arduino/Tone.o: lib/Arduino/Tone.cpp
	$(CC) -c lib/Arduino/Tone.cpp -o lib/Arduino/Tone.o

lib/Arduino/Stream.o: lib/Arduino/Stream.cpp
	$(CC) -c lib/Arduino/Stream.cpp -o lib/Arduino/Stream.o

lib/Arduino/Print.o: lib/Arduino/Print.cpp
	$(CC) -c lib/Arduino/Print.cpp -o lib/Arduino/Print.o

lib/Arduino/CDC.o: lib/Arduino/CDC.cpp
	$(CC) -c lib/Arduino/CDC.cpp -o lib/Arduino/CDC.o

lib/Arduino/WInterrupts.o: lib/Arduino/WInterrupts.c
	$(CC) -c lib/Arduino/WInterrupts.c -o lib/Arduino/WInterrupts.o

lib/Arduino/IPAddress.o: lib/Arduino/IPAddress.cpp
	$(CC) -c lib/Arduino/IPAddress.cpp -o lib/Arduino/IPAddress.o

lib/Arduino/wiring_analog.o: lib/Arduino/wiring_analog.c
	$(CC) -c lib/Arduino/wiring_analog.c -o lib/Arduino/wiring_analog.o

lib/Arduino/USBCore.o: lib/Arduino/USBCore.cpp
	$(CC) -c lib/Arduino/USBCore.cpp -o lib/Arduino/USBCore.o

lib/Arduino/WMath.o: lib/Arduino/WMath.cpp
	$(CC) -c lib/Arduino/WMath.cpp -o lib/Arduino/WMath.o

lib/Arduino/new.o: lib/Arduino/new.cpp
	$(CC) -c lib/Arduino/new.cpp -o lib/Arduino/new.o

ByteBuffer.a: lib/ByteBuffer/ByteBuffer.o
	$(AR) ByteBuffer.a lib/ByteBuffer/ByteBuffer.o

lib/ByteBuffer/ByteBuffer.o: lib/ByteBuffer/ByteBuffer.cpp
	$(CC) -c lib/ByteBuffer/ByteBuffer.cpp -o lib/ByteBuffer/ByteBuffer.o

CapSense.a: lib/CapSense/CapSense.o
	$(AR) CapSense.a lib/CapSense/CapSense.o

lib/CapSense/CapSense.o: lib/CapSense/CapSense.cpp
	$(CC) -c lib/CapSense/CapSense.cpp -o lib/CapSense/CapSense.o

src/TouchLamp.o: src/TouchLamp.cpp
	$(CC) -c src/TouchLamp.cpp -o src/TouchLamp.o

src/main.o: src/main.cpp
	$(CC) -c src/main.cpp -o src/main.o

src/PowerLedDimmer.o: src/PowerLedDimmer.cpp
	$(CC) -c src/PowerLedDimmer.cpp -o src/PowerLedDimmer.o

src/TouchSensor.o: src/TouchSensor.cpp
	$(CC) -c src/TouchSensor.cpp -o src/TouchSensor.o

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
