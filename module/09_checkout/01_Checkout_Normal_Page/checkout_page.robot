*** Settings ***
Documentation     Ckeckout Page Check
Suite Setup       New Test Suite Browser And Login    15220581724    123456    chen
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/var_tax_price.robot
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot
Resource          ../../../resources/kw_shipping.robot
Resource          ../../../resources/kw_Checkout.robot

*** Test Cases ***
Checkout AddCard Check
    [Documentation]    C端将商品加入购入车再点击checkout 显示购买的商品，地址，买家留言，商品总价及提交按钮
    [Tags]    P0
    #.click products btn
    Checkout Common Setp
    Wait Until Element Is Visible    dom:document.querySelectorAll(".submit_mb span")[0]
    Page Should Contain Image    dom:document.querySelectorAll("img")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".sales_price")[0]

Checkout Bynow Check
    [Documentation]    进入checkout界面 显示购买的商品，地址，
    [Tags]    P1
    #点击商品预览
    Checkout Common Setp
    Wait Until Element Is Visible    dom:document.querySelectorAll(".submit_mb span")[0]
    Click Element    //*[@id="shoplaza-section-1523699573925"]/div/div[4]/div[2]/a[5]/i
    Wait Until Element Is Visible    class:account_container
    Page Should Not Contain Element    class:buy-now

Checkout Should Search
    [Documentation]    进入checkout界面 显示search按钮
    [Tags]    P1
    Checkout Common Setp
    Page Should Contain Element    dom:document.querySelectorAll("a[alt='sousuo1']")[0]

Checkout Click Search
    [Documentation]    进入checkout界面 点击搜索按钮 跳转到搜索页面
    [Tags]    P1
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll("a[alt='sousuo1']")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".search_header_txt")[0]

Checkout Should Name
    [Documentation]    进入checkout界面 顶部导航栏中间显示店铺名
    [Tags]    P1
    Checkout Common Setp
    Page Should Contain Element    dom:document.querySelectorAll("div[alt='logo']")[0]

Checkout Should Card Content
    [Documentation]    进入checkout界面 点击购物车按钮 显示购物车内容
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll("a[alt='bag']")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".title")[0]

Checkout Should User
    [Documentation]    进入checkout界面 点击个人中心按钮 显示个人中心内容
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll("a[alt='account']")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".operal_list_item")[0]

Checkout Add Address
    [Documentation]    进入checkout界面 点击buynow 然后添加地址
    [Tags]    P0
    Checkout Common Setp
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".address_btn")[0]
    Page Should Contain Element    dom:document.querySelectorAll("input[name='first_name']")[0]

Checkout Add Address Save Pass
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

Checkout Add Address First Name Faile
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

Checkout Add Address Select Country
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

Checkout Add Address Country China
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

Checkout Add Address Area
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

Checkout Add Address Area Check Quantity
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

Checkout Add Address City
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

Checkout Add Address Detail Area
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

Checkout Add Address Ecode
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

Checkout Add Address Email
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

Checkout Add Address Phone
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

Checkout Add Address Save
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

Checkout Add Card
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

Checkout Msg Bot
    [Documentation]    进入checkout 界面 点击留言板，弹出窗口
    [Tags]    P1
    Checkout Common Setp
    Execute JavaScript    return document.getElementsByClassName("review_write")[0].scrollIntoView()
    Wait And Click Element    dom:document.querySelectorAll(".review_write")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".addli")

Checkout Msg Bot Str
    [Documentation]    进入checkout 界面 点击留言板，弹出窗口 输入超过500个字符
    [Tags]    P1
    ${strs}    Set Variable    aslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsaaslkdjlaksjdlkasjdksajdlaksjdlaksadsa
    Go To    ${home_page}    #.跳转主页
    Checkout Common Setp
    Execute JavaScript    return document.getElementsByClassName("review_write")[0].scrollIntoView()
    Wait And Click Element    dom:document.querySelectorAll(".review_write")[0]
    Input Text    id:content    ${strs}
    Page Should Contain Element    dom:document.querySelectorAll(".addli")
