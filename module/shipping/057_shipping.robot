*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
057_shipping
    #.添加运费    最小订单重量输入：200    最大订单重量输入： 100 提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    200
    ${sx}    set variable    100
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sx}
    input text    dom:document.querySelectorAll('#range_min')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    ${data}    evaluate    ${sx}-1
    ${res}    get value    id:range_min
    Run keyword If    ${data}==${res}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sdfh2
