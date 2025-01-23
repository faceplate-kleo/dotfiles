#!/bin/bash

URI=$(playerctl -p spotify metadata mpris:artUrl | tr -d '\0')

curl -s $URI --output - 
