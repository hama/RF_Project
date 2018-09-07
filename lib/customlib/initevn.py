# -*- coding:utf-8 -*-
import ConfigParser
import argparse
import os
import sys
import time

import kwlogin
from lib_utils import *

reload(sys)
sys.setdefaultencoding('utf-8')

if __name__ == '__main__':
    # 设置执行入参
    parser = argparse.ArgumentParser(description='manual to this script')
    parser.add_argument('--url', type=str, default='https://qa.shoplazza.com')
    parser.add_argument('--user', type=str, default='default')
    args = parser.parse_args()
    # 设置用户信息
    config = ConfigParser.ConfigParser()
    path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
    config.read(path)
    if 'https://admin.shoplazza.com' in args.url:
        # 美服使用固定账号跑用例
        config.set("common_account", "datas_invite_code", 'DJ2746')
        config.set("common_db", "db_service_config", '{"host": "rm-rj9ww1316miq2j87l.mysql.rds.aliyuncs.com",'
                                                     '"port": 3306,"user": "fortest","password": "fortest@123",'
                                                     '"db": "service","charset": "utf8"}')
        config.set("common_url", "home_page_url", 'https://admin.shoplazza.com')
        config.set("common_account", "datas_contact", '15220581724')
        config.set("common_account", "datas_domain", 'chen')
        config.write(open(path, 'w'))
    else:
        config.set("common_account", "datas_invite_code", 'DJ6602')
        config.set("common_db", "db_service_config", '{"host": "rm-wz9tz4ff2v9t95f9qao.mysql.rds.aliyuncs.com",'
                                                     '"port": 3306,"user": "app","password": "8rEdunuH@Fe+",'
                                                     '"db": "service","charset": "utf8"}')
        config.set("common_url", "home_page_url", args.url)
        # 测试服，使用新注册用户跑用例
        if args.user == 'new':
            random_str = salt()
            config.set("common_account", "datas_contact", random_str + "@abctest.com")
            config.set("common_account", "datas_domain", random_str)
            config.write(open(path, 'w'))
            # 注册用户
            kwlogin.sign_up()
            # 注册用户之后等待10s，等用户生效
            time.sleep(10)
        else:
            config.write(open(path, 'w'))
