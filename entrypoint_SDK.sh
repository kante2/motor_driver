#!/bin/bash
set -e

PROBLEM_ID="${PROBLEM_ID:-4}"
CAV_ID="${CAV_ID:-32}"
ROLE="${ROLE:-SDK}"

echo "start SDK NODE" >&2
echo "CAV_ID: $CAV_ID, PROBLEM_ID: $PROBLEM_ID, ROLE: $ROLE" >&2

# ROS2 환경 설정
cd ~/KAIST_MOBILITY_CHALLENGE_SDK/examples/Driver_ROS2
source install/setup.bash
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
        export ROS_DOMAIN_ID=101
        # CAV_ID를 2자리 포맷으로 변환 (1 -> 01, 32 -> 32)
        CAV_ID_FORMATTED=$(printf "%02d" $CAV_ID)
        echo "ROS_DOMAIN_ID: $ROS_DOMAIN_ID, CAV_ID: $CAV_ID (CAV_$CAV_ID_FORMATTED)" >&2
        ros2 run kmc_hardware_driver_node kmc_hardware_driver_demo_node_ver2 --ros-args -p port:=/dev/ttyKMC -p baud:=115200 -p vehicle_name:=CAV_$CAV_ID_FORMATTED
        echo "Started SDK Hardware Driver for CAV_$CAV_ID_FORMATTED in Problem 4" >&2
    fi
fi