*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
081_shipping
    #.添加数量运费    最大订单数量自动变化为大于最小订单数量的数字：101
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${min}    set variable    100
    ${max}    set variable    10
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    input text    id:range_min    ${min}
    input text    id:range_max    ${max}
    click button    id:test_shipping_edit_modal_sure_btn
    ${max_data}    execute javascript    return document.querySelectorAll("input[placeholder='无限']")[0].value
    ${count}    evaluate    ${min}+1
    sleep    1
    Run keyword If    ${count}==${max_data}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    ssskk1
