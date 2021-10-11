CROSS_COMPILE=arm-linux-gnueabihf-
CC=${CROSS_COMPILE}gcc
LD=${CROSS_COMPILE}ld
OBJCOPY=${CROSS_COMPILE}objcopy
OBJDUMP=${CROSS_COMPILE}objdump

GUEST_CFLAGS=-Wall -nostdinc -nostdlib -fno-stack-protector
GUEST_LDFLAGS=-e _start  -Ttext 0x100000 -nostdlib

all: simple_virt guest

simple_virt:simple_virt.c
	${CC} $< -I./kernel_header/include -o $@

guest: start.o main.o
	${LD} ${GUEST_LDFLAGS}  -o $@ start.o main.o
	${OBJDUMP} -D $@ > $@.dump
	${OBJCOPY} -O binary $@ $@.bin

start.o:start.S
	${CC} ${GUEST_CFLAGS} -c -o $@ $<

main.o:main.c
	${CC} ${GUEST_CFLAGS} -c -o $@ $<

clean:
	rm -rf *.o guest simple_virt *.map *.dump *.bin

.PHONY: all clean

