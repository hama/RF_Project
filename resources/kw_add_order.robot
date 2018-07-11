*** Settings ***
Documentation     生成订单
Library           SeleniumLibrary
Library           ${CURDIR}/../lib/customLibrary
Resource          kw_browser.robot
Resource          kw_common.robot
Resource          var_order.robot
Resource          var_common.robot

*** Keywords ***
Add Order
    #.add order
    #C端将商品加入购入车再点击checkout 显示购买的商品，地址，买家留言，商品总价及提交按钮
    #.click products btn
    Go To Products Page
    #点击商品预览
    #获取第一个商品名称
    #Assign id To Element    dom:document.querySelectorAll("table tbody tr td span")[4]    title
    #Wait Until Element Is Visible    title
    #${title}    Get Text    title
    #点击商品预览
    #Assign id To Element    dom:document.querySelectorAll(".preview___37DtU")[0]    btn1
    #Wait Until Element Is Visible    btn1
    #Click Element    btn1
    Sleep    2
    Wait And Click Element    dom:document.querySelectorAll(".preview___37DtU")[0]
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