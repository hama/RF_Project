*** Settings ***
Resource          ../../resources/kw_browser.robot
Resource          ../../resources/var_tax_price.robot
Library           SeleniumLibrary
Library           customLibrary

*** Variable ***
${uname}          98989898
${u_format}       $93!@#

*** Test Cases ***
login_psss
    #.登陆成功
    Comment    wait until login button is visible
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${defaultUser}
    Input Password    id:password    ${defaultPassword}
    Click Button    ${login_btn}
    Comment    wait until domain input text element is visible
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${defaultDomain}
    Click Button    ${login_btn}
    Sleep    1.5
    Page Should Contain Element    ${order_list_btn}

login_error_one
    #.输入未注册的手机号 弹出提示店铺地址或者联系方式错误
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${uname}
    Input Password    id:password    ${defaultPassword}
    Click Button    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login_error_two
    #.输入格式错误的账号 弹出提示店铺地址或者联系方式错误
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${Empty}
    Input Password    id:password    ${defaultPassword}
    Click Button    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login_error_three
    #.账号为空 弹出提示店铺地址或者联系方式错误
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${u_format}
    Input Password    id:password    ${defaultPassword}
    Click Button    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login_error_four
    #.输入正确账号，密码错误 弹出提示店铺地址或者联系方式错误
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${defaultUser}
    Input Password    id:password    ${uname}
    Click Button    ${login_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${defaultDomain}
    Click Button    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice")

login_error_five
    #.输入正确账号，密码为空 弹出提示店铺地址或者联系方式错误
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${defaultUser}
    Input Password    id:password    1${Empty}
    Click Button    ${login_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${defaultDomain}
    Click Button    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice")

login_error_six
    #.输入正确账号，密码    域名为空 弹出提示店铺地址或者联系方式错误
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${defaultUser}
    Input Password    id:password    1${Empty}
    Click Button    ${login_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    ${Empty}
    Click Button    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login_error_seven
    #.输入正确账号，密码    域名错误 弹出提示店铺地址或者联系方式错误
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${defaultUser}
    Input Password    id:password    1${Empty}
    Click Button    ${login_btn}
    Wait Until Element Is Visible    id:username
    Input Text    id:username    dgdfg
    Click Button    ${login_btn}
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice")

login_main_account_pass
    #.登陆成功
    Comment    wait until login button is visible
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${main_user}
    Input Password    id:password    ${main_pwd}
    Click Button    ${login_btn}
    Comment    wait until domain input text element is visible
    Sleep    1.5
    Page Should Contain Element    ${order_list_btn}

login_main_account_error
    #.输入未注册的手机号 弹出提示店铺地址或者联系方式错误
    Comment    wait until login button is visible
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    900000000
    Input Password    id:password    ${main_pwd}
    Click Button    ${login_btn}
    Comment    wait until domain input text element is visible
    Sleep    1.5
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login_main_account_error_two
    #.输入错误格式的账号 弹出提示店铺地址或者联系方式错误
    Comment    wait until login button is visible
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    sdfsdf@@
    Input Password    id:password    ${main_pwd}
    Click Button    ${login_btn}
    Comment    wait until domain input text element is visible
    Sleep    1.5
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login_main_account_error_three
    #.输入账号,错误密码 弹出提示店铺地址或者联系方式错误
    Comment    wait until login button is visible
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    sdfsdf@@
    Input Password    id:password    ${main_pwd}
    Click Button    ${login_btn}
    Comment    wait until domain input text element is visible
    Sleep    1.5
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login_main_account_error_four
    #.输入账号,错误为空 弹出提示店铺地址或者联系方式错误
    Comment    wait until login button is visible
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${main_user}
    Input Password    id:password    ${Empty}
    Click Button    ${login_btn}
    Comment    wait until domain input text element is visible
    Sleep    1.5
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

login_main_account_five
    #.输入账号,错误为空 弹出提示店铺地址或者联系方式错误
    Comment    wait until login button is visible
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${login_btn}
    Input Text    id:account    ${main_user}
    Input Password    id:password    ${main_pwd}
    Click Button    ${login_btn}
    Comment    wait until domain input text element is visible
    Sleep    1.5
    Page Should Contain Element    ${order_list_btn}
