*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
032_shipping
    #.最小单价输入100    最大单价输入10    最大单价变为101
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    100
    ${max}    set variable    10
    input text    id:range_min    ${min}
    input text    id:range_max    ${max}
    click element    class:ant-checkbox-input
    sleep    1.5
    ${data}    get value    id:range_max
    ${new_max}    evaluate    ${min}+1
    Run keyword If    ${data}==${new_max}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sdfsd5
