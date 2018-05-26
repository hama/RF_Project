*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
067_shipping
    #.添加重量运费    直接关掉窗口 列表不存在运费信息
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    page should not contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser
