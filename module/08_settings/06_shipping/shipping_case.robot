*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${user_default_name}    ${user_default_pwd}    ${user_default_domain}
Suite Teardown    #Close Test Suite Browser
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_shipping.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_shipping.robot
Resource          ./common.robot

*** Variables ***

*** Test Cases ***
093_shipping
    [Documentation]    创建物流 输入 方案名 点击保存 提示 请添加国家
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    sleep    1
    input text    id:name    方案1
    Wait Until Element Is Visible    id:test_save_btn
    click link    id:test_save_btn
    sleep    2
    page should not contain element    id:test_add_btn
    Quit All Shipping

096_shipping
    [Documentation]    创建物流 添加中国 > 点击后显示弹窗，显示中国的所有省份并全部处于勾选状态
    [Tags]    P0
    Go To Shipping Page
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    click element    ${locator_shipping_add_shipping}
    sleep    1
    ${name}    salt
    input text    id:name    ${name}
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    Execute JavaScript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[2].click()
    Execute JavaScript    return document.getElementsByClassName("ant-tree-checkbox-inner")[10].click()
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    click element    dom:document.querySelectorAll("#test_shipping_country_edit_icon")[0]
    sleep    1
    ${count}    execute javascript    return document.querySelectorAll(".ant-modal-body ul li").length
    Should Be True    ${count}==32
    Wait And Click Element    class:ant-modal-close-x
    Quit All Shipping

097_shipping
    [Documentation]    创建物流 添加中国 弹出删除窗口
    [Tags]    P0
    Go To Shipping Page
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    click element    ${locator_shipping_add_shipping}
    sleep    1
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    click element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[2]
    Sleep    1
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[10]
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    Execute JavaScript    return document.querySelectorAll("#test_shipping_country_delete_icon")[0].click()
    sleep    2
    page should contain element    id:test_delete_modal_sure_btn
    Wait And Click Element    class:ant-modal-close-x
    Quit All Shipping

094_shipping
    [Documentation]    创建物流 除了价格运费不添加，其他照常添加 保存成功
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    sleep    1
    ${name}    salt
    input text    id:name    ${name}
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    click element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    ${input}    set variable    重量运费
    ${desc}    set variable    重量运费说明
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll("#name")[1]    ${input}
    input text    dom:document.querySelectorAll("#desc")[0]    ${desc}
    input text    id:range_min    ${range_min}
    input text    id:range_max    ${range_max}
    input text    id:rate_amount    ${rate_amount}
    sleep    1
    click button    id:test_shipping_edit_modal_sure_btn
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${input_a}    set variable    数量运费
    ${desc_a}    set variable    熟练给运费说明
    input text    dom:document.querySelectorAll("#name")[1]    ${input_a}
    input text    dom:document.querySelectorAll("#desc")[0]    ${desc_a}
    input text    id:range_min    ${range_min}
    input text    id:range_max    ${range_max}
    input text    id:rate_amount    ${rate_amount}
    sleep    1
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    click link    id:test_save_btn
    sleep    2
    page should contain element    dom:document.querySelectorAll("button")[1]
    Delete Shipping

095_shipping
    [Documentation]    创建物流 只添加数量运费，重量和价格运费不添加，保存成功
    [Tags]    P0
    Go To Shipping Page
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    Wait And Click Element    ${locator_shipping_add_shipping}
    sleep    1
    ${name}    salt
    input text    id:name    ${name}
    Wait Until Element Is Visible    id:test_save_btn
    Wait And Click Element    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[1].click()
    sleep    1
    Wait And Click Element    id:test_shipping_country_modal_sure_btn
    sleep    1
    Wait And Click Element    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${input_a}    set variable    数量运费
    ${desc_a}    set variable    熟练给运费说明
    input text    dom:document.querySelectorAll("#name")[1]    ${input_a}
    input text    dom:document.querySelectorAll("#desc")[0]    ${desc_a}
    input text    id:range_min    ${range_min}
    input text    id:range_max    ${range_max}
    input text    id:rate_amount    ${rate_amount}
    sleep    1
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait And Click Element    id:test_save_btn
    sleep    2
    page should contain element    dom:document.querySelectorAll("button")[1]

check_list_data
    [Documentation]    校验list接口数据
    [Tags]    P0
    Go To Shipping Page
    Start Ajax Listener
    Sleep    1.5s
    Execute JavaScript    return document.querySelectorAll("#test_setting_shipping")[0].click()
    #Wait Until Page Contains    ${tax_shipping_tab1}
    sleep    1.5s
    ${dataLength}=    Execute JavaScript    return responseMap.get("${page_list_api}").data.length;
    : FOR    ${i}    IN RANGE    ${dataLength}
    \    ${res_data}    Execute Javascript    return responseMap.get("${page_list_api}").data[${i}].shipping_name;
    \    ${ul_data}    Execute Javascript    return document.querySelectorAll("#test_shipping_list_${i} li span")[0].innerHTML
    \    Should Be True    '${res_data}'=='${ul_data}'
    Quit All Setp

092_shipping
    [Documentation]    创建物流 没有输入 方案名 点击保存
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_save_btn
    click link    id:test_save_btn
    page should contain element    class:ant-form-explain
    Quit All Setp
    Delete Shipping
