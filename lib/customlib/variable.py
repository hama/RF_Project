# -*- coding:utf-8 -*-
from kwlogin import *

reload(sys)
sys.setdefaultencoding('utf-8')

config = ConfigParser.ConfigParser()
path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
config.read(path)

home_page_url = config.get("common_url", "home_page_url")
datas_contact = config.get("common_account", "datas_contact")
datas_password = config.get("common_account", "datas_password")
datas_domain = config.get("common_account", "datas_domain")
datas_invite_code = config.get("common_account", "datas_invite_code")
db_service_config = json.loads(config.get("common_db", "db_service_config"))
db_shop_config = json.loads(config.get("common_db", "db_shop_config"))

# 北京时区
Bj_timeZone = "+0800"
# 美属萨摩亚时区
My_timeZone = "-1100"
aliyun = {
    "accessKeyId": "LTAIpvmId6CBlCH8",
    "accessKeySecret": "RkrFrAmixqlS5su065AgVzFa9OXb9w",
    "bucket": "shoplazza",
    "endPoint": "oss-cn-shenzhen.aliyuncs.com"
}
img = "http://120.79.196.159:8000/RF/logs/module/result.png"

init_cookie = login_py()
