#!/bin/bash

if [[ -z $1 ]]; then
    echo "Set i3 theme file to target of `config` symlink."
    exit 1
fi

ln -sf $1 config
