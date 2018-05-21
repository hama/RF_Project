# -*- coding: utf-8 -*-

from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
import time
import json
import sys
class product:

    def __init__(self):
        self.dr = ""
        # self.host = "http://admin1024.shoplazza.com"
        # self.uname = "18826557090"
        # self.pwd = "147258"
        self.error_msg = "未找到该元素"
        self.error_content = "未找到该商品"
        self.file_error = "参数错误"
        self.title = "todayisverynice"
        self.brief = "Iamveryheat"
        self.min_price = 2222
        self.max_price = 9999
        self.weight = 50
        self.sku = 99
        self.dir = "/Users/dianjiang/Downloads/tm.jpg"
        self.config_dir = "/usr/local/lib/python2.7/site-packages/aaa.json"

    def run_test(self):
        # try:
        #     parameter = sys.argv[1]
        #     if not parameter.index('.json'):
        #         pass
        # except Exception as e:
        #     print self.file_error
        #     return

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
        #.点击添加商品按钮
        self.dr.find_element_by_xpath('//*[@id="dj"]/div/div/div/div[1]/a[3]').click()
        time.sleep(2)
        # page_check_fbs = self.dr.find_element_by_xpath('//*[@id="dj"]/form/div[2]/div/div[1]/div/div[1]')
        page_check_fbs = self.dr.find_element_by_xpath('//*[@id="__title"]')
        if page_check_fbs is False:
            return self.error_msg
        time.sleep(2)
        self.dr.find_element_by_id('__title').send_keys(self.title)
        self.dr.find_element_by_id('__brief').send_keys(self.brief)
        self.dr.find_element_by_id('price').send_keys(self.min_price)
        self.dr.find_element_by_id('compare_at_price').send_keys(self.max_price)
        self.dr.find_element_by_id('weight').send_keys(self.weight)
        self.dr.find_element_by_id('sku').send_keys(self.sku)
        self.dr.find_element_by_xpath('//*[@id="dj"]/form/div[3]/div/div[2]/div/ul/li/div/span/div[1]/span/input').send_keys(self.dir)
        time.sleep(1.5)
        self.dr.find_element_by_xpath('//*[@id="dj"]/form/div[4]/div/div[1]/div[3]/div/button').click()
        time.sleep(0.5)
        self.dr.find_element_by_xpath('//*[@id="dj"]/form/div[4]/div/div[1]/div[3]/span/div/button').click()
        time.sleep(2)
        #.点击确定
        self.dr.find_element_by_xpath('/html/body/div[6]/div/div[2]/div/div[1]/div/p[3]/a[2]').click()
        #.点击添加子产品按钮
        # self.dr.find_element_by_xpath('//*[@id="dj"]/form/div[4]/div/div[2]/div/div/ul/div/div/button').click()
        # time.sleep(3)
        # self.dr.find_element_by_xpath("/html/body/div[4]/div/div/ul/li[7]").click()
        time.sleep(1.5)
        #.保存
        self.dr.find_element_by_xpath('//*[@id="dj"]/form/div[1]/a').click()
        time.sleep(2)
        #.在次点击商品列表
        self.dr.find_element_by_xpath('//*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[3]/div').click()
        time.sleep(2)
        # .获取table
        next_table = self.dr.find_element_by_tag_name('table')
        next_rows = next_table.find_elements_by_tag_name('tr')[1]
        td_data = next_rows.find_elements_by_tag_name('td')[2].text
        td_data = td_data.encode('unicode-escape').decode('string_escape')
        if td_data != self.title:
            return self.error_content
        self.dr.quit()
if __name__ == '__main__':
    obk = product()
    obk.run_test()
