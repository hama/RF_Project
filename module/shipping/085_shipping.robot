*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
085_shipping
    #.添加数量运费    在运费输入框 输入 991212313165656    提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    id:rate_amount    991212313165656
    page should not contain    class:ant-form-explain
    close browser
