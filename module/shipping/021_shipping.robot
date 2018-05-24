*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
021_shipping
    #.add transport price >> check add transport price windows
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    page should contain button    id:test_shipping_edit_modal_sure_btn
    close browser
