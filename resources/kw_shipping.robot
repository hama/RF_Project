*** Settings ***
Documentation     添加物流
Library           SeleniumLibrary
Library           ${CURDIR}/../lib/customLibrary
Resource          kw_browser.robot
Resource          kw_login.robot
Resource          var_shipping.robot

*** Variable ***
${input}          重量运费
${desc}           重量运费说明
${range_min}      10
${range_max}      100
${rate_amount}    9
${input_a}        数量运费
${desc_a}         数量运费说明

*** keyword ***
Add Shipping
    Go To Shipping Page
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    sleep    1
    input text    id:name    ${shipping_name}    #.物流名称
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    click element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll("#name")[1]    ${input}
    input text    dom:document.querySelectorAll("#desc")[0]    ${desc}
    input text    id:range_min    ${range_min}
    input text    id:range_max    ${range_max}
    input text    id:rate_amount    ${rate_amount}
    sleep    1
    click button    id:test_shipping_edit_modal_sure_btn
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    Sleep    1
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll("#name")[1]    ${input_a}
    input text    dom:document.querySelectorAll("#desc")[0]    ${desc_a}
    input text    id:range_min    ${range_min}
    input text    id:range_max    ${range_max}
    input text    id:rate_amount    ${rate_amount}
    sleep    1
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    click link    id:test_save_btn
    sleep    2
    Location Should Be    ${shipping_url}

Delete Shipping
    #.删除物流
    Go To Shipping Page
    Wait Until Element Is Visible    ${add_shipping_btn}
    Click Element    ${shipping_first_element}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    Click Button    ${del_shipp_btn}
    Wait Until Element Is Visible    id:test_delete_modal_sure_btn
    Click Button    id:test_delete_modal_sure_btn
    Page Should Not Contain Element    ${shipping_first_element}
