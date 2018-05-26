*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
043_shipping
    #.点击添加重量运费按钮出现编辑窗口
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    page should contain element    id:test_shipping_edit_modal_sure_btn
    close browser
