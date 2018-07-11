*** Settings ***
Suite Teardown    Close Test Suite Browser
Library           SeleniumLibrary
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_tax_price.robot
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot
Library           customLibrary

*** Variable ***
${uname}          98989898
${u_format}       $93!@#

*** Test Cases ***
login001
    [Documentation]    登陆成功
    [Tags]    P0
    Comment    wait until login button is visible
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${comm_user}
    Input Password    id:password    ${comm_pwd}
    Wait And Click Button    ${login_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${comm_domain}
    Wait And Click Element    ${login_btn}
    Sleep    2
    Page Should Contain Element    ${locator_order}
    Logout

login002
    [Documentation]    输入未注册的手机号 弹出提示店铺地址或者联系方式错误
    [Tags]    P1
    Login Setp
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${uname}
    Input Password    id:password    ${comm_pwd}
    Wait And Click Element    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login003
    [Documentation]    输入格式错误的账号 弹出提示店铺地址或者联系方式错误
    [Tags]    P1
    Login Setp
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${Empty}
    Input Password    id:password    ${comm_pwd}
    Wait And Click Element    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login004
    [Documentation]    账号为空 弹出提示店铺地址或者联系方式错误
    [Tags]    P1
    Login Setp
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${u_format}
    Input Password    id:password    ${comm_pwd}
    Wait And Click Element    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login005
    [Documentation]    输入正确账号，密码错误 弹出提示店铺地址或者联系方式错误
    [Tags]    P1
    Login Setp
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${comm_user}
    Input Password    id:password    ${comm_pwd}
    Wait And Click Element    ${login_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ss
    Wait And Click Element    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".anticon-cross-circle")[0]

login006
    [Documentation]    输入正确账号，密码为空 弹出提示店铺地址或者联系方式错误误
    [Tags]    P1
    Login Setp
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${comm_user}
    Input Password    id:password    1${Empty}
    Wait And Click Element    ${login_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${comm_domain}
    Wait And Click Element    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice")

login010
    [Documentation]    输入正确账号，密码 域名为空 弹出提示店铺地址或者联系方式错误
    [Tags]    P1
    Login Setp
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${comm_user}
    Input Password    id:password    1${Empty}
    Wait And Click Element    ${login_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${Empty}
    Wait And Click Element    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login008
    [Documentation]    输入正确账号，密码 域名错误 弹出提示店铺地址或者联系方式错误
    [Tags]    P1
    Login Setp
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${comm_user}
    Input Password    id:password    1${Empty}
    Wait And Click Element    ${login_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    dgdfg
    Wait And Click Element    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice")

login007
    [Documentation]    登陆成功
    [Tags]    P0
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${comm_user}
    Input Password    id:password    ${comm_pwd}
    Wait And Click Button    ${login_btn}
    Comment    wait until domain input text element is visible
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${comm_domain}
    Wait And Click Element    ${login_btn}
    Sleep    2
    Page Should Contain Element    ${locator_order}
    Logout

login012
    [Documentation]    输入未注册的手机号 弹出提示店铺地址或者联系方式错误
    [Tags]    P1
    Login Setp
    Comment    wait until login button is visible
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    900000000
    Input Password    id:password    123123
    Wait And Click Element    ${login_btn}
    Comment    wait until domain input text element is visible
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login_main_account_error_two
    [Documentation]    输入错误格式的账号 弹出提示店铺地址或者联系方式错误
    [Tags]    P1
    Login Setp
    Comment    wait until login button is visible
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    sdfsdf@@
    Input Password    id:password    123123
    Wait And Click Element    ${login_btn}
    Comment    wait until domain input text element is visible
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login015
    [Documentation]    输入账号,错误密码 弹出提示店铺地址或者联系方式错误
    [Tags]    P1
    Login Setp
    Comment    wait until login button is visible
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    sdfsdf@@
    Input Password    id:password    123123
    Wait And Click Element    ${login_btn}
    Comment    wait until domain input text element is visible
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login_main_account_error_four
    [Documentation]    输入账号,错误为空 弹出提示店铺地址或者联系方式错误
    [Tags]    P1
    Login Setp
    Comment    wait until login button is visible
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${comm_user}
    Input Password    id:password    ${Empty}
    Wait And Click Element    ${login_btn}
    Comment    wait until domain input text element is visible
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login_main_account_five
    [Documentation]    输入账号,密码为空 弹出提示店铺地址或者联系方式错误
    [Tags]    P1
    Login Setp
    Comment    wait until login button is visible
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${comm_user}
    Input Password    id:password    ${Empty}
    Wait And Click Element    ${login_btn}
    Comment    wait until domain input text element is visible
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

*** keywords ***
Login Setp
    Go To    ${home_page}

Logout
    Wait And Click Element    dom:document.querySelectorAll(".hd-line-center")[0]
    Execute JavaScript    return document.querySelectorAll(".account_content___18o60 a")[1].click()
    Sleep    1.5
