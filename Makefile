SHELL := /bin/bash
WS := ./sys_ws

.PHONY: default clean build unspecified copy_conf
default: unspecified

unspecified:
	@echo "Please specify a run option:"
	@echo "  Missions:"
	@echo "    retrieval_mission"
	@echo "    science_mission"
	@echo "    TODO!"
	@echo ""
	@echo "  Grouped Options:"
	@echo "    drive"
	@echo "    arm"
	@echo "    gui"
	@echo "    televideo"
	@echo ""
	@echo "  Single run:"
	@echo "     clean"
	@echo "     build"
	@echo "     heartbeat"
	@echo "     gui_frontend"
	@echo "     gui_backend"
	@echo "     drive_rover"
	@echo "     drive_base"
	@echo "     arm_rover"
	@echo "     arm_base"
	@echo "     televideo_base"
	@echo "     televideo_rover"
	@echo "     gps_rover"
	@echo "     gps_base"
	@echo "     science"
	@echo "     autonomy"
	@echo "     scp_orin"
	@echo "     scp_pi"
	@echo "     ssh_pi"
	@echo "     ssh_pi"

clean:
	@rm -rf build/ install/ log/

build:
	# TODO: Build full autonomy pkgs
	@colcon build --continue-on-error --packages-skip nav2_sms_behavior zed_components zed_wrapper zed_ros2

#### MISSIONS

# retrieval_mission: copy_conf
# 	@python3 multi-runner.py "make gui" "make drive" "make arm" "make televideo" "make gps"

science_mission: copy_conf
	@terminator --maximize --working-directory "$(pwd)" -l science

copy_conf:
	@mkdir -p ~/.config/terminator
	@cp termc/all.conf ~/.config/terminator/config

#### HEARTBEAT

heartbeat:
	@ros2 launch heartbeat_manager heartbeat_launch.yaml

#### GUI

gui:
	@terminator --maximize --working-directory "$(pwd)" --config termc/gui.conf

gui_frontend:
	@cd sys_ws/base-station-gui/client && npm run dev

gui_backend:
	# TODO: Need to run script to get databases first?
	@cd sys_ws/base-station-gui/server && python manage.py migrate && python manage.py runserver

#### DRIVE

drive:
	@terminator --maximize --working-directory "$(pwd)" --config termc/drive.conf

drive_rover:
	@ros2 launch drive rover_drive_launch.yaml

drive_base:
	@ros2 launch drive base_drive_launch.yaml

#### ARM

arm:
	@terminator --maximize --working-directory "$(pwd)" --config termc/arm.conf

arm_rover:
	@ros2 launch arm rover_arm_launch.yaml

arm_base:
	@ros2 launch arm base_arm_launch.yaml

#### TELECOM

televideo:
	@terminator --maximize --working-directory "$(pwd)" --config termc/televideo.conf

televideo_base:
	@ros2 launch sys_ws/televideo_2023_24/src/all_camera_decode.launch.py

televideo_rover:
	@ros2 launch sys_ws/televideo_2023_24/src/all_camera_encode.launch.py


#### GPS

gps:
	@terminator --maximize --working-directory "$(pwd)" --config termc/gps.conf

gps_base:
	@ros2 launch sys_ws/autonomy_2023_24/gps/base_gps.launch.py

gps_rover:
	@ros2 launch sys_ws/autonomy_2023_24/gps/rover_gps.launch.py


#### SCIENCE

science:
	@ros2 launch sys_ws/science_2023_24/src/backend-listener.launch.py

#### AUTONOMY

# TODO!!!
autonomy:
	@ros2 launch


#### SCP Functions

scp_orin:
	@cd .. && scp -r systems_2023_24/ orin@ubuntu.local:/home/orin/

scp_pi:
	@cd .. && scp -r systems_2023_24/ cameron@rpi.local:/home/cameron/

ssh_orin:
	@ssh -t orin@ubuntu.local "cd systems_2023_24 ; bash --login"

ssh_pi:
	@ssh -t cameron@rpi.local "cd systems_2023_24 ; bash --login"