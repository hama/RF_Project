*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
022_shipping
    #.add    transport price    check name input (str)
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    #.输入名称
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    #${res}    execute javascript    return document.getElementsByClassName("ant-input ant-input-lg name_input___14djA")[0].value
    close browser