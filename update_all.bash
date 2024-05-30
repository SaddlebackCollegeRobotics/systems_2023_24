#!/bin/bash

# Install necessary packages
# TODO!!!
sudo apt install $(cat apt-requirements.txt)

python3 -m pip install -r pip-requirements.txt

# Clone repos
source ./clone_all.bash

# Auto-install ros2 dependencies
rosdep install -i --from-paths . -r -y


# Add ros2 install files to .bashrc
echo "source $(pwd)/install/setup.bash" >> ~/.bashrc

# Add utility aliases to user config
echo "source $(pwd)/utilities.bash" >> ~/.bashrc

# Re-source user config
source ~/.bashrc