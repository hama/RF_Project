*** Settings ***
Resource          kw_common.robot

*** Keywords ***
Logout
    Wait And Mouse Over    ${locatorB_logout_icon_individualAccount}
    Wait And Click Element    ${locatorB_logout_icon_logout}

Login Testcase Setup
    # 判断是否退出登录
    ${status0}    Run Keyword And Return Status    Wait Until Page Contains Locator    ${locatorB_login_btn_login}    2
    Run Keyword If    '${status0}'=='False'    Logout