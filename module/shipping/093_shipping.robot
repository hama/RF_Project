*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
093_shipping
    #创建物流    输入 方案名 点击保存 提示 请添加国家
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    input text    id:name    方案1
    Wait Until Element Is Visible    id:test_save_btn
    click link    id:test_save_btn
    sleep    2
    page should not contain element    id:test_add_btn
    close browser
