*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Force Tags        Shipping
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_shipping.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_shipping.robot

*** Test Cases ***
shipping029
    [Documentation]    add transport price >> check add transport price windows
    [Tags]    P0
    #.check button
    Go To Shipping Page
    Quantity All Setp
    page should contain button    ${locatorB_shipping_freight_save}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping032
    [Documentation]    add transport price check name input (str)
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    #.输入名称
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    Page Should Contain Element    ${locatorB_shipping_freight_first_input}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping033
    [Documentation]    add transport price check name input (int)
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    #.输入名称
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    123
    Page Should Contain Element    ${locatorB_shipping_freight_first_input}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping034
    [Documentation]    保存成功，关闭弹窗，价格运费列表中显示 价格运费的信息
    [Tags]    P0
    #.add    transport price    check
    Go To Shipping Page
    Quit Add Price Shipping
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    sleep    1.5
    Wait And Click Element    ${locatorB_shipping_freight_save}
    page should contain element    ${locatorB_shipping_freight_content_elm}
    Quit All Shipping

shipping035
    [Documentation]    输入50个字符点击保存
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${str}    set variable    sssssssssssssssssssssssssssssssssssssssssssssssss
    input text    ${locatorB_shipping_freight_first_input}    ${str}
    sleep    1.5
    Wait And Click Element    ${locatorB_shipping_freight_save}
    page should contain element    ${locatorB_shipping_freight_content_elm}
    Quit All Shipping

shipping036
    [Documentation]    输入超过50个字符点击保存
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${str}    set variable    ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    input text    ${locatorB_shipping_freight_first_input}    ${str}
    sleep    1.5
    page should contain element    ${locatorB_shipping_freight_error_elm}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping040
    [Documentation]    说明框输入超过200个字符点击保存
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    input text    ${locatorB_shipping_description}    sssssssssssssssssssssssssddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    page should contain element    ${locatorB_shipping_freight_error_elm}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping041
    [Documentation]    说明框输入正常字符点击保存
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    input text    ${locatorB_shipping_description}    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    Wait And Click Element    ${locatorB_shipping_freight_save}
    page should contain element    ${locatorB_shipping_freight_content_elm}
    Quit All Shipping

shipping043
    [Documentation]    最小订单价输入超过10位以上的数字
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    input text    ${locatorB_shipping_description}    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    input text    ${locatorB_shipping_range_min}    123456789012
    Wait And Click Element    ${locatorB_shipping_freight_save}
    page should contain element    ${locatorB_shipping_freight_error_elm}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping044
    [Documentation]    最大订单价输入超过10位以上的数字
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    input text    ${locatorB_shipping_description}    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    input text    ${locatorB_shipping_range_max}    123456789012
    Wait And Click Element    ${locatorB_shipping_freight_save}
    page should contain element    ${locatorB_shipping_freight_error_elm}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping046
    [Documentation]    正常输入最小价格，最大价格 保存成功
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    input text    ${locatorB_shipping_description}    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    input text    ${locatorB_shipping_range_min}    10
    input text    ${locatorB_shipping_range_max}    100
    Wait And Click Element    ${locatorB_shipping_freight_save}
    page should contain element    ${locatorB_shipping_freight_content_elm}
    Quit All Shipping

shipping047
    [Documentation]    最大单价输入10 最大单价变为101
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    input text    ${locatorB_shipping_description}    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    100
    ${max}    set variable    10
    input text    ${locatorB_shipping_range_min}    ${min}
    input text    ${locatorB_shipping_range_max}    ${max}
    Sleep    1
    Input Text    ${locatorB_shipping_price}    1
    ${data}    get value    ${locatorB_shipping_range_max}
    ${new_max}    evaluate    ${min}+1
    Should Be True    ${data}==${new_max}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping048
    [Documentation]    最大单价输入100 最小单价输入200 最小单价变为99
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    input text    ${locatorB_shipping_description}    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    ${locatorB_shipping_range_max}    ${max}
    input text    ${locatorB_shipping_range_min}    ${min}
    Input Text    ${locatorB_shipping_price}    1
    sleep    1
    ${data}    get value    ${locatorB_shipping_range_min}
    ${new_min}    evaluate    ${max}-1
    Should Be True    ${data}==${new_min}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping049
    [Documentation]    在运费价格框输入值 免运费的勾选离开框取消勾选
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    input text    ${locatorB_shipping_description}    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    ${locatorB_shipping_range_max}    ${max}
    input text    ${locatorB_shipping_range_min}    ${min}
    input text    id:rate_amount    ${max}
    sleep    1.5
    page should not contain checkbox    execute javascript    return document.getElementsByClassName("ant-checkbox-input")[0]
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping052
    [Documentation]    运费价格框输入超过长度的数字 提示错误
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    input text    ${locatorB_shipping_description}    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    ${ship}    set variable    991212313165656
    input text    ${locatorB_shipping_range_max}    ${max}
    input text    ${locatorB_shipping_range_min}    ${min}
    input text    id:rate_amount    ${ship}
    sleep    1.5
    page should contain element    ${locatorB_shipping_freight_error_elm}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping053
    [Documentation]    运费价格框数字 保存成功 在列表显示刚添加的运费
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    input text    ${locatorB_shipping_description}    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    ${ship}    set variable    100
    input text    ${locatorB_shipping_range_max}    ${max}
    input text    ${locatorB_shipping_range_min}    ${min}
    input text    id:rate_amount    ${ship}
    sleep    1.5
    Wait And Click Element    ${locatorB_shipping_freight_save}
    sleep    4
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs_py    ${data}
    Should Be True    ${res}==${ship}
    Quit All Shipping

shipping054
    [Documentation]    运费价格框数字 保存成功 保存成功，价格列表中显示的运费为0
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    input text    ${locatorB_shipping_description}    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    ${locatorB_shipping_range_max}    ${max}
    input text    ${locatorB_shipping_range_min}    ${min}
    execute javascript    ${locatorB_shipping_freight_free_freight_btn}
    sleep    1.5
    Wait And Click Element    ${locatorB_shipping_freight_save}
    sleep    2
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs_py    ${data}
    Should Be True    ${res}==0
    Quit All Shipping

shipping055
    [Documentation]    勾选是否支持货到付款 列表显示支持
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    input text    ${locatorB_shipping_description}    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    ${locatorB_shipping_range_max}    ${max}
    input text    ${locatorB_shipping_range_min}    ${min}
    execute javascript    ${locatorB_shipping_freight_free_freight_btn}
    sleep    1.5
    Wait And Click Element    ${locatorB_shipping_freight_save}
    sleep    2
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='支持'
    Quit All Shipping

shipping056
    [Documentation]    不勾选是否支持货到付款 列表显示不支持
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_freight_first_input}    价格运费
    input text    ${locatorB_shipping_description}    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    ${locatorB_shipping_range_max}    ${max}
    input text    ${locatorB_shipping_range_min}    ${min}
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()    #.货到付款按钮
    sleep    1.5
    Wait And Click Element    ${locatorB_shipping_freight_save}
    sleep    2
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='不支持'
    Quit All Shipping
