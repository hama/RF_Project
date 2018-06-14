*** Settings ***
Documentation     在跑用例测试之前，初始化默认的账号，然后使用新初始化的账号来跑测试用例
Force Tags        setup

Resource          ../resources/kw_register_account.robot

*** Variables ***
${username}=    18825260804
${pwd}=    18825260804
${domain}=    diu

*** Test Cases ***
Setup Test User
    [Documentation]    重新注册一个新用户
    log    若用户存在，则先删除指定的用户
    Delete User    ${username}
    log    重新注册该用户
    Register New User    ${username}    ${pwd}    ${domain}
