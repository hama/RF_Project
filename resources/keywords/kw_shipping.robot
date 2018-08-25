*** Settings ***
Documentation     添加物流
Library           SeleniumLibrary
Library           ${CURDIR}/../../lib/customLibrary
Resource          ../variable/var_common.robot
Resource          ../variable/var_shipping.robot
Resource          kw_browser.robot
Resource          kw_common.robot

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
    [Documentation]    添加物流
    ${name}    salt
    Go To Shipping Page
    Wait And click element    ${locatorB_shipping_add_shipping}
    Wait And input text    id:name    ${name}    #.物流名称
    Wait And click Element    id:test_shipping_country_add_btn
    Wait And click element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    Wait Until Page Contains    Algeria
    Wait And click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    Wait And click Element    id:test_shipping_country_modal_sure_btn
    Wait And click Element    id:test_shipping_add_weight_btn
    Wait And input text    dom:document.querySelectorAll("#name")[1]    ${input}
    Wait And input text    dom:document.querySelectorAll("#desc")[0]    ${desc}
    Wait And input text    id:range_min    ${range_min}
    Wait And input text    id:range_max    ${range_max}
    Wait And input text    id:rate_amount    ${rate_amount}
    Wait And click Element    id:test_shipping_edit_modal_sure_btn
    Wait And click Element    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    Wait And input text    dom:document.querySelectorAll("#name")[1]    ${input_a}
    Wait And input text    dom:document.querySelectorAll("#desc")[0]    ${desc_a}
    Wait And input text    id:range_min    ${range_min}
    Wait And input text    id:range_max    ${range_max}
    Wait And input text    id:rate_amount    ${rate_amount}
    Wait And click Element    id:test_shipping_edit_modal_sure_btn
    Wait And click Element    dom:document.querySelectorAll("button")[1]
    Location Should Be    ${url_shipping}

Add Shipping China
    [Documentation]    添加中国的物流
    ${name}    salt
    Go To Shipping Page
    Wait And click element    ${locatorB_shipping_add_shipping}
    Wait And input text    id:name    ${name}    #.物流名称
    Wait And click element    id:test_shipping_country_add_btn
    Wait And click element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[2]
    Execute JavaScript    return document.getElementsByClassName("ant-tree-checkbox-inner")[10].scrollIntoView()
    Sleep    1
    Wait And click element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[10]
    Wait And click element    id:test_shipping_country_modal_sure_btn
    Wait And click element    id:test_shipping_add_weight_btn
    Wait And input text    dom:document.querySelectorAll("#name")[1]    ${input}
    Wait And input text    dom:document.querySelectorAll("#desc")[0]    ${desc}
    Wait And input text    id:range_min    ${range_min}
    Wait And input text    id:range_max    ${range_max}
    Wait And input text    id:rate_amount    ${rate_amount}
    Wait And click Element    id:test_shipping_edit_modal_sure_btn
    Wait And click Element    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    Wait And input text    dom:document.querySelectorAll("#name")[1]    ${input_a}
    Wait And input text    dom:document.querySelectorAll("#desc")[0]    ${desc_a}
    Wait And input text    id:range_min    ${range_min}
    Wait And input text    id:range_max    ${range_max}
    Wait And input text    id:rate_amount    ${rate_amount}
    Wait And click Element    id:test_shipping_edit_modal_sure_btn
    Wait And click Element    dom:document.querySelectorAll("button")[1]
    Location Should Be    ${url_shipping}

Add Other Country
    [Documentation]    添加其他国家物流
    ${name}    salt
    Go To Shipping Page
    Wait And click element    ${locatorB_shipping_add_shipping}
    Wait And input text    id:name    ${name}    #.物流名称
    Wait And click Element    id:test_shipping_country_add_btn
    Sleep    1
    Wait And click element    dom:document.querySelectorAll(".ant-checkbox")[0]
    Wait And click Element    id:test_shipping_country_modal_sure_btn
    Wait And click Element    id:test_shipping_add_weight_btn
    Wait And input text    dom:document.querySelectorAll("#name")[1]    ${input}
    Wait And input text    dom:document.querySelectorAll("#desc")[0]    ${desc}
    Wait And input text    id:range_min    ${range_min}
    Wait And input text    id:range_max    ${range_max}
    Wait And input text    id:rate_amount    ${rate_amount}
    Wait And click Element    id:test_shipping_edit_modal_sure_btn
    Wait And click Element    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    Wait And input text    dom:document.querySelectorAll("#name")[1]    ${input_a}
    Wait And input text    dom:document.querySelectorAll("#desc")[0]    ${desc_a}
    Wait And input text    id:range_min    ${range_min}
    Wait And input text    id:range_max    ${range_max}
    Wait And input text    id:rate_amount    ${rate_amount}
    Wait And click Element    id:test_shipping_edit_modal_sure_btn
    Wait And click Element    dom:document.querySelectorAll("button")[1]
    Location Should Be    ${url_shipping}

Delete Shipping
    [Documentation]    删除物流
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_first_element}
    Wait Until Element Is Visible    ${locatorB_shipping_add_country}
    Sleep    1
    Execute JavaScript    return document.getElementById("dj").scrollTo(0,10000)
    Wait And Click Element    ${locatorB_shipping_del_shipping}
    Wait And Click Element    dom:document.querySelectorAll("button")[7]
    Sleep    1
    Location Should Be    ${url_shipping}

Quit Adding Shipping
    Wait And Click Element    ${locatorB_setting_shipping}
    Alert Should Be Present

Common Setp
    [Arguments]    ${element}    ${elements_}
    Wait And Click Element    ${element}
    Wait And Click Element    ${elements_}

Quantity All Setp
    [Documentation]    回到添加按钮页面
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_quantity_btn}
    Sleep    1

Quit All Shipping
    [Documentation]    点击页面弹出的确定回到设置按钮页面
    Wait And Click Element    ${locatorB_setting_shipping}
    Sleep    1
    Alert Should Be Present

Quit All Setp
    [Documentation]    回到设置物流按钮页面
    Wait And Click Element    ${locatorB_setting_shipping}
    Sleep    1

Quit Add Country
    [Documentation]    添加国家页面
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_country}
    Sleep    1

Quit Add Price Shipping
    [Documentation]    添加价格运费页面
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_price_btn}
    Sleep    1

Wait Setp
    [Documentation]    等待
    Wait Until Element Is Visible    ${locatorB_shipping_add_country}
