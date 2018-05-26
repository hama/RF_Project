*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
097_shipping
    #创建物流    添加中国    弹出删除窗口
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[2].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[10].click()
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    execute javascript    return document.querySelectorAll("#test_shipping_country_delete_icon")[0].click()
    sleep    2
    page should contain element    id:test_delete_modal_sure_btn
    close browser
