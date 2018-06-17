*** Variables ***
${home_page}      http://admin1024.shoplazza.com
${main_user}      18826557090    #.没有子账户的账号
${main_pwd}       147258    #.没有子账户的密码
${recover_user}    15220581724    #.找回密码的账号
${recover_password}    123456    #.找回密码的密码
${recover_domain}    chen    #.找回密码的域名
${recover_pwd_btn}    dom:document.querySelectorAll('a')[1]
${defaultUser}    17601298661
${defaultPassword}    111111
${defaultDomain}    baiyuan
### 菜单栏 locator
${locator_setting}    id:test_setting    # 导航栏-设置
${locator_setting_shipping}    dom:document.querySelectorAll('a[href="/shipping"]')[0]    # 导航栏-设置-物流
${locator_setting_taxPrice}    dom:document.querySelectorAll('a[href="/taxPrice"]')[0]    # 导航栏-设置-税费
### 页面模块 url
${url_home_page}    http://admin1024.shoplazza.com/    # home page
${url_tax_price}    http://admin1024.shoplazza.com/taxPrice    # tax price
${url_shipping}    http://admin1024.shoplazza.com/shipping    # shipping
### 测试用户
${user_default_name}    18825260804    # 默认使用的用户信息，用于跑大部分用例
${user_default_pwd}    18825260804
${user_default_domain}    diu
