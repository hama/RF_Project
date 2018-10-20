#!/bin/bash
echo `date` >> ~/cron.log
docker run -i -v /dev/shm:/dev/shm --rm registry.shoplazza.com/library/uitest:v5 bash -c "/opt/run_in_docker.sh -e"