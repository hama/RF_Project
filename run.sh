#!/bin/bash
python2.7 lib/customLibrary/customKeyWord.py --url=http://admin1024.shoplazza.com
robot -v is_headless:True -d logs/03_login/  module/03_login/*
robot -v is_headless:True -d logs/04_register/  module/04_register/*
