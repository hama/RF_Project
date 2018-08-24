*** Settings ***
Library           SeleniumLibrary
Library           ${CURDIR}/../lib/customLibrary
Resource          kw_browser.robot

*** Keywords ***
Register New User
    [Arguments]    ${username}    ${$pwd}    ${domain}
    # 封装注册关键字
    log    开始注册新用户
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    link:免费注册
    Click Link    link:免费注册
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    ${locatorB_login_input_domain}    ${domain}    #.输入域名
    input password    ${locatorB_login_input_password}    ${pwd}    #.输入密码
    input password    id:confirmpass    ${pwd}    #.输入确认密码
    input text    ${locatorB_login_input_account}    ${username}    #.输入账号
    click button    dom:document.querySelectorAll("button")[0]
    sleep    2
    ${code}    get db verification code    ${username}
    input text    id:code    ${code}
    #click button    dom:document.querySelectorAll("button")[1]
    click button    确 定
    sleep    2
    page should not contain    发送验证码
    Close Browser

Delete User
    [Arguments]    ${username}
    remove user    ${username}