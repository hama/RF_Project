*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
044_shipping
    #.添加运费 在名称输入 重量运费 后    对应框里显示 重量运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    ${data}    execute javascript    return document.querySelectorAll("input[placeholder='物流名称']")[0].value
    Run keyword If    '${data}'=='重量运费'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sjkdkj2
