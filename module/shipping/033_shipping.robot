*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
033_shipping
    #.最大单价输入100    最小单价输入200    最小单价变为99
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
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    click element    class:ant-checkbox-input
    sleep    1.5
    ${data}    get value    id:range_min
    ${new_min}    evaluate    ${max}-1
    Run keyword If    ${data}==${new_min}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sdfsd5
