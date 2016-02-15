#!/usr/bin/ruby
# Written by: Paulo H. "Taka" Torrens <paulo_torrens@hotmail.com>

Libs = []
Headers = []
Extensions = /\.(c$|cpp$|cxx$|cc$|hpp$)/
class LoL
  attr_accessor :dir
  def get_files(dir = @dir)
    Headers.push("-I\"#{dir}\"")
    Headers.uniq!
    array = []
    Dir.foreach(dir) do |file|
      next if [".", ".."].include?(file)
      name = dir + "/" + file
      if FileTest.directory?(name)
        array += get_files(name)
      else
        if file =~ Extensions
          array.push(name)
        end
      end
    end
    return array
  end
  def command(x)
    obj = x.gsub(Extensions, ".o")
    return "#{obj}: #{x}\n\t$(CC) -c #{x} -o #{obj}"
  end
end
class Lib < LoL
  attr_accessor :name
  def initialize(name)
    @name = name + ".a"
    @dir = "lib/" + name
  end
  def to_s
    array = get_files
    objects = array.collect { |x| x.gsub(Extensions, ".o") }
    return [
      "#{@name}: #{objects.join(" ")}\n\t#{objects.collect { |x| "$(AR) #{@name} #{x}" }.join("\n\t")}",
      array.collect { |x| command(x) }
    ].compact.join("\n\n")
  end
  def <=> (other)
    if @name == "default.a"
      return 1
    else
      return @name <=> other.name
    end
  end
end
class Source < LoL
  attr_accessor :objects
  def initialize
    @dir = "src"
    @array = get_files
    @objects = @array.collect { |x| x.gsub(Extensions, ".o") }
  end
  def to_s
    return @array.collect { |x| command(x) }.join("\n\n")
  end
end
Dir.foreach("lib") do |dir|
  next if [".", ".."].include?(dir)
  Libs.push(Lib.new(dir))
end
Sources = Source.new
Sources.to_s
Libs.sort!
Libs.join(" ")
Makefile = <<EOF
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

LIBRARIES = #{([Libs.collect { |x| x.name }] - ["default.a"]).join(" ")}
OBJECTS = #{Sources.objects.join(" ")}
INCLUDES = -I"/usr/lib/avr/include/avr" -I"./include/util/avr-stl" -I"./include/util/HashMap" #{Headers.join(" ")}
DEFINES = -DF_CPU=$(F_CPU) -DARDUINO=105

CPP_FLAGS = -Wall -Os -fno-exceptions -ffunction-sections -fdata-sections -funsigned-char -funsigned-bitfields -fpack-struct -fshort-enums -mmcu=$(MCU) $(DEFINES) $(INCLUDES)
LD_FLAGS = -Os -Wl,--gc-sections -mmcu=$(MCU)
AR_FLAGS = rcs

MCU = atmega8
F_CPU = 8000000UL
FORMAT = ihex

OUTPUT = main

all: $(LIBRARIES) $(OUTPUT).hex

#{Libs.join("\n\n")}

#{Sources.to_s}

$(OUTPUT).elf: $(OBJECTS) $(LIBRARIES)
\t$(LD) $(OBJECTS) $(LIBRARIES) -lm -o $(OUTPUT).elf

$(OUTPUT).hex: $(OUTPUT).elf
\t$(OBJCP) -O ihex -R .eeprom $(OUTPUT).elf $(OUTPUT).hex
\t$(SIZE) $(OUTPUT).elf
  
.PHONY: upload clean

upload: all
\t$(AVRDUDE) -p$(MCU) -cusbasp -Uflash:w:$(OUTPUT).hex:a

clean:
\t@rm -f $(LIBRARIES) $(OUTPUT).elf $(OUTPUT).hex $(shell find . -follow -name "*.o")
  
Makefile: scripts/make.rb $(shell find src -follow -not -type f -newer Makefile)
\t@scripts/make.rb
EOF
File.open("Makefile", "w") do |file|
  file.write(Makefile)
end
