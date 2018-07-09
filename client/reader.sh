#!/bin/bash
######################################################################
# rtl_fm   : does rtl fm'ish things
# -d 0101  : device address - omit this if only one dongle
# -E dc    : removes DC spike
# -F 0     : does something to do with magic or something
# -l 15    : squelch setting, tune accordingly
# -A fast  : more magic
# -f 148.. : your frequency
# -s22050  : sample rate - this is the only valid option for multimon
######################################################################
# multimon-ng  : does multimoning
# -q		   : ssshhhh
# -b1		   : blocks a lot of false decodes, set to b0 if you still get some
# -c 		   : I forget what this does
# -a POCSAG512 : set to the protocol you're decoding
# -f alpha 	   : omit if you want non-alphanumeric pages
# -t raw 	   : tells multimon that you're coming from rtl_fm's pipe
# /dev/stdin   : the place where all the studs come from
######################################################################
# node reader.js : the cool thing that makes magic happen
######################################################################
rtl_fm -E dc -F 0 -l 15 -A fast -f 153.350M -s22050 - | multimon-ng -q -b1 -c -a -t raw -a POCSAG512 -a POCSAG1200 -a POCSAG2400 -f alpha /dev/stdin | node reader.js
