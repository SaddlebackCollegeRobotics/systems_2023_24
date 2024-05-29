#!/bin/bash

# Install utilities
sudo apt install git python-git -y

python3 -m pip install ifcfg python-can

# Clone repos
source ./clone_all.bash

# Add ros2 install files to .bashrc
echo "source $(pwd)/install/setup.bash" >> ~/.bashrc

# Re-source user config
source ~/.bashrc