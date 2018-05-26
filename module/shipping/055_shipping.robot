*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
055_shipping
    #.添加运费 输入正常最小最大运费 保存成功
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    10
    ${sx}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    ${sm}
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sm}
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sx}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser
