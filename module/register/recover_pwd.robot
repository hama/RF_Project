*** Settings ***
Resource          ../../resources/browser.robot
Resource          ../../resources/tax_price.robot
Library           SeleniumLibrary
Library           customLibrary

*** Test Cases ***
recover_password_pass
    #.找回密码，收到验证码，进入密码重置
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Sleep    1
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${recover_user}
    Input Text    id:code    ${code}
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[0]
    Input Password    id:password    ${recover_password}
    Input Password    id:confirmpass    ${recover_password}
    Click Button    dom:document.querySelectorAll("button")[0]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll("button")[2]

recover_password_error
    #.找回密码- 输入未注册域名 正确账号 提示错误
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

recover_password_error_two
    #.找回密码- 输入格式错误域名 正确账号 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    @#$ss
    Input Text    id:account    ${recover_user}
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[0]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

recover_password_error_three
    #.找回密码- 域名为空 正确账号 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    ${Empty}
    Input Text    id:account    ${recover_user}
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

recover_password_error_four
    #.找回密码- 正确域名 错误账号 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    1131231313210@qq.dcc
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

recover_password_error_five
    #.找回密码- 正确域名 错误格式账号 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    @1155
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

recover_password_error_six
    #.找回密码- 正确域名 账号为空 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${Empty}
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

recover_password_error_seven
    #.找回密码- 正确域名 正确账号 错误验证码 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Input Text    id:code    123456
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice-content")[0]

recover_password_error_eight
    #.找回密码- 正确域名 正确账号 错误验格式证码 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Input Text    id:code    @#¥¥%
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

recover_password_error_nine
    #.找回密码- 正确域名 正确账号 验证码为空 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Input Text    id:code    ${Empty}
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

recover_password_pass_info
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Sleep    1
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${recover_user}
    Input Text    id:code    ${code}
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[0]
    Input Password    id:password    ${recover_password}
    Input Password    id:confirmpass    ${recover_password}
    Click Button    dom:document.querySelectorAll("button")[0]
    Sleep    1
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[2]
    Click Button    dom:document.querySelectorAll("button")[2]

recover_password_error_ten
    #.找回密码- 正确域名 正确账号 验证码-修改密码 输入为空 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Sleep    1
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${recover_user}
    Input Text    id:code    ${code}
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[0]
    Input Password    id:password    ${Empty}
    Input Password    id:confirmpass    ${Empty}
    Click Button    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

recover_password_error_eleven
    #.找回密码- 正确域名 正确账号 验证码-修改密码 输入1位数 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Sleep    1
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${recover_user}
    Input Text    id:code    ${code}
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[0]
    Input Password    id:password    1
    Input Password    id:confirmpass    1
    Click Button    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

recover_password_error_twelve
    #.找回密码- 正确域名 正确账号 验证码-修改密码 输入13位数 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Sleep    1
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${recover_user}
    Input Text    id:code    ${code}
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[0]
    Input Password    id:password    12312312312
    Input Password    id:confirmpass    12312312312
    Click Button    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

recover_password_error_thirteen
    #.找回密码- 正确域名 正确账号 验证码-修改密码 输入13位数 确认密码为空 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Sleep    1
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${recover_user}
    Input Text    id:code    ${code}
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[0]
    Input Password    id:password    12312312312
    Input Password    id:confirmpass    ${Empty}
    Click Button    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

recover_password_error_fourteen
    #.找回密码- 正确域名 正确账号 验证码-修改密码 输入13位数 确认密码1-6位 2次密码不一致 提示错误
    Comment    recover password
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${recover_pwd_btn}
    Click Element    ${recover_pwd_btn}
    Wait Until Element Is Visible    id:username
    Sleep    1
    Input Text    id:username    ${recover_domain}
    Input Text    id:account    ${recover_user}
    Sleep    1
    Click Button    发送验证码
    Sleep    2
    ${code}    selectCodesPwd    ${recover_user}
    Input Text    id:code    ${code}
    Sleep    1
    Click Button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[0]
    Input Password    id:password    12312312312
    Input Password    id:confirmpass    123
    Click Button    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

recover_password_error_fivesteen
