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

remove_user_kw
    #.删除账号
    remove user    ${recover_user}
