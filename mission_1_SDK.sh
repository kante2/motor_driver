#!/bin/bash
set -e

# CAV 1번 차량 실행
# run command : ./mission_1_SDK.sh
./mission_domain_setup.sh

PROBLEM_ID="4" ROLE="SDK" CAV_ID="1" ./entrypoint_SDK.sh
