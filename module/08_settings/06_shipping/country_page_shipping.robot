*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${user_default_name}    ${user_default_pwd}    ${user_default_domain}
Suite Teardown    Close Test Suite Browser
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_shipping.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_shipping.robot

*** Test Cases ***
001_add_country_shipping
    #添加国家
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_country}
    Sleep    1
    Click Element    ${locator_shipping_add_country}
    Sleep    1
    page should contain element    //*[@id="rcDialogTitle0"]/div
    click element    dom:document.getElementsByClassName("ant-tree-checkbox")[0]
    Sleep    1
    click button    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    Sleep    1
    Quit Adding Shipping

013_shipping
    # tax price page should be normal atfer login
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_save_btn
    sleep    1
    Input Text    dom:document.querySelectorAll('#name')[0]    中国
    Sleep    1
    Click Element    id:test_save_btn
    Sleep    1
    Page Should Not Contain Element    //*[@id="dj"]/div/div/div[1]/div/div/div/div/div[2]/div
    Quit Adding Shipping

014_shipping
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_save_btn
    sleep    1
    input text    dom:document.querySelectorAll('#name')[0]    中
    Click Element    id:test_save_btn
    Page Should Not Contain Element    //*[@id="dj"]/div/div/div[1]/div/div/div/div/div[2]/div
    Quit Adding Shipping

015_shipping
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_save_btn
    sleep    1
    input text    dom:document.querySelectorAll('#name')[0]    @#￥
    Click Element    id:test_save_btn
    Page Should Not Contain Element    //*[@id="dj"]/div/div/div[1]/div/div/div/div/div[2]/div
    Quit Adding Shipping

016_shipping
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_country}
    Sleep    1
    Click Element    ${locator_shipping_add_country}
    Sleep    1
    click element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    Sleep    1
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    ${count}    get text    class:country_selected___2BYCm
    ${res}    searchStr    ${count}
    #Run keyword If    ${res}==1    run keyword    close browser
    Should Be True    ${res}==1

017_shipping
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_country}
    Sleep    1
    Click Element    ${locator_shipping_add_country}
    sleep    1.5
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    ${data}    execute javascript    return document.getElementsByClassName("info_cn___N00o6")[1].innerHTML
    click button    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div/table/tbo../../../td[1]/div/div/p[2]
    Should Be True    '${data}'=='${res}'

018_shipping
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_country}
    Click Element    ${locator_shipping_add_country}
    sleep    1.5
    click element    dom:document.getElementsByClassName("ant-checkbox-input")[0]
    click element    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div/table/tbo../../../td[1]/div/div/p[2]
    Should Be True    '${res}'=='其他国家'

019_shipping
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_country}
    Click Element    ${locator_shipping_add_country}
    sleep    1.5
    click element    dom:document.getElementsByClassName("ant-checkbox-input")[0]
    click element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    click button    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div/table/tbo../../../td[1]/div/div/p[2]
    Should Be True    '${res}'<>'其他国家'

020_shipping
    Go To Shipping Page
    Sleep    1
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_country}
    Sleep    1
    Click Element    ${locator_shipping_add_country}
    sleep    1.5
    click element    dom:document.getElementsByClassName("ant-modal-close-x")[0]
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div[2]/span
    #check data
    Should Be True    '${res}'=='暂无数据'

jsjjd
    Go To Setting Page
    del_products

*** Keywords ***
Quit Adding Shipping
    Wait Until Element is Visible    ${locator_setting_shipping}
    Click Element    ${locator_setting_shipping}
    Alert Should Be Present
