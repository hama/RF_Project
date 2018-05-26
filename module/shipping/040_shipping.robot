*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
040_shipping
    #.添加运费窗口直接关闭 列表不存在数据
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    click element    class:ant-modal-close-x
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser
