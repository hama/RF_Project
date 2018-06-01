*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Library           customLibrary
Resource          ../../resources/shipping.robot
Resource          ../../resources/tax_price.robot
Resource          ../../resources/browser.robot

*** Test Cases ***
001_add_country_shipping
    #添加国家
    open browser    ${url}    google chrome
    Wait Until Element Is Visible    //*[@id="root"]/div/div/form/div[4]/button
    input text    id:account    ${uname}
    input password    id:password    ${pwd}
    click button    //*[@id="root"]/div/div/form/div[4]/button
    sleep    2
    click element    //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[9]/div
    sleep    1
    click element    //*[@id="9$Menu"]/li[3]/a
    sleep    1
    click element    //*[@id="dj"]/div/div/div[2]/div[1]/div/div[2]/a
    sleep    1.5
    input text    id:name    shipping1
    click button    //*[@id="dj"]/div/div[2]/div[1]/div[2]/div/button
    sleep    1.5
    #execute javascript    return document.getElementsByClassName("ant-tree-checkbox")[0].click()
    click element    dom:document.getElementsByClassName("ant-tree-checkbox")[0]
    #execute javascript    return document.getElementById("test_shipping_country_modal_sure_btn").click()
    click button    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    close browser

012_shipping
    # tax price page should be normal atfer login
    Open Test Browser    ${home_page}
    Login With User    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div[1]/div/div
    click element    //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[9]/div
    sleep    1.5
    click element    //*[@id="9$Me nu"]/li[3]/a
    Wait Until Element Is Visible    id:test_add_btn
    click element    id:test_add_btn
    sleep    1.5
    page should contain link    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    page should contain element    //*[@id="rcDialogTitle0"]/div
    close browser

013_shipping
    # tax price page should be normal atfer login
    Open Test Browser    ${home_page}
    Login With User    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div[1]/div/div
    click element    //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[9]/div
    sleep    1.5
    click element    //*[@id="9$Menu"]/li[3]/a
    sleep    1
    page should contain link    id:test_add_btn
    click link    id:test_add_btn
    sleep    1.5
    page should contain link    id:test_save_btn
    sleep    1
    click button    id:test_shipping_country_add_btn
    wait until element is visible    id:test_shipping_country_modal_search_btn
    input text    class:ant-input    中国
    click button    id:test_shipping_country_modal_search_btn
    close browser

014_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    class:ant-input
    input text    class:ant-input    中
    click button    id:test_shipping_country_modal_search_btn
    close browser

015_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    class:ant-input
    input text    class:ant-input    @#￥
    click button    id:test_shipping_country_modal_search_btn
    close browser

016_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_search_btn
    #execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    click element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    #execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[1].click()
    ${count}    get text    class:country_selected___2BYCm
    ${res}    searchStr    ${count}
    Run keyword If    ${res}==1    run keyword    close browser
    ...    ELSE    RUn keyword    page should contain element    sdsdsdsd

017_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_search_btn
    sleep    1.5
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    #execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[1].click()
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    ${data}    execute javascript    return document.getElementsByClassName("info_cn___N00o6")[1].innerHTML
    #execute javascript    return document.getElementById("test_shipping_country_modal_sure_btn").click()
    click button    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div/table/tbody/tr/td[1]/div/div/p[2]
    Run keyword If    '${data}'=='${res}'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    dsfsfdsf

018_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_search_btn
    sleep    1.5
    #execute javascript    return document.getElementsByClassName("ant-checkbox-input")[0].click()
    click element    dom:document.getElementsByClassName("ant-checkbox-input")[0]
    #execute javascript    return document.getElementById("test_shipping_country_modal_sure_btn").click()
    click element    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div/table/tbody/tr/td[1]/div/div/p[2]
    Run keyword If    '${res}'=='其他国家'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sadhakjsd

019_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_search_btn
    sleep    1.5
    #execute javascript    return document.getElementsByClassName("ant-checkbox-input")[0].click()
    click element    dom:document.getElementsByClassName("ant-checkbox-input")[0]
    #execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    click element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    #execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[1].click()
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    #execute javascript    return document.getElementById("test_shipping_country_modal_sure_btn").click()
    click button    dom:document.getElementById("test_shipping_country_modal_sure_btn")
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div/table/tbody/tr/td[1]/div/div/p[2]
    Run keyword If    '${res}'<>'其他国家'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sdf6546

020_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_search_btn
    sleep    1.5
    #execute javascript    return document.getElementsByClassName("ant-modal-close-x")[0].click()
    click element    dom:document.getElementsByClassName("ant-modal-close-x")[0]
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div[2]/span
    #check data
    Run keyword If    '${res}'=='暂无数据'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    dsjhh45
