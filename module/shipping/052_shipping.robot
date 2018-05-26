*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
052_shipping
    #.添加重量运费 在说明框里输入字符 保存提示 其他信息未填写
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    6as51d65a1d65sa65d165as1d56as165d1as56d156as1d56as156d1as65d16sa1d56as1d56as1d6d89f498dfg489fd4g89fd4g89df4gdfg1d3f2g132df1g
    input text    dom:document.querySelectorAll('#desc')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    class:ant-form-explain
    close browser
