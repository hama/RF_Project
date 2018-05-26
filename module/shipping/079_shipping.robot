*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
079_shipping
    #.添加数量运费    最大订单数量输入超过10位以上的数字
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    5478799641231313
    input text    id:range_max    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain
    close browser
