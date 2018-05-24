*** Settings ***
Resource          ../../resources/shoplaza_login.robot

*** Test Cases ***
012_shipping
    # tax price page should be normal atfer login
    Open Test Browser    ${home_page}
    Login With User    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div[1]/div/div
    click element    //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[9]/div
    sleep    1.5
    click element    //*[@id="9$Menu"]/li[3]/a
    Wait Until Element Is Visible    id:test_add_btn
    click element    id:test_add_btn
    sleep    1.5
    page should contain link    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    page should contain element    //*[@id="rcDialogTitle0"]/div
    close browser