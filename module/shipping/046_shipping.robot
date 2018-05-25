*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
046_shipping
    #.添加运费 在名称输入 123 后    保存 列表里显示 123对应信息
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    123
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser
