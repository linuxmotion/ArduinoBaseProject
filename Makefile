

PWD=$(CURDIR)
MAKEDIR=$(PWD)/make
SRCDIR=$(PWD)/src
OUT=$(PWD)/out


CPU=atmega328p

ifeq ($(CPU), atmega328p)

include $(MAKEDIR)/atmel328p.mk

endif
