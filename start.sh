#!/bin/zsh
FIRMWARE=$1

echo loading $FIRMWARE kernel into qemu

exec timeout 10s \
    xpack-qemu-arm-2.8.0-11/bin/qemu-system-gnuarmeclipse  \
    --verbose \
    --semihosting-config enable=on,target=native \
    -gdb tcp::3333 \
    -nographic -M STM32F4-Discovery \
    -no-reboot \
    -kernel  "${FIRMWARE}" &>> qemu_output.txt
    -s 0
