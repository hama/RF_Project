# -*- coding:utf-8 -*-
import ConfigParser
import json
import os
import sys

import kwlogin

reload(sys)
sys.setdefaultencoding('utf-8')

config = ConfigParser.ConfigParser()
path = os.path.join(os.path.dirname(__file__), '../..') + '/config/common.ini'
config.read(path)

home_page_url = config.get("common_url", "home_page_url")
datas_contact = config.get("common_account", "datas_contact")
datas_password = config.get("common_account", "datas_password")
datas_domain = config.get("common_account", "datas_domain")
datas_invite_code = config.get("common_account", "datas_invite_code")
db_service_config = json.loads(config.get("common_db", "db_service_config"))
db_shop_config = json.loads(config.get("common_db", "db_shop_config"))

cookie = kwlogin.login()
