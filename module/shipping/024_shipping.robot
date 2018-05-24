*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
024_shipping
    #.add    transport price    check
    #.保存成功，关闭弹窗，价格运费列表中显示 价格运费的信息
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    #execute javascript    return document.querySelectorAll('#name')[1].value='价格运费'
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    sleep    1.5
    #click button    id:test_shipping_edit_modal_sure_btn
