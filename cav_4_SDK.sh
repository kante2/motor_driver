#!/bin/bash
set -e

# # 문제 1번 실행
# PROBLEM_ID="1" ./mission_SDK.sh

# 문제 4번 실행 (CAV 1~4 동시 백그라운드 실행)
# PROBLEM_ID="4" ./mission_SDK.sh

PROBLEM_ID="${PROBLEM_ID:-4}"

# mission_1 -> 1
# run command : PROBLEM_ID="1" ./mission_SDK.sh
if [ "$PROBLEM_ID" = "1" ]; then
    PROBLEM_ID="1" ROLE="CAV" CAV_ID="32" ./entrypoint_SDK.sh
fi

# mission_3 -> 4
# run command : PROBLEM_ID="4" ./mission_SDK.sh
# 또는 각 터미널에서 개별 실행:
# terminal 1 : PROBLEM_ID="4" ROLE="SDK" CAV_ID="1" ./entrypoint_SDK.sh
# terminal 2 : PROBLEM_ID="4" ROLE="SDK" CAV_ID="2" ./entrypoint_SDK.sh
# terminal 3 : PROBLEM_ID="4" ROLE="SDK" CAV_ID="3" ./entrypoint_SDK.sh
# terminal 4 : PROBLEM_ID="4" ROLE="SDK" CAV_ID="4" ./entrypoint_SDK.sh
if [ "$PROBLEM_ID" = "4" ]; then
    # only one cav_id , for this cav, 
    PROBLEM_ID="4" ROLE="SDK" CAV_ID="4" ./entrypoint_SDK.sh &
    # PROBLEM_ID="4" ROLE="SDK" CAV_ID="2" ./entrypoint_SDK.sh &
    # PROBLEM_ID="4" ROLE="SDK" CAV_ID="3" ./entrypoint_SDK.sh &
    # PROBLEM_ID="4" ROLE="SDK" CAV_ID="4" ./entrypoint_SDK.sh &
    wait
    echo "All SDK NODEs started" >&2
fi



