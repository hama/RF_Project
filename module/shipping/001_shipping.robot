*** Settings ***
Library           Selenium2Library
Library           ${CURDIR}/../../lib/customLibrary

*** Test Cases ***
001_shipping
    #添加国家
    import variables    /Users/dianjiang/shoplaza/shoplaza_robot/config.py
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
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox")[0].click()
    execute javascript    return document.getElementById("test_shipping_country_modal_sure_btn").click()
    close browser
