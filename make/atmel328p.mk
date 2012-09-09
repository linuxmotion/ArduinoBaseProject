
PLATFORM=arduino
CPUP=ATMEGA328P # Passed in caps, Don't know if actually needed
AVRDUDE=avrdude 
CC=avr-gcc
OBJC=avr-objcopy
MMCU=-mmcu=$(CPU) 
DFCPU=16000000UL
CFLAGS=-DF_CPU=$(DFCPU) $(MMCU)
EXECUTABLE=main
BAUD=115200
SDEVICE=/dev/ttyACM0

SRC=BareMinimumC.c

OBJ=$(OUT)/BareMinimunC.o 


################### Add C objects here
minimum:
	$(CC) -Os $(CFLAGS) -c  $(SRCDIR)/$(SRC) -I. -o $(OBJ) 


################### Add your make directives here
src: minimum


obj: 
	$(CC) $(MMCU) $(OBJ) -o $(OUT)/$(EXECUTABLE)

hex:	
	$(OBJC) -O ihex -R .eeprom $(EXECUTABLE)  $(OUT)/$(EXECUTABLE).hex


# Flash th component to the Arduino
flash:
	$(AVRDUDE) -F -V -c $(PLATFORM) -p $(CPUP) -P $(SDVICE) -b $(BAUD) -U flash:w: $(OUT)/$(EXECUTABLE).hex

# Compile erything don't flash the program
all: src obj hex

# Remove the object files, the hex file, and the program file
clean: 
	rm $(OUT)/*

##########


