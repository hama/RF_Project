# -*- coding:utf-8 -*-
from Login import *
from lib_utils import *

reload(sys)
sys.setdefaultencoding('utf-8')

config = ConfigParser.ConfigParser()
path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
config.read(path)

shop_urn = config.get("common_urn", "shop_urn")
home_urn = config.get("common_urn", "home_urn")
contact = config.get("common_account", "contact")
password = config.get("common_account", "password")
domain = config.get("common_account", "domain")
invite_code = config.get("common_account", "invite_code")
db_service_config = json.loads(config.get("common_db", "db_service_config"))
db_shop_config = json.loads(config.get("common_db", "db_shop_config"))
login_url = config.get("common_url", "login_url")
home_page_url = 'https://' + domain + home_urn
myshoplaza_url = 'https://' + domain + shop_urn


img = "http://120.79.196.159:8000/RF/logs/module/result.png"
# 获取图片
imgs = upload_oss_py(img)[0]
path_img = "//cn.cdn.shoplazza.com/" + upload_oss_py(img)[0]
# image = {"lastModified": "1520929852000", "lastModifiedDate": "2018-03-13T08:30:52.000Z", "name": imgs,
#          "originFileObj": {"uid": "rc-upload-1535093594875-2"}, "path": imgs, "percent": "100.00",
#          "status": "done", "type": "image/jpeg", "uid": "rc-upload-1535093594875-2", "url": path_img}
image = {"path": imgs, "alt": "", "aspect_ratio": "1.3333333333333333", "height": "504", "src": path_img,
         "width": "672", "size": "53455"}

login = Login()
init_cookie = {'b_cookie': login.login_b_py(), 'c_cookie': login.login_c_py()}
