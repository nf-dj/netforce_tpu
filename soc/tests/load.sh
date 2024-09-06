#!/bin/sh
#openFPGALoader -c ft2232 test_led.bit
openFPGALoader -c ft2232 --write-flash test_led.bit
