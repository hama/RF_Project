*** Settings ***
Library           /usr/local/lib/python2.7/site-packages/customLibrary
Resource          ../../resources/shipping.robot

*** Test Cases ***
064_shipping
    #.添加重量运费    运费价格输入框输入0 保存成功 列表出现该运费为0
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    ${re}    set variable    0
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    input text    id:rate_amount    ${re}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Run keyword If    ${res}==${re}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    ds2121
