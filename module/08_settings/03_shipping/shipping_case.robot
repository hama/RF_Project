*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Test Teardown     Teardown Test Case
Force Tags        Shipping
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_shipping.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_shipping.robot

*** Variables ***

*** Test Cases ***
shipping132
    [Documentation]    创建物流 输入 方案名 点击保存 提示 请添加国家
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    input text    id:name    方案1
    Wait And Click Element    ${shipping_first_button}
    sleep    2
    page should contain element    dom:document.querySelectorAll(".anticon-cross-circle")[0]
    Quit All Shipping

shipping137
    [Documentation]    点击后显示弹窗，显示中国的所有省份并全部处于勾选状态
    [Tags]    P0
    Go To Shipping Page
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    ${name}    salt_py
    input text    id:name    ${name}
    Wait Until Element Is Visible    ${shipping_first_button}
    Wait And Click Element    ${locatorB_shipping_add_country}
    Wait Until Element Is Visible    ${locatorB_shipping_country_save_btn}
    Execute JavaScript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[2].click()
    Execute JavaScript    return document.getElementsByClassName("ant-tree-checkbox-inner")[10].click()
    sleep    1
    Wait And Click Element    ${locatorB_shipping_country_save_btn}
    Wait And Click Element    dom:document.querySelectorAll("#test_shipping_country_edit_icon")[0]
    ${count}    execute javascript    return document.querySelectorAll(".ant-modal-body ul li").length
    Should Be True    ${count}==32
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Shipping

shipping97
    [Documentation]    创建物流 添加中国 弹出删除窗口
    [Tags]    P0
    Go To Shipping Page
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_country}
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[2]
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[10]
    Wait And Click Element    ${locatorB_shipping_country_save_btn}
    Execute JavaScript    return document.querySelectorAll("#test_shipping_country_delete_icon")[0].click()
    sleep    2
    page should contain element    dom:document.querySelectorAll("button")[8]
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Shipping

shipping135
    [Documentation]    只添加重量运费，价格和数量运费不添加
    [Tags]    P0
    Go To Shipping Page
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    sleep    1
    ${name}    salt_py
    input text    id:name    ${name}
    Wait And Click Element    ${locatorB_shipping_add_country}
    Wait Until Element Is Visible    ${locatorB_shipping_country_save_btn}
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[1].click()
    sleep    1
    Wait And Click Element    ${locatorB_shipping_country_save_btn}
    Wait And Click Element    ${locatorB_shipping_add_quantity_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${input_a}    set variable    数量运费
    ${desc_a}    set variable    熟练给运费说明
    input text    ${shipping_first_input}    ${input_a}
    input text    ${locatorB_shipping_description}    ${desc_a}
    input text    ${locatorB_shipping_range_min}    ${range_min}
    input text    ${locatorB_shipping_range_max}    ${range_max}
    input text    ${locatorB_shipping_price}    ${rate_amount}
    sleep    1
    Wait And Click Element    ${locatorB_shipping_freight_save}
    Wait And Click Element    ${shipping_first_button}
    sleep    2
    page should contain element    dom:document.querySelectorAll("#test_shipping_list_0 li")[0]

check_list_data
    [Documentation]    校验list接口数据
    [Tags]    P0
    Go To Shipping Page
    Start Ajax Listener
    Sleep    1.5s
    Execute JavaScript    return document.querySelectorAll("#test_setting_shipping")[0].click()
    #Wait Until Page Contains    ${tax_shipping_tab1}
    sleep    1.5s
    ${dataLength}=    Execute JavaScript    return responseMap.get("${locatorB_shipping_list_api}").data.length;
    : FOR    ${i}    IN RANGE    ${dataLength}
    \    ${res_data}    Execute Javascript    return responseMap.get("${locatorB_shipping_list_api}").data[${i}].shipping_name;
    \    ${ul_data}    Execute Javascript    return document.querySelectorAll("#test_shipping_list_${i} li span")[0].innerHTML
    \    Should Be True    '${res_data}'=='${ul_data}'
    Delete Shipping
    Quit All Setp

0131_shipping
    Go To Shipping Page