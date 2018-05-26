*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
061_shipping
    #.添加重量运费 输入 运费    免运费的选中状态取消
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    id:rate_amount    100
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    page should not contain element    document.querySelectorAll(".ant-checkbox-checked")[0]
    close browser
