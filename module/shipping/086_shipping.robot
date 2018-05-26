*** Settings ***
Resource          ../../resources/shipping.robot
Library           /usr/local/lib/python2.7/site-packages/customLibrary

*** Test Cases ***
086_shipping
    #.添加数量运费    在运费输入框 输入 100    保存成功，数量运费列表中显示的运费为100
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${cc}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    input text    id:rate_amount    ${cc}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Run keyword If    ${res}==${cc}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    djdjjd99
