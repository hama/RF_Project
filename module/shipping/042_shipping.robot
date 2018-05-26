*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
042_shipping
    #.添加运费窗口输入内容后直接关闭 再次点击添加按钮 后的编辑窗口里没有数据
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    click element    class:ant-modal-close-x
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain
    close browser
