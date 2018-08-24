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

*** Test Cases ***
findpwd001
    [Documentation]    密码找回成功
    [Tags]    P0
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    id:username    ${user_default_domain}
    Wait And Input Text    id:account    ${user_default_name}
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
    Wait And Input Text    id:username    testdomain
    Wait And Input Text    id:account    ${user_default_name}
    Wait And Click Element    ${locatorB_login_btn_sendVcode}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Page Contains Text    店铺地址或者联系方式错误

findpwd003
    [Documentation]    密码找回失败_格式不正确的域名
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    id:username    test!@domain
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入合法域名

#   不好实现，暂且搁置
#findpwd004
#    [Documentation]    密码找回失败_域名为空
#    [Tags]    P2
#    Wait And Click Element    ${locatorB_login_btn_findpwd}
#    Wait And Input Text    id:account    ${user_default_name}
#    Wait And Input Text    id:username    121212
##    Clear Element Text 因为这个关键字不可用，因此使用js
#    Sleep    3
#    Execute Javascript    return document.querySelectorAll("input[id='username']")[0].value=''
#    Sleep    3
#    Wait And Click Element    id:account
#    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
#    Should Be Equal    ${prompt}    输入店铺域名

findpwd005
    [Documentation]    密码找回失败_未注册的手机/邮箱
    [Tags]    P2
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait And Input Text    id:username    ${user_default_domain}
    Wait And Input Text    id:account
    Wait And Click Element    ${locatorB_login_btn_sendVcode}
    ${prompt}    Get Text    dom:document.querySelectorAll(".ant-form-explain")[0]
    Should Be Equal    ${prompt}    请输入合法域名

recover_003
    [Documentation]    找回密码- 输入格式错误域名 正确账号 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    @#$ss
    Input Text    id:account    ${user_default_name}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_004
    [Documentation]    找回密码- 域名为空 正确账号 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${Empty}
    Input Text    id:account    ${user_default_name}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_005
    [Documentation]    找回密码- 正确域名 错误账号 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${user_default_domain}
    Input Text    id:account    1131231313210@qq.dcc
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_006
    [Documentation]    找回密码- 正确域名 错误格式账号 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${user_default_domain}
    Input Text    id:account    @1155
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_007
    [Documentation]    找回密码- 正确域名 账号为空 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${user_default_domain}
    Input Text    id:account    ${Empty}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_008
    [Documentation]    找回密码- 正确域名 正确账号 错误验证码 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${user_default_domain}
    Input Text    id:account    ${user_default_name}
    Input Text    id:code    123456
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice-content")[0]
    Close Browser

recover_010
    [Documentation]    找回密码- 正确域名 正确账号 错误验格式证码 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${user_default_domain}
    Input Text    id:account    ${user_default_name}
    Input Text    id:code    @#¥¥%
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_011
    [Documentation]    找回密码- 正确域名 正确账号 验证码为空 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${user_default_domain}
    Input Text    id:account    ${user_default_name}
    Input Text    id:code    ${Empty}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_013
    [Documentation]    找回密码- 正确域名 正确账号 验证码-修改密码 输入为空 提示错误
    [Tags]    P1
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${user_default_domain}
    Input Text    id:account    ${user_default_name}
    Sleep    100
    Click Button    发送验证码
    Sleep    2
    ${code}    Get Reset Pwd Vcode Fromdb    ${user_default_name}
    Input Text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Sleep    4
    Input Password    id:password    ${Empty}
    Input Password    id:confirmpass    ${Empty}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_014
    [Documentation]    找回密码- 正确域名 正确账号 验证码-修改密码 输入1位数 提示错误
    [Tags]    P1
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${user_default_domain}
    Input Text    id:account    ${user_default_name}
    Sleep    130s
    Click Button    发送验证码
    Sleep    2
    ${code}    Get Reset Pwd Vcode Fromdb    ${user_default_name}
    Input Text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Sleep    4
    Input Password    id:password    1
    Input Password    id:confirmpass    1
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_015
    [Documentation]    找回密码- 正确域名 正确账号 验证码-修改密码 输入13位数 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${user_default_domain}
    Input Text    id:account    ${user_default_name}
    Sleep    120s
    Click Button    发送验证码
    Sleep    2
    ${code}    Get Reset Pwd Vcode Fromdb    ${user_default_name}
    Input Text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Sleep    4
    Input Password    id:password    12312312312
    Input Password    id:confirmpass    123123123121
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_016
    [Documentation]    找回密码- 正确域名 正确账号 验证码-修改密码 输入13位数 确认密码为空 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${user_default_domain}
    Input Text    id:account    ${user_default_name}
    Sleep    120s
    Click Button    发送验证码
    Sleep    2
    ${code}    Get Reset Pwd Vcode Fromdb    ${user_default_name}
    Input Text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Sleep    4
    Input Password    id:password    12312312312
    Input Password    id:confirmpass    ${Empty}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_017
    [Documentation]    找回密码- 正确域名 正确账号 验证码-修改密码 输入13位数 确认密码1-6位 2次密码不一致 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${locatorB_login_btn_findpwd}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${user_default_domain}
    Input Text    id:account    ${user_default_name}
    Sleep    130s
    Click Button    发送验证码
    Sleep    2
    ${code}    Get Reset Pwd Vcode Fromdb    ${user_default_name}
    Input Text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Sleep    4
    Input Password    id:password    12312312312
    Input Password    id:confirmpass    123
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

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