*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${comm_user}    ${comm_pwd}    ${comm_domain}
Suite Teardown    Close Test Suite Browser
Force Tags        Shipping
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_shipping.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_shipping.robot
Library           customLibrary
Resource          ./common.robot

*** Test Cases ***
012_shipping
    [Documentation]    添加国家
    [Tags]    P0
    Go To Shipping Page
    Quit Add Country
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-checkbox")[0]
    Wait And Click Element    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    Page Should Contain Element    class:ant-table-body
    Quit All Shipping

013_shipping
    [Documentation]    tax price page should be normal atfer login
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    sleep    1
    Input Text    dom:document.querySelectorAll('#name')[0]    中国
    Sleep    1
    Wait And Click Button    dom:document.querySelectorAll("button")[1]
    Page Should Not Contain Element    class:title___29mch
    Quit All Shipping

017_shipping
    [Documentation]    物流方案输入中
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    sleep    1
    input text    dom:document.querySelectorAll('#name')[0]    中
    Wait And Click Button    dom:document.querySelectorAll("button")[1]
    Page Should Not Contain Element    class:title___29mch
    Quit All Shipping

018_shipping
    [Documentation]    物流方案输入 特殊字符
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
    sleep    1
    input text    dom:document.querySelectorAll('#name')[0]    @#￥
    Wait And Click Button    dom:document.querySelectorAll("button")[1]
    Page Should Not Contain Element    class:title___29mch
    Quit All Shipping

019_shipping
    [Documentation]    选择国家后 列表选中国家出现1
    [Tags]    P0
    Go To Shipping Page
    Quit Add Country
    Sleep    1
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    ${count}    get text    class:country_selected___2BYCm
    ${res}    searchStr    ${count}
    Should Be True    ${res}==1
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-close-x")[0]

022_shipping
    [Documentation]    选择国家后 列表出现对应的国家
    [Tags]    P0
    Go To Shipping Page
    Quit Add Country
    sleep    1
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    ${data}    execute javascript    return document.getElementsByClassName("info_cn___N00o6")[1].innerHTML
    Wait And Click Element    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    dom:document.querySelectorAll(".name_wrapper___Kkqpr p")[1]
    Should Be True    '${data}'=='${res}'
    Quit All Shipping

024_shipping
    [Documentation]    选择国家的`其他国家` 列表出现其他国家
    [Tags]    P0
    Go To Shipping Page
    Quit Add Country
    Sleep    1.5
    Execute JavaScript    return document.getElementsByClassName("ant-checkbox-input")[0].click()
    Wait And Click Element    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    dom:document.querySelectorAll(".name_wrapper___Kkqpr p")[1]
    Should Be True    '${res}'=='其他国家'
    Quit All Shipping

025_shipping
    [Documentation]    选择国家的随意一个国家 列表不会出现`其他国家`
    [Tags]    P0
    Go To Shipping Page
    Quit Add Country
    sleep    1.5
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    Wait And Click Element    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    dom:document.querySelectorAll(".name_wrapper___Kkqpr p")[1]
    Should Be True    '${res}'<>'其他国家'
    Quit All Shipping

027_shipping
    [Documentation]    选择国家不选国家 列表提示暂无数据
    [Tags]    P1
    Go To Shipping Page
    Sleep    1
    Quit Add Country
    Wait And Click Element    dom:document.getElementsByClassName("ant-modal-close-x")[0]
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-table-placeholder span")[0].innerText
    #check data
    Should Be True    '${res}'=='暂无数据'
    Quit All Setp
