*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
018_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_search_btn
    sleep    1.5
    execute javascript    return document.getElementsByClassName("ant-checkbox-input")[0].click()
    execute javascript    return document.getElementById("test_shipping_country_modal_sure_btn").click()
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div/table/tbody/tr/td[1]/div/div/p[2]
    Run keyword If    '${res}'=='其他国家'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sadhakjsd
