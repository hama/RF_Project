*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${user_default_name}    ${user_default_pwd}    ${user_default_domain}
Suite Teardown    Close Test Suite Browser
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_shipping.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_shipping.robot
Library           customLibrary

*** Test Cases ***
001_add_country_shipping
    [Documentation]    添加国家
    [Tags]    P0
    Go To Shipping Page
    Add Shipping Setp
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-checkbox")[0]
    Wait And Click Element    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    Page Should Contain Element    class:ant-table-body
    Quit Adding Shipping

013_shipping
    [Documentation]    tax price page should be normal atfer login
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_save_btn
    sleep    1
    Input Text    dom:document.querySelectorAll('#name')[0]    中国
    Sleep    1
    Wait And Click Element    id:test_save_btn
    Page Should Not Contain Element    class:title___29mch
    Quit Adding Shipping

014_shipping
    [Documentation]    物流方案输入中
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_save_btn
    sleep    1
    input text    dom:document.querySelectorAll('#name')[0]    中
    Wait And Click Element    id:test_save_btn
    Page Should Not Contain Element    class:title___29mch
    Quit Adding Shipping

015_shipping
    [Documentation]    物流方案输入 特殊字符
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_save_btn
    sleep    1
    input text    dom:document.querySelectorAll('#name')[0]    @#￥
    Wait And Click Element    id:test_save_btn
    Page Should Not Contain Element    class:title___29mch
    Quit Adding Shipping

016_shipping
    [Documentation]    选择国家后 列表选中国家出现1
    [Tags]    P0
    Go To Shipping Page
    Add Shipping Setp
    Sleep    1
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    ${count}    get text    class:country_selected___2BYCm
    ${res}    searchStr    ${count}
    Should Be True    ${res}==1
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-close-x")[0]

017_shipping
    [Documentation]    选择国家后 列表出现对应的国家
    [Tags]    P0
    Go To Shipping Page
    Add Shipping Setp
    sleep    1
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    ${data}    execute javascript    return document.getElementsByClassName("info_cn___N00o6")[1].innerHTML
    Wait And Click Element    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    dom:document.querySelectorAll(".name_wrapper___Kkqpr p")[1]
    Should Be True    '${data}'=='${res}'
    Quit Adding Shipping

018_shipping
    [Documentation]    选择国家的`其他国家` 列表出现其他国家
    [Tags]    P0
    Go To Shipping Page
    Add Shipping Setp
    Wait And Click ELement    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    Wait And Click Element    dom:document.querySelectorAll(".ant-checkbox-input")[1]
    Wait And Click Element    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    dom:document.querySelectorAll(".name_wrapper___Kkqpr p")[1]
    Should Be True    '${res}'=='其他国家'
    Quit Adding Shipping

019_shipping
    [Documentation]    选择国家的随意一个国家 列表不会出现`其他国家`
    [Tags]    P0
    Go To Shipping Page
    Add Shipping Setp
    sleep    1.5
    Click Element    dom:document.getElementsByClassName("ant-checkbox-input")[0]
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    Wait And Click Element    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    dom:document.querySelectorAll(".name_wrapper___Kkqpr p")[1]
    Should Be True    '${res}'<>'其他国家'
    Quit Adding Shipping

020_shipping
    [Documentation]    选择国家不选国家 列表提示暂无数据
    [Tags]    P1
    Go To Shipping Page
    Sleep    1
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_country}
    Sleep    1
    Wait And Click Element    ${locator_shipping_add_country}
    Wait And Click Element    dom:document.getElementsByClassName("ant-modal-close-x")[0]
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-table-placeholder span")[0].innerText
    #check data
    Should Be True    '${res}'=='暂无数据'

*** Keywords ***
Quit Adding Shipping
    Wait Until Element is Visible    ${locator_setting_shipping}
    Click Element    ${locator_setting_shipping}
    Alert Should Be Present

Add Shipping Setp
    Wait And click element    ${locator_shipping_add_shipping}
    Wait And Click Element    ${locator_shipping_add_country}
    Sleep    1
