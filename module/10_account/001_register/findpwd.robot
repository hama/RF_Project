*** Settings ***
Suite Setup       Findpwd Suite Setup
Suite Teardown    Close Test Suite Browser
#Test Setup
Test Teardown     Findpwd Test Teardown
Force Tags        findpwd
Library           SeleniumLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/var_login.robot

*** Test Cases ***
findpwd001
    [Documentation]    密码找回成功
    [Tags]    P0
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_name}
    Wait And Click Element    ${locatorB_login_btn_sendVcode}
    Sleep    2
    ${code}    Get Reset Pwd Vcode Fromdb    ${user_default_name}
    Input Text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Page Contains Text    密码重置

findpwd002
    [Documentation]    密码找回失败_未注册的域名
    [Tags]    P1
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_name}
    Wait And Click Element    ${locatorB_login_btn_sendVcode}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Page Contains Text    店铺地址或者联系方式错误

findpwd003
    [Documentation]    密码找回失败_格式不正确的域名
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    ${locatorB_login_input_domain}    ${contentB_login_errorFormatDomain}
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入合法域名

#   不好实现，暂且搁置
#findpwd004
#    [Documentation]    密码找回失败_域名为空
#    [Tags]    P2
#    Wait And Click Element    ${locatorB_login_btn_findpwd}
#    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_name}
#    Wait And Input Text    ${locatorB_login_input_domain}    121212
##    Clear Element Text 因为这个关键字不可用，因此使用js
#    Sleep    3
#    Execute Javascript    return document.querySelectorAll("input[id='username']")[0].value=''
#    Sleep    3
#    Wait And Click Element    ${locatorB_login_input_account}
#    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
#    Should Be Equal    ${prompt}    输入店铺域名

findpwd005
    [Documentation]    密码找回失败_未注册的手机/邮箱
    [Tags]    P1
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
    Wait And Input Text    ${locatorB_login_input_account}    ${contentB_login_unregisteredAccount}
    Wait And Click Element    ${locatorB_login_btn_sendVcode}
    Wait Until Page Contains Text    店铺地址或者联系方式错误

findpwd006
    [Documentation]    密码找回失败_格式不正确的手机/邮箱
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
    Wait And Input Text    ${locatorB_login_input_account}    ${contentB_login_errorFormatAccount}
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入正确的邮箱／手机

#   不好实现，暂且搁置
#findpwd007
#    [Documentation]    密码找回失败_账号为空
#    [Tags]    P2
#    Wait And Click Element    ${locatorB_login_btn_findpwd}
#    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_name}
#    Wait And Input Text    ${locatorB_login_input_account}    ${Empty}
#    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
##    Clear Element Text 因为这个关键字不可用，因此使用js
##    Sleep    3
##    Execute Javascript    return document.querySelectorAll("input[id='account']")[0].value=''
##    Sleep    3
#    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
#    Should Be Equal    ${prompt}    请输入正确的邮箱／手机


*** keywords ***
Findpwd Suite Setup
    Open Test Browser    ${home_page}

Findpwd Test Teardown
    @{window_handle}    Get Window Handles
    Execute Javascript    window.open("${home_page}")
    Select Window    ${window_handle[0]}
    Close Window
    # focus on new window
    @{window_handle}    Get Window Handles
    Select Window    ${window_handle[0]}