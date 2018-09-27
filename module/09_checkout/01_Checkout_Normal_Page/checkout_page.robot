*** Settings ***
Documentation     Ckeckout Page Check
Suite Setup       Common_Step
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        Checkout
Resource          ../../../resources/variable/var_tax_price.robot
Resource          ../../../resources/variable/var_product_management.robot
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_product_management.robot
Resource          ../../../resources/keywords/kw_shipping.robot
Resource          ../../../resources/keywords/kw_checkout.robot
Resource          ../../../resources/variable/var_checkout.robot


*** Test Cases ***
checkout001
    [Documentation]    C端将商品加入购入车再点击checkout 显示购买的商品，地址，买家留言，商品总价及提交按钮
    [Tags]    P0
    #.click products btn
    Checkout Common Setp
    Wait Until Element Is Visible    ${locatorB_checkout_add_card_btn}
    Page Should Contain Image    dom:document.querySelectorAll("img")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".sales_price")[0]

checkout002
    [Documentation]    进入checkout界面 显示购买的商品，地址，
    [Tags]    P1
    #点击商品预览
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Sleep    2
    Page Should Contain Element    dom:document.querySelectorAll(".coline")[0]

checkout004
    [Documentation]    进入checkout界面 显示search按钮
    [Tags]    P1
    Checkout Common Setp
    Page Should Contain Element    ${locatorB_checkout_search_btn}

checkout005
    [Documentation]    进入checkout界面 点击搜索按钮 跳转到搜索页面
    [Tags]    P1
    Checkout_Common_Show_Element    ${locatorB_checkout_search_btn}    dom:document.querySelectorAll(".search_header_txt")[0]

checkout008
    [Documentation]    进入checkout界面 顶部导航栏中间显示店铺名
    [Tags]    P1
    Checkout Common Setp
    Page Should Contain Element    ${locatorB_checkout_user_name}

checkout009
    [Documentation]    进入checkout界面 点击购物车按钮 显示购物车内容
    [Tags]    P0
    Checkout_Common_Show_Element    ${locatorB_checkout_card_img_btn}    dom:document.querySelectorAll(".title")[0]

checkout010
    [Documentation]    进入checkout界面 点击个人中心按钮 显示个人中心内容
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_member_btn}
    Sleep Time
    Page Should Contain Element    dom:document.querySelectorAll(".operal_list_item")[0]

checkout011
    [Documentation]    进入checkout界面 点击buynow 然后添加地址
    [Tags]    P0
    Checkout Common Setp
    Checkout_Common_Address_Step
    Page Should Contain Element    dom:document.querySelectorAll("input[name='first_name']")[0]

checkout012
    [Documentation]    进去checkout界面 点击buynow 添加地址·输入该输入信息·保存成功
    [Tags]    P0
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Sleep Time
    Page Should Contain Element    dom:document.querySelectorAll(".header")[0]

checkout013
    [Documentation]    进去checkout 界面 点击buynow 添加地址·姓名不输入 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    ${Empty}
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout017
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不选择国家 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout018
    [Documentation]    进去checkout 界面 点击buynow 添加地址·先在后台添加一个中国的国家 然后在c端显示可选的为中国
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Page Should Contain Element    dom:document.querySelectorAll("#shipping_country_id option")[1]    #.代表中国

checkout022
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不选择地区 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout023
    [Documentation]    进去checkout 界面 点击buynow 添加地址·选择中国 出现中国的所有地区
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep Time
    ${count}    Execute JavaScript    return document.querySelectorAll("#shipping_zone_id")[0].length
    Should Be True    ${count}==32

checkout025
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入城市 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout026
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入详细地址 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout028
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入zip 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout030
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入邮箱 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout032
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入电话 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}


checkout035
    [Documentation]    进去checkout 界面 点击buynow 添加地址· 保存成功
    [Tags]    P1
    Checkout Common Setp
    Checkout_Common_Address_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_save_checkout_btn}

checkout039
    [Documentation]    进去checkout 界面 点击buynow 添加2次购物车 购物车的数量为2
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_add_card_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Sleep    3
    Wait And Click Element    ${locatorB_checkout_add_card_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Sleep    3
    Wait And Click Element    ${locatorB_checkout_card_img_btn}
    ${count}    Execute JavaScript    return document.querySelectorAll(".space-between span")[2].innerText
    Should Be True    ${count}==2

checkout040
    [Documentation]    进入checkout 界面 点击留言板，弹出窗口
    [Tags]    P1
    Checkout Common Setp
    Execute JavaScript    return document.getElementsByClassName("review_write")[0].scrollIntoView()
    Wait And Click Element    ${locatorB_checkout_write_review}
    Page Should Contain Element    dom:document.querySelectorAll(".addli")

checkout043
    [Documentation]    进入checkout 界面 点击留言板，弹出窗口 输入超过500个字符
    [Tags]    P1
    ${strs}    Set Variable    aslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsa
    Go To Home By Url
    Checkout Common Setp
    Execute JavaScript    return document.getElementsByClassName("review_write")[0].scrollIntoView()
    Wait And Click Element    ${locatorB_checkout_write_review}
    Input Text    id:content    ${strs}
    Page Should Contain Element    dom:document.querySelectorAll(".addli")

checkout019
    [Documentation]    B端添加其他国家 checkout 展开下拉框，显示所有国家
    [Tags]    P1
    Go To Home By Url
    Add Other Country
    Sleep    2
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    ${count}    Execute JavaScript    return document.querySelectorAll("#shipping_country_id")[0].length
    Should Be True    ${count}==228
    Go To Home By Url
    Delete Shipping

checkout021
    [Documentation]    正常添加数据，保存成功
    [Tags]    P0
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    ${name}    Execute JavaScript    return document.querySelectorAll("#shipping_country_id option")[1].innerText
    Select From List    ${locatorB_checkout_address_select_country}    ${name}
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    id:changeaddress

checkout038
    [Documentation]    添加地址后关闭页面填写的信息不会被重置
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    ${first_name}    Set Variable    123
    Input Text    ${locatorB_checkout_address_first_name}    ${first_name}
    Input Text    ${locatorB_checkout_address_last_name}    345
    Wait And Click Element    ${locatorB_checkout_address_close_address}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    ${data}    Execute JavaScript    return document.querySelectorAll("input[name='first_name']")[0].value
    Should Be True    '${data}'=='${first_name}'

checkout052
    [Documentation]    1.添加价格为10USD的一个商品进入checkout界面2.选中没有设置税金的国家3.不使用优惠券4.查看价格选项中优惠前的总价  优惠前的总价显示为10USD
    [Tags]    P1
    Add TenPrice Products    #.添加商品
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    dom:document.getElementsByClassName("pm_footer_left")[0]
    ${new_price}    Execute JavaScript    return document.querySelectorAll(".paydetail-line span")[1].innerText
    Should Be True    '${new_price}'=='$10'

checkout054
    [Documentation]    1.添加价格为10USD的一个商品进入checkout界面2.不使用优惠券3.选择设置了税金的国家4.查看价格选项中优惠前的总价"  优惠价格显示为0USD
    [Tags]    P1
    Set Tax Price    中国    10
    Add TenPrice Products    #.添加商品
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    dom:document.getElementsByClassName("pm_footer_left")[0]
    ${new_price}    Execute JavaScript    return document.querySelectorAll(".paydetail-content div:nth-child(2) span")[1].innerText
    ${res_price}    searchStrs_py    ${new_price}
    Should Be True    ${res_price}==0

checkout063
    [Documentation]    1.添加价格为10USD的商品进入checkout界面2.添加购买地址时选择中国，城市选择上海3.查看价格选项中税金价格 税金价格显示为1USD
    [Tags]    P1
    Set Tax Price    中国    10    #.设置税金
    Add TenPrice Products    #.添加商品
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep Time
    Select From List    ${locatorB_checkout_address_select_city}    Shanghai
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    dom:document.getElementsByClassName("pm_footer_left")[0]
    ${new_price}    Execute JavaScript    return document.querySelectorAll(".paydetail-content div:nth-child(3) span")[1].innerText
    ${res_price}    searchStrs_py    ${new_price}
    Should Be True    ${res_price}==1

checkout065
    [Documentation]     "1.添加价格为10USD的商品进入checkout界面2.添加购买地址时选择中国，城市选择广东3.查看价格选项中税金价格"  税金价格显示为0USD
    [Tags]    P0
    Set Tax Price    中国    0    #.设置税金
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Sleep Time
    Select From List    ${locatorB_checkout_address_select_city}    Guangdong
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_addr}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    dom:document.getElementsByClassName("pm_footer_left")[0]
    ${new_price}    Execute JavaScript    return document.querySelectorAll(".paydetail-content div:nth-child(3) span")[1].innerText
    ${res_price}    searchStrs_py    ${new_price}
    Should Be True    ${res_price}==0

checkout079
    [Documentation]     1.B端激活COD支付 2.进入checkout界面并进入支付界面" 支付界面显示COD支付方式
    [Tags]    P0
    Add Cod Payment    #.添加cod支付方式
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Page Should Contain Element    class:pm_name

checkout081
    [Documentation]     1.B端激活所有支付方式2.进入checkout界面并进入支付界面   支付界面显示所有激活的支付方式
    [Tags]    P0
    Add Payment    #.添加paylinks支付方式
    Add Cod Payment    #.添加cod支付方式
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Page Should Contain Element    class:pm_list_row
    Page Should Contain Element    dom:document.querySelectorAll(".pm_list_row[alt=ipaylinks]")[0]

checkout088
    [Documentation]    1.选择CDO支付方式 2.点击pay now"   直接跳转到支付成功界面
    [Tags]    P0
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    ${locator_checkout_payment_cod_elm}
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    Page Should Contain Element    class:success

checkout098
    [Documentation]    1.进入支付界面2.B端删除本次购买的商品3.点击支付    购买失败，进入支付失败界面
    [Tags]    P0
    Add Order Products    #.添加商品
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    ${locator_checkout_payment_cod_elm}
    Del First Product    #. 调用关键字删除刚添加的商品
    Sleep    2
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    Page Should Contain Element    class:failed

checkout099
    [Documentation]    1.进入支付界面2.B端删除本次购买所选的支付方式3.点击支付    购买失败，进入支付失败界面
    [Tags]    P0
    Add Payment    #.添加支付方式
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    ${locator_checkout_payment_ipaylinks_elm}
    delPaymentPk    #. 调用关键字删除刚添加的支付方式
    Sleep    2
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    Page Should Contain Element    class:failed
checkout100
    [Documentation ]     1.进入支付界面2.B端删除本次购买所选的物流  3.点击支付
    [Tags]    P0
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    ${locator_checkout_payment_cod_elm}
    delShipping_py    #. 调用关键字删除刚添加的物流方式
    Sleep    2
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    Page Should Contain Element    class:failed
checkout101
    [Documentation]    支付失败 1.点击Pay again 2.查看结果   返回支付界面
    [Tags]    P0
    Add Cod Payment    #.添加支付方式
    Checkout Common Setp
    Checkout_Common_Checkout_Step
    Add Address Common Step    # 添加地址公共部分
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    ${locator_checkout_payment_cod_elm}
    delPaymentCod    #. 调用关键字删除刚添加的支付方式
    Sleep    2
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    Wait And Click Element    id:payagain
    Page Should Contain Element    class:cart-title

*** Keywords ***
Checkout_Common_Show_Element
    [Documentation]    封装 进入checkout界面 显示购买的商品，地址......
    [Arguments]    ${click_element}    ${check_element}
    Checkout Common Setp
    Wait And Click Element    ${click_element}
    Page Should Contain Element    ${check_element}

Common_Step
    #.登陆
    Login With Default User
    #.添加中国的物流
    Add Shipping China
    #.添加商品
    Add Order Products

   