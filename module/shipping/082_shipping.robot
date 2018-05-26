*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
082_shipping
    #.添加数量运费    最小订单数量自动变化为小于最大订单数量的数字：99
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    click button    id:test_shipping_edit_modal_sure_btn
    ${max_data}    get value    id:range_min
    ${count}    evaluate    ${max}-1
    sleep    1
    Run keyword If    ${count}==${max_data}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    ssskk1
