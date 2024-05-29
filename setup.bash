#!/bin/bash

# Disable command echoing
set +x

. /etc/os-release

if [[ "$NAME" != "Ubuntu" || "$VERSION_ID" != "22.04" ]];
then
    echo "Unsupported system! Use Ubuntu Jammy 22.04"
    exit 1
fi

# ros2 basic install: https://docs.ros.org/en/humble/Installation.html

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8


sudo apt install software-properties-common -y
sudo add-apt-repository universe -y


sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg


echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null


sudo apt update
sudo apt-get upgrade -y


sudo apt install python3-colcon-common-extensions -y
sudo apt install ros-humble-desktop -y
sudo apt install python3-rosdep2 -y
rosdep update


# Set up ROS environment
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# Set up Colcon features
echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc
echo "export _colcon_cd_root=/opt/ros/humble/" >> ~/.bashrc
echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> ~/.bashrc

# Install utilities
sudo apt install git -y
