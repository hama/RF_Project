*** Settings ***
Documentation     Ckeckout Page Check
Suite Setup       New Test Suite Browser And Login    ${comm_user}    ${comm_pwd}    ${comm_domain}
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
Resource          ../../../resources/kw_Checkout.robot

*** Test Cases ***
checkout001
    [Documentation]    C端将商品加入购入车再点击checkout 显示购买的商品，地址，买家留言，商品总价及提交按钮
    [Tags]    P0
    #.click products btn
    Checkout Common Setp
    Wait Until Element Is Visible    dom:document.querySelectorAll(".submit_mb span")[0]
    Page Should Contain Image    dom:document.querySelectorAll("img")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".sales_price")[0]

checkout002
    [Documentation]    进入checkout界面 显示购买的商品，地址，
    [Tags]    P1
    #点击商品预览
    Checkout Common Setp
    Wait Until Element Is Visible    dom:document.querySelectorAll(".submit_mb span")[0]
    Click Element    //*[@id="shoplaza-section-1523699573925"]/div/div[4]/div[2]/a[5]/i
    Wait Until Element Is Visible    class:account_container
    Page Should Not Contain Element    class:buy-now

checkout004
    [Documentation]    进入checkout界面 显示search按钮
    [Tags]    P1
    Checkout Common Setp
    Page Should Contain Element    dom:document.querySelectorAll("a[alt='sousuo1']")[0]

checkout005
    [Documentation]    进入checkout界面 点击搜索按钮 跳转到搜索页面
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll("a[alt='sousuo1']")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".search_header_txt")[0]

checkout008
    [Documentation]    进入checkout界面 顶部导航栏中间显示店铺名
    [Tags]    P1
    Checkout Common Setp
    Page Should Contain Element    dom:document.querySelectorAll("div[alt='logo']")[0]

checkout009
    [Documentation]    进入checkout界面 点击购物车按钮 显示购物车内容
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll("a[alt='bag']")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".title")[0]

checkout010
    [Documentation]    进入checkout界面 点击个人中心按钮 显示个人中心内容
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll("a[alt='account']")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".operal_list_item")[0]

checkout011
    [Documentation]    进入checkout界面 点击buynow 然后添加地址
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Page Should Contain Element    dom:document.querySelectorAll("input[name='first_name']")[0]

checkout012
    [Documentation]    进去checkout界面 点击buynow 添加地址·输入该输入信息·保存成功
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Input Text    dom:document.querySelectorAll("input[name='first_name']")[0]    123
    Input Text    dom:document.querySelectorAll("input[name='last_name']")[0]    345
    Select From List    id:shipping_country_id    China
    Input Text    dom:document.querySelectorAll("input[name='city']")[0]    深圳
    Input Text    dom:document.querySelectorAll("input[name='address']")[0]    深圳123
    Input Text    dom:document.querySelectorAll("input[name='zip']")[0]    123456
    Input Text    dom:document.querySelectorAll("input[name='email']")[0]    123456@zz.xx
    Input Text    dom:document.querySelectorAll("input[name='phone']")[0]    123456789
    Input Text    dom:document.querySelectorAll("input[name='company']")[0]    123456789
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]
    Wait And Click Element    id:submitMbPay
    Sleep Time
    Page Should Contain Element    dom:document.querySelectorAll(".header")[0]

checkout013
    [Documentation]    进去checkout 界面 点击buynow 添加地址·姓名不输入 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Input Text    dom:document.querySelectorAll("input[name='first_name']")[0]    ${Empty}
    Input Text    dom:document.querySelectorAll("input[name='last_name']")[0]    345
    Select From List    id:shipping_country_id    China
    Input Text    dom:document.querySelectorAll("input[name='city']")[0]    深圳
    Input Text    dom:document.querySelectorAll("input[name='address']")[0]    深圳123
    Input Text    dom:document.querySelectorAll("input[name='zip']")[0]    123456
    Input Text    dom:document.querySelectorAll("input[name='email']")[0]    123456@zz.xx
    Input Text    dom:document.querySelectorAll("input[name='phone']")[0]    123456789
    Input Text    dom:document.querySelectorAll("input[name='company']")[0]    123456789
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".not_none")[0]

checkout017
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不选择国家 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Input Text    dom:document.querySelectorAll("input[name='first_name']")[0]    123
    Input Text    dom:document.querySelectorAll("input[name='last_name']")[0]    345
    #Select From List    id:shipping_country_id    China
    Input Text    dom:document.querySelectorAll("input[name='city']")[0]    深圳
    Input Text    dom:document.querySelectorAll("input[name='address']")[0]    深圳123
    Input Text    dom:document.querySelectorAll("input[name='zip']")[0]    123456
    Input Text    dom:document.querySelectorAll("input[name='email']")[0]    123456@zz.xx
    Input Text    dom:document.querySelectorAll("input[name='phone']")[0]    123456789
    Input Text    dom:document.querySelectorAll("input[name='company']")[0]    123456789
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".not_none")[0]

checkout018
    [Documentation]    进去checkout 界面 点击buynow 添加地址·先在后台添加一个中国的国家 然后在c端显示可选的为中国
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Input Text    dom:document.querySelectorAll("input[name='first_name']")[0]    123
    Input Text    dom:document.querySelectorAll("input[name='last_name']")[0]    345
    #Select From List    id:shipping_country_id    China
    Page Should Contain Element    dom:document.querySelectorAll("#shipping_country_id option")[1]    #.代表中国

checkout022
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不选择地区 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Input Text    dom:document.querySelectorAll("input[name='first_name']")[0]    123
    Input Text    dom:document.querySelectorAll("input[name='last_name']")[0]    345
    Input Text    dom:document.querySelectorAll("input[name='city']")[0]    深圳
    Input Text    dom:document.querySelectorAll("input[name='address']")[0]    深圳123
    Input Text    dom:document.querySelectorAll("input[name='zip']")[0]    123456
    Input Text    dom:document.querySelectorAll("input[name='email']")[0]    123456@zz.xx
    Input Text    dom:document.querySelectorAll("input[name='phone']")[0]    123456789
    Input Text    dom:document.querySelectorAll("input[name='company']")[0]    123456789
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".not_none")[0]

checkout023
    [Documentation]    进去checkout 界面 点击buynow 添加地址·选择中国 出现中国的所有地区
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Input Text    dom:document.querySelectorAll("input[name='first_name']")[0]    123
    Input Text    dom:document.querySelectorAll("input[name='last_name']")[0]    345
    Select From List    id:shipping_country_id    China
    Sleep Time
    ${count}    Execute JavaScript    return document.querySelectorAll("#shipping_zone_id")[0].length
    Should Be True    ${count}==32

checkout025
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入城市 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Input Text    dom:document.querySelectorAll("input[name='first_name']")[0]    123
    Input Text    dom:document.querySelectorAll("input[name='last_name']")[0]    345
    Select From List    id:shipping_country_id    China
    Input Text    dom:document.querySelectorAll("input[name='address']")[0]    深圳123
    Input Text    dom:document.querySelectorAll("input[name='zip']")[0]    123456
    Input Text    dom:document.querySelectorAll("input[name='email']")[0]    123456@zz.xx
    Input Text    dom:document.querySelectorAll("input[name='phone']")[0]    123456789
    Input Text    dom:document.querySelectorAll("input[name='company']")[0]    123456789
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".not_none")[0]

checkout026
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入详细地址 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Input Text    dom:document.querySelectorAll("input[name='first_name']")[0]    123
    Input Text    dom:document.querySelectorAll("input[name='last_name']")[0]    345
    Select From List    id:shipping_country_id    China
    Input Text    dom:document.querySelectorAll("input[name='city']")[0]    深圳
    Input Text    dom:document.querySelectorAll("input[name='zip']")[0]    123456
    Input Text    dom:document.querySelectorAll("input[name='email']")[0]    123456@zz.xx
    Input Text    dom:document.querySelectorAll("input[name='phone']")[0]    123456789
    Input Text    dom:document.querySelectorAll("input[name='company']")[0]    123456789
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".not_none")[0]

checkout028
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入邮编 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Input Text    dom:document.querySelectorAll("input[name='first_name']")[0]    123
    Input Text    dom:document.querySelectorAll("input[name='last_name']")[0]    345
    Select From List    id:shipping_country_id    China
    Input Text    dom:document.querySelectorAll("input[name='city']")[0]    深圳
    Input Text    dom:document.querySelectorAll("input[name='address']")[0]    深圳123
    Input Text    dom:document.querySelectorAll("input[name='email']")[0]    123456@zz.xx
    Input Text    dom:document.querySelectorAll("input[name='phone']")[0]    123456789
    Input Text    dom:document.querySelectorAll("input[name='company']")[0]    123456789
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".not_none")[0]

checkout030
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入邮箱 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Input Text    dom:document.querySelectorAll("input[name='first_name']")[0]    123
    Input Text    dom:document.querySelectorAll("input[name='last_name']")[0]    345
    Select From List    id:shipping_country_id    China
    Input Text    dom:document.querySelectorAll("input[name='city']")[0]    深圳
    Input Text    dom:document.querySelectorAll("input[name='address']")[0]    深圳123
    Input Text    dom:document.querySelectorAll("input[name='zip']")[0]    123456
    Input Text    dom:document.querySelectorAll("input[name='phone']")[0]    123456789
    Input Text    dom:document.querySelectorAll("input[name='company']")[0]    123456789
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".not_none")[0]

checkout032
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入电话 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Input Text    dom:document.querySelectorAll("input[name='first_name']")[0]    123
    Input Text    dom:document.querySelectorAll("input[name='last_name']")[0]    345
    Select From List    id:shipping_country_id    China
    Input Text    dom:document.querySelectorAll("input[name='city']")[0]    深圳
    Input Text    dom:document.querySelectorAll("input[name='address']")[0]    深圳123
    Input Text    dom:document.querySelectorAll("input[name='zip']")[0]    123456
    Input Text    dom:document.querySelectorAll("input[name='email']")[0]    123456@zz.xx
    Input Text    dom:document.querySelectorAll("input[name='company']")[0]    123456789
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".not_none")[0]

checkout035
    [Documentation]    进去checkout 界面 点击buynow 添加地址·不输入电话 保存不成功
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Input Text    dom:document.querySelectorAll("input[name='first_name']")[0]    123
    Input Text    dom:document.querySelectorAll("input[name='last_name']")[0]    345
    Select From List    id:shipping_country_id    China
    Input Text    dom:document.querySelectorAll("input[name='city']")[0]    深圳
    Input Text    dom:document.querySelectorAll("input[name='address']")[0]    深圳123
    Input Text    dom:document.querySelectorAll("input[name='zip']")[0]    123456
    Input Text    dom:document.querySelectorAll("input[name='email']")[0]    123456@zz.xx
    Input Text    dom:document.querySelectorAll("input[name='phone']")[0]    123456789
    Input Text    dom:document.querySelectorAll("input[name='company']")[0]    123456789
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]
    Page Should Contain Element    id:submitMbPay

checkout039
    [Documentation]    进去checkout 界面 点击buynow 添加2次购物车 购物车的数量为2
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".add-to-card")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".add-to-card")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll("a[realhref='/cart']")[0]
    ${count}    Execute JavaScript    return document.querySelectorAll(".space-between span")[2].innerText
    Should Be True    ${count}==2

checkout040
    [Documentation]    进入checkout 界面 点击留言板，弹出窗口
    [Tags]    P1
    Checkout Common Setp
    Execute JavaScript    return document.getElementsByClassName("review_write")[0].scrollIntoView()
    Wait And Click Element    dom:document.querySelectorAll(".review_write")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".addli")

checkout043
    [Documentation]    进入checkout 界面 点击留言板，弹出窗口 输入超过500个字符
    [Tags]    P1
    ${strs}    Set Variable    aslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsa
    Go To    ${home_page}    #.跳转主页
    Checkout Common Setp
    Execute JavaScript    return document.getElementsByClassName("review_write")[0].scrollIntoView()
    Wait And Click Element    dom:document.querySelectorAll(".review_write")[0]
    Input Text    id:content    ${strs}
    Page Should Contain Element    dom:document.querySelectorAll(".addli")
