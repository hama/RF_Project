#!/bin/bash
export PATH=$PATH:/usr/local/bin/
echo "start:"`date` >> ~/cron.log

if [ ! -n "$1" ]
then
	RUN_SH_IN_DOCKER='run_develop_in_docker.sh'
fi

TIMESTAMP=`date "+%Y%m%d%H%M%S"`
LOG_PATH="/var/log/uitest_log/$TIMESTAMP"
LOG_PATH_1="$LOG_PATH""/1"
LOG_PATH_2="$LOG_PATH""/2"
LOG_PATH_3="$LOG_PATH""/3"
LOG_PATH_4="$LOG_PATH""/4"
LOG_PATH_5="$LOG_PATH""/5"
LOG_PATH_6="$LOG_PATH""/6"
LOG_PATH_7="$LOG_PATH""/7"

#if [ ! -d "$LOG_PATH_1" ]
#then
#	mkdir -p $LOG_PATH_1
#fi
#if [ ! -d "$LOG_PATH_2" ]
#then
#	mkdir -p $LOG_PATH_2
#fi
#if [ ! -d "$LOG_PATH_3" ]
#then
#	mkdir -p $LOG_PATH_3
#fi

# 开启docker容器跑对应用例,新创建用户
docker run -i -v /dev/shm:/dev/shm -v /var/log:/var/log --name "$TIMESTAMP"_1 --rm registry.shoplazza.com/library/uitest:v7 \
        bash -c "/opt/$RUN_SH_IN_DOCKER -M 'module/00_login/login.robot \
        module/00_login/logout.robot \
        module/02_order/*' \
        -U https://admin.shoplazza.com -R -A -D $LOG_PATH_1"&

docker run -i -v /dev/shm:/dev/shm -v /var/log:/var/log --name "$TIMESTAMP"_2 --rm registry.shoplazza.com/library/uitest:v7 \
        bash -c "/opt/$RUN_SH_IN_DOCKER -M 'module/08_settings/01_basic_info/store.robot \
        module/08_settings/03_shipping/shipping.robot' \
        -U https://admin.shoplazza.com -R -A -D $LOG_PATH_2"&

docker run -i -v /dev/shm:/dev/shm -v /var/log:/var/log --name "$TIMESTAMP"_3 --rm registry.shoplazza.com/library/uitest:v7 \
        bash -c "/opt/$RUN_SH_IN_DOCKER -M 'module/03_product/01_product_management/*' \
        -U https://admin.shoplazza.com -R -A -D $LOG_PATH_3"&

docker run -i -v /dev/shm:/dev/shm -v /var/log:/var/log --name "$TIMESTAMP"_4 --rm registry.shoplazza.com/library/uitest:v7 \
        bash -c "/opt/$RUN_SH_IN_DOCKER -M 'module/03_product/04_seoimg/* \
        module/03_product/02_product_collection/* \
        module/03_product/03_product_comment/*' \
        -U https://admin.shoplazza.com -R -A -D $LOG_PATH_4"&

docker run -i -v /dev/shm:/dev/shm -v /var/log:/var/log --name "$TIMESTAMP"_5 --rm registry.shoplazza.com/library/uitest:v7 \
        bash -c "/opt/$RUN_SH_IN_DOCKER -M 'module/07_decoration/02_checkout_process/setings_checkout.robot' \
        -U https://admin.shoplazza.com -R -A -D $LOG_PATH_5"&

docker run -i -v /dev/shm:/dev/shm -v /var/log:/var/log --name "$TIMESTAMP"_6 --rm registry.shoplazza.com/library/uitest:v7 \
        bash -c "/opt/$RUN_SH_IN_DOCKER -M 'module/06_marketing/01_coupon_code/coupon_code_smoke.robot \
        module/09_checkout/01_Checkout_Normal_Page/*' \
        -U https://admin.shoplazza.com -R -A -D $LOG_PATH_6"&

docker run -i -v /dev/shm:/dev/shm -v /var/log:/var/log --name "$TIMESTAMP"_7 --rm registry.shoplazza.com/library/uitest:v7 \
        bash -c "/opt/$RUN_SH_IN_DOCKER -M 'module/08_settings/04_tax/tax_rate.robot \
        module/08_settings/07_file_management/file_management.robot' \
        -U https://admin.shoplazza.com -R -A -D $LOG_PATH_7"&

sleep 300

# 轮询检查docker容器是否结束,结束则合并报告,发送
for i in {1..120}
do
	sleep 60
	COUNT=`docker ps | grep "$TIMESTAMP" | wc -l`
	if [ "$COUNT" -eq 0 ]
	then
		echo "send:"`date` >> ~/cron.log
		rebot -d "$LOG_PATH"/ "$LOG_PATH_1"/output.xml "$LOG_PATH_2"/output.xml "$LOG_PATH_3"/output.xml \
			"$LOG_PATH_4"/output.xml "$LOG_PATH_5"/output.xml "$LOG_PATH_6"/output.xml "$LOG_PATH_7"/output.xml
		docker run -i -v /var/log:/var/log --rm registry.shoplazza.com/library/uitest:v7 \
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
#        bash -c "/opt/run_develop_in_docker.sh -M 'module/00_login/login.robot \
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