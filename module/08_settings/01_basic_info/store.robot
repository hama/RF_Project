*** Settings ***
Suite Setup       Store Suite Setup
Suite Teardown    Store Suite Teardown
Test Setup        Store Test Setup
Test Teardown     Teardown Test Case
Force Tags        store
Resource          ../../../resources/keywords/kw_common.robot


*** Test Cases ***
store001
    [Documentation]    店铺信息-店铺名称里UI展示正确
    [Tags]    P1
    Wait Until Page Contains    ${contextB_store_storeInfo}

store002
    [Documentation]    店铺名称可保存小于50个字符
    [Tags]    P0    threshold
    Wait And Input Text    ${locatorB_store_input_storeName}    storeName
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    店铺信息更新成功。
    Wait Until Page Not Contains Locator     ${locatorB_button_save00}
    Reload Page And Start Ajax
    Value Of Element Should Be Equal With Wait    ${locatorB_store_input_storeName}    storeName

store007
    [Documentation]    验证‘店铺链接’UI展示正确
    [Tags]    P0    threshold
    Element Attribute Should Be Equal With Wait    ${locatorB_store_input_storeLink}     class    ant-input ant-input-disabled

store025
    [Documentation]    验证可选择货币
    [Tags]    P0    threshold
    Wait And Select From List By Clicking    ${locatorB_store_select_currency}     ${locatorB_store_select_childSetCurrency}[3]
    Wait And Click Element    ${locatorB_popUps_button_footermiddle}
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    店铺信息更新成功。
    Reload Page And Start Ajax
    Wait Until Page Not Contains Locator    ${locatorB_button_save00}
    Text Of Element Should Be Equal With Wait     ${locatorB_store_select_currency}      CAD

store027
    [Documentation]    验证可选择时区
    [Tags]    P0    threshold
    Wait And Select From List By Clicking    ${locatorB_store_select_timeZone}     ${locatorB_store_select_childTime}[32]
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    店铺信息更新成功。
    Reload Page And Start Ajax
    Wait Until Page Not Contains Locator    ${locatorB_button_save00}
    Text Of Element Should Be Equal With Wait     ${locatorB_store_select_timeZone}    (GMT + 13:00) 努库阿洛法，萨摩亚

