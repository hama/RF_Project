*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Library           ../../../lib/customLibrary
Resource          ../../../resources/var_tax_price.robot
Resource          ../../../resources/kw_browser.robot

*** Test Cases ***
021_shipping
    #.add transport price >> check add transport price windows
    #${xpath_d}    set variable    id:test_add_btn
    #.login
    #Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}
    #.check button
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    page should contain button    id:test_shipping_edit_modal_sure_btn

022_shipping
    #.add    transport price    check name input (str)
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    #.check button
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    #.输入名称
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    #${res}    execute javascript    return document.getElementsByClassName("ant-input ant-input-lg name_input___14djA")[0].value

023_shipping
    #.add    transport price    check name input (int)
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    #.check button
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    #.输入名称
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    123
    #${res}    execute javascript    return document.getElementsByClassName("ant-input ant-input-lg name_input___14djA")[0].value

024_shipping
    #.add    transport price    check
    #.保存成功，关闭弹窗，价格运费列表中显示 价格运费的信息
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    #execute javascript    return document.querySelectorAll('#name')[1].value='价格运费'
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    sleep    1.5
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbo../../../td[1]

025_shipping
    #.输入50个字符点击保存
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    #.check button
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    #execute javascript    return document.querySelectorAll('#name')[1].value='价格运费'
    ${str}    set variable    sssssssssssssssssssssssssssssssssssssssssssssssss
    input text    dom:document.querySelectorAll('#name')[1]    ${str}
    sleep    1.5
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbo../../../td[1]

026_shipping
    #.输入超过50个字符点击保存
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    #execute javascript    return document.querySelectorAll('#name')[1].value='价格运费'
    ${str}    set variable    ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    input text    dom:document.querySelectorAll('#name')[1]    ${str}
    sleep    1.5
    page should contain element    class:ant-form-explain

027_shipping
    #.说明框输入超过200个字符点击保存
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    page should contain element    class:ant-form-explain

028_shipping
    #.说明框输入正常字符点击保存
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbo../../../td[1]

029_shipping
    #.最小订单价输入超过10位以上的数字
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    input text    id:range_min    123456789012
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain

030_shipping
    #.最大订单价输入超过10位以上的数字
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    input text    id:range_max    123456789012
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain

031_shipping
    #.正常输入最小价格，最大价格 保存成功
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    input text    id:range_min    10
    input text    id:range_max    100
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbo../../../td[1]

032_shipping
    #.最小单价输入100    最大单价输入10    最大单价变为101
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    100
    ${max}    set variable    10
    input text    id:range_min    ${min}
    input text    id:range_max    ${max}
    click element    class:ant-checkbox-input
    sleep    1.5
    ${data}    get value    id:range_max
    ${new_max}    evaluate    ${min}+1
    Should Be True    ${data}==${new_max}

033_shipping
    #.最大单价输入100    最小单价输入200    最小单价变为99
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    click element    class:ant-checkbox-input
    sleep    1.5
    ${data}    get value    id:range_min
    ${new_min}    evaluate    ${max}-1
    Should Be True    ${data}==${new_min}

034_shipping
    #.在运费价格框输入值    免运费的勾选离开框取消勾选
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
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

035_shipping
    #.运费价格框输入超过长度的数字 提示错误
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
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

036_shipping
    #.运费价格框数字 保存成功 在列表显示刚添加的运费
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
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
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait Until Element Is Visible    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Should Be True    ${res}==${ship}

037_shipping
    #.运费价格框数字 保存成功 在列表显示刚添加的运费
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
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
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait Until Element Is Visible    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Should Be True    ${res}==0

038_shipping
    #.勾选是否支持货到付款    列表显示支持
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
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
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait Until Element Is Visible    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='支持'

039_shipping
    #.不勾选是否支持货到付款    列表显示不支持
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
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
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait Until Element Is Visible    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='不支持'
