#!/bin/bash
export HOST_NAME=$1; pass generate -f $HOST_NAME > /dev/null; export PASSWORD=$(pass $HOST_NAME); ( envsubst < user-data ) > /media/$USERNAME/system-boot/user-data
export PASSWD=$(pass rpi-wifi); envsubst < wpa_supplicant.conf > /media/$USERNAME/system-boot/wpa_supplicant.conf
