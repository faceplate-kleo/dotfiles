#!/bin/bash

# A quick and dirty way to set up these dotfiles in a fresh linux install
# Configs are symlinked to this repo so they can be updated automatically

echo \#\#\# ~ \#\#\#

for filename in .*; do 
    if [[ $filename == ".git" ]]
    then
        continue
    fi

    if [[ ! -L ~/$filename ]]
    then
        ln -s $PWD/$filename ~/$filename
    else
        echo $filename already linked
    fi
done


echo \#\#\# ~/.config \#\#\#

cd dotconfig
for filename in *; do
    if [[ ! -L ~/.config/$filename ]]
    then
        ln -s $PWD/$filename ~/.config/$filename 
    else
        echo .config/$filename already linked 
    fi 
done
