#!/bin/bash
set -e

# chmod
chmod +x /home/autonav/KAIST_Mobility_Challenge_SDK/build.sh

# ROS2 환경 설정
source /opt/ros/$ROS_DISTRO/setup.bash

# Driver_ROS2 패키지 빌드
cd ~/KAIST_Mobility_Challenge_SDK/examples/Driver_ROS2

colcon build --symlink-install
source install/setup.bash

echo "Build completed successfully!" >&2
