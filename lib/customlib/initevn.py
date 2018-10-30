# -*- coding:utf-8 -*-
import argparse

from kwlogin import *
from lib_utils import *

reload(sys)
sys.setdefaultencoding('utf-8')

if __name__ == '__main__':
    # 设置执行入参
    parser = argparse.ArgumentParser(description='manual to this script')
    parser.add_argument('--url', type=str, default='https://sandbox-admin.shoplazza.com')
    parser.add_argument('--user', type=str, default='autotest@shoplazza.com')
    parser.add_argument('--domain', type=str, default='autotest')
    args = parser.parse_args()
    # 设置用户信息
    config = ConfigParser.ConfigParser()
    path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
    config.read(path)

    config.set("common_account", "datas_invite_code", 'DJ1024')
    config.set("common_url", "home_page_url", args.url)
    config.set("common_urn", "shop_urn", '.sandbox-preview.shoplazza.com')
    config.set("common_db", "db_service_config",
               '{"host": "39.108.94.30","port": 33306,"user": "readonly","password": "shoplaza@123",'
               '"db": "service","charset": "utf8"}')
    config.set("common_db", "db_shop_config",
               '{"host": "rm-rj9f22zpw641v45g9.mysql.rds.aliyuncs.com","port": 3306,"user": "lansejiebo",'
               '"password": "lansejiebo@123","db": "shop_","charset": "utf8"}')

    if 'https://admin.shoplazza.com' in args.url:
        config.set("common_db", "db_service_config",
                   '{"host": "rm-rj978v5t5e6462r66.mysql.rds.aliyuncs.com","port": 3306,'
                   '"user": "readonly","password": "readonly@123","db": "service","charset": "utf8"}')
        config.set("common_urn", "shop_urn", '.myshoplaza.com')
    if 'new' in args.user:
        # 使用新注册用户跑用例
        random_str = salt_py()
        config.set("common_account", "datas_contact", random_str + "@autotest.com")
        config.set("common_account", "datas_domain", random_str)
        config.write(open(path, 'w'))
        # 注册用户
        Login().sign_up_py()
        # 注册用户之后等待10s，等用户生效
        time.sleep(10)
    else:
        # 使用固定账号跑用例
        config.set("common_account", "datas_contact", args.user)
        config.set("common_account", "datas_domain", args.domain)
        config.write(open(path, 'w'))
