#!/bin/zsh
sudo apt update
sudo apt -y install  inetutils-ping iptables iproute2 byobu
sleep 1
sudo apt -y install lsb-release locales locales-all bash-completion net-tools tree
sleep 1
sudo apt -y install wget git build-essential vim expect x11-xserver-utils

sudo apt -y install mesa-utils pciutils
glxinfo | grep -i opengl
lspci | grep -i nvidia
sleep 1
sudo apt install -y python-dev python-numpy python3-pip python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool bridge-utils
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple/ -U pip && \
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple/ && \
sudo pip3 install rosdepc
sudo rosdepc init
rosdepc update