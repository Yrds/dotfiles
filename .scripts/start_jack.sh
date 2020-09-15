#!/bin/bash

jack_control ds alsa &
jack_control dps device 'hw:SB,0' &
jack_control dps rate 48000 &
jack_control dps nperiods 3 &
jack_control dps period 256 &
jack_control start &&
alsa_in -j mic -d "hw:Device" -r 48000 &&
exit 0
