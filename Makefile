SHELL := /bin/bash
WS := ./sys_ws

.PHONY: default clean build unspecified
default: unspecified

unspecified:
	@echo "Please specify run option(s) [clean, build, drive-rover, drive-base, arm-rover, arm-base, televideo, science, autonomy]"
	@exit 1

clean:
	@rm -rf build/ install/ log/

build:
	@colcon build

#### DRIVE

drive-rover:
	@ros2 launch drive rover_drive_launch.yaml

drive-base:
	@ros2 launch drive base_drive_launch.yaml

#### ARM

arm-rover:
	@ros2 launch arm rover_arm_launch.yaml

arm-base:
	@@ros2 launch drive base_arm_launch.yaml

#### TELECOM

televideo:
	@ros2 launch sys_ws/televideo_2023_24/src/decoder.launch.py && ros2 launch sys_ws/televideo_2023_24/src/encoder.launch.py

#### SCIENCE

science:
	@ros2 launch sys_ws/science_2023_24/src/backend-listener.launch.py

#### AUTONOMY

autonomy:
	@ros2 launch 

all: drive arm televideo science autonomy