*** Settings ***
Suite Teardown    Close Test Suite Browser
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
recover_password_pass
    [Documentation]    找回密码，收到验证码，进入密码重置
    [Tags]    P0
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Sleep    1
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${recover_user}
    Input Text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Element Is Visible    id:password
    Input Password    id:password    ${recover_password}
    Input Password    id:confirmpass    ${recover_password}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll("button")[2]
    Sleep    40s
    Close Browser

recover_password_error
    [Documentation]    找回密码- 输入未注册域名 正确账号 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    klklklklk
    Input Text    id:account    ${recover_user}
    Sleep    1
    Click Button    发送验证码
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice-content")[0]
    Close Browser

recover_password_error_two
    [Documentation]    找回密码- 输入格式错误域名 正确账号 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    @#$ss
    Input Text    id:account    ${recover_user}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_password_error_three
    [Documentation]    找回密码- 域名为空 正确账号 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${Empty}
    Input Text    id:account    ${recover_user}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_password_error_four
    [Documentation]    找回密码- 正确域名 错误账号 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    1131231313210@qq.dcc
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_password_error_five
    [Documentation]    找回密码- 正确域名 错误格式账号 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    @1155
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_password_error_six
    [Documentation]    找回密码- 正确域名 账号为空 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${Empty}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_password_error_seven
    [Documentation]    找回密码- 正确域名 正确账号 错误验证码 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Input Text    id:code    123456
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice-content")[0]
    Close Browser

recover_password_error_eight
    [Documentation]    找回密码- 正确域名 正确账号 错误验格式证码 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Input Text    id:code    @#¥¥%
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_password_error_nine
    [Documentation]    找回密码- 正确域名 正确账号 验证码为空 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Input Text    id:code    ${Empty}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_password_error_ten
    [Documentation]    找回密码- 正确域名 正确账号 验证码-修改密码 输入为空 提示错误
    [Tags]    P1
    #.找回密码- 正确域名 正确账号 验证码-修改密码 输入为空 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${recover_user}
    Input Text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Element Is Visible    id:password
    Input Password    id:password    ${Empty}
    Input Password    id:confirmpass    ${Empty}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_password_error_eleven
    [Documentation]    找回密码- 正确域名 正确账号 验证码-修改密码 输入1位数 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Sleep    40s
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${recover_user}
    Input Text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Element Is Visible    id:password
    Input Password    id:password    1
    Input Password    id:confirmpass    1
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_password_error_twelve
    [Documentation]    找回密码- 正确域名 正确账号 验证码-修改密码 输入13位数 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Sleep    40s
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${recover_user}
    Input Text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Element Is Visible    id:password
    Input Password    id:password    12312312312
    Input Password    id:confirmpass    123123123121
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_password_error_thirteen
    [Documentation]    找回密码- 正确域名 正确账号 验证码-修改密码 输入13位数 确认密码为空 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Sleep    50s
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${recover_user}
    Input Text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Element Is Visible    id:password
    Input Password    id:password    12312312312
    Input Password    id:confirmpass    ${Empty}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

recover_password_error_fourteen
    [Documentation]    找回密码- 正确域名 正确账号 验证码-修改密码 输入13位数 确认密码1-6位 2次密码不一致 提示错误
    [Tags]    P1
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait And Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Sleep    40s
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${recover_user}
    Input Text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Wait Until Element Is Visible    id:password
    Input Password    id:password    12312312312
    Input Password    id:confirmpass    123
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser
