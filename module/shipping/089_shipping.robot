*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
089_shipping
    #.添加数量运费    取消勾选是否支持货到付款 保存 列表显示 不支持
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${cc}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Run keyword If    '${data}'=='不支持'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    djdjjd99
