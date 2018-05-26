*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
059_shipping
    #.添加运费重量    克。千克，磅
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    #Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    execute javascript    return document.querySelectorAll(".ant-select-arrow")[0].click()
    #${res}    execute javascript    return document.querySelectorAll(“.ant-select-selection-selected-value”)[0].innerHTML
    Mouse Down    dom:document.querySelectorAll("div[role='combobox']")[0]
    Mouse Over    dom:document.querySelectorAll("div[role='combobox']")[0]
    Mouse Up    dom:document.querySelectorAll("div[role='combobox']")[0]
    #close browser
