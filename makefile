
TARGET=kernel
AS=nasm

all: $(TARGET)

install:
	apt update & apt upgrade -y
	apt install nasm -y

$(TARGET): $(TARGET).asm
	$(AS) -f bin -o $(TARGET).bin $(TARGET).asm
	dd if=/dev/zero of=disk.img bs=512 count=2880
	dd if=$(TARGET).bin of=disk.img bs=512 seek=0