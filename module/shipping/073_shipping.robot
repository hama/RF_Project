*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
073_shipping
    #.添加数量运费    输入 数量运费    保存    列表显示 数量运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    数量运费
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${getdata}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[0].innerText
    Run keyword If    '${getdata}'=='${data}'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    sd454
