*** Settings ***
Documentation     用例初始化操作，注册一个新的用户，然后开始跑测试用例
Force Tags        setup
Resource          ../resources/kw_register_account.robot

*** Variables ***
${username}=    18825260804
${pwd}=    18825260804
${domain}=    diu

*** Test Cases ***
Register New User For Test
    [Documentation]    注册一个新用户 
    Register New User    ${username}    ${pwd}    ${domain}
