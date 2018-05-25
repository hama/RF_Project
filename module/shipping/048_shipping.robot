*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
048_shipping
    #.添加运费 在名称输入正常字符 保存 提示其他信息未填写错误
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
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain
    close browser
