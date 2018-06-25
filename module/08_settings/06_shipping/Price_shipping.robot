*** Settings ***
Suite Setup       New Test Suite Browser And Login    15220581724    123456    chen
Suite Teardown    Close Test Suite Browser
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_shipping.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_shipping.robot
Resource          ./common.robot

*** Test Cases ***
021_shipping
    [Documentation]    add transport price >> check add transport price windows
    [Tags]    P0
    #.check button
    Go To Shipping Page
    Quantity All Setp
    page should contain button    id:test_shipping_edit_modal_sure_btn
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

022_shipping
    [Documentation]    add transport price check name input (str)
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    #.输入名称
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    Page Should Contain Element    dom:document.querySelectorAll("#name")[1]
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

023_shipping
    [Documentation]    add transport price check name input (int)
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    #.输入名称
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    123
    Page Should Contain Element    dom:document.querySelectorAll("#name")[1]
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

024_shipping
    [Documentation]    保存成功，关闭弹窗，价格运费列表中显示 价格运费的信息
    [Tags]    P0
    #.add    transport price    check
    Go To Shipping Page
    Quit Add Price Shipping
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    sleep    1.5
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    page should contain element    dom:document.querySelectorAll(".ant-table-tbody")[1]
    Quit All Shipping

025_shipping
    [Documentation]    输入50个字符点击保存
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${str}    set variable    sssssssssssssssssssssssssssssssssssssssssssssssss
    input text    dom:document.querySelectorAll('#name')[1]    ${str}
    sleep    1.5
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    page should contain element    dom:document.querySelectorAll(".ant-table-tbody")[1]
    Quit All Shipping

026_shipping
    [Documentation]    输入超过50个字符点击保存
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${str}    set variable    ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    input text    dom:document.querySelectorAll('#name')[1]    ${str}
    sleep    1.5
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

027_shipping
    [Documentation]    说明框输入超过200个字符点击保存
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

028_shipping
    [Documentation]    说明框输入正常字符点击保存
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    page should contain element    dom:document.querySelectorAll(".ant-table-tbody")[1]
    Quit All Shipping

029_shipping
    [Documentation]    最小订单价输入超过10位以上的数字
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    input text    id:range_min    123456789012
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

030_shipping
    [Documentation]    最大订单价输入超过10位以上的数字
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    input text    id:range_max    123456789012
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

031_shipping
    [Documentation]    正常输入最小价格，最大价格 保存成功
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    input text    id:range_min    10
    input text    id:range_max    100
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    page should contain element    dom:document.querySelectorAll(".ant-table-tbody")[1]
    Quit All Shipping

032_shipping
    [Documentation]    最大单价输入10 最大单价变为101
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    100
    ${max}    set variable    10
    input text    id:range_min    ${min}
    input text    id:range_max    ${max}
    Sleep    1
    Execute JavaScript    return document.querySelectorAll('.ant-checkbox-inner')[0].click()
    ${data}    get value    id:range_max
    ${new_max}    evaluate    ${min}+1
    Should Be True    ${data}==${new_max}
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

033_shipping
    [Documentation]    最大单价输入100 最小单价输入200 最小单价变为99
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    Execute JavaScript    return document.querySelectorAll('.ant-checkbox-inner')[0].click()
    sleep    1.5
    ${data}    get value    id:range_min
    ${new_min}    evaluate    ${max}-1
    Should Be True    ${data}==${new_min}
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

034_shipping
    [Documentation]    在运费价格框输入值 免运费的勾选离开框取消勾选
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    input text    id:rate_amount    ${max}
    sleep    1.5
    page should not contain checkbox    execute javascript    return document.getElementsByClassName("ant-checkbox-input")[0]
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

035_shipping
    [Documentation]    运费价格框输入超过长度的数字 提示错误
    [Tags]    P1
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    ${ship}    set variable    991212313165656
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    input text    id:rate_amount    ${ship}
    sleep    1.5
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

036_shipping
    [Documentation]    运费价格框数字 保存成功 在列表显示刚添加的运费
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    ${ship}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    input text    id:rate_amount    ${ship}
    sleep    1.5
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait Until Element Is Visible    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Should Be True    ${res}==${ship}
    Quit All Shipping

037_shipping
    [Documentation]    运费价格框数字 保存成功 在列表显示刚添加的运费
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    sleep    1.5
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait Until Element Is Visible    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Should Be True    ${res}==0
    Quit All Shipping

038_shipping
    [Documentation]    勾选是否支持货到付款 列表显示支持
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    sleep    1.5
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait Until Element Is Visible    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='支持'
    Quit All Shipping

039_shipping
    [Documentation]    不勾选是否支持货到付款 列表显示不支持
    [Tags]    P0
    Go To Shipping Page
    Quit Add Price Shipping
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    sleep    1.5
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait Until Element Is Visible    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='不支持'
    Quit All Shipping
