*** Settings ***
Library           SeleniumLibrary
Library           customLibrary
Resource          browser.robot
Resource          shoplaza_login.robot

*** Keywords ***
register_kw
    #..封装注册关键字
    remove user    ${recover_user}    #.删除该账户
    Comment    register
    Open Test Browser    ${home_page}    #.打开浏览器
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}    #.点击注册按钮
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    ${recover_domain}    #.输入域名
    input password    id:password    ${recover_password}    #.输入密码
    input password    id:confirmpass    ${recover_password}    #.输入确认密码
    input text    id:account    ${recover_user}    #.输入账号
    click button    dom:document.querySelectorAll("button")[0]
    sleep    2
    ${code}    select code    ${recover_user}
    input text    id:code    ${code}
    sleep    1
    click button    dom:document.querySelectorAll("button")[1]
    sleep    2
    page should contain element    //*[@id="root"]

add_shipping_kw
    #,添加物流
    Login With User    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    sleep    1
    ${name}    salt
    input text    id:name    ${name}
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    #execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    click element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    #execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[1].click()
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    ${input}    set variable    重量运费
    ${desc}    set variable    重量运费说明
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll("#name")[1]    ${input}
    input text    dom:document.querySelectorAll("#desc")[0]    ${desc}
    input text    id:range_min    ${range_min}
    input text    id:range_max    ${range_max}
    input text    id:rate_amount    ${rate_amount}
    sleep    1
    click button    id:test_shipping_edit_modal_sure_btn
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${input_a}    set variable    数量运费
    ${desc_a}    set variable    熟练给运费说明
    input text    dom:document.querySelectorAll("#name")[1]    ${input_a}
    input text    dom:document.querySelectorAll("#desc")[0]    ${desc_a}
    input text    id:range_min    ${range_min}
    input text    id:range_max    ${range_max}
    input text    id:rate_amount    ${rate_amount}
    sleep    1
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    click link    id:test_save_btn
    sleep    2
    page should contain element    id:test_add_btn

remove_user_kw
    #.删除账号
    remove user    ${recover_user}
