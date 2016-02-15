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

LIBRARIES = Button.a MsTimer2.a SevSeg.a TM8_Arduino.a
OBJECTS = src/main.o
INCLUDES = -I"/usr/lib/avr/include/avr" -I"./include/util/avr-stl" -I"./include/util/HashMap" -I"src" -I"lib/Button" -I"lib/Button/Examples" -I"lib/Button/Examples/StateChanged" -I"lib/Button/Examples/Debounce" -I"lib/Button/Examples/UniquePress" -I"lib/Button/Examples/Button" -I"lib/Button/Examples/Callbacks" -I"lib/MsTimer2" -I"lib/SevSeg" -I"lib/TM8_Arduino" -I"lib/TM8_Arduino/avr-libc"
DEFINES = -DF_CPU=$(F_CPU) -DARDUINO=105

CPP_FLAGS = -Wall -Os -fno-exceptions -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -mmcu=$(MCU) $(DEFINES) $(INCLUDES)
LD_FLAGS = -Os -Wl,--gc-sections -mmcu=$(MCU)
AR_FLAGS = rcs

MCU = atmega8
F_CPU = 8000000UL
FORMAT = ihex

OUTPUT = main

all: $(LIBRARIES) $(OUTPUT).hex

Button.a: lib/Button/Button.o
	$(AR) Button.a lib/Button/Button.o

lib/Button/Button.o: lib/Button/Button.cpp
	$(CC) -c lib/Button/Button.cpp -o lib/Button/Button.o

MsTimer2.a: lib/MsTimer2/MsTimer2.o
	$(AR) MsTimer2.a lib/MsTimer2/MsTimer2.o

lib/MsTimer2/MsTimer2.o: lib/MsTimer2/MsTimer2.cpp
	$(CC) -c lib/MsTimer2/MsTimer2.cpp -o lib/MsTimer2/MsTimer2.o

SevSeg.a: lib/SevSeg/SevSeg.o
	$(AR) SevSeg.a lib/SevSeg/SevSeg.o

lib/SevSeg/SevSeg.o: lib/SevSeg/SevSeg.cpp
	$(CC) -c lib/SevSeg/SevSeg.cpp -o lib/SevSeg/SevSeg.o

TM8_Arduino.a: lib/TM8_Arduino/WInterrupts.o lib/TM8_Arduino/Tone.o lib/TM8_Arduino/HardwareSerial.o lib/TM8_Arduino/WString.o lib/TM8_Arduino/WMath.o lib/TM8_Arduino/avr-libc/malloc.o lib/TM8_Arduino/avr-libc/realloc.o lib/TM8_Arduino/HID.o lib/TM8_Arduino/wiring_shift.o lib/TM8_Arduino/USBCore.o lib/TM8_Arduino/CDC.o lib/TM8_Arduino/wiring_analog.o lib/TM8_Arduino/IPAddress.o lib/TM8_Arduino/Print.o lib/TM8_Arduino/wiring_pulse.o lib/TM8_Arduino/wiring_digital.o lib/TM8_Arduino/Stream.o lib/TM8_Arduino/wiring.o lib/TM8_Arduino/new.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/WInterrupts.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/Tone.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/HardwareSerial.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/WString.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/WMath.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/avr-libc/malloc.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/avr-libc/realloc.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/HID.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/wiring_shift.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/USBCore.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/CDC.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/wiring_analog.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/IPAddress.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/Print.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/wiring_pulse.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/wiring_digital.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/Stream.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/wiring.o
	$(AR) TM8_Arduino.a lib/TM8_Arduino/new.o

lib/TM8_Arduino/WInterrupts.o: lib/TM8_Arduino/WInterrupts.c
	$(CC) -c lib/TM8_Arduino/WInterrupts.c -o lib/TM8_Arduino/WInterrupts.o

lib/TM8_Arduino/Tone.o: lib/TM8_Arduino/Tone.cpp
	$(CC) -c lib/TM8_Arduino/Tone.cpp -o lib/TM8_Arduino/Tone.o

lib/TM8_Arduino/HardwareSerial.o: lib/TM8_Arduino/HardwareSerial.cpp
	$(CC) -c lib/TM8_Arduino/HardwareSerial.cpp -o lib/TM8_Arduino/HardwareSerial.o

lib/TM8_Arduino/WString.o: lib/TM8_Arduino/WString.cpp
	$(CC) -c lib/TM8_Arduino/WString.cpp -o lib/TM8_Arduino/WString.o

lib/TM8_Arduino/WMath.o: lib/TM8_Arduino/WMath.cpp
	$(CC) -c lib/TM8_Arduino/WMath.cpp -o lib/TM8_Arduino/WMath.o

lib/TM8_Arduino/avr-libc/malloc.o: lib/TM8_Arduino/avr-libc/malloc.c
	$(CC) -c lib/TM8_Arduino/avr-libc/malloc.c -o lib/TM8_Arduino/avr-libc/malloc.o

lib/TM8_Arduino/avr-libc/realloc.o: lib/TM8_Arduino/avr-libc/realloc.c
	$(CC) -c lib/TM8_Arduino/avr-libc/realloc.c -o lib/TM8_Arduino/avr-libc/realloc.o

lib/TM8_Arduino/HID.o: lib/TM8_Arduino/HID.cpp
	$(CC) -c lib/TM8_Arduino/HID.cpp -o lib/TM8_Arduino/HID.o

lib/TM8_Arduino/wiring_shift.o: lib/TM8_Arduino/wiring_shift.c
	$(CC) -c lib/TM8_Arduino/wiring_shift.c -o lib/TM8_Arduino/wiring_shift.o

lib/TM8_Arduino/USBCore.o: lib/TM8_Arduino/USBCore.cpp
	$(CC) -c lib/TM8_Arduino/USBCore.cpp -o lib/TM8_Arduino/USBCore.o

lib/TM8_Arduino/CDC.o: lib/TM8_Arduino/CDC.cpp
	$(CC) -c lib/TM8_Arduino/CDC.cpp -o lib/TM8_Arduino/CDC.o

lib/TM8_Arduino/wiring_analog.o: lib/TM8_Arduino/wiring_analog.c
	$(CC) -c lib/TM8_Arduino/wiring_analog.c -o lib/TM8_Arduino/wiring_analog.o

lib/TM8_Arduino/IPAddress.o: lib/TM8_Arduino/IPAddress.cpp
	$(CC) -c lib/TM8_Arduino/IPAddress.cpp -o lib/TM8_Arduino/IPAddress.o

lib/TM8_Arduino/Print.o: lib/TM8_Arduino/Print.cpp
	$(CC) -c lib/TM8_Arduino/Print.cpp -o lib/TM8_Arduino/Print.o

lib/TM8_Arduino/wiring_pulse.o: lib/TM8_Arduino/wiring_pulse.c
	$(CC) -c lib/TM8_Arduino/wiring_pulse.c -o lib/TM8_Arduino/wiring_pulse.o

lib/TM8_Arduino/wiring_digital.o: lib/TM8_Arduino/wiring_digital.c
	$(CC) -c lib/TM8_Arduino/wiring_digital.c -o lib/TM8_Arduino/wiring_digital.o

lib/TM8_Arduino/Stream.o: lib/TM8_Arduino/Stream.cpp
	$(CC) -c lib/TM8_Arduino/Stream.cpp -o lib/TM8_Arduino/Stream.o

lib/TM8_Arduino/wiring.o: lib/TM8_Arduino/wiring.c
	$(CC) -c lib/TM8_Arduino/wiring.c -o lib/TM8_Arduino/wiring.o

lib/TM8_Arduino/new.o: lib/TM8_Arduino/new.cpp
	$(CC) -c lib/TM8_Arduino/new.cpp -o lib/TM8_Arduino/new.o

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
