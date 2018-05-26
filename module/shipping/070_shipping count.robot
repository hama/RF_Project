*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
070_shipping
    #.添加数量运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    page should contain button    id:test_shipping_edit_modal_sure_btn
    close browser
