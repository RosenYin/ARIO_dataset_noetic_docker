#!/usr/bin/env bash

echo "export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /root/.bashrc
alias scd='source devel/setup.bash'
alias cm='catkin_make'
source /root/.bashrc