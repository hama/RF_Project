#!/bin/bash
if [ $# -eq 1 ]
then
    python2.7 lib/customLibrary/customKeyWord.py --url=$1
elif [ $# -eq 0 ]
then
    python2.7 lib/customLibrary/customKeyWord.py
else
    echo 'the num of params is wrong!'
fi

robot -v is_headless:True -d logs/  module/03_login/*
python2.7 lib/utils/email_utils.py