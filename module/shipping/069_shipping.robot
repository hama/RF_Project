*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
069_shipping
    #.添加重量运费    输入内容后 直接关掉窗口 列表不存在运费信息
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    input text    dom:document.querySelectorAll('#desc')[0]    重量运费
    input text    id:range_min    10
    input text    id:range_max    100
    input text    id:rate_amount    100
    execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    page should not contain    dom:document.querySelectorAll("#name")[1].value
    close browser
