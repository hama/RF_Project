*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
014_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    class:ant-input
    input text    class:ant-input    中
    click button    id:test_shipping_country_modal_search_btn
    close browser
