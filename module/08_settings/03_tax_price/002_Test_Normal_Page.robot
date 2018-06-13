*** Settings ***
Documentation     测试税费页面基本功能: 帮助提示、设置按钮提示、界面基本内容展示
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Suite Teardown    Close Test Suite Browser
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        tax
Resource          ../../../resources/shoplaza_login.robot
Resource          ../../../resources/browser.robot
Resource          ../../../resources/tax_price.robot

*** Test Cases ***
Test_Tax_Page_Normal
    [Documentation]    测试税费页面基本组件
    [Tags]    P0
    Go TO    ${home_page}
    Wait Until Element Is Visible    class:icon_setting___3OCQq
    Click Element    class:icon_setting___3OCQq
    Start Ajax Listener
    log    测试: 点击税费设置，页面加载数据并展示，判断页面展示内容是否同接口获取的数据一致.
    Assign Id To Element    xpath://ul[@id="9$Menu"]//li[4]    tax_price_btn
    Wait Until Element Is Visible    id:tax_price_btn
    Click Element    id:tax_price_btn
    Wait Until Page Contains    ${tax_price_setting}
    sleep    1
    Page Should Contain    ${tax_page_country}
    Page Should Contain    ${tax_page_country_price}
    Page Should Contain    ${tax_page_location}
    Page Should Contain    ${tax_page_operation}
    Page Should Contain    ${tax_page_tips}
    log    测试: 检查列表数据是否同接口返回的一致
    Check Tax Page List
    log    测试: 鼠标移动到税费计算方式的帮助问号上
    Mouse Over    dom:document.querySelectorAll('.hd-line-help')[1];
    Wait Until Page Contains    ${tax_page_count_tips}
    log    测试: 鼠标移动到设置按钮上
    Mouse Over    dom:document.querySelectorAll('.card-col-Setting')[0];
    Wait Until Page Contains    ${tax_page_setting_hover_tips}

Test_Set_Tax_Price
    [Documentation]    测试: 税费设置
    [Tags]    P0
    # click setting btn
    Click Element    dom:document.querySelectorAll('.card-col-Setting')[0];
    Wait Until Page Contains    保 存
    Sleep    2
    log    测试: 随机设置税费值，看是否设置成功
    Set Random Price
    Click Button    保 存
    Wait Until Page Does Not Contain    保 存
    log    检查: 税费设置是否生效
    Click Element    dom:document.querySelectorAll('.card-col-Setting')[0];
    Wait Until Page Contains    保 存
    Check City Data
    Click Element    class:ant-modal-close-x

*** KeyWords ***
Check Tax Page List
    log    获取指定接口的数据，使用 Table should countains 关键字判断是否包含
    ${dataLength}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list.length;
    : FOR    ${index}    IN RANGE    ${dataLength}
    \    ${rowIndex}=    Evaluate    int(${index}) + 2
    \    ${country_name}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list[${index}].country_name;
    \    ${country_name_en}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list[${index}].country_name_en;
    \    ${country_price}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list[${index}].country_price.toString();
    \    ${zone_total}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list[${index}].zone_total.toString();
    \    ${zone_total_msg}=    Set Variable If    '${zone_total}'=='0'    ${tax_page_zone_total_all}    ${zone_total}
    \    Table Cell Should Contain    tag:table    ${rowIndex}    1    ${country_name}
    \    Table Cell Should Contain    tag:table    ${rowIndex}    1    ${country_name_en}
    \    Table Cell Should Contain    tag:table    ${rowIndex}    2    ${country_price}
    \    Table Cell Should Contain    tag:table    ${rowIndex}    3    ${zone_total_msg}

Set Random Price
    [Documentation]    随机设置税费
    ${zone_count}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list[0].zone_list.length;
    ${rand_value}=    Evaluate    random.randint(0, 100)    modules=random
    : FOR    ${index}    IN RANGE    ${zone_count}
    \    ${inputIndex}=    Evaluate    int(${index}) + 1
    \    Input Text    dom:document.querySelectorAll('.ant-modal-body .ant-input')[${inputIndex}]    ${rand_value}

Check City Data
    # check city price under country
    ${zone_count}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list[0].zone_list.length;
    # find table
    Assign Id To Element    dom:document.querySelectorAll('.ant-modal-body table')[0]    zone_table
    # compare ajax result and the page result
    : FOR    ${index}    IN RANGE    ${zone_count}
    \    ${rowIndex}=    Evaluate    int(${index}) + 2
    \    ${inputIndex}=    Evaluate    int(${index}) + 1
    \    ${zone_name}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list[0].zone_list[${index}].zone_name;
    \    ${zone_price}=    Execute JavaScript    return responseMap.get("${tax_page_list_interface}").data.list[0].zone_list[${index}].price.toString();
    \    ${zone_price_show}=    Set Variable If    '${zone_price}'=='0.00'    ${EMPTY}    ${zone_price}
    \    Table Cell Should Contain    id:zone_table    ${rowIndex}    1    ${zone_name}
    \    #Table Cell Should Contain    id:zone_table    ${rowIndex}    2    ${zone_price_show}
    \    Textfield Value Should Be    dom:document.querySelectorAll('.ant-modal-body input')[${inputIndex}]    ${zone_price_show}
