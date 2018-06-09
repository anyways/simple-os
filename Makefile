CC=gcc
LD=ld
DD=dd
RM=rm
OBJCOPY=objcopy
LDFILE=solrex_x86.ld

all: clean boot.img

boot.o: boot.S
	$(CC) -c boot.S

boot.elf: boot.o
	$(LD) boot.o -o boot.elf -e c -T$(LDFILE)

boot.bin: boot.elf
	$(OBJCOPY) -R .pdr -R .comment -R.note -S -O binary boot.elf boot.bin

boot.img: boot.bin
	$(DD) if=boot.bin of=boot.img bs=512 count=1
	$(DD) if=/dev/zero of=boot.img seek=1 bs=512 count=2879

clean:
	$(RM) -rf boot.img boot.bin boot.elf boot.o
