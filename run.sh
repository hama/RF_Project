#!/bin/bash
python2.7 lib/customLibrary/customKeyWord.py --url=http://admin1024.shoplazza.com
robot -v is_headless:True -d /logs/01_order/  module/01_order
robot -v is_headless:True -d /logs/02_product/  module/02_product
robot -v is_headless:True -d /logs/06_shipping/  module/08_settings/06_shipping
robot -v is_headless:True -d /logs/09_checkout/  module/09_checkout
