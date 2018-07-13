*** Variables ***
### 未分类，需要分类并清理
${home_page}      http://admin1024.shoplazza.com
${error_msg}      出错啦！    #.自定义错误提示
${login_btn}      class:logBtn___3pRgJ    #.登陆按钮
${register_btn}    dom:document.querySelectorAll(".bottomEdit___zk0l5 a")[0]     #.注册按钮
${recover_pwd_btn}       dom:document.querySelectorAll(".bottomEdit___zk0l5 div a")[0]     #.忘记密码按钮
${add_products_btn}    id:test_product    #.添加商品按钮
${add_products_title}    ceshi1    #.添加商品的标题
${add_products_img}    ${CURDIR}/../images/tm.jpg    #.添加商品的图片
### 菜单栏 locator
${locator_order}    dom:document.querySelectorAll('a[href="/order"]')[0]    # 导航栏-订单
${locator_products}    id:test_product    # 导航栏-商品
${locator_marketing}    id:test_marketing    # 导航栏-营销
${locator_setting}    id:test_setting    # 导航栏-设置
${locator_setting_shipping}    dom:document.querySelectorAll('a[href="/shipping"]')[0]    # 导航栏-设置-物流
${locator_setting_taxPrice}    dom:document.querySelectorAll('a[href="/taxPrice"]')[0]    # 导航栏-设置-税费
${locator_setting_payment}    dom:document.querySelectorAll('a[href="/pay"]')[0]    # 导航栏-设置-收款渠道
### 页面模块 url
${url_home_page}    ${home_page}/    # home page
${url_order}      ${home_page}/order    # order page
${url_products}    ${home_page}/products    # products page
${url_marketing}    ${home_page}/subtraction    # marketing page
${url_tax_price}    ${home_page}/taxPrice    # tax price
${url_shipping}    ${home_page}/shipping    # shipping
### 测试用户
${user_default_name}    17665076519    # 默认使用的用户信息，用于跑大部分用例
${user_default_pwd}    123456
${user_default_domain}    xx
### keybord_key
${keybord_enter}    \\13
### 注册用户
${register_user}    15297989918
${register_domain}    cheng
${register_pwd}    123456
${register_code}    DJ6602    #.推荐吗
