cd#!/bin/bash

git clone --depth=1 git@gitlab.sealmoo.com:shoplaza/shoplaza_robot.git
#pip install --pre --upgrade pip robotframework-seleniumlibrary
echo "执行的文件名：$0"
cd /opt/shoplaza_robot/
echo $@
bash run.sh $@
#docker run -it cn-registry.shoplazza.com/library/uitest:v2 bash -c "/opt/run_in_docker.sh -m 'module/03_login/*' -u https://admin.shoplazza.com -e
