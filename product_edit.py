#-*- coding:utf-8 -*-
from selenium import webdriver
import time

class product:
    def __init__(self):
        self.dr = ""
        # self.host = "http://admin1024.shoplazza.com"
        # self.uname = "18826557090"
        # self.pwd = "147258"
        self.title = "qxqxxqxqx"
        self.brief = "xcxcxcxcx"
        self.min_price = 66
        self.max_price = 77
        self.weight = 11
        self.sku = 7
        self.dir = "/Users/dianjiang/Downloads/mv.jpg"
        self.index = 1
        self.error_msg = "数据不正确"
        self.config_dir = "/usr/local/lib/python2.7/site-packages/aaa.json"

    def str_run(self):
        with open(self.config_dir,'r') as f:
            f_data = f.read()
            f_data = json.loads(f_data)
        self.host = f_data['host']
        self.uname = f_data['uname']
        self.pwd = f_data['pwd']
        self.dr = webdriver.Chrome()
        self.dr.get(self.host)
        time.sleep(1)
        self.dr.find_element_by_id('account').send_keys(self.uname)
        self.dr.find_element_by_id('password').send_keys(self.pwd)
        time.sleep(1.5)
        self.dr.find_element_by_tag_name("button").click()
        time.sleep(1.5)
        page_check = self.dr.find_element_by_xpath('//*[@id="root"]/div/div/div[1]/div[2]/div[1]/div/div[1]/span')
        if page_check is False:
            return self.error_msg
        self.dr.find_element_by_xpath('//*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[3]/div').click()
        time.sleep(2)
        page_check_fb = self.dr.find_element_by_xpath('//*[@id="dj"]/div/div/div/div[4]')
        if page_check_fb is False:
            return self.error_msg
        # .点击第一个tr
        next_table = self.dr.find_element_by_tag_name('table')
        next_res = next_table.find_elements_by_tag_name('tr')[self.index]
        res_next = next_res.text
        next_res.click()
        time.sleep(2)
        self.dr.find_element_by_id('__title').send_keys(self.title)
        self.dr.find_element_by_id('__brief').send_keys(self.brief)
        # self.dr.find_element_by_id('price').send_keys(self.min_price)
        # self.dr.find_element_by_id('compare_at_price').send_keys(self.max_price)
        # self.dr.find_element_by_id('weight').send_keys(self.weight)
        # self.dr.find_element_by_id('sku').send_keys(self.sku)
        self.dr.find_element_by_xpath(
            '//*[@id="dj"]/form/div[3]/div/div[2]/div/ul/li/div/span/div[1]/span/input').send_keys(self.dir)
        time.sleep(1.5)
        # self.dr.find_element_by_xpath('//*[@id="dj"]/form/div[4]/div/div[1]/div[3]/div/button').click()
        # time.sleep(0.5)
        # self.dr.find_element_by_xpath('//*[@id="dj"]/form/div[4]/div/div[1]/div[3]/span/div/button').click()
        self.dr.find_element_by_xpath('//*[@id="dj"]/form/div[1]/a[1]').click()
        time.sleep(1)
        # .在次点击商品列表
        self.dr.find_element_by_xpath('//*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[3]/div').click()
        time.sleep(1)
        new_table = self.dr.find_element_by_tag_name('table')
        new_res = new_table.find_elements_by_tag_name('tr')[self.index].text
        new_res = new_res.encode('unicode-escape').decode('string_escape')
        str_ = str(res_next)+self.title
        if new_res != str_:
            return self.error_msg
        self.dr.quit()
if __name__ == '__main__':
    objk = product()
    objk.str_run()
