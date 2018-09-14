*** Settings ***
Documentation     生成订单
Library           SeleniumLibrary    run_on_failure=NOTHING
Resource          kw_browser.robot
Resource          kw_common.robot
Resource          ../variable/var_order.robot
Resource          ../variable/var_common.robot

*** Keywords ***
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