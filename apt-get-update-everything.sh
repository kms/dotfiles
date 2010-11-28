#!/bin/bash

for i in farad katal newton radian lux tesla; do
    figlet -c $i
    ssh -t $i "
    sudo apt-get update -qq;
    sudo apt-get dist-upgrade;
    sudo apt-get autoremove;
    sudo apt-get clean;
    "
done
