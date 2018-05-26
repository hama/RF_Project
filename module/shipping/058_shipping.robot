*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
058_shipping
    #.添加重量运费 默认单位是克
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${res}    execute javascript    return document.querySelectorAll(".ant-select-selection-selected-value")[0].innerHTML
    Run keyword If    '${res}'=='克'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sd56f1s
