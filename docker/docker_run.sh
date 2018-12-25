#!/bin/bash
export PATH=$PATH:/usr/local/bin/
echo "start:"`date` >> ~/cron.log

if [ ! -n "$1" ]
then
	RUN_SH_IN_DOCKER='run_develop_in_docker.sh'
fi

TIMESTAMP=`date "+%Y%m%d%H%M%S"`
LOG_PATH="/var/log/uitest_log/$TIMESTAMP"
NUM=1
REBOT_FILE=""
OUTFILE=`cat ./docker.config`

# 开启docker容器跑对应用例,新创建用户
while read line
do
	DOCKER_LOG_PATH=${LOG_PATH}/${NUM}
	DOCKER_LOG_FILE=${TIMESTAMP}_${NUM}
	docker run -d -v /dev/shm:/dev/shm -v /var/log:/var/log --rm --name $DOCKER_LOG_FILE registry.shoplazza.com/library/uitest:v7 \
		bash -c "/opt/$RUN_SH_IN_DOCKER -M '$line' -U https://admin.shoplazza.com -R -A -D $DOCKER_LOG_PATH"
	((NUM++))
	REBOT_FILE=${REBOT_FILE}${DOCKER_LOG_PATH}/output.xml" "
	echo "MODULE=${line}"
	echo "DOCKER_LOG_PATH=${DOCKER_LOG_PATH}"
	echo "DOCKER_LOG_FILE=${DOCKER_LOG_FILE}"
done << EOF
$OUTFILE
EOF



# 轮询检查docker容器是否结束,结束则合并报告,发送
for i in {1..120}
do
	sleep 60
    COUNT=`docker ps | grep "$TIMESTAMP" | wc -l`
    if [ "$COUNT" -eq 0 ]
    then
        echo "send:"`date` >> ~/cron.log
        echo "send:"`date`
        echo "REBOT_FILE=${REBOT_FILE}"
        rebot -d "$LOG_PATH"/ ${REBOT_FILE}
        docker run -d -v /var/log:/var/log --rm registry.shoplazza.com/library/uitest:v7 \
                bash -c "/opt/$RUN_SH_IN_DOCKER -E -T $TIMESTAMP -D $LOG_PATH"
        exit 0
    fi
done

echo "end:"`date` >> ~/cron.log