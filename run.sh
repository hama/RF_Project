#!/bin/bash
python2.7 lib/customLibrary/customKeyWord.py --url=http://admin1024.shoplazza.com
robot -v is_headless:True -l /01order  module/01_order
robot -v is_headless:True -l /02product  module/02_product
robot -v is_headless:True -l /06shipping  module/08_settings/06_shipping
robot -v is_headless:True -l /09checkout  module/09_checkout
