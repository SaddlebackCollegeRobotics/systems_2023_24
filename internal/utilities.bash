#!/bin/bash

# Colcon-cd features
source /usr/share/colcon_cd/function/colcon_cd.sh
export _colcon_cd_root=/opt/ros/humble/
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash

# Ros shorthand aliases
alias rosc="colcon build"
alias rossrc="source install/setup.bash"
alias rosrm="rm -rf ./install/ ./build/ ./log/"