#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#32cd32cc'
TEXT='#32cd32bb'
WRONG='#f38ba8bb'
VERIFYING='#a6e3a1bb'

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$VERIFYING         \
--bshl-color=$WRONG          \
\
--screen 2                   \
--blur 8                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"       \
