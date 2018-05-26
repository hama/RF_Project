*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
062_shipping
    #.添加重量运费    运费价格输入框输入超过10位以上的数字 提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    ${re}    set variable    456789456789
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    id:rate_amount    ${re}
    page should contain element    class:ant-form-explain
    close browser
