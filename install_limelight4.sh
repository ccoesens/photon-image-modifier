#!/bin/bash -v

# Verbose and exit on errors
set -ex

# Run the pi install script
chmod +x ./install_pi.sh
./install_pi.sh

# Install our new config.txt with OV9281 overlay
install -m 644 limelight4/config.txt /boot/

# Add the one extra file for the LL3
wget https://datasheets.raspberrypi.org/cmio/dt-blob-cam1.bin -O /boot/dt-blob.bin
