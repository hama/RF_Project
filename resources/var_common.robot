*** Variables ***
### 未分类，需要分类并清理
${home_page}      http://admin1024.shoplazza.com
${recover_user}    15220581724    #.找回密码的账号
${recover_password}    123456    #.找回密码的密码
${recover_domain}    chen    #.找回密码的域名
${recover_pwd_btn}    dom:document.querySelectorAll('a')[1]

${error_msg}      出错啦！    #.自定义错误提示
${login_btn}      class:logBtn___3pRgJ    #.登陆按钮
${recover_pwd_btn}    //*[@id="root"]/div/div/form/div[4]/div/div/a[1]    #.忘记密码按钮
${register_btn}    //*[@id="root"]/div/div/form/div[4]/div/a    #.注册按钮
${add_products_btn}    id:test_product    #.添加商品按钮
${add_products_title}    ceshi1    #.添加商品的标题
${add_products_img}    ./images/tm.jpg    #.添加商品的图片
### 菜单栏 locator
${locator_order}    id:test_order    # 导航栏-订单
${locator_products}    id:test_product    # 导航栏-商品
${locator_marketing}    id:test_marketing    # 导航栏-营销
${locator_setting}    id:test_setting    # 导航栏-设置
${locator_setting_shipping}    id:test_setting_shipping    # 导航栏-设置-物流
${locator_setting_taxPrice}    id:test_setting_tax    # 导航栏-设置-税费
${locator_setting_payment}    id:test_setting_pay    # 导航栏-设置-收款渠道
### 页面模块 url
${url_home_page}    ${home_page}    # home page
${url_order}      ${home_page}/order    # order page
${url_products}    ${home_page}/products    # products page
${url_marketing}    ${home_page}/subtraction    # marketing page
${url_tax_price}    ${home_page}/taxPrice    # tax price
${url_shipping}    ${home_page}/shipping    # shipping
### 测试用户
${user_default_name}    18825260804    # 默认使用的用户信息，用于跑大部分用例
${user_default_pwd}    18825260804
${user_default_domain}    diu
### keybord_key
${keybord_enter}    \\13
### 注册用户
${register_user}    15297989918
${register_domain}    cheng
${register_pwd}    123456
${register_code}    DJ6602    #.推荐吗

#.订单|物流|checkout 所用的账户
${comm_user}    15220581724
${comm_pwd}    123456
${comm_domain}    chen