*** Settings ***
Documentation     生成订单
Library           SeleniumLibrary
Library           ${CURDIR}/../lib/customLibrary
Resource          kw_browser.robot
Resource          kw_common.robot
Resource          var_common.robot
Resource          var_order.robot

*** Keywords ***
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