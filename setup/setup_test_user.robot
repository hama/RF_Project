*** Settings ***
Documentation     在跑用例测试之前，初始化默认的账号，然后使用新初始化的账号来跑测试用例
Force Tags        setup
Resource          ../resources/kw_register_account.robot
Resource          ../resources/var_common.robot

*** Test Cases ***
Setup Test User
    [Documentation]    重新注册一个新用户
    log    若用户存在，则先删除指定的用户
    Delete User    ${user_default_name}
    log    重新注册该用户
    Register New User    ${user_default_name}    ${user_default_pwd}    ${user_default_domain}
