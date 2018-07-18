*** Settings ***
Variables         ${CURDIR}/../lib/customLibrary

*** Variables ***
### 未分类，需要分类并清理
${home_page}      ${home_page_url}
${error_msg}      出错啦！    #.自定义错误提示
${login_btn}      class:logBtn___3pRgJ    #.登陆按钮
${register_btn}    dom:document.querySelectorAll(".bottomEdit___zk0l5 a")[0]     #.注册按钮
${recover_pwd_btn}       dom:document.querySelectorAll(".bottomEdit___zk0l5 div a")[0]     #.忘记密码按钮
### 菜单栏 locator
${locator_order}    dom:document.querySelectorAll('a[href="/order"]')[0]    # 导航栏-订单
${locator_products}    id:test_product    # 导航栏-商品
${locator_product_manage}    dom:document.querySelectorAll('a[href="/products"]')[0]    # 导航栏-商品管理
${locator_product_collection}    dom:document.querySelectorAll('a[href="/collection"]')[0]    # 导航栏-商品专辑
${locator_product_review}    dom:document.querySelectorAll('href="/reviews"')[0]    # 导航栏-商品评论
${locator_marketing}    id:test_marketing    # 导航栏-营销
${locator_setting}    id:test_setting    # 导航栏-设置
${locator_setting_shipping}    dom:document.querySelectorAll('a[href="/shipping"]')[0]    # 导航栏-设置-物流
${locator_setting_taxPrice}    dom:document.querySelectorAll('a[href="/taxPrice"]')[0]    # 导航栏-设置-税费
${locator_setting_payment}    dom:document.querySelectorAll('a[href="/pay"]')[0]    # 导航栏-设置-收款渠道
### locator checkbox
${locator_checkbox00}    dom:document.querySelectorAll(".ant-checkbox-input")[0]    #定位当前页面第0个checkbox
${locator_checkbox01}    dom:document.querySelectorAll(".ant-checkbox-input")[1]
### locator button
${locator_button_add}    dom:document.querySelectorAll(".large_btn___3RbRK")[0]        #添加按钮
### locator popUps
${locator_popUps_button_middle}    dom:document.querySelectorAll(".middle_btn___2ExQc")[0]    #弹窗的中间按钮
${locator_popUps_button_default}    dom:document.querySelectorAll(".default_btn___2wyTS")[0]    #弹窗的默认按钮
### locator page
${locator_page_text_totalRecord}    dom:document.querySelectorAll(".ant-pagination-total-text")[0]      #页面分页按钮-"N 条记录"
### 页面模块 url
${url_home_page}    ${home_page}/    # home page
${url_order}      ${home_page}/order    # order page
${url_products}    ${home_page}/products    # products page
${url_marketing}    ${home_page}/subtraction    # marketing page
${url_tax_price}    ${home_page}/taxPrice    # tax price
${url_shipping}    ${home_page}/shipping    # shipping
### 测试用户

${user_default_name}    ${datas_contact}    # 默认使用的用户信息，用于跑大部分用例
${user_default_pwd}    ${datas_password}
${user_default_domain}    ${datas_username}
### keybord_key
${keybord_enter}    \\13
### 注册用户
${register_user}    15297989918
${register_domain}    cheng
${register_pwd}    123456
${register_code}    DJ6602    #.推荐吗
