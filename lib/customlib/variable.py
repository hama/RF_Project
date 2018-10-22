# -*- coding:utf-8 -*-
from kwlogin import *
from lib_utils import *

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
# myshoplaza_url = 'https://' + datas_domain + '.myshoplaza.com'
myshoplaza_url = 'https://' + datas_domain + '.sandbox-preview.shoplazza.com'
# myshoplaza_url = 'https://' + datas_domain + '.preview.shoplazza.com'


img = "http://120.79.196.159:8000/RF/logs/module/result.png"
# 获取图片
imgs = upload_oss_py(img)[0]
path_img = "//cn.cdn.shoplazza.com/" + upload_oss_py(img)[0]
image = {"lastModified": "1520929852000", "lastModifiedDate": "2018-03-13T08:30:52.000Z", "name": imgs,
         "originFileObj": {"uid": "rc-upload-1535093594875-2"}, "path": imgs, "percent": "100.00",
         "status": "done", "type": "image/jpeg", "uid": "rc-upload-1535093594875-2", "url": path_img}

init_cookie = login_py()
