#!/bin/bash
set -e

cd ~/KAIST_MOBILITY_CHALLENGE_SDK
chmod +x *

# ROS2 환경 설정
source /opt/ros/$ROS_DISTRO/setup.bash

# Driver_ROS2 패키지 빌드
# cd ~/KAIST_Mobility_Challenge_SDK/examples/Driver_ROS2

cd ~/KAIST_MOBILITY_CHALLENGE_SDK/examples/Driver_ROS2
rm -rf build install log
colcon build --symlink-install

echo "Build completed successfully!" >&2
