./firmware-docker-build.sh mbl1.3.1
./bootloader-docker-build.sh mbl1.3.1
scp ./output/bootloader-mbl1.3.1.elf mickayz@172.16.251.139:~/trezor/boots/
scp ./output/trezor-mbl1.3.1.elf mickayz@172.16.251.139:~/trezor/boots/
./constructfirmware.py ./output/bootloader-mbl1.3.1.bin ./output/trezor-mbl1.3.1.bin
scp firmout.dat mickayz@172.16.251.139:~/trezor/boots/

