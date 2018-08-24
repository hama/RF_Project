*** Settings ***
Suite Setup       Login Suite Setup
Suite Teardown    Close Test Suite Browser
#Test Setup
Test Teardown     Login Test Teardown
Force Tags        login
Library           SeleniumLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/var_login.robot


*** Test Cases ***
login001
    [Documentation]     主账号登录成功
    [Tags]    P0
    Wait And Input Text     id:account    ${user_default_name}
    Wait And Input Password    id:password    ${user_default_pwd}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait And Input Text    id:username    ${user_default_domain}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Element    ${locatorB_order}
    Logout

login002
    [Documentation]     主账号登录失败_未注册账号
    [Tags]    P1
    Wait And Input Text    id:account    ${contentB_login_unregisteredAccount}
    Wait And Input Password    id:password    ${user_default_pwd}
    Wait And Click Element    ${locatorB_login_btn_login}
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入正确的邮箱／手机

login003
    [Documentation]     主账号登录失败_格式不正确
    [Tags]    P2
    Wait And Input Text    id:account    ${contentB_login_errorFormatAccount}
    Wait And Input Password    id:password    ${user_default_pwd}
    Wait And Click Element    ${locatorB_login_btn_login}
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入正确的邮箱／手机

login004
    [Documentation]     主账号登录失败_账号为空
    [Tags]    P2
    Wait And Input Text    id:account    ${Empty}
    Wait And Input Password    id:password    ${user_default_pwd}
    Wait And Click Element    ${locatorB_login_btn_login}
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入正确的邮箱／手机

login005
    [Documentation]     主账号登录失败_错误密码
    [Tags]    P0
    Wait And Input Text    id:account    ${user_default_name}
    Wait And Input Password    id:password    ${contentB_login_errorPwd}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait And Input Text    id:username    ${user_default_domain}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Element    dom:document.querySelectorAll(".anticon-cross-circle")[0]
    Wait Until Page Contains    用户名或者密码错误

login006
    [Documentation]     主账号登录失败_密码为空
    [Tags]    P2
    Wait And Input Text    id:account    ${user_default_name}
    Wait And Input Password    id:password    ${Empty}
    Wait And Click Element    ${locatorB_login_btn_login}
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入密码

login007
    [Documentation]     员工账号登录_登录成功
    [Tags]    P0
    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
    Wait And Input Text    id:account    ${user_default_name}
    Wait And Input Password    id:password    ${user_default_pwd}
    Wait And Input Text    id:username    ${user_default_domain}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Element    ${locatorB_order}
    Logout

login008
    [Documentation]     员工账号登录失败_未注册的域名
    [Tags]    P0
    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
    Wait And Input Text    id:account    ${user_default_name}
    Wait And Input Password    id:password    ${user_default_pwd}
    Wait And Input Text    id:username    ${contentB_login_unregisteredDomain}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Text    店铺地址或者联系方式错误

login009
    [Documentation]     员工账号登录失败_格式不正确的域名
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
    Wait And Input Text    id:account    ${user_default_name}
    Wait And Input Password    id:password    ${user_default_pwd}
    Wait And Input Text    id:username    ${contentB_login_errorFormatDomain}
    Wait And Click Element    ${locatorB_login_btn_login}
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入合法域名

login010
    [Documentation]     员工账号登录失败_域名为空
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
    Wait And Input Text    id:account    ${user_default_name}
    Wait And Input Password    id:password    ${user_default_pwd}
    Wait And Input Text    id:username    ${Empty}
    Wait And Click Element    ${locatorB_login_btn_login}
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入店铺域名

login011
    [Documentation]     员工账号登录失败_未注册的手机/邮箱
    [Tags]    P0
    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
    Wait And Input Text    id:account    ${contentB_login_unregisteredAccount}
    Wait And Input Password    id:password    ${user_default_pwd}
    Wait And Input Text    id:username    ${user_default_domain}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Text    店铺地址或者联系方式错误

login012
    [Documentation]     员工账号登录失败_格式不正确的手机/邮箱
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
    Wait And Input Text    id:account    ${contentB_login_errorFormatAccount}
    Wait And Input Password    id:password    ${user_default_pwd}
    Wait And Input Text    id:username    ${user_default_domain}
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入正确的邮箱／手机

login013
    [Documentation]     员工账号登录失败_账号为空
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
    Wait And Input Text    id:account    123456
    Wait And Input Text    id:account    ${Empty}
    Wait And Input Password    id:password    ${user_default_pwd}
    Wait And Input Text    id:username    ${user_default_domain}
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入正确的邮箱／手机

login014
    [Documentation]     员工账号登录失败_错误密码
    [Tags]    P0
    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
    Wait And Input Text    id:account    ${user_default_name}
    Wait And Input Password    id:password    ${contentB_login_errorPwd}
    Wait And Input Text    id:username    ${user_default_domain}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Text    用户名或者密码错误

login015
    [Documentation]     员工账号登录失败_密码为空
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_employeeLogin}
    Wait And Input Text    id:account    ${user_default_name}
    Wait And Input Password    id:password    ${Empty}
    Wait And Input Text    id:username    ${user_default_domain}
    Wait And Click Element    ${locatorB_login_btn_login}
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入密码



*** keywords ***
Login Suite Setup
    Open Test Browser    ${home_page}

Login Test Teardown
    @{window_handle}    Get Window Handles
    Execute Javascript    window.open("${home_page}")
    Select Window    ${window_handle[0]}
    Close Window
    # focus on new window
    @{window_handle}    Get Window Handles
    Select Window    ${window_handle[0]}

Logout
    Wait And Click Element    dom:document.querySelectorAll("i[class~='hd-line-center']")[0]
    Wait And Click Element    dom:document.querySelectorAll("div[class='account_content___18o60'] a")[1]