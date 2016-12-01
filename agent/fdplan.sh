#/usr/bin/env bash

# find path to fast downward #
FD_PATH=$(locate fast-downward.py | head -n 1)

# find optimal plan using fd on input domain and problem #
rm -f output output.sas sas_plan
${FD_PATH} $1 $2 --search "astar(lmcut())" | grep -E '(\([0-9]\)|cost)' | awk '{print $0}'
