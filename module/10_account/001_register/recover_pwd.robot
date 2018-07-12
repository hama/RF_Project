*** Settings ***
Suite Teardown    Close Test Suite Browser
Force Tags        Recover Password
Library           SeleniumLibrary
Resource          ../../../resources/var_tax_price.robot
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot
Library           customLibrary

*** Test Cases ***
recover_001
    [Documentation]    找回密码，收到验证码，进入密码重置
    [Tags]    P0
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${user_default_domain}
    Input Text    id:account    ${user_default_name}
    Sleep    60
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${user_default_name}
    Input Text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Sleep    4
    Input Password    id:password    ${user_default_pwd}
    Input Password    id:confirmpass    ${user_default_pwd}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll("button")[2]
    Close Browser

recover_002
    [Documentation]    找回密码- 输入未注册域名 正确账号 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    klklklklk
    Input Text    id:account    ${user_default_name}
    Sleep    1
    Click Button    发送验证码
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice-content")[0]
    Close Browser

recover_003
    [Documentation]    找回密码- 输入格式错误域名 正确账号 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
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
    Wait And Click Element    ${recover_pwd_btn}
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
    Wait And Click Element    ${recover_pwd_btn}
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
    Wait And Click Element    ${recover_pwd_btn}
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
    Wait And Click Element    ${recover_pwd_btn}
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
    Wait And Click Element    ${recover_pwd_btn}
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
    Wait And Click Element    ${recover_pwd_btn}
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
    Wait And Click Element    ${recover_pwd_btn}
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
    #.找回密码- 正确域名 正确账号 验证码-修改密码 输入为空 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${user_default_domain}
    Input Text    id:account    ${user_default_name}
    #Sleep    60
    #Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${user_default_name}
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
    #Comment    recover password
    #Open Test Browser    ${home_page}
    #Wait And Click Element    ${recover_pwd_btn}
    #Wait Until Element Is Visible    id:username
    #Input Text    id:username    ${user_default_domain}
    #Input Text    id:account    ${user_default_name}
    #Sleep    60s
    #Click Button    发送验证码
    #Sleep    2
    #${code}    selectCodesPwd    ${user_default_name}
    #Input Text    id:code    ${code}
    #Wait And Click Element    dom:document.querySelectorAll("button")[1]
    #Sleep    4
    #Input Password    id:password    1
    #Input Password    id:confirmpass    1
    #Wait And Click Element    dom:document.querySelectorAll("button")[0]
    #Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    #Close Browser

recover_015
    [Documentation]    找回密码- 正确域名 正确账号 验证码-修改密码 输入13位数 提示错误
    [Tags]    P1
    #Comment    recover password
    #Open Test Browser    ${home_page}
    #Wait And Click Element    ${recover_pwd_btn}
    #Wait Until Element Is Visible    id:username
    #Input Text    id:username    ${user_default_domain}
    #Input Text    id:account    ${user_default_name}
    #Sleep    60s
    #Click Button    发送验证码
    #Sleep    2
    #${code}    selectCodesPwd    ${user_default_name}
    #Input Text    id:code    ${code}
    #Wait And Click Element    dom:document.querySelectorAll("button")[1]
    #Sleep    4
    #Input Password    id:password    12312312312
    #Input Password    id:confirmpass    123123123121
    #Wait And Click Element    dom:document.querySelectorAll("button")[0]
    #Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    #Close Browser

recover_016
    [Documentation]    找回密码- 正确域名 正确账号 验证码-修改密码 输入13位数 确认密码为空 提示错误
    [Tags]    P1
    #Comment    recover password
    #Open Test Browser    ${home_page}
    #Wait And Click Element    ${recover_pwd_btn}
    #Wait Until Element Is Visible    id:username
    #Input Text    id:username    ${user_default_domain}
    #Input Text    id:account    ${user_default_name}
    #Sleep    60s
    #Click Button    发送验证码
    #Sleep    2
    #${code}    selectCodesPwd    ${user_default_name}
    #Input Text    id:code    ${code}
    #Wait And Click Element    dom:document.querySelectorAll("button")[1]
    #Sleep    4
    #Input Password    id:password    12312312312
    #Input Password    id:confirmpass    ${Empty}
    #Wait And Click Element    dom:document.querySelectorAll("button")[0]
    #Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    #Close Browser

recover_017
    [Documentation]    找回密码- 正确域名 正确账号 验证码-修改密码 输入13位数 确认密码1-6位 2次密码不一致 提示错误
    [Tags]    P1
    #Comment    recover password
    #Open Test Browser    ${home_page}
    #Wait And Click Element    ${recover_pwd_btn}
    #Wait Until Element Is Visible    id:username
    #Input Text    id:username    ${user_default_domain}
    #Input Text    id:account    ${user_default_name}
    #Sleep    60s
    #Click Button    发送验证码
    #Sleep    2
    #${code}    selectCodesPwd    ${user_default_name}
    #Input Text    id:code    ${code}
    #Wait And Click Element    dom:document.querySelectorAll("button")[1]
    #Sleep    4
    #Input Password    id:password    12312312312
    #Input Password    id:confirmpass    123
    #Wait And Click Element    dom:document.querySelectorAll("button")[0]
    #Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    #Close Browser
