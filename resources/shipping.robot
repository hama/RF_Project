*** Settings ***
Resource          ./Login.robot
Library           SeleniumLibrary    # import selenium library

*** Variables ***
${home_page}      http://admin1024.shoplazza.com    # feature test enviroment
${is_headless}    false    # whether should use headless chrome
# default user, has everything
${xpath_a}        //*[@id="root"]/div/div/div[1]/div[1]/div/div
${xpath_b}        //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[9]/div
${xpath_c}        //*[@id="9$Menu"]/li[3]/a

*** Keywords ***
Login With Shipping
    [Arguments]    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Open Test Browser    ${home_page}
    Login With User    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
    Wait Until Element Is Visible    ${xpath_a}
    click element    ${xpath_b}
    Wait Until Element Is Visible    ${xpath_c}
    click element    ${xpath_c}
    Wait Until Element Is Visible    ${xpath_d}
    click link    ${xpath_d}
