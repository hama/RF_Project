*** Settings ***
Suite Teardown    Close Test Suite Browser
Library           SeleniumLibrary
Library           ${CURDIR}../../../lib/customLibrary
Resource          ../../../resources/var_tax_price.robot
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot

*** Test Cases ***
remove_user
    remove user    ${recover_user}

register_pass
    [Documentation]    注册
    [Tags]    P0
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    ${recover_domain}
    input password    id:password    ${recover_password}
    input password    id:confirmpass    ${recover_password}
    input text    id:account    ${recover_user}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    ${code}    select code    ${recover_user}
    input text    id:code    ${code}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    page should contain element    //*[@id="root"]
    Close Browser

register_error_one
    [Documentation]    注册 输入已注册的账号 提示错误
    [Tags]    P0
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    ${defaultDomain}
    input password    id:password    ${recover_password}
    input password    id:confirmpass    ${recover_password}
    input text    id:account    ${defaultUser}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice-content")[0]
    Close Browser

register_error_two
    [Documentation]    注册 输入格式错误的域名 提示错误
    [Tags]    P0
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    @!@$1
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_error_three
    [Documentation]    注册 域名为空 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    ${Empty}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_error_four
    [Documentation]    注册 输入未注册的域名 密码为空 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input text    id:account    ${defaultUser}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_error_five
    [Documentation]    注册 输入未注册的域名 密码5位 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    12345
    input password    id:confirmpass    12345
    input text    id:account    ${defaultUser}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_error_six
    [Documentation]    注册 输入未注册的域名 密码13位 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    1234512345678
    input password    id:confirmpass    1234512345678
    input text    id:account    ${defaultUser}
    Wait And Click Elementn    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_error_seven
    [Documentation]    注册 输入未注册的域名 密码6位 确认密码为空 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    1234512345678
    input password    id:confirmpass    ${Empty}
    input text    id:account    ${defaultUser}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_error_eaght
    [Documentation]    注册 输入未注册的域名 2次密码输入不一致 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    123451234
    input password    id:confirmpass    987654321
    input text    id:account    ${defaultUser}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_error_nine
    [Documentation]    注册 输入未注册的域名-密码 错误格式账号 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    123451234
    input password    id:confirmpass    123451234
    input text    id:account    2$$%%@1q
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_error_ten
    [Documentation]    注册 输入未注册的域名-密码 账号为空 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    123451234
    input password    id:confirmpass    123451234
    input text    id:account    ${Empty}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_error_eleven
    [Documentation]    注册 输入未注册的域名-密码 验证码错误 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    123451234
    input password    id:confirmpass    123451234
    input text    id:account    ${defaultUser}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Input Text    id:code    999999
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice-content")[0]
    Close Browser

register_error_twelve
    [Documentation]    注册 输入未注册的域名-密码 验证码4位数 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    123451234
    input password    id:confirmpass    123451234
    input text    id:account    ${defaultUser}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Input Text    id:code    9999
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

register_error_thirteen
    [Documentation]    注册 输入未注册的域名-密码 验证码为空 提示错误
    [Tags]    P1
    Comment    register
    Open Test Browser    ${home_page}
    Wait And Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    123451234
    input password    id:confirmpass    123451234
    input text    id:account    ${defaultUser}
    Wait And Click Element    dom:document.querySelectorAll("button")[0]
    Input Text    id:code    ${Empty}
    Wait And Click Element    dom:document.querySelectorAll("button")[1]
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]
    Close Browser

logout
    [Documentation]    登陆成功
    [Tags]    P0
    Comment    wait until login button is visible
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${defaultUser}
    Input Password    id:password    ${defaultPassword}
    Wait And Click Button    ${login_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${defaultDomain}
    Wait And Click Element    ${login_btn}
    Sleep    1
    Page Should Contain Element    ${locator_order}
    Wait And Click Element    dom:document.querySelectorAll(".xiala-choose")[0]
    Wait And Click Element    dom:document.querySelectorAll(".logout___U0tma")[0]
    Close Browser
