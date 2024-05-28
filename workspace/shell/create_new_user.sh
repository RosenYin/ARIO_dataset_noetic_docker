#!/usr/bin/env bash

USER_NAME=noetic
useradd --create-home --no-log-init --shell /bin/bash $USER_NAME 
adduser $USER_NAME sudo 
echo "$USER_NAME:1" | chpasswd 
usermod -u 1000 $USER_NAME && usermod -G 1000 $USER_NAME 
echo "%$USER_NAME ALL=(ALL:ALL) ALL" >> /etc/sudoers 
echo "%$USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

sudo cp /home/workspace/.bashrc /home/$USER_NAME

su $USER_NAME