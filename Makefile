SHELL := /bin/bash
WS := ./sys_ws

.PHONY: default clean build unspecified
default: unspecified

unspecified:
	@echo "Please specify run option(s) [clean, build, drive_rover, drive_base, arm_rover, arm_base, telecom_base, telecom_rover, science, autonomy]"
	@exit 1

clean:
	@rm -rf build/ install/ log/

build:
	@colcon build

#### DRIVE

drive_rover:
	@ros2 launch drive rover_drive_launch.yaml

drive_base:
	@ros2 launch drive base_drive_launch.yaml

#### ARM

arm_rover:
	@ros2 launch arm rover_arm_launch.yaml

arm_base:
	@ros2 launch drive base_arm_launch.yaml

#### TELECOM

televideo_rover:
	@ros2 launch sys_ws/televideo_2023_24/src/rover_televideo.launch.py

televideo_base:
		@ros2 launch sys_ws/televideo_2023_24/src/base_televideo.launch.py

#### SCIENCE

# TODO!!!
science:
	@ros2 launch sys_ws/science_2023_24/src/backend_listener.launch.py

#### AUTONOMY

# TODO!!!
autonomy:
	@ros2 launch 