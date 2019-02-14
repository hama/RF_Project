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
	 #       过滤以#开头的注释
    if [[ "$line" =~ ^#.* ]]; then
        continue
    fi
    # 从文档中获取所有入参
    CONTACT=`echo ${line} | awk -F$ '{print $1}'`
    PASSWORD=`echo ${line} | awk -F$ '{print $2}'`
    DOMAIN=`echo ${line} | awk -F$ '{print $3}'`
    MODULES=`echo ${line} | awk -F$ '{print $4}'`
    if [[ "$CONTACT" =~ ^module.* ]]; then
        MODULES=${CONTACT}
        CONTACT=new
    fi
    if [[ "$PASSWORD" == "" ]]; then
        PASSWORD=123456
    fi
    if [[ "$DOMAIN" == "" && "$CONTACT" == *@autotest.com ]]; then
        DOMAIN=${CONTACT%@*}
    fi


	DOCKER_LOG_PATH=${LOG_PATH}/${NUM}
	DOCKER_LOG_FILE=${TIMESTAMP}_${NUM}
	if [[ "$CONTACT" == "new" ]]; then
        docker run -d -v /dev/shm:/dev/shm -v /var/log:/var/log --add-host gitlab.shoplazza.site:172.18.55.254 \
            --rm --name $DOCKER_LOG_FILE \
			registry.shoplazza.com/library/uitest:v12 bash -c \
			"/opt/$RUN_SH_IN_DOCKER -M '$MODULES' -U https://admin.shoplazza.com -R \
			-A ${CONTACT} -D $DOCKER_LOG_PATH"
    else
		docker run -d -v /dev/shm:/dev/shm -v /var/log:/var/log --add-host gitlab.shoplazza.site:172.18.55.254 \
			--rm --name $DOCKER_LOG_FILE \
			registry.shoplazza.com/library/uitest:v12 bash -c \
			"/opt/$RUN_SH_IN_DOCKER -M '$MODULES' -U https://admin.shoplazza.com -R \
			-A ${CONTACT} -P ${PASSWORD} -O ${DOMAIN} -D $DOCKER_LOG_PATH"
    fi

	((NUM++))
	REBOT_FILE=${REBOT_FILE}${DOCKER_LOG_PATH}/output.xml" "

	echo "CONTACT=${CONTACT}"
    echo "PASSWORD=${PASSWORD}"
    echo "DOMAIN=${DOMAIN}"
    echo "MODULES=${MODULES}"
	echo "DOCKER_LOG_PATH=${DOCKER_LOG_PATH}"
	echo "DOCKER_LOG_FILE=${DOCKER_LOG_FILE}"
	echo ""
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
        docker run -d -v /var/log:/var/log --add-host gitlab.shoplazza.site:172.18.55.254 \
                --rm registry.shoplazza.com/library/uitest:v12 \
                bash -c "/opt/$RUN_SH_IN_DOCKER -E -T $TIMESTAMP -D $LOG_PATH"
        exit 0
    fi
done

echo "end:"`date` >> ~/cron.log