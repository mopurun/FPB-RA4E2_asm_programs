cd %~dp0
arm-none-eabi-as -mcpu=cortex-m33 -mthumb -o main.out main.asm
arm-none-eabi-ld -Ttext=0 -o main.elf main.out
arm-none-eabi-objcopy -O srec  --srec-len 16 --srec-forceS3 main.elf main.mot
arm-none-eabi-objdump -D main.elf > objdump.txt