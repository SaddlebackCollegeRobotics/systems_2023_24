#!/bin/bash

set +x

# Install necessary packages
# TODO!!!
sudo apt install $(cat apt-requirements.txt) -y

# Nodejs and npm install
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm install 20

python3 -m pip install -r pip-requirements.txt

# Clone repos
source ./clone_all.bash

# Auto-install ros2 dependencies
rosdep install -i --from-paths . -y

# Add ros2 install files to .bashrc
echo "source $(pwd)/install/setup.bash" >> ~/.bashrc

# Add utility aliases to user config
echo "source $(pwd)/utilities.bash" >> ~/.bashrc

echo "Please restart your terminal session..."