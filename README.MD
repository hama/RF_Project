# 自动化测试框架

[TOC]

## 1.  概述

> 本项目为 shoplaza 自动化测试项目，包含自动化测试框架的选型以及所有的自动化测试用例



## 2. 项目结构&命名规范

```shell
├── README.MD								# README
├── lib										# 第三方库
│   └── ajaxListener.js
├── logs									# 标准日志文件(可删除，此处仅作用例参考)
│   ├── log.html
│   ├── output.xml
│   └── report.html
├── module									# 按照模块区分测试用例
│   ├── 01_order							# 01_xx   一级菜单
│   │   ├── 01_checkout						# 01_xx   二级菜单
│   │   │   └── 001_checkout_list.robot		# 001_xx  实际用例
│   │   └── 02_payment
│   ├── 02_product
│   │   └── 01_material
│   ├── 03_customer
│   ├── 04_data
│   ├── 05_marketing
│   │   └── 01_discount
│   ├── 06_store
│   ├── 07_tools
│   └── 08_settings
│       └── 01_shipping
└── smoke									# 冒烟用例，为最基本用例，必须全部过
    └── 001_product_list.robot
```



## 3. Robot Framework 框架安装

### 3.1 安装系统依赖 python 2.7

```shell
# 安装 python 2.7
brew install python@2
```



### 3.2 安装 RF 及 SeleniumLibrary

```shell
# 安装框架
pip install robotframework

# 安装测试库 selenium library
pip install --pre --upgrade robotframework-seleniumlibrary

# 下载谷歌浏览器驱动，并放到运行环境的 PATH 下面
https://sites.google.com/a/chromium.org/chromedriver/downloads
```



### 3.3 安装 RIDE (可选安装，只针对 Python2.x 环境)

> RIDE = RobotFramework IDE
>
> 是提供的一个用于编写测试用例的界面， 实现了语法高亮，错误检查，运行用例等功能
>
> 你也可以使用 sublime+plugin 或者其他 ide + plugin 的方式开发，详见参考文档；

```shell
# 安装 wxPython
#     wxPython 是 Python 非常有名的一个 GUI 库，因为 RIDE 是基于这个库开发的，所以这个必须安装
#     必须是 wxPython 2.8.12.1 版本，RIDE 基于该版本开发

# 下载 dmg 并安装
http://sourceforge.net/projects/wxpython/files/wxPython/2.8.12.1/

# 若安装过程失败，可使用如下方法手动安装
https://blog.csdn.net/TZJD89/article/details/72857961

# 设置 python 默认使用 32 位来运行 wxPython,否则失败
defaults write com.apple.versioner.python Prefer-32-Bit -bool yes
```





## 4. 使用教程

- [RF 入门教程](http://www.testclass.net/rf/)
- [RF 中文手册](https://jmcn.gitbooks.io/robotframework-cn/content/)
- [SeleniumLibrary 说明](https://github.com/robotframework/SeleniumLibrary)
- [SeleniumLibrary 驱动说明](https://seleniumhq.github.io/selenium/docs/api/py/index.html#drivers)



## 5. API 文档

- [RF User Guide](http://robotframework.org/robotframework/2.9b2/RobotFrameworkUserGuide.html)
- [RF API Reference](http://robot-framework.readthedocs.io/en/latest/)
- [SeleniumLibrary API](http://robotframework.org/Selenium2Library/Selenium2Library.html)