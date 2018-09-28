# -*- coding:utf-8 -*-

from kwproduct import *

reload(sys)
sys.setdefaultencoding('utf-8')


def comments_select_py(api='/api/comments/select?page=0&limit=10&keyword=&customer='
                           '&sort%5Bpraise%5D=&sort%5Bctime%5D=', cookie=init_cookie):
    p_url = home_page_url + api
    ret_data = requests.get(url=p_url, headers={"cookie": cookie['cookie']})
    return ret_data.content


def comments_insert_py(data, cookie=init_cookie):
    url = home_page_url + '/api/comments/insert'

    try:
        resData = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        if resData.status_code == 200 and json.loads(resData.content)['state'] == 0:
            return True
        else:
            return False
    except Exception as e:
        return e


def add_comments_with_conf_py(conf, cookie=init_cookie):
    '''
    通过conf（dict数据类型）配置来添加评论
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(collecion_data)

    key_list = conf.keys()
    if 'star' in key_list:
        data['star'] = conf['star']
    if 'content' in key_list:
        data['content'] = conf['content']
    if 'praise' in key_list:
        data['praise'] = conf['praise']
    if 'status' in key_list:
        data['status'] = conf['status']
    if 'uname' in key_list:
        data['uname'] = conf['uname']
    if 'product_id' in key_list:
        data['product_id'] = conf['product_id']
    if 'ctime' in key_list:
        data['ctime'] = conf['ctime']
    if 'img_link' in key_list and conf['img_link'] == 'yes':
        data['img_link'] = ['//cn.cdn.shoplazza.com/d330406101ae1c48e33ed1f29f77c8b2.jpg']
    else:
        data['img_link'] = []

    comments_insert_py(data, cookie)


def comments_delete_py(comments_list, cookie=init_cookie):
    exist_comments_id = get_exist_commentsid_py()
    if isinstance(comments_list, str) and comments_list == 'all':
        comments_list = exist_comments_id
    elif isinstance(comments_list, int):
        num = comments_list
        comments_list = exist_comments_id[:num]

    url = home_page_url + '/api/comments/delete'
    data = {"id": comments_list}
    try:
        response_data = requests.post(url=url, headers={"cookie": cookie['cookie']}, json=data)
        if response_data.status_code == 200 \
                and (json.loads(response_data.content)['state'] == 0 \
                     or json.loads(response_data.content)['state'] == 1):
            return True
        else:
            return False

    except Exception as e:
        return e


def del_latest_comment_py(cookie=init_cookie):
    """
    删除最新评论
    :return: True | False
    """
    comments_delete_py(1, cookie)


def del_latest_comments_py(num, cookie=init_cookie):
    """
    删除最新评论s
    :param num:
    :param cookie:
    :return:
    """
    comments_delete_py(num, cookie)


def del_all_comments_py(cookie=init_cookie):
    """
    删除全部评论
    :return: True | False
    """
    comments_delete_py('all', cookie)


def get_latest_comments_py():
    comments_list = json.loads(comments_select_py())['data']['list']
    try:
        return int(comments_list[0]['id'])
    except Exception as e:
        return 1


def get_exist_commentsid_py():
    comments_list = json.loads(comments_select_py())['data']['list']
    comments_id = []
    for comment in comments_list:
        comments_id.append(comment['id'])
    return comments_id


if __name__ == '__main__':
    add_comments_with_conf_py()
