# -*- coding:utf-8 -*-
import argparse

from kwlogin import *
from lib_utils import *

reload(sys)
sys.setdefaultencoding('utf-8')

if __name__ == '__main__':
    random_str = salt_py()
    # 设置执行入参
    parser = argparse.ArgumentParser(description='manual to this script')
    parser.add_argument('--url', type=str, default='https://admin.shoplazza.com')
    parser.add_argument('--user', type=str, default='17665076519')
    parser.add_argument('--domain', type=str, default='homer')
    parser.add_argument('--host', type=str, default='all_usa')
    args = parser.parse_args()
    # 设置用户信息
    config = ConfigParser.ConfigParser()
    path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
    config.read(path)

    config.set("common_account", "datas_invite_code", 'DJ2048')
    config.set("common_url", "login_url", args.url)

    # 正式服配置
    if 'admin.shoplazza.com' in args.url:
        config.set("common_urn", "shop_urn", '.myshoplaza.com')
        # 过滤神策数据
        os.popen('echo "0.0.0.0 shence.shoplazza.com" >> /etc/hosts')
        # 国服配置
        if 'all_china' in args.host:
            # --------------------配置国内B端映射 host 记录 47.106.30.167 admin.shoplazza.com--------------------
            # --------------------配置国内C端映射 host 记录 47.106.30.164 random_str.myshoplaza.com--------------------
            os.popen('echo "47.106.30.167 admin.shoplazza.com" >> /etc/hosts')
            os.popen('echo "47.106.30.164 %s.myshoplaza.com" >> /etc/hosts' % (random_str))
            config.set("common_db", "db_service_config",
                       '{"host": "rm-wz909yoadvh82f9x1.mysql.rds.aliyuncs.com","port": 3306,"user": "readonly",'
                       '"password": "readonly@123","db": "service","charset": "utf8"}')
        # 默认美服配置
        elif 'all_usa' in args.host:
            config.set("common_db", "db_service_config",
                       '{"host": "rm-rj978v5t5e6462r66.mysql.rds.aliyuncs.com","port": 3306,'
                       '"user": "readonly","password": "readonly@123","db": "service","charset": "utf8"}')
        # pre_release环境配置
        elif 'pre_release' in args.host:
            os.popen('echo "39.108.38.125 admin.shoplazza.com" >> /etc/hosts')
            os.popen('echo "39.108.39.224 %s.myshoplaza.com" >> /etc/hosts' % (random_str))
            config.set("common_db", "db_service_config",
                       '{"host": "rm-wz9x2w88ltj8c94cf.mysql.rds.aliyuncs.com","port": 3306,'
                       '"user": "readonly","password": "readonly@123","db": "service","charset": "utf8"}')
    # 测试服配置
    elif 'accounts1024.shoplazza.com' in args.url:
        # 过滤神策数据
        os.popen('echo "0.0.0.0 dev-shence.shoplazza.com" >> /etc/hosts')
        config.set("common_urn", "shop_urn", '.preview.shoplazza.com')
        config.set("common_urn", "home_urn", '.preview.shoplazza.com/admin')
        config.set("common_db", "db_service_config",
                   '{"host": "rm-wz90k3o28md7301p3.mysql.rds.aliyuncs.com","port": 3306,"user": "readonly",'
                   '"password": "readonly@123","db": "service","charset": "utf8"}')

    if 'new' in args.user:
        # 使用新注册用户跑用例
        config.set("common_account", "datas_contact", random_str + "@autotest.com")
        config.set("common_account", "datas_domain", random_str)
        config.write(open(path, 'w'))
        # 注册用户
        Login().sign_up_py()
        # 注册用户之后等待10s，等用户生效
        time.sleep(10)
    else:
        # 使用指定账号跑用例
        config.set("common_account", "datas_contact", args.user)
        config.set("common_account", "datas_domain", args.domain)
        config.write(open(path, 'w'))

    print "--------------------initevn.py has done--------------------"
