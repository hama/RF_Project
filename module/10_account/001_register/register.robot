*** Settings ***
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
    #.注册
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    ${recover_domain}
    input password    id:password    ${recover_password}
    input password    id:confirmpass    ${recover_password}
    input text    id:account    ${recover_user}
    sleep    1
    click button    dom:document.querySelectorAll("button")[0]
    sleep    2
    ${code}    select code    ${recover_user}
    input text    id:code    ${code}
    sleep    1
    click button    dom:document.querySelectorAll("button")[1]
    sleep    2
    page should contain element    //*[@id="root"]

register_error_one
    #.注册 输入已注册的账号 提示错误
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    ${defaultDomain}
    input password    id:password    ${recover_password}
    input password    id:confirmpass    ${recover_password}
    input text    id:account    ${defaultUser}
    sleep    1
    click button    dom:document.querySelectorAll("button")[0]
    sleep    2
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice-content")[0]

register_error_two
    #.注册 输入格式错误的域名 提示错误
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    @!@$1
    sleep    1
    click button    dom:document.querySelectorAll("button")[0]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

register_error_three
    #.注册 域名为空 提示错误
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    ${Empty}
    sleep    1
    click button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

register_error_four
    #.注册 输入未注册的域名    密码为空 提示错误
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input text    id:account    ${defaultUser}
    sleep    1
    click button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

register_error_five
    #.注册 输入未注册的域名    密码5位 提示错误
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    12345
    input password    id:confirmpass    12345
    input text    id:account    ${defaultUser}
    sleep    1
    click button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

register_error_six
    #.注册 输入未注册的域名    密码13位 提示错误
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    1234512345678
    input password    id:confirmpass    1234512345678
    input text    id:account    ${defaultUser}
    sleep    1
    click button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

register_error_seven
    #.注册 输入未注册的域名    密码6位 确认密码为空    提示错误
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    1234512345678
    input password    id:confirmpass    ${Empty}
    input text    id:account    ${defaultUser}
    sleep    1
    click button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

register_error_eaght
    #.注册 输入未注册的域名    2次密码输入不一致    提示错误
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    123451234
    input password    id:confirmpass    987654321
    input text    id:account    ${defaultUser}
    sleep    1
    click button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

register_error_nine
    #.注册 输入未注册的域名-密码 错误格式账号    提示错误
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    123451234
    input password    id:confirmpass    123451234
    input text    id:account    2$$%%@1q
    sleep    1
    click button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

register_error_ten
    #.注册 输入未注册的域名-密码 账号为空    提示错误
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    123451234
    input password    id:confirmpass    123451234
    input text    id:account    ${Empty}
    sleep    1
    click button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

register_error_eleven
    #.注册 输入未注册的域名-密码 验证码错误    提示错误
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    123451234
    input password    id:confirmpass    123451234
    input text    id:account    ${defaultUser}
    Click Element    dom:document.querySelectorAll("button")[0]
    sleep    1
    Input Text    id:code    999999
    click button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-message-notice-content")[0]

register_error_twelve
    #.注册 输入未注册的域名-密码 验证码4位数    提示错误
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    123451234
    input password    id:confirmpass    123451234
    input text    id:account    ${defaultUser}
    Click Element    dom:document.querySelectorAll("button")[0]
    sleep    1
    Input Text    id:code    9999
    click button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

register_error_thirteen
    #.注册 输入未注册的域名-密码 验证码为空    提示错误
    Comment    register
    Open Test Browser    ${home_page}
    Wait Until Element Is Visible    ${register_btn}
    Click Element    ${register_btn}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    input text    id:username    lalala
    input password    id:password    123451234
    input password    id:confirmpass    123451234
    input text    id:account    ${defaultUser}
    Click Element    dom:document.querySelectorAll("button")[0]
    sleep    1
    Input Text    id:code    ${Empty}
    click button    dom:document.querySelectorAll("button")[1]
    Sleep    1
    Page Should Contain Element    dom:document.querySelectorAll(".ant-form-explain")[0]

logout
    #.退出登陆
    Comment    logout
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
    Click Element    //*[@id="root"]/div/div/div[1]/div[2]/div[1]/div[1]/div[2]/div[3]/a
    Sleep    1
    Click Element    //*[@id="root"]/div/div/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/span[2]
    Page SHould COntain Element    //*[@id="root"]/div/div/form/div[5]/button
