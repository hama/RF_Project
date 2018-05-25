*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
050_shipping
    #.添加运费 在说明框里输入超过200个字符 提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    重量运费
    ${sm}    set variable    ssssssssssssssssssssssddsadasdasdasdasdasdasdasdsadasdasdcxvcbvfghfghfghfghdfsdfsdfdsfsdfdsdsfsssddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    input text    dom:document.querySelectorAll('#desc')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    class:ant-form-explain
    close browser
