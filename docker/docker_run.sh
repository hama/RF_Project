#!/bin/bash
export PATH=$PATH:/usr/local/bin/
echo "start:"`date` >> ~/cron.log

TIMESTAMP=`date "+%Y%m%d%H%M%S"`
LOG_PATH="/var/log/uitest_log/$TIMESTAMP"
LOG_PATH_1="$LOG_PATH""/1"
LOG_PATH_2="$LOG_PATH""/2"
LOG_PATH_3="$LOG_PATH""/3"

if [ ! -d "$LOG_PATH_1" ]
then
	mkdir -p $LOG_PATH_1
fi
if [ ! -d "$LOG_PATH_2" ]
then
	mkdir -p $LOG_PATH_2
fi
if [ ! -d "$LOG_PATH_3" ]
then
	mkdir -p $LOG_PATH_3
fi

# 开启docker容器跑对应用例,新创建用户
docker run -i -v /dev/shm:/dev/shm -v /var/log:/var/log --name "$TIMESTAMP"_1 --rm registry.shoplazza.com/library/uitest:v5 \
        bash -c "/opt/run_in_docker.sh -M 'module/02_order/* \
        module/08_settings/01_basic_info/store.robot \
        module/08_settings/03_shipping/shipping.robot' \
        -U https://sandbox-admin.shoplazza.com -R -A -D $LOG_PATH_1"&

docker run -i -v /dev/shm:/dev/shm -v /var/log:/var/log --name "$TIMESTAMP"_2 --rm registry.shoplazza.com/library/uitest:v5 \
        bash -c "/opt/run_in_docker.sh -M 'module/03_product/*' \
        -U https://sandbox-admin.shoplazza.com -R -A -D $LOG_PATH_2"&

docker run -i -v /dev/shm:/dev/shm -v /var/log:/var/log --name "$TIMESTAMP"_3 --rm registry.shoplazza.com/library/uitest:v5 \
        bash -c "/opt/run_in_docker.sh -M 'module/00_login/login.robot \
        module/00_login/logout.robot \
        module/06_marketing/01_coupon_code/coupon_code_smoke.robot \
        module/07_decoration/02_checkout_process/setings_checkout.robot \
        module/09_checkout/01_Checkout_Normal_Page/* \
        module/08_settings/04_tax/tax_rate.robot \
        module/08_settings/07_file_management/file_management.robot' \
        -U https://sandbox-admin.shoplazza.com -R -A -D $LOG_PATH_3"&

sleep 300

# 轮询检查docker容器是否结束,结束则合并报告,发送
for i in {1..120}
do
	sleep 60
	COUNT=`docker ps | grep "$TIMESTAMP" | wc -l`
	if [ "$COUNT" -eq 0 ]
	then
		echo "send:"`date` >> ~/cron.log
		rebot -d "$LOG_PATH"/ "$LOG_PATH_1"/output.xml "$LOG_PATH_2"/output.xml "$LOG_PATH_3"/output.xml
		docker run -i -v /var/log:/var/log --rm registry.shoplazza.com/library/uitest:v5 \
		        bash -c "/opt/run_in_docker.sh -E -T $TIMESTAMP -D $LOG_PATH"
		exit 0
	fi
done

echo "end:"`date` >> ~/cron.log




# ------------------------docker_run_single.sh------------------------
##!/bin/bash
#echo "start:"`date` >> ~/cron.log
#
## 开启docker容器跑对应用例,新创建用户
#docker run -i -v /dev/shm:/dev/shm --rm registry.shoplazza.com/library/uitest:v5 \
#        bash -c "/opt/run_in_docker.sh -M 'module/00_login/login.robot \
#                module/00_login/logout.robot \
#                module/02_order/* \
#                module/03_product/* \
#                module/06_marketing/01_coupon_code/coupon_code_smoke.robot \
#                module/07_decoration/02_checkout_process/setings_checkout.robot \
#                module/08_settings/01_basic_info/store.robot \
#                module/08_settings/03_shipping/shipping.robot \
#                module/08_settings/04_tax/tax_rate.robot \
#                module/08_settings/07_file_management/file_management.robot \
#                module/09_checkout/01_Checkout_Normal_Page/*' \
#        -U https://admin.shoplazza.com -R -E"&