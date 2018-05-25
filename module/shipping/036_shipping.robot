*** Settings ***
Resource          ../../resources/shipping.robot
Library           /usr/local/lib/python2.7/site-packages/customLibrary

*** Test Cases ***
036_shipping
    #.运费价格框数字 保存成功 在列表显示刚添加的运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    ${ship}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    input text    id:rate_amount    ${ship}
    sleep    1.5
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait Until Element Is Visible    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Run keyword If    ${res}==${ship}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    dfs5f51s6
