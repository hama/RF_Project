*** Settings ***
Resource          ../../resources/Login.robot
Resource          ../../resources/Shipping.robot

*** Test Cases ***
015_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    class:ant-input
    input text    class:ant-input    @#￥
    click button    id:test_shipping_country_modal_search_btn
    close browser
