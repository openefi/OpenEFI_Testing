#!bin/sh
FIRMWARE=$1

ls -l /mnt

/mnt/xpack-qemu-arm-2.8.0-11/bin/qemu-system-gnuarmeclipse  \
--verbose \
--semihosting-config enable=on,target=native \
-gdb tcp::3333 \
-nographic -M STM32F4-Discovery \
-no-reboot \
-kernel "${FIRMWARE}"

# para conectarse local por GDB:
#gdb-multiarch \
#        -q "./firmware_5a5dc3f.elf" \
#        -ex "target remote localhost:3333"