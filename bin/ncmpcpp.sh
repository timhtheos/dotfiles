#!/bin/bash

t update "Now listening to $(mpc current) #$(mpc current --format [%genre%])" 1>/dev/null
