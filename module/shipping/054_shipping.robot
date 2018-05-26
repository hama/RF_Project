*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
054_shipping
    #.添加重量运费 最大单价输入 454544454454545 提示输入10位数以内的数字
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    454544454454545
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    class:ant-form-explain
    close browser
