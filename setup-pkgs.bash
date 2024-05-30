#!/bin/bash

# Install necessary packages
sudo apt install git ros-humble-rtcm-msgs -y

python3 -m pip install -r pip-requirements.txt

# Clone repos
source ./clone_all.bash

# Auto-install ros2 dependencies
rosdep install -i --from-paths . -r -y


# Add ros2 install files to .bashrc
echo "source $(pwd)/install/setup.bash" >> ~/.bashrc

# Re-source user config
source ~/.bashrc