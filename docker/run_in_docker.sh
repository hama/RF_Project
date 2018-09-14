#!/bin/bash

git clone git@gitlab.sealmoo.com:shoplaza/shoplaza_robot.git
cd /opt/shoplaza_robot/
bash run.sh $@
#bash /opt/shoplaza_robot/run.sh -m "module/03_login/*" -u https://admin.shoplazza.com -e
#docker run -it image:tag sh -c "/opt/run_id_docker.sh"