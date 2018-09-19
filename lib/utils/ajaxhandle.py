# -*- coding:utf-8 -*-
import ConfigParser
import email
import os
import smtplib
import sys
import time
import execjs

from selenium import webdriver

def get_response():
    # json = execjs.eval("responseMap.get('${api}')")
    execjs.eval("responseMap = {'a':123 }")
    json = execjs.eval("responseMap")
    print json
    return json

def exec_js_function():
    # 编译JS代码
    ctx = execjs.compile("""
    function add(x, y){
        return x + y;
        }
    """)

    print ctx.call("add", 1, 2)

if __name__ == '__main__':
    # get_response()
    exec_js_function()