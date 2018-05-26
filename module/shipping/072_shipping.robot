*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
072_shipping
    #.添加数量运费    输入1234 显示 数量运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    1234
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    ${res}    execute javascript    return document.querySelectorAll("#name")[1].value
    Run keyword If    '${res}'=='${data}'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    sd454
