*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
092_shipping
    #创建物流    没有输入 方案名 点击保存
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    Wait Until Element Is Visible    id:test_save_btn
    click link    id:test_save_btn
    page should contain element    class:ant-form-explain
    close browser
