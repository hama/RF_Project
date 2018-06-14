*** Settings ***
Library           SeleniumLibrary
Library           ${CURDIR}/../lib/customLibrary
Resource          kw_browser.robot

*** Keywords ***
Register New User
    # 封装注册关键字
    [Arguments]    ${username}    ${$pwd}   ${domain}
    log    开始注册新用户
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    link:免费注册
    Click Link     link:免费注册
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    ${domain}        #.输入域名
    input password    id:password    ${pwd}       #.输入密码
    input password    id:confirmpass    ${pwd}    #.输入确认密码
    input text    id:account    ${username}       #.输入账号
    click button    dom:document.querySelectorAll("button")[0]
    sleep    2
    ${code}    select code    ${username}
    input text    id:code     ${code}
    #click button    dom:document.querySelectorAll("button")[1]
    click button    确 定
    sleep    2
    page should not contain    发送验证码
    Close Browser

Remove User
    #.删除账号
    [Arguments]    ${username}
    remove user    ${username}
