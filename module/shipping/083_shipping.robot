*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
083_shipping
    #.添加数量运费    取消勾选免运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    close browser
