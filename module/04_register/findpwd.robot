*** Settings ***
Suite Setup       Open Test Browser    ${home_page}
Suite Teardown    Close Test Suite Browser
#Test Setup
Test Teardown     Teardown Test Case
Force Tags        findpwd
Library           SeleniumLibrary
Resource          ../../resources/variable/var_common.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/keywords/kw_browser.robot
Resource          ../../resources/variable/var_login.robot
Resource          ../../resources/keywords/kw_login.robot

*** Test Cases ***
findpwd001
    [Documentation]    密码找回成功
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Click Element    ${locatorB_login_btn_sendVcode}
    Sleep    2
    ${code}    Get Reset Pwd Vcode Fromdb    ${user_default_contact}
    Wait And Input Text    ${locatorB_login_input_vcode}    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Page Contains Text    密码重置

findpwd002
    [Documentation]    密码找回失败_未注册的域名
    [Tags]    P1
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
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

findpwd004
    [Documentation]    密码找回失败_域名为空
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    ${locatorB_login_input_domain}    ${Empty}
    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Input Text    ${locatorB_login_input_vcode}    123456
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入店铺域名

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

findpwd007
    [Documentation]    密码找回失败_账号为空
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    ${locatorB_login_input_account}    ${Empty}
    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
    Wait And Input Text    ${locatorB_login_input_vcode}    123456
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入正确的邮箱／手机

findpwd008
    [Documentation]    密码找回失败_错误的验证码
    [Tags]    P1
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Click Element    ${locatorB_login_btn_sendVcode}
    Wait And Input Text    ${locatorB_login_input_vcode}    123456
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Page Contains Text    验证码无效

# 等待验证码过期，时间太长，暂不验证
#findpwd009
#    [Documentation]    密码找回失败_超时的验证码
#    [Tags]    P1
#    Wait And Click Element    ${locatorB_login_btn_findpwd}
#    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
#    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
#    Wait And Click Element    ${locatorB_login_btn_sendVcode}
#    Sleep    300
#    ${code}    Get Reset Pwd Vcode Fromdb    ${user_default_contact}
#    Wait And Input Text    ${locatorB_login_input_vcode}    ${code}
#    Wait And Click Element    dom:document.querySelectorAll("button")[1]
#    Wait Until Page Contains Text    验证码无效

findpwd010
    [Documentation]    密码找回失败_格式不正确的验证码
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Input Text    ${locatorB_login_input_vcode}    ${contentB_login_errorFormatVCode}
    Wait Until Page Contains Text    请输入六位数字的验证码

findpwd011
    [Documentation]    密码找回失败_格式不正确的验证码
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Input Text    ${locatorB_login_input_vcode}    ${Empty}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Page Contains Text    输入验证码

findpwd012
    [Documentation]    密码修改成功
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    ${locatorB_login_input_domain}    ${user_default_domain}
    Wait And Input Text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Click Element    ${locatorB_login_btn_sendVcode}
    Sleep    2
    ${code}    Get Reset Pwd Vcode Fromdb    ${user_default_contact}
    Wait And Input Text    ${locatorB_login_input_vcode}    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    # 修改密码操作
    Wait And Input Text    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And Input Text    ${locatorB_login_input_confirmPwd}    ${user_default_pwd}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Wait Until Page Contains Text    修改成功
    Wait And Click Element    dom:document.querySelectorAll("button")[2]
    Wait Until Page Contains Text    登录我的店匠店铺
    # 登录店铺操作
    Wait And Input Text     ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Input Password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And Click Element    ${locatorB_login_btn_login}
    Wait Until Page Contains Element    ${locatorB_order}
    Logout
    Wait Until Page Contains Element    ${locatorB_login_input_account}
