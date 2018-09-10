*** Settings ***


*** Keywords ***
Logout
    Mouse Over    dom:document.querySelectorAll("i[class~='hd-line-center']")[0]
    Wait And Click Element    dom:document.querySelectorAll("div[class='account_content___18o60'] a")[1]

Login Testcase Setup
    # 判断是否退出登录
    ${status0}    Run Keyword And Return Status    Wait Until Page Contains Element    ${locatorB_login_btn_login}    2    0
    Run Keyword If    '${status0}'=='False'    Logout