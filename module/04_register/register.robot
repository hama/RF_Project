*** Settings ***
Suite Setup       Open Test Browser    ${home_page}
Suite Teardown    Close Test Suite Browser
Test Setup        Login Testcase Setup
Test Teardown     Teardown Test Case
Force Tags        Register
Library           SeleniumLibrary
Library           ${CURDIR}/../../lib/customLibrary
Resource          ../../resources/variable/var_common.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/keywords/kw_browser.robot
Resource          ../../resources/variable/var_login.robot

*** Test Cases ***
register_001
    [Documentation]    注册信息成功
    [Tags]    P0    threshold
    Del User Fromdb    ${register_contact}
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${register_domain}
    Wait And input password    ${locatorB_login_input_password}    ${register_pwd}
    Wait And input password    ${locatorB_login_input_confirmPwd}    ${register_pwd}
    Wait And input text    ${locatorB_login_input_account}    ${register_contact}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Sleep    2
    ${code}    Get Latest Vcode Fromdb    ${register_contact}
    Wait And input text    ${locatorB_login_input_vcode}    ${code}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Page Contains Element    ${locatorB_order}
    Logout
    Wait Until Page Contains Element    ${locatorB_login_input_account}

register_002
    [Documentation]    注册信息失败_已注册的域名
    [Tags]    P1
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${user_default_domain}
    Wait And input password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And input password    ${locatorB_login_input_confirmPwd}    ${user_default_pwd}
    Wait And input text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Wait Until Page Contains Text    用户名已存在

register_003
    [Documentation]    注册信息失败_无效的邀请码
    [Tags]    P0
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    abcdef
    Wait And input text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And input password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And input password    ${locatorB_login_input_confirmPwd}    ${user_default_pwd}
    Wait And input text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Sleep    2
    ${code}    Get Latest Vcode Fromdb    ${user_default_contact}
    Wait And input text    ${locatorB_login_input_vcode}    ${code}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Page Contains Text    邀请码无效

register_004
    [Documentation]    注册信息失败_未勾选协议
    [Tags]    P0
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And input password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And input password    ${locatorB_login_input_confirmPwd}    ${user_default_pwd}
    Wait And input text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Sleep    2
    ${code}    Get Latest Vcode Fromdb    ${user_default_contact}
    Wait And input text    ${locatorB_login_input_vcode}    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Page Contains Element    dom:document.querySelectorAll("button:disabled")[0]

register_005
    [Documentation]    注册信息失败_格式不正确的域名
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And input text    ${locatorB_login_input_domain}    ${contentB_login_errorFormatDomain}
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入合法域名

register_006
    [Documentation]    注册信息失败_域名为空
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${Empty}
    Wait And input password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And input password    ${locatorB_login_input_confirmPwd}    ${user_default_pwd}
    Wait And input text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And input text    ${locatorB_login_input_vcode}    ${contentB_login_invalidVCode}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入店铺域名

register_007
    [Documentation]    注册信息失败_密码为空
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And input password    ${locatorB_login_input_password}    ${Empty}
    Wait And input password    ${locatorB_login_input_confirmPwd}    ${Empty}
    Wait And input text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And input text    ${locatorB_login_input_vcode}    ${contentB_login_invalidVCode}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入密码

register_008
    [Documentation]    注册信息失败_输入1-5个字符密码
    [Tags]    P1
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And input password    ${locatorB_login_input_password}    12345
    Wait And input password    ${locatorB_login_input_confirmPwd}    12345
    Wait And input text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And input text    ${locatorB_login_input_vcode}    ${contentB_login_invalidVCode}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入6-12位数的密码


register_009
    [Documentation]    注册信息失败_输入13个以上字符密码
    [Tags]    P1
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And input password    ${locatorB_login_input_password}    1234567890acf
    Wait And input password    ${locatorB_login_input_confirmPwd}    1234567890acf
    Wait And input text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And input text    ${locatorB_login_input_vcode}    ${contentB_login_invalidVCode}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入6-12位数的密码

register_010
    [Documentation]    注册信息失败_确认密码为空
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And input password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And input password    ${locatorB_login_input_confirmPwd}    ${Empty}
    Wait And input text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And input text    ${locatorB_login_input_vcode}    ${contentB_login_invalidVCode}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入确认密码

register_011
    [Documentation]    注册信息失败_确认密码输入1-5个字符
    [Tags]    P1
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And input password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And input password    ${locatorB_login_input_confirmPwd}    12345
    Wait And input text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And input text    ${locatorB_login_input_vcode}    ${contentB_login_invalidVCode}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入6-12位数的密码, 两次输入的密码不一致

register_013
    [Documentation]    注册信息失败_格式不正确的手机/邮箱
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And input password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And input password    ${locatorB_login_input_confirmPwd}    ${user_default_pwd}
    Wait And input text    ${locatorB_login_input_account}    ${contentB_login_errorFormatAccount}
    Wait And input text    ${locatorB_login_input_vcode}    ${contentB_login_invalidVCode}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入正确的邮箱／手机

register_014
    [Documentation]    注册信息失败_手机/邮箱为空
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And input password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And input password    ${locatorB_login_input_confirmPwd}    ${user_default_pwd}
    Wait And input text    ${locatorB_login_input_account}    ${Empty}
    Wait And input text    ${locatorB_login_input_vcode}    ${contentB_login_invalidVCode}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入正确的邮箱／手机

register_015
    [Documentation]    注册信息失败_错误验证码
    [Tags]    P1
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And input password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And input password    ${locatorB_login_input_confirmPwd}    ${user_default_pwd}
    Wait And input text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And input text    ${locatorB_login_input_vcode}    ${contentB_login_invalidVCode}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Page Contains Text    验证码无效

register_017
    [Documentation]    注册信息失败_格式不正确的验证码
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And input password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And input password    ${locatorB_login_input_confirmPwd}    ${user_default_pwd}
    Wait And input text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And input text    ${locatorB_login_input_vcode}    ${contentB_login_errorFormatVCode}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入六位数字的验证码

register_018
    [Documentation]    注册信息失败_验证码为空
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_register}
    Wait And Input Text    ${locatorB_login_input_inviteCode}    ${user_default_inviteCode}
    Wait And input text    ${locatorB_login_input_domain}    ${contentB_login_unregisteredDomain}
    Wait And input password    ${locatorB_login_input_password}    ${user_default_pwd}
    Wait And input password    ${locatorB_login_input_confirmPwd}    ${user_default_pwd}
    Wait And input text    ${locatorB_login_input_account}    ${user_default_contact}
    Wait And input text    ${locatorB_login_input_vcode}    ${Empty}
    Wait And Click Element    dom:document.querySelectorAll("span[class='ant-checkbox']")[0]    #.点击我接受
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入验证码
