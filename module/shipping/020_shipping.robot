*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
020_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_search_btn
    sleep    1.5
    execute javascript    return document.getElementsByClassName("ant-modal-close-x")[0].click()
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div[2]/span
    #check data
    Run keyword If    '${res}'=='暂无数据'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    dsjhh45
