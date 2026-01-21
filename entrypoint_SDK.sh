#!/bin/bash
set -e

PROBLEM_ID="${PROBLEM_ID:-4}"
CAV_ID="${CAV_ID:-32}"
ROLE="${ROLE:-SDK}"

echo "start SDK NODE" >&2
echo "CAV_ID: $CAV_ID, PROBLEM_ID: $PROBLEM_ID, ROLE: $ROLE" >&2

#
cd ~/KAIST_Mobility_Challenge_SDK/examples/Driver_ROS2
colcon build --symlink-install
source install/setup.bash

# ROS2 환경 설정
export ROS_LOCALHOST_ONLY=0
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export CAV_ID=$CAV_ID

# mission_1 -> 1
if [ "$PROBLEM_ID" = "1" ]; then
    if [ "$ROLE" = "CAV" ]; then
        export ROS_DOMAIN_ID=106
        echo "ROS_DOMAIN_ID: $ROS_DOMAIN_ID, CAV_ID: $CAV_ID" >&2
        ros2 run kmc_hardware_driver_node kmc_hardware_driver_demo_node_ver2 --ros-args -p port:=/dev/ttyKMC -p baud:=115200 -p vehicle_name:=cav_$CAV_ID
    fi
fi

# mission_3 -> 4
if [ "$PROBLEM_ID" = "4" ]; then
    if [ "$ROLE" = "SDK" ]; then
        export ROS_DOMAIN_ID=100
        echo "ROS_DOMAIN_ID: $ROS_DOMAIN_ID, CAV_ID: $CAV_ID" >&2
        ros2 run kmc_hardware_driver_node kmc_hardware_driver_demo_node_ver2 --ros-args -p port:=/dev/ttyKMC -p baud:=115200 -p vehicle_name:=cav_$CAV_ID
        echo "Started SDK Hardware Driver for CAV_ID $CAV_ID in Problem 4" >&2
    fi
fi