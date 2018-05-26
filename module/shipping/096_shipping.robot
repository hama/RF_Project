*** Settings ***
Resource          ../../resources/shipping.robot
Library           /usr/local/lib/python2.7/site-packages/customLibrary

*** Test Cases ***
096_shipping
    #创建物流    添加中国    > 点击后显示弹窗，显示中国的所有省份并全部处于勾选状态
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    ${name}    salt
    input text    id:name    ${name}
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[2].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[10].click()
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    execute javascript    return document.querySelectorAll("#test_shipping_country_edit_icon")[0].click()
    sleep    1
    ${count}    execute javascript    return document.querySelectorAll(".ant-modal-body ul li").length
    Run keyword If    ${count}==32    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    dddss
