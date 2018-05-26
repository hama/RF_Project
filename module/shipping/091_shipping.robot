*** Settings ***
Resource          ../../resources/shipping.robot

*** Test Cases ***
091_shipping
    #.添加数量运费    输入内容 直接关闭窗口，再次打开窗口 没有添加数量运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    input text    dom:document.querySelectorAll("#name")[1]    数量运费
    execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    page should not contain element    dom:document.querySelectorAll("#name")[1].value
    close browser
