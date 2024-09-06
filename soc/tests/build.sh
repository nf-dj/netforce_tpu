#!/bin/sh
yosys -p "synth_ecp5 -json test_led.json" test_led.v
nextpnr-ecp5 --25k --package CABGA256 --json test_led.json --lpf test_led.lpf --textcfg test_led.config
ecppack test_led.config test_led.bit
