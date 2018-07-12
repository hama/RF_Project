*** Settings ***
Resource          ./kw_common.robot
Resource          ./kw_browser.robot
Library           SeleniumLibrary
Resource          var_common.robot

*** Variables ***
${is_headless}    false    # whether should use headless chrome
# default user, has everything
${xpath_a}        //*[@id="root"]/div/div/div[1]/div[1]/div/div
${xpath_b}        //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[9]/div
${xpath_c}        //*[@id="9$Menu"]/li[4]/a

*** Keywords ***
Login With Payment
    [Arguments]    ${xpath_a}    ${xpath_b}    ${xpath_c}
    Open Test Browser    ${home_page}
    Login With User    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
    Wait Until Element Is Visible    ${xpath_a}
    click element    ${xpath_b}
    Wait Until Element Is Visible    ${xpath_c}
    click element    ${xpath_c}
    sleep    1
    #Wait Until Element Is Visible    ${xpath_d}
    #click link    ${xpath_d}
