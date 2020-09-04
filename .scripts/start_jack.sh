#!/bin/bash

jack_control ds alsa &
jack_control dps device 'hw:Device' &
jack_control dps rate 48000 &
jack_control dps nperiods 3 &
jack_control dps period 128 &
jack_control start &&
exit 0
