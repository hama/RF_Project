# -*- coding: utf-8 -*-

from selenium import webdriver
import json
import time
import requests
import pymysql

class productList:

    def __init__(self):
        self.dr = ""
        self.u_id = "account"
        self.p_id = "password"
        self.error_msg = "找不到该页面元素"
        self.config_dir = "/usr/local/lib/python2.7/site-packages/aaa.json"

    #>.case
    def test(self):
       try:
           with open(self.config_dir, 'r') as f:
               f_data = f.read()
               f_data = json.loads(f_data)
           self.host = f_data['host']
           self.uname = f_data['uname']
           self.pwd = f_data['pwd']
           self.x_url = f_data['x_url']
           self.f_url = f_data['f_url']
       except Exception as e:
           print e
           return
       self.dr = webdriver.Chrome()
       self.dr.get(self.host)
       time.sleep(2)
       self.dr.find_element_by_id(self.u_id).send_keys(self.uname)
       self.dr.find_element_by_id(self.p_id).send_keys(self.pwd)
       self.dr.find_element_by_tag_name("button").click()

       time.sleep(2)
       check = self.check_element('//*[@id="root"]/div/div/div[1]/div[2]/div[1]/div/div[1]/span')
       #.验证登陆成功后的页面元素
       if not check:
           return error_msg
       self.dr.find_element_by_xpath('//*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[3]/div').click()
       check2 = self.check_element('//*[@id="dj"]/div/div/div/div[4]')
       #.验证点击商品专栏后页面元素
       if not check2:
           return error_msg
       time.sleep(2)

       # .验证是否有下一页
       page = self.check_element('//*[@id="dj"]/div/div/div/div[5]/div[1]/div[2]/ul/li[10]/a')

       num = 100
       next_list = []
       #.获取总条数
       tatol = self.dr.find_element_by_xpath('//*[@id="dj"]/div/div/div/div[5]/div[1]/div[2]/ul/li[1]')
       tatol_str = tatol.text
       tatol_str = tatol_str.encode('unicode-escape').decode('string_escape')[0:3]
       newtatol = int(tatol_str) / 20

       for ix in range(1, num):
           # .如果为1 进入下一页
           if ix != 1:
               self.dr.find_element_by_xpath('//*[@id="dj"]/div/div/div/div[5]/div[1]/div[2]/ul/li[11]/a').click()
               time.sleep(2)
           #.获取table
           next_table = self.dr.find_element_by_tag_name('table')
           next_rows = next_table.find_elements_by_tag_name('tr')[1:]

           for xx in next_rows:
               next_cows = xx.find_elements_by_tag_name('td')[2].text
               next_str = next_cows.encode('unicode-escape').decode('string_escape')
               next_list.append(next_str)
           resdata = self.checkData(next_list)
           if resdata is False:
               return "数据校验失败"
           if ix == newtatol:
               break

       self.dr.quit()
    #.验证页面元素
    def check_element(self,element):
        if element is None:
            return
        check = True
        try:
            self.dr.find_element_by_xpath(element)
            return check
        except Exception as e:
            check = False
            print e
            return check

    def checkData(self,arg1):
        data = self.getProduct()
        for x in arg1:
            if x not in data:
                return False
        return True
    #.获取该用户下所有商品
    def getProduct(self):
        datas = {"contact": self.uname, "password": self.pwd}
        res = requests.post(url=self.x_url, headers={}, data=datas)
        if res is None or res.status_code != 200:
            return res.status_code

        cookiesx = '; '.join(['='.join(item) for item in res.cookies.items()])
        serich = requests.get(url=self.f_url,headers={"cookie":cookiesx})
        limit = json.loads(serich.content)['data']['total']
        l_url = self.f_url + "?limit="+str(limit)

        serichdata = requests.get(url=l_url,headers={"cookie":cookiesx})
        serich_data = json.loads(serichdata.content)['data']['products']
        res_list = []
        for x in serich_data:
            cpws = x['title'].encode('unicode-escape').decode('string_escape')
            cpws = cpws.strip()
            res_list.append(cpws)
        return res_list
if __name__ == '__main__':
    res = productList()
    res.test()
