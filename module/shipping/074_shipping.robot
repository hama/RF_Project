*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
074_shipping
    #.添加数量运费    输入 输入超过50字符的内容    保存    提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain
    close browser
