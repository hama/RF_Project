#!/bin/bash

git clone --depth=1 git@gitlab.sealmoo.com:shoplaza/shoplaza_robot.git
cd /opt/shoplaza_robot/
echo $@
bash run.sh $@
#docker run -it cn-registry.shoplazza.com/library/uitest:v2 bash -c "/opt/run_in_docker.sh -m 'module/03_login/*' -u https://admin.shoplazza.com -e
#30 */2 * * * docker run --rm -it cn-registry.shoplazza.com/library/uitest:v2 bash -c "/opt/run_in_docker.sh -m 'module/03_login/* module/02_product/01_product_mangement/003_Product_List.robot module/02_product/01_product_mangement/001_views.robot' -u https://admin.shoplazza.com -e"
