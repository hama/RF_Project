#!/bin/bash
echo $1

if [ $* != 0 ]
then
    sed -i "s@home_page_url.*@home_page_url = $1" config/common.ini
fi
python2.7 lib/customLibrary/customKeyWord.py $1
robot -v is_headless:True -d logs/  module/03_login/* module/04_register/*
python2.7 lib/utils/email.py