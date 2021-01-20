#!/bin/zsh
FIRMWARE=$1

exec timeout 1s \
    xpack-qemu-arm-2.8.0-11/bin/qemu-system-gnuarmeclipse  \
    --verbose \
    --semihosting-config enable=on,target=native \
    -gdb tcp::3333 \
    -nographic -M STM32F4-Discovery \
    -no-reboot \
    -kernel "${FIRMWARE}" \
    -s 0
    &>> qemu_output.txt
