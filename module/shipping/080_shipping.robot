*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
080_shipping
    #.添加数量运费    最小订单数量：10    最大订单数量：100
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${min}    set variable    10
    ${max}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    input text    id:range_min    ${min}
    input text    id:range_max    ${max}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    //*[@id="dj"]/div/div[5]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser
