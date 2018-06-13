*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Library           customLibrary
Resource          ../../resources/shipping.robot
Resource          ../../resources/tax_price.robot
Resource          ../../resources/browser.robot
Resource          ../../resources/shipping.robot

*** Test Cases ***
001_add_country_shipping
    #添加国家
    #open browser    ${url}    google chrome
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    Wait Until Element Is Visible    ${shipping_add_country}
    Click Element    ${shipping_add_country}
    Sleep    1
    #execute javascript    return document.getElementsByClassName("ant-tree-checkbox")[0].click()
    click element    dom:document.getElementsByClassName("ant-tree-checkbox")[0]
    #execute javascript    return document.getElementById("test_shipping_country_modal_sure_btn").click()
    click button    dom:document.getElementById("test_shipping_country_modal_sure_btn")

012_shipping
    # tax price page should be normal atfer login
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    sleep    1.5
    page should contain link    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    page should contain element    //*[@id="rcDialogTitle0"]/div

013_shipping
    # tax price page should be normal atfer login
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    Wait Until Element Is Visible    id:test_save_btn
    sleep    1
    Input Text    dom:document.querySelectorAll('#name')[0]    中国
    Sleep    1
    Click Element    id:test_save_btn
    Sleep    1
    Page Should Not Contain Element    //*[@id="dj"]/div/div/div[1]/div/div/div/div/div[2]/div

014_shipping
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    Wait Until Element Is Visible    id:test_save_btn
    sleep    1
    input text    dom:document.querySelectorAll('#name')[0]    中
    Click Element    id:test_save_btn
    Page Should Not Contain Element    //*[@id="dj"]/div/div/div[1]/div/div/div/div/div[2]/div

015_shipping
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    Wait Until Element Is Visible    id:test_save_btn
    sleep    1
    input text    dom:document.querySelectorAll('#name')[0]    @#￥
    Click Element    id:test_save_btn
    Page Should Not Contain Element    //*[@id="dj"]/div/div/div[1]/div/div/div/div/div[2]/div

016_shipping
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    Wait Until Element Is Visible    ${shipping_add_country}
    Click Element    ${shipping_add_country}
    click element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    ${count}    get text    class:country_selected___2BYCm
    ${res}    searchStr    ${count}
    #Run keyword If    ${res}==1    run keyword    close browser
    Should Be True    ${res}==1

017_shipping
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    Wait Until Element Is Visible    ${shipping_add_country}
    Click Element    ${shipping_add_country}
    sleep    1.5
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    ${data}    execute javascript    return document.getElementsByClassName("info_cn___N00o6")[1].innerHTML
    click button    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div/table/tbody/tr/td[1]/div/div/p[2]
    Should Be True    '${data}'=='${res}'

018_shipping
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    Wait Until Element Is Visible    ${shipping_add_country}
    Click Element    ${shipping_add_country}
    sleep    1.5
    click element    dom:document.getElementsByClassName("ant-checkbox-input")[0]
    click element    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div/table/tbody/tr/td[1]/div/div/p[2]
    Should Be True    '${res}'=='其他国家'

019_shipping
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    Wait Until Element Is Visible    ${shipping_add_country}
    Click Element    ${shipping_add_country}
    sleep    1.5
    click element    dom:document.getElementsByClassName("ant-checkbox-input")[0]
    click element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    click button    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div/table/tbody/tr/td[1]/div/div/p[2]
    Should Be True    '${res}'<>'其他国家'

020_shipping
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    Wait Until Element Is Visible    ${shipping_add_country}
    Click Element    ${shipping_add_country}
    sleep    1.5
    click element    dom:document.getElementsByClassName("ant-modal-close-x")[0]
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div[2]/span
    #check data
    Should Be True    '${res}'=='暂无数据'
