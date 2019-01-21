*** Settings ***
Suite Setup       Open Test Browser    ${login_page}
Suite Teardown    Close Test Suite Browser
Test Setup        Login Testcase Setup
Test Teardown     Teardown Test Case
Force Tags        login
Resource          ../../resources/keywords/kw_common.robot


*** Test Cases ***
login001
    [Documentation]    主账号登录成功
    [Tags]    P0    threshold
    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Locator    ${locatorB_logout_icon_individualAccount}
    Logout
    Wait Until Page Contains Locator    ${locatorB_login_input_account}

login002
    [Documentation]   主账号登录失败_未注册账号
    [Tags]    P1
    Wait And Input Text    ${locatorB_login_input_account}    ${contentB_login_unregisteredAccount}
    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Text    店铺地址或者联系方式错误

login003
    [Documentation]    主账号登录失败_格式不正确
    [Tags]    P2
    Wait And Input Text    ${locatorB_login_input_account}    ${contentB_login_errorFormatAccount}
    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And Click Element    ${locatorB_login_btn_login}
    Text Of Element Should Be Equal With Wait    dom:document.querySelectorAll(".ant-form-explain")[0]    请输入正确的邮箱／手机

login004
    [Documentation]    主账号登录失败_账号为空
    [Tags]    P2
    Wait And Input Text    ${locatorB_login_input_account}    ${Empty}
    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And Click Element    ${locatorB_login_btn_login}
    Text Of Element Should Be Equal With Wait    dom:document.querySelectorAll(".ant-form-explain")[0]    请输入正确的邮箱／手机

login005
    [Documentation]    主账号登录失败_错误密码
    [Tags]    P0
    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Input Password    ${locatorB_login_input_password}    ${contentB_login_errorPwd}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".anticon-exclamation-circle")[0]
    Wait Until Page Contains    用户名或者密码错误

login006
    [Documentation]    主账号登录失败_密码为空
    [Tags]    P2
    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Input Password    ${locatorB_login_input_password}    ${Empty}
    Wait And Click Element    ${locatorB_login_btn_login}
    Text Of Element Should Be Equal With Wait    dom:document.querySelectorAll(".ant-form-explain")[0]    请输入密码

# 隐藏了员工账号的功能，下面用例暂时不执行
#login007
#    [Documentation]    员工账号登录_登录成功
#    [Tags]    P0    threshold
#    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
#    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
#    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
#    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
#    Wait And Click Element    ${locatorB_login_btn_login}
#    Wait Until Page Contains Locator    ${locatorB_logout_icon_individualAccount}
#    Logout
#    Wait Until Page Contains Locator    ${locatorB_login_input_account}
#
#login008
#    [Documentation]    员工账号登录失败_未注册的域名
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
#    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
#    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
#    Wait And Input Text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
#    Wait And Click Element    ${locatorB_login_btn_login}
#    Wait Until Page Contains Text    店铺地址或者联系方式错误
#
#login009
#    [Documentation]    员工账号登录失败_格式不正确的域名
#    [Tags]    P2
#    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
#    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
#    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
#    Wait And Input Text    ${locatorB_login_input_domain}    ${contentB_login_errorFormatDomain}
#    Wait And Click Element    ${locatorB_login_btn_login}
#    Text Of Element Should Be Equal With Wait    dom:document.querySelectorAll(".ant-form-explain")[0]    请输入合法域名
#
#login010
#    [Documentation]    员工账号登录失败_域名为空
#    [Tags]    P2
#    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
#    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
#    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
#    Wait And Input Text    ${locatorB_login_input_domain}    ${Empty}
#    Wait And Click Element    ${locatorB_login_btn_login}
#    Text Of Element Should Be Equal With Wait    dom:document.querySelectorAll(".ant-form-explain")[0]    请输入店铺域名
#
#login011
#    [Documentation]    员工账号登录失败_未注册的手机/邮箱
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
#    Wait And Input Text    ${locatorB_login_input_account}    ${contentB_login_unregisteredAccount}
#    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
#    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
#    Wait And Click Element    ${locatorB_login_btn_login}
#    Wait Until Page Contains Text    店铺地址或者联系方式错误
#
#login012
#    [Documentation]    员工账号登录失败_格式不正确的手机/邮箱
#    [Tags]    P2
#    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
#    Wait And Input Text    ${locatorB_login_input_account}    ${contentB_login_errorFormatAccount}
#    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
#    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
#    Text Of Element Should Be Equal With Wait    dom:document.querySelectorAll(".ant-form-explain")[0]    请输入正确的邮箱／手机
#
#login013
#    [Documentation]    员工账号登录失败_账号为空
#    [Tags]    P2
#    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
#    Wait And Input Text    ${locatorB_login_input_account}    ${Empty}
#    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
#    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
#    Wait And Click Element    ${locatorB_login_btn_login}
#    Text Of Element Should Be Equal With Wait    dom:document.querySelectorAll(".ant-form-explain")[0]    请输入正确的邮箱／手机
#
#login014
#    [Documentation]    员工账号登录失败_错误密码
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
#    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
#    Wait And Input Password    ${locatorB_login_input_password}    ${contentB_login_errorPwd}
#    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
#    Wait And Click Element    ${locatorB_login_btn_login}
#    Wait Until Page Contains Text    用户名或者密码错误
#
#login015
#    [Documentation]    员工账号登录失败_密码为空
#    [Tags]    P2
#    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
#    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
#    Wait And Input Password    ${locatorB_login_input_password}    ${Empty}
#    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
#    Wait And Click Element    ${locatorB_login_btn_login}
#    Text Of Element Should Be Equal With Wait    dom:document.querySelectorAll(".ant-form-explain")[0]    请输入密码
