*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
076_shipping
    #.添加数量运费    说明框输入 输入200个以内    保存成功
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#name")[1]    数量运费
    input text    dom:document.querySelectorAll("#desc")[0]    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    //*[@id="dj"]/div/div[5]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser
