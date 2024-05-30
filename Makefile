SHELL := /bin/bash
WS := ./sys_ws

.PHONY: default clean build unspecified
default: unspecified

unspecified:
	@echo "Please specify a run option:"
	@echo "     clean"
	@echo "     build"
	@echo "     drive_rover"
	@echo "     drive_base"
	@echo "     arm_rover"
	@echo "     arm_base"
	@echo "     telecom_base"
	@echo "     telecom_rover"
	@echo "     science"
	@echo "     autonomy"

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
	@ros2 launch sys_ws/telecom_2023_24/src/

#### SCIENCE

science:
	@ros2 launch sys_ws/science_2023_24/src/backend_listener.launch.py

#### AUTONOMY

# TODO!!!
autonomy:
	@ros2 launch 