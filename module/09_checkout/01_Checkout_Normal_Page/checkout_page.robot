*** Settings ***
Documentation     Ckeckout Page Check
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        Checkout
Resource          ../../../resources/var_tax_price.robot
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot
Resource          ../../../resources/kw_shipping.robot
Resource          ../../../resources/kw_checkout.robot
Resource          ../../../resources/var_checkout.robot

*** Test Cases ***
add shipping
    Add Shipping China
add product
    Add Order Products
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
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_search_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".search_header_txt")[0]

checkout008
    [Documentation]    进入checkout界面 顶部导航栏中间显示店铺名
    [Tags]    P1
    Checkout Common Setp
    Page Should Contain Element    ${locatorB_checkout_user_name}

checkout009
    [Documentation]    进入checkout界面 点击购物车按钮 显示购物车内容
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_card_img_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".title")[0]

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
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}
    Page Should Contain Element    dom:document.querySelectorAll("input[name='first_name']")[0]

checkout012
    [Documentation]    进去checkout界面 点击buynow 添加地址·输入该输入信息·保存成功
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_add}    深圳123
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
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}
    Input Text    ${locatorB_checkout_address_first_name}    ${Empty}
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_add}    深圳123
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
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_add}    深圳123
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
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Page Should Contain Element    dom:document.querySelectorAll("#shipping_country_id option")[1]    #.代表中国

checkout022
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不选择地区 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_add}    深圳123
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
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}
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
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_add}    深圳123
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
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}
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
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_add}    深圳123
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout030
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入邮箱 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_add}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_phone}    123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}

checkout032
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入电话 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_add}    深圳123
    Input Text    ${locatorB_checkout_address_zip}    123456
    Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Page Should Contain Element    ${locatorB_checkout_address_error}


checkout035
    [Documentation]    进去checkout 界面 点击buynow 添加地址· 保存成功
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_add}    深圳123
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
    Go To    ${home_page}    #.跳转主页
    Checkout Common Setp
    Execute JavaScript    return document.getElementsByClassName("review_write")[0].scrollIntoView()
    Wait And Click Element    ${locatorB_checkout_write_review}
    Input Text    id:content    ${strs}
    Page Should Contain Element    dom:document.querySelectorAll(".addli")

checkout019
    [Documentation]    B端添加其他国家 checkout 展开下拉框，显示所有国家
    [Tags]    P1
    Go To    ${home_page}
    Add Other Country
    Sleep    2
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    ${count}    Execute JavaScript    return document.querySelectorAll("#shipping_country_id")[0].length
    Should Be True    ${count}==228
    Go To    ${home_page}
    Delete Shipping

checkout021
    [Documentation]    正常添加数据，保存成功
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Input Text    ${locatorB_checkout_address_first_name}    123
    Input Text    ${locatorB_checkout_address_last_name}    345
    ${name}    Execute JavaScript    return document.querySelectorAll("#shipping_country_id option")[1].innerText
    Select From List    ${locatorB_checkout_address_select_country}    ${name}
    Input Text    ${locatorB_checkout_address_city}    深圳
    Input Text    ${locatorB_checkout_address_add}    深圳123
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

