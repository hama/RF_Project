# -*- coding:utf-8 -*-
import uuid

import oss2

from lib_utils import *
from variable import *

reload(sys)
sys.setdefaultencoding('utf-8')


def product_search_py(api='/api/product/search?page=0&limit=20', cookie=init_cookie):
    """
    公共获取数据方法
    :param p_url: url
    :return: dict
    """
    p_url = home_page_url + api
    ret_data = requests.get(url=p_url, headers={"cookie": cookie['cookie']})
    return ret_data.content


def add_product_py(cookie=init_cookie):
    """
    添加商品
    :return: True | False
    """
    # .获取图片
    imgs = upload_oss_py(img)[0]
    path_img = "//cn.cdn.shoplazza.com/" + upload_oss_py(img)[0]
    url = home_page_url + "/api/product/add"
    data = {
        "barcode": "",
        "brief": "自动化测试",
        "compare_at_price": 1000,
        "has_only_default_variant": True,
        "images": [{"lastModified": "1520929852000", "lastModifiedDate": "2018-03-13T08:30:52.000Z", "name": imgs,
                    "originFileObj": {"uid": "rc-upload-1535093594875-2"}, "path": imgs, "percent": "100.00",
                    "status": "done", "type": "image/jpeg", "uid": "rc-upload-1535093594875-2", "url": path_img}],
        "meta_description": "",
        "meta_keyword": "",
        "meta_title": "自动化测试",
        "price": 99,
        "status": 1,
        "title": "自动化测试",
        "url": "/products/自动化测试",
        "variants": [{"barcode": "", "compare_at_price": 1000, "inventory_management": "", "inventory_policy": "",
                      "inventory_quantity": "", "price": 99, "requires_shipping": "", "sku": "", "taxable": "",
                      "weight": "", "weight_unit": "kg"}]
    }
    try:
        resData = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        if resData.status_code == 200 and json.loads(resData.content)['state'] == 0:
            return True
        else:
            return False

    except Exception as e:
        return e


def updates_status_py(product_list, status, cookie=init_cookie):
    """
    更改商品状态
    :param product_list:
    :param status: -1 = 删除商品（非数据库） | 0 = 设置下架 | 1 = 设置上架
    :return:
    """
    first_product_id = get_latest_productid_py()
    if isinstance(product_list, str):
        if product_list == 'all':
            product_list = range(1, first_product_id + 1)
        elif product_list == 'first':
            product_list = [first_product_id]

    url = home_page_url + "/api/product/updatestatus"
    data = {"product_ids": product_list, "status": status}
    try:
        resData = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        if resData.status_code == 200 and json.loads(resData.content)['state'] == 0:
            return True
        else:
            return False

    except Exception as e:
        return e


def upload_oss_py(urlex, name='', extension='', timeout_second=30):
    """
    上传图片到阿里云
    :param urlex: url
    :param name: 名字
    :param extension: 扩充信息
    :param timeout_second: 超时时间
    :return: tuple
    """
    auth = oss2.Auth(aliyun['accessKeyId'], aliyun['accessKeySecret'])
    bucket = oss2.Bucket(auth, aliyun['endPoint'], aliyun['bucket'])
    if not urlex:
        return False
    tmp_file = '/tmp/' + str(uuid.uuid1())
    try:
        r = requests.get(urlex, stream=True, timeout=timeout_second)
        if r.status_code > 399:
            return False
        with open(tmp_file, 'wb') as f:
            for chunk in r.iter_content(chunk_size=1024):
                if chunk:  # filter out keep-alive new chunks
                    f.write(chunk)
        md5_file = md5_py(tmp_file)
        size_file = os.stat(tmp_file).st_size
        s3key = name
        if not s3key:
            if not extension:
                extension = urlex.split('.')[-1].split('?')[0]
                if len(extension) > 5:
                    extension = ""
            if extension:
                s3key = md5_file + '.' + extension
            else:
                s3key = md5_file
            if s3key.endswith('.SS2'):
                s3key = str(s3key).replace('SS2', 'jpg')

        with open(tmp_file, 'rb') as f:
            bucket.put_object(s3key, f)
        return (s3key, size_file)
    except Exception as e:
        print e
    finally:
        try:
            os.remove(tmp_file)
        except Exception as e:
            print e
    return False


def del_first_product_py(cookie=init_cookie):
    """
    删除首个商品
    :return: True | False
    """
    updates_status_py('first', -1, cookie)


def del_all_product_py(cookie=init_cookie):
    """
    删除全部商品
    :return: True | False
    """
    updates_status_py('all', -1, cookie)


def getAllProductCount_py(cookie=init_cookie):
    p_url = home_page_url + "/api/product/search"
    sub_list = requests.get(url=p_url, headers={"cookie": cookie['cookie']})
    total = json.loads(sub_list.content)['data']['total']

    return total


def get_latest_productid_py():
    products_list = json.loads(product_search_py())['data']['products']
    return products_list[0]['id']

# if __name__ == '__main__':
# product_search_py()
# del_first_product_py()
# del_all_product_py()
