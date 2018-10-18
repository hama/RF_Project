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
    [Tags]    P0
    Wait And Input Text    ${locatorB_store_input_storeName}    storeName
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Text    店铺信息更新成功。
    Wait Until Page Not Contains Locator     ${locatorB_button_save00}
    Reload Page And Start Ajax
    Value Of Element Should Be Equal With Wait    ${locatorB_store_input_storeName}    storeName

