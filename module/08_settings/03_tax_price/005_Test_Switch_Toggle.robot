*** Settings ***
Documentation     测试税费开关设置
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Suite Teardown    Close Test Suite Browser
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Resource          ../../../resources/shoplaza_login.robot
Resource          ../../../resources/browser.robot
Resource          ../../../resources/tax_price.robot

*** Variables ***
${tax_page_toggle_switch_api}    http://admin1024.shoplazza.com/api/tax/toggle
${tax_page_list_api}    http://admin1024.shoplazza.com/api/tax/list

*** Test Cases ***
Test Toggle Tax Switch
    [Documentation]    测试税费开关
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    # using xpath temporary(should be instead by element id)
    Assign Id To Element    xpath://ul[@id="9$Menu"]//li[4]    tax_price_btn
    Wait Until Element Is Visible    id:tax_price_btn
    Start Ajax Listener
    Click Element    id:tax_price_btn
    Wait Until Page Contains    ${tax_price_setting}
    sleep    2
    Assign Id To Element    dom:document.querySelectorAll('.ant-table-tbody .ant-switch')[0];    switch_1
    ${dataLength}=    Execute JavaScript    return responseMap.get("${tax_page_list_api}").data.list.length;
    log    列表应该不为空，有数据存在
    Should Be True    ${dataLength}>=1
    # 获取原始开关值
    ${rawSwitch}=    Execute JavaScript    return responseMap.get("${tax_page_list_api}").data.list[0].is_enable;
    Click Element    id:switch_1
    sleep    2
    Page Should Contain    ${tax_page_setting_ok}
    Check response status
    # 获取设置后开关值
    ${newSwitch}=    Execute JavaScript    return responseMap.get("${tax_page_list_api}").data.list[0].is_enable;
    Should Not Be True    '${rawSwitch}'=='${newSwitch}'

*** KeyWords ***
Check response status
    ${state}=    Execute JavaScript    return responseMap.get("${tax_page_toggle_switch_api}").state;
    ${msg}=    Execute JavaScript    return responseMap.get("${tax_page_toggle_switch_api}").msg;
    Should Be Equal As Strings    ${state}    0
    Should Be Equal As Strings    ${msg}    请求成功
