*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
035_shipping
    #.运费价格框输入超过长度的数字 提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    ${ship}    set variable    991212313165656
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    input text    id:rate_amount    ${ship}
    sleep    1.5
    page should contain element    class:ant-form-explain
    close browser
