###################################################################
#          This file is machine-generated - Do NOT edit!          #
# Written by: Paulo H. "Taka" Torrens <paulo_torrens@hotmail.com> #
###################################################################

CC = avr-gcc $(C_FLAGS)
LD = avr-gcc $(LD_FLAGS)
AR = avr-ar $(AR_FLAGS)
OBJCP = avr-objcopy
SIZE = avr-size --format=avr --mcu=$(MCU)
AVRDUDE = avrdude

LIBRARIES = irmp.a uart.a usbdrv.a
OBJECTS = src/main.o
INCLUDES = -I"/usr/lib/avr/include/avr" -I"./include/irhid" -I"src" -I"lib/irmp" -I"lib/uart" -I"lib/usbdrv"
DEFINES = -DF_CPU=$(F_CPU)

C_FLAGS = -std=gnu99 -Wall -Wstrict-prototypes -Os -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -mmcu=$(MCU) $(DEFINES) $(INCLUDES)
LD_FLAGS = -Wl,--gc-sections -mmcu=$(MCU)
AR_FLAGS = rcs

MCU = atmega8
F_CPU = 12000000UL
FORMAT = ihex

OUTPUT = main

all: $(LIBRARIES) $(OUTPUT).hex

irmp.a: lib/irmp/irmpextlog.o lib/irmp/irmp.o
	$(AR) irmp.a lib/irmp/irmpextlog.o
	$(AR) irmp.a lib/irmp/irmp.o

lib/irmp/irmpextlog.o: lib/irmp/irmpextlog.c
	$(CC) -c lib/irmp/irmpextlog.c -o lib/irmp/irmpextlog.o

lib/irmp/irmp.o: lib/irmp/irmp.c
	$(CC) -c lib/irmp/irmp.c -o lib/irmp/irmp.o

uart.a: lib/uart/uart.o
	$(AR) uart.a lib/uart/uart.o

lib/uart/uart.o: lib/uart/uart.c
	$(CC) -c lib/uart/uart.c -o lib/uart/uart.o

usbdrv.a: lib/usbdrv/usbdrv.o lib/usbdrv/oddebug.o lib/usbdrv/usbdrvasm.o
	$(AR) usbdrv.a lib/usbdrv/usbdrv.o
	$(AR) usbdrv.a lib/usbdrv/oddebug.o
	$(AR) usbdrv.a lib/usbdrv/usbdrvasm.o

lib/usbdrv/usbdrv.o: lib/usbdrv/usbdrv.c
	$(CC) -c lib/usbdrv/usbdrv.c -o lib/usbdrv/usbdrv.o

lib/usbdrv/oddebug.o: lib/usbdrv/oddebug.c
	$(CC) -c lib/usbdrv/oddebug.c -o lib/usbdrv/oddebug.o

lib/usbdrv/usbdrvasm.o: lib/usbdrv/usbdrvasm.S
	$(CC) -c lib/usbdrv/usbdrvasm.S -o lib/usbdrv/usbdrvasm.o

src/main.o: src/main.c
	$(CC) -c src/main.c -o src/main.o

$(OUTPUT).elf: $(OBJECTS) $(LIBRARIES)
	$(LD) $(OBJECTS) $(LIBRARIES) -lm -o $(OUTPUT).elf

$(OUTPUT).hex: $(OUTPUT).elf
	$(OBJCP) -O ihex -R .eeprom $(OUTPUT).elf $(OUTPUT).hex
	$(OBJCP) -j .eeprom --set-section-flags=.eeprom="alloc,load" --change-section-lma .eeprom=0 -O ihex $(OUTPUT).elf $(OUTPUT).eep
	$(SIZE) $(OUTPUT).elf
  
.PHONY: upload clean

upload: all
	$(AVRDUDE) -p$(MCU) -cusbasp -Uflash:w:$(OUTPUT).hex:a -U eeprom:w:$(OUTPUT).eep:i

clean:
	@rm -f $(LIBRARIES) $(OUTPUT).elf $(OUTPUT).hex $(OUTPUT).eep $(shell find . -follow -name "*.o")
  
Makefile: scripts/make.rb $(shell find src -follow -not -type f -newer Makefile)
	@scripts/make.rb
