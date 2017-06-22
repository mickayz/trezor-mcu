#!/bin/bash
set -e

IMAGETAG=trezor-mcu-build
FIRMWARETAG=${1:-master}

docker build -t $IMAGETAG .
docker run -t -v $(pwd)/output:/output $IMAGETAG /bin/sh -c "\
	git clone https://github.com/mickayz/trezor-mcu && \
	cd trezor-mcu && \
	git checkout $FIRMWARETAG && \
	git submodule update --init && \
	make -C vendor/libopencm3 && \
	make && \
	make -C firmware && \
	cp firmware/trezor.bin /output/trezor-$FIRMWARETAG.bin && \
    cp firmware/trezor.elf /output/trezor-$FIRMWARETAG.elf"

echo "---------------------"
echo "Firmware fingerprint:"
FILENAME=output/trezor-$FIRMWARETAG.bin
tail -c +257 "$FILENAME" | sha256sum
FILESIZE=$(stat -c%s "$FILENAME")
echo "Firmware size: $FILESIZE bytes (out of 491520 maximum)"
