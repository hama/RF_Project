*** Settings ***
Documentation     税费正常功能测试
Suite Setup       Tax Price Suite Setup
Suite Teardown    Tax Price Suite Teardown
Test Setup        Tax Price Test Cases Setup
Force Tags        tax
Library           SeleniumLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_tax_price.robot
Resource          ../../../resources/var_shipping.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_shipping.robot

*** Test Cases ***
001 Test Forward To Shipping Page
    [Documentation]    测试: 从税费页面点击物流设置跳转到物流页面
    [Tags]    P0
    log    测试页面基本内容
    Page Should Contain    ${content_tax_head_country}
    Page Should Contain    ${content_tax_head_taxPrice}
    Page Should Contain    ${content_tax_head_location}
    Page Should Contain    ${content_tax_head_operation}
    Page Should Contain    ${content_tax_tips_list}
    log    点击设置按钮，跳转到物流设置
    Wait And Click Button    tag:button
    Wait Until Page Contains    ${content_tax_setting}
    Sleep    2
    Page Should Contain    ${content_shipping_tab1}
    Page Should Contain    ${content_shipping_tab2}

002 Test Tax Page Normal
    [Documentation]    [测试内容]: 页面基本组件正常 [预期结果]: 税费页面基本组件正常 [前置条件]: 添加一条物流
    [Tags]    P0
    Page Should Contain    ${content_tax_head_country}
    Page Should Contain    ${content_tax_head_taxPrice}
    Page Should Contain    ${content_tax_head_location}
    Page Should Contain    ${content_tax_head_operation}
    Page Should Contain    ${content_tax_tips_list}
    Log    测试: 检查列表数据是否同接口返回的一致
    Check Tax Page List
    Log    测试: 鼠标移动到税费计算方式的帮助问号上
    Mouse Over    ${locator_tax_help}
    Sleep    1
    Page Should Contain    ${content_tax_tips_count}
    Log    测试: 鼠标移动到设置按钮上
    Mouse Over    ${locator_tax_setting}
    Wait Until Page Contains    ${content_tax_tips_setting}

003 Test Tax Price Setting
    [Documentation]    测试: 税费设置
    [Tags]    P0
    Wait And Click Element    ${locator_tax_setting}
    Wait Until Page Contains    保 存
    Sleep    2
    log    测试: 随机设置税费值，看是否设置成功
    Set Random Price
    Click Button    保 存
    Wait Until Page Does Not Contain    保 存
    log    检查: 税费设置是否生效
    Click Element    ${locator_tax_setting}
    Wait Until Page Contains    保 存
    Sleep    2
    Check City Data
    Click Element    ${locator_tax_close}

004 Test Toggle Tax Switch
    [Documentation]    测试税费开关
    [Tags]    P0
    Assign Id To Element    dom:document.querySelectorAll('.ant-table-tbody .ant-switch')[0];    switch_1
    ${dataLength}=    Execute JavaScript    return responseMap.get("${api_tax_list}").data.list.length;
    log    列表应该不为空，有数据存在
    Should Be True    ${dataLength}>=1
    # 获取原始开关值
    ${rawSwitch}=    Execute JavaScript    return responseMap.get("${api_tax_list}").data.list[0].is_enable;
    Wait And Click Element    id:switch_1
    sleep    1
    Page Should Contain    ${content_tax_tips_setting}
    Check response status
    # 获取设置后开关值
    ${newSwitch}=    Execute JavaScript    return responseMap.get("${api_tax_list}").data.list[0].is_enable;
    Should Not Be True    '${rawSwitch}'=='${newSwitch}'

*** KeyWords ***
Tax Price Suite Setup
    New Test Suite Browser And Login    ${user_default_name}    ${user_default_pwd}    ${user_default_domain}
    Add Shipping
    Start Ajax Listener

Tax Price Suite Teardown
    Delete Shipping
    Close Test Suite Browser

Tax Price Test Cases Setup
    Go To Tax Price Page
    Sleep    1

Check Tax Page List
    log    获取指定接口的数据，使用 Table should countains 关键字判断是否包含
    ${dataLength}=    Execute JavaScript    return responseMap.get("${api_tax_list}").data.list.length;
    : FOR    ${index}    IN RANGE    ${dataLength}
    \    ${rowIndex}=    Evaluate    int(${index}) + 2
    \    ${country_name}=    Execute JavaScript    return responseMap.get("${api_tax_list}").data.list[${index}].country_name;
    \    ${country_name_en}=    Execute JavaScript    return responseMap.get("${api_tax_list}").data.list[${index}].country_name_en;
    \    ${country_price}=    Execute JavaScript    return responseMap.get("${api_tax_list}").data.list[${index}].country_price.toString();
    \    ${zone_total}=    Execute JavaScript    return responseMap.get("${api_tax_list}").data.list[${index}].zone_total.toString();
    \    ${zone_total_msg}=    Set Variable If    '${zone_total}'=='0'    ${content_tax_data_all}    ${zone_total}
    \    Table Cell Should Contain    tag:table    ${rowIndex}    1    ${country_name}
    \    Table Cell Should Contain    tag:table    ${rowIndex}    1    ${country_name_en}
    \    Table Cell Should Contain    tag:table    ${rowIndex}    2    ${country_price}
    \    Table Cell Should Contain    tag:table    ${rowIndex}    3    ${zone_total_msg}

Set Random Price
    [Documentation]    随机设置税费
    ${zone_count}=    Execute JavaScript    return responseMap.get("${api_tax_list}").data.list[0].zone_list.length;
    ${rand_value}=    Evaluate    random.randint(0, 100)    modules=random
    : FOR    ${index}    IN RANGE    ${zone_count}
    \    ${inputIndex}=    Evaluate    int(${index}) + 1
    \    Input Text    dom:document.querySelectorAll('.ant-modal-body .ant-input')[${inputIndex}]    ${rand_value}

Check City Data
    # check city price under country
    ${zone_count}=    Execute JavaScript    return responseMap.get("${api_tax_list}").data.list[0].zone_list.length;
    # find table
    Assign Id To Element    dom:document.querySelectorAll('.ant-modal-body table')[0]    zone_table
    # compare ajax result and the page result
    : FOR    ${index}    IN RANGE    ${zone_count}
    \    ${rowIndex}=    Evaluate    int(${index}) + 2
    \    ${inputIndex}=    Evaluate    int(${index}) + 1
    \    ${zone_name}=    Execute JavaScript    return responseMap.get("${api_tax_list}").data.list[0].zone_list[${index}].zone_name;
    \    ${zone_price}=    Execute JavaScript    return responseMap.get("${api_tax_list}").data.list[0].zone_list[${index}].price.toString();
    \    ${zone_price_show}=    Set Variable If    '${zone_price}'=='0.00'    ${EMPTY}    ${zone_price}
    \    Table Cell Should Contain    id:zone_table    ${rowIndex}    1    ${zone_name}
    \    #Table Cell Should Contain    id:zone_table    ${rowIndex}    2    ${zone_price_show}
    \    Textfield Value Should Be    dom:document.querySelectorAll('.ant-modal-body input')[${inputIndex}]    ${zone_price_show}

Check response status
    ${state}=    Execute JavaScript    return responseMap.get("${api_tax_toggle}").state;
    ${msg}=    Execute JavaScript    return responseMap.get("${api_tax_toggle}").msg;
    Should Be Equal As Strings    ${state}    0
    Should Be Equal As Strings    ${msg}    请求成功
