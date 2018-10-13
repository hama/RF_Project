*** Settings ***
Documentation     order keyword
Library           SeleniumLibrary    run_on_failure=NOTHING
Resource          kw_browser.robot
Resource          kw_common.robot
Resource          ../variable/var_common.robot
Resource          ../variable/var_order.robot

*** keyword ***
Dealing Order Suite Setup
    [Documentation]
    Login With Default User
    kwproduct.del_all_products_py

Dealing Order Suite Teardown
    [Documentation]
    kwproduct.del_all_products_py
    Close Test Suite Browser

Dealing Order Case Setup
    [Documentation]
    Go To Dealing Order Page

Undeal Order Suite Setup
    [Documentation]
    Login With Default User
    kwproduct.del_all_products_py

Undeal Order Suite Teardown
    [Documentation]
    kwproduct.del_all_products_py
    Close Test Suite Browser

Undeal Order Case Setup
    [Documentation]
    Go To Undeal Order Page

Select All Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_button_all}
    Sleep    2

Select To Deliver Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_button_toDeliver}
    Sleep    2

Select Delivered Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_button_delivered}
    Sleep    2

Select Finished Dealing Order Tag
    Wait And Click Element    ${locatorB_orderDealing_button_finished}
    Sleep    2

Select All Undeal Order Tag
    Wait And Click Element    ${locatorB_orderUndeal_button_all}
    Sleep    2

Select To Pay Undeal Order Tag
    Wait And Click Element    ${locatorB_orderUndeal_button_toPay}
    Sleep    2

Select Canceled Undeal Order Tag
    Wait And Click Element    ${locatorB_orderUndeal_button_canceled}
    Sleep    2


Add Order
    [Documentation]    .add order
    #C端将商品加入购入车再点击checkout 显示购买的商品，地址，买家留言，商品总价及提交按钮
    #.click products btn
    Go To Product Management Page
    #点击商品预览
    Sleep    2
    Wait And Click Element    ${locatorB_productsMgmt_icon_listPreview}[0]
    #.第二个窗口
    Select Window    New
    Wait Until Element Is Visible    dom:document.querySelectorAll(".submit_mb span")[0]
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Wait Until Element Is Visible    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]
    Wait And Click Element    id:submitMbPay
    Wait Until Element Is Visible    dom:document.querySelectorAll(".form-footer")[0]
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
    Wait And Click Element    dom:document.querySelectorAll('label[for="cod"]')[0]
    Wait And Click Element    class:submitPaymentMb

Quit Order Setp
    Sleep    1
    Wait And Click Element    ${locatorB_order}
    Sleep    1

Add Alerady Mission Order
    [Documentation]    添加已完成订单
    Go To Order Page
    Wait And Click Element    ${locatorB_order_list_first_tr}    #.点击订单列表第一个订单
    Wait And Click Element    dom:document.querySelectorAll("button")[1]    #.点击添加运单按钮
    Wait And Click Element    dom:document.querySelectorAll("button")[4]    #.点击发货按钮
    Wait And Click Element    dom:document.querySelectorAll(".btn_list___3_eM9 a")[0]    #.点击已完成按钮

Add Alerady Cancel Order
    [Documentation]    添加已取消订单
    Go To Order Page
    Wait And Click Element    ${locatorB_order_list_first_tr}    #.点击订单列表第一个订单
    Wait And Click Element    dom:document.querySelectorAll(".btn_list___3_eM9 a")[0]    #.点击取消订单按钮
    Wait And Click Element    dom:document.querySelectorAll("button")[4]    #.点击确定按钮