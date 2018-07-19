*** Settings ***
Documentation     Ckeckout Price Page
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

*** Test Cases ***
test
    Add Payment
checkout051
    [Documentation]    checkout页面底部弹窗物流选择界面，显示物流（运费1）
    [Tags]    P0
    #.click products btn
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_down_price_eml}
    Page Should Contain Element    class:detail_total_price

checkout071
    [Documentation]    checkout 界面 不添加地址 提示 please select a shipping
    [Tags]    P1
    #,click products btn
    Checkout Common Setp
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Page Should Contain Element    class:not_none

checkout072
    [Documentation]    checkout 界面 提交成功 进入支付方式选择界面
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
    Page Should Contain Element    id:submitPaymentMb

checkout073
    [Documentation]    chekout 界面 提交成功 选择支付方式
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
    Page Should Contain Element    class:pm_list_title

checkout074
    [Documentation]    checkout 界面提交成功 显示B端设置的支付方式
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
    Page Should Contain Element    class:pm_list_row

checkout075
    [Documentation]    checkout 界面提交成功 展示订单详情
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
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Sleep Time
    Page Should Contain Element    class:pm_order_detail

checkout076
    [Documentation]    checkout 界面提交成功 点击收起展示订单详情按钮
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
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    dom:document.querySelectorAll(".pm_order_header i")[0]
    Sleep Time
    Page Should Contain Element    class:pm_order_detail

checkout090
    [Documentation]    checkout 界面提交成功后显示商品价格
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
    ${res}    Get Text    class:total_price
    ${rex}    searchStrs    ${res}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    ${data}    Execute JavaScript    return document.querySelectorAll(".detail_total_price div span:nth-child(2)")[0].innerHTML
    ${desc}    searchStrs    ${data}
    Sleep Time
    Should Be True    '${rex}'=='${desc}'

checkout091
    [Documentation]    checkout 页面提交成功后 收起价格详情，只显示本次实际应该支付的价格
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
    Input Text    ${locatorB_checkout_address_phone}     123456789
    Input Text    ${locatorB_checkout_address_company}    123456789
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    Sleep Time
    Page Should Contain Element    dom:document.querySelectorAll(".detail_total_price div span:nth-child(2)")[0]

checkout092
    [Documentation]    checkout 页面提交成功后 跳转到支付成功页面
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
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    id:submitPaymentMb
    Page Should Contain Element    class:pay_state

checkout095
    [Documentation]    checkout 页面提交成功后 跳转到支付成功页面显示对应商品信息
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
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    id:submitPaymentMb
    Page Should Contain Element    class:pay_success_detail

checkout096
    [Documentation]    checkout 页面提交成功后 跳转到支付成功页面点击 continue shopping 跳转主页
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
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Wait And Click Element    id:submitPaymentMb
    Wait And Click Element    dom:document.querySelectorAll(".btn1")[1]    #.跳转主页
    Sleep Time
    Page Should Contain Element    class:nav-title

checkout097
    [Documentation]    checkout 页面提交成功后 跳转到支付成功页面 点击 view order 跳转到订单详情
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
    Wait And Click Element    id:submitPaymentMb
    Wait And Click Element    dom:document.querySelectorAll(".btn2")[1]    #.跳转主页
    Sleep Time
    Page Should Contain Element    class:header
clear shipping
    Go To    ${home_page}
    Delete Shipping
