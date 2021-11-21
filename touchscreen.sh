#!/usr/bin/bash
#enable or disable touchscreen input

device="ELAN2514:00 04F3:2AF0"
state=$(xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$")

if [ $state == '1' ]; then
	echo "the touchscreen is enabled"
else
	echo "the touchscreen is disabled"
fi

echo "wanna toggle it? [y/n]"
read input

if [[ $state == '1' && $input == "y" ]]; then
	xinput --disable "$device"
elif [[ $state == '0' && $input == "y" ]]; then
	xinput --enable "$device"
else
	exit
fi
