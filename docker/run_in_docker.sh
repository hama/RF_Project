#!/bin/bash

docker run -it myimage \
cd /opt && \
git clone git@gitlab.sealmoo.com:shoplaza/shoplaza_robot.git && \
cd /opt/shoplaza_robot/ && \
bash run.sh -u https://admin.shoplazza.com -e > /tmp/run_robot.log 2>&1
