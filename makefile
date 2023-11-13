
TARGET=kernel
AS=nasm

all: $(TARGET)

install:
	apt update & apt upgrade -y
	apt install nasm -y

$(TARGET): $(TARGET).asm
	$(AS) -f bin -o build/$(TARGET).bin $(TARGET).asm
	dd if=/dev/zero of=build/disk.img bs=512 count=2880
	dd if=build/$(TARGET).bin of=build/disk.img bs=512 seek=0