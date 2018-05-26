*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
084_shipping
    #.添加数量运费    在运费输入框 输入 100    免运费的勾选会自动去掉
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    input text    id:rate_amount    100
    page should not contain    document.querySelectorAll(".ant-checkbox-checked")[0]
    close browser
