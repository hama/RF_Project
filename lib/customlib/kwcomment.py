# -*- coding:utf-8 -*-

from kwproduct import *

reload(sys)
sys.setdefaultencoding('utf-8')


def comments_select_py(query_str={}, cookie=init_cookie):
    url = home_page_url + '/api/comments/select'
    return do_get(url, query_str, cookie=cookie)


def comments_delete_py(comments_list, cookie=init_cookie):
    exist_comments_id = get_exist_commentsid_py()
    if isinstance(comments_list, str) and comments_list == 'all':
        comments_list = exist_comments_id
    elif isinstance(comments_list, int):
        num = comments_list
        comments_list = exist_comments_id[:num]

    url = home_page_url + '/api/comments/delete'
    data = {"id": comments_list}
    return do_post(url, data, cookie=cookie)


def comments_insert_py(data, cookie=init_cookie):
    url = home_page_url + '/api/comments/insert'
    return do_post(url, data, cookie=cookie)


def add_published_comment_py(cookie=init_cookie):
    conf = {}
    conf['status'] = '1'
    return add_comment_with_conf_py(conf, cookie=cookie)


def add_unpublished_comment_py(cookie=init_cookie):
    conf = {}
    conf['status'] = '0'
    return add_comment_with_conf_py(conf, cookie=cookie)


def add_comment_with_conf_py(conf={}, cookie=init_cookie):
    '''
    通过conf（dict数据类型）配置来添加评论
    :param conf:
    :param cookie:
    :return:
    '''
    data = copy.deepcopy(comment_data)

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
    else:
        data['product_id'] = add_max_product_py()
    if 'ctime' in key_list:
        data['ctime'] = conf['ctime']
    else:
        data['ctime'] = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    if 'img_link' in key_list and conf['img_link'] == 'yes':
        data['img_link'] = ['//cn.cdn.shoplazza.com/d330406101ae1c48e33ed1f29f77c8b2.jpg']
    else:
        data['img_link'] = []

    return comments_insert_py(data, cookie=cookie)


def del_latest_comment_py(cookie=init_cookie):
    """
    删除最新评论
    :return: True | False
    """
    return comments_delete_py(1, cookie=cookie)


def del_latest_comments_py(num, cookie=init_cookie):
    """
    删除最新评论s
    :param num:
    :param cookie:
    :return:
    """
    return comments_delete_py(num, cookie=cookie)


def del_all_comments_py(cookie=init_cookie):
    """
    删除全部评论
    :return: True | False
    """
    return comments_delete_py('all', cookie=cookie)


def get_latest_commentid_py():
    query_str = copy.deepcopy(query_list_data)
    comments_list = comments_select_py(query_str)['content']['data']['list']
    try:
        return int(comments_list[0]['id'])
    except Exception as e:
        return 1


def get_exist_commentsid_py():
    query_str = copy.deepcopy(query_list_data)
    comments_list = comments_select_py(query_str)['content']['data']['list']
    comments_id = []
    for comment in comments_list:
        comments_id.append(comment['id'])
    return comments_id


if __name__ == '__main__':
    print add_unpublished_comment_py()
    # print add_published_comment_py()
    # config01 = {'content': 'content00'}
    # add_comment_with_conf_py(config01)
    # config02 = {'content': 'content01'}
    # add_comment_with_conf_py(config02)
    # print get_latest_commentid_py()
