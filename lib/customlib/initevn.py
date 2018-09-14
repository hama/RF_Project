# -*- coding:utf-8 -*-
import argparse

from kwlogin import *
from lib_utils import *

reload(sys)
sys.setdefaultencoding('utf-8')

if __name__ == '__main__':
    # 设置执行入参
    parser = argparse.ArgumentParser(description='manual to this script')
    parser.add_argument('--url', type=str, default='https://admin1024.shoplazza.com')
    parser.add_argument('--user', type=str, default='default')
    args = parser.parse_args()
    # 设置用户信息
    config = ConfigParser.ConfigParser()
    path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
    config.read(path)
    if 'https://admin.shoplazza.com' in args.url:
        # 美服使用固定账号跑用例
        config.set("common_account", "datas_invite_code", 'DJ2311')
        config.set("common_db", "db_service_config", '{"host": "rm-rj9ww1316miq2j87l.mysql.rds.aliyuncs.com",'
                                                     '"port": 3306,"user": "fortest","password": "fortest@123",'
                                                     '"db": "service","charset": "utf8"}')
        config.set("common_url", "home_page_url", 'https://admin.shoplazza.com')
        config.set("common_account", "datas_contact", '15220581724')
        config.set("common_account", "datas_domain", 'chen')
        config.write(open(path, 'w'))
    else:
        random_str = salt_py()
        data_config = {}
        data_config['datas_invite_code'] = 'DJ6602'
        data_config['db_service_config'] = '{"host": "rm-wz9tz4ff2v9t95f9qao.mysql.rds.aliyuncs.com",' \
                                           '"port": 3306,"user": "app","password": "8rEdunuH@Fe+",' \
                                           '"db": "service","charset": "utf8"}'
        data_config['home_page_url'] = args.url
        data_config['datas_contact'] = random_str + "@abctest.com"
        data_config['datas_domain'] = random_str
        data_config['datas_password'] = config.get("common_account", "datas_password")

        config.set("common_account", "datas_invite_code", data_config['datas_invite_code'])
        config.set("common_db", "db_service_config", data_config['db_service_config'])
        config.set("common_url", "home_page_url", data_config['home_page_url'])

        # 测试服，使用新注册用户跑用例
        if args.user == 'new':
            config.set("common_account", "datas_contact", data_config['datas_contact'])
            config.set("common_account", "datas_domain", data_config['datas_domain'])
            config.write(open(path, 'w'))

            # 注册用户
            sign_up_py(**data_config)
            # 注册用户之后等待10s，等用户生效
            time.sleep(10)
        else:
            config.write(open(path, 'w'))
