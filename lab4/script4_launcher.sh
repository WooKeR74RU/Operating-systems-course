#!/bin/bash

nice -n 19 ./script4_processing.sh > /dev/null &
./script4_processing.sh > /dev/null &

