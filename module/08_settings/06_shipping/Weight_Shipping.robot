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
040_shipping
    [Documentation]    添加运费窗口直接关闭 列表不存在数据
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait And Click Element    class:ant-modal-close-x
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr

041_shipping
    [Documentation]    添加运费窗口输入内容后直接关闭 列表不存在数据
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    Wait And Click Element    class:ant-modal-close-x
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr

042_shipping
    [Documentation]    添加运费窗口输入内容后直接关闭 再次点击添加按钮 后的编辑窗口里没有数据
    [Tags]    P1
    Go To Shipping Page
    Quantity All Setp
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    Wait And Click Element    class:ant-modal-close-x
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    Wait And Click Element    id:test_shipping_add_price_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

043_shipping
    [Documentation]    点击添加重量运费按钮出现编辑窗口
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    Wait And Click Element    id:test_shipping_add_weight_btn
    sleep    1
    page should contain element    id:test_shipping_edit_modal_sure_btn
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

044_shipping
    [Documentation]    添加运费 在名称输入 重量运费 后 对应框里显示 重量运费
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    ${data}    execute javascript    return document.querySelectorAll("input[placeholder='物流名称']")[0].value
    Should Be True    '${data}'=='重量运费'
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

045_shipping
    [Documentation]    添加运费 在名称输入 123 后 对应框里显示 123
    [Tags]    P0
    #.添加运费 在名称输入 123 后    对应框里显示 123
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    123
    ${data}    execute javascript    return document.querySelectorAll("input[placeholder='物流名称']")[0].value
    Should Be True    '${data}'=='123'
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

046_shipping
    [Documentation]    添加运费 在名称输入 123 后 保存 列表里显示 123对应信息
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    Wait And Click Element    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    123
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    page should contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr
    Quit All Shipping

047_shipping
    [Documentation]    添加运费 在名称输入超过50个字符 提示错误
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    Wait And Click Element    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    sssssssssssssssssssssssssddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

048_shipping
    [Documentation]    添加运费 在名称输入正常字符 保存成功
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    重量运费
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    page should contain element    dom:document.querySelectorAll("table tbody tr")[0]
    Quit All Shipping

049_shipping
    [Documentation]    添加运费 在名称输入正常字符 保存成功
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    重量运费
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr
    Quit All Shipping

050_shipping
    [Documentation]    添加运费 在说明框里输入超过200个字符 提示错误
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    重量运费
    ${sm}    set variable    ssssssssssssssssssssssddsadasdasdasdasdasdasdasdsadasdasdcxvcbvfghfghfghfghdfsdfsdfdsfsdfdsdsfsssddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    input text    dom:document.querySelectorAll('#desc')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

051_shipping
    [Documentation]    添加运费 在说明框里输入 200个以内的字符 保存成功
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    重量运费
    ${sm}    set variable    6as51d65a1d65sa65d165as1d56as165d1as56d156as1d56as156d1as65d16sa1d56as1d56as1d6d89f498dfg489fd4g89fd4g89df4gdfg1d3f2g132df1g
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    input text    dom:document.querySelectorAll('#desc')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr
    Quit All Shipping

052_shipping
    [Documentation]    添加重量运费 在说明框里输入字符 保存提示 其他信息未填写
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
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
    page should contain element    class:ant-form-explain\
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

053_shipping
    [Documentation]    添加重量运费 最小单价输入 454544454454545 提示输入10位数以内的数字
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    454544454454545
    input text    dom:document.querySelectorAll('#range_min')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

054_shipping
    [Documentation]    添加重量运费 最大单价输入 454544454454545 提示输入10位数以内的数字
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    454544454454545
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

055_shipping
    [Documentation]    添加运费 输入正常最小最大运费 保存成功
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    10
    ${sx}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    ${sm}
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sm}
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sx}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr
    Quit All Shipping

056_shipping
    [Documentation]    添加运费 最小订单重量输入：100 最大订单重量输入： 10 提示错误
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    100
    ${sx}    set variable    10
    input text    dom:document.querySelectorAll('#range_min')[0]    ${sm}
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sx}
    click button    id:test_shipping_edit_modal_sure_btn
    ${data}    evaluate    ${sm}+1
    ${res}    get value    id:range_max
    Should Be True    ${data}==${res}
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

057_shipping
    [Documentation]    添加运费 最小订单重量输入：200 最大订单重量输入： 100 提示错误
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    200
    ${sx}    set variable    100
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sx}
    input text    dom:document.querySelectorAll('#range_min')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    ${data}    evaluate    ${sx}-1
    ${res}    get value    id:range_min
    Should Be True    ${data}==${res}
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

058_shipping
    [Documentation]    添加重量运费 默认单位是克
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${res}    execute javascript    return document.querySelectorAll(".ant-select-selection-selected-value")[0].innerHTML
    Should Be True    '${res}'=='克'
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

059_shipping
    [Documentation]    添加运费重量 克。千克，磅
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    #Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    #execute javascript    return document.querySelectorAll(".ant-select-arrow")[0].click()
    click element    dom:document.querySelectorAll(".ant-select-arrow")[0]
    #${res}    execute javascript    return document.querySelectorAll(“.ant-select-selection-selected-value”)[0].innerHTML
    Mouse Down    dom:document.querySelectorAll("div[role='combobox']")[0]
    Mouse Over    dom:document.querySelectorAll("div[role='combobox']")[0]
    Mouse Up    dom:document.querySelectorAll("div[role='combobox']")[0]
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

060_shipping
    [Documentation]    添加重量运费 取消勾选 免运费
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    #Wait And Click Element    dom:document.querySelectorAll(".ant-checkbox-input")[0]
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

061_shipping
    [Documentation]    添加重量运费 输入 运费 免运费的选中状态取消
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    id:rate_amount    100
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    #click element    dom:document.querySelectorAll(".ant-checkbox-input")[1]
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    page should not contain element    document.querySelectorAll(".ant-checkbox-checked")[0]
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

062_shipping
    [Documentation]    添加重量运费 运费价格输入框输入超过10位以上的数字 提示错误
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    ${re}    set variable    456789456789
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    id:rate_amount    ${re}
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

063_shipping
    [Documentation]    添加重量运费 运费价格输入框输入100 保存成功 列表出现该运费
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    ${re}    set variable    100
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    input text    id:rate_amount    ${re}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Should Be True    ${res}==${re}
    Quit All Shipping

064_shipping
    [Documentation]    添加重量运费 运费价格输入框输入0 保存成功 列表出现该运费为0
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    ${re}    set variable    0
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    input text    id:rate_amount    ${re}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Should Be True    ${res}==${re}
    Quit All Shipping

065_shipping
    [Documentation]    添加重量运费 勾选是否支持货到付款 列表出先支持
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    ${re}    set variable    0
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    input text    id:rate_amount    ${re}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='支持'
    Quit All Shipping

066_shipping
    [Documentation]    添加重量运费 不勾选是否支持货到付款 列表出先不支持
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    ${re}    set variable    0
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    input text    id:rate_amount    ${re}
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    click element    dom:document.querySelectorAll(".ant-checkbox-input")[1]
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='不支持'
    Quit All Shipping

067_shipping
    [Documentation]    添加重量运费 直接关掉窗口 列表不存在运费信息
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    #click element    dom:document.querySelectorAll(".ant-modal-close-x")[0]
    page should not contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr

068_shipping
    [Documentation]    添加重量运费 直接关掉窗口 列表不存在运费信息
    [Tags]    P0
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    #execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    click element    dom:document.querySelectorAll(".ant-modal-close-x")[0]
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    page should not contain    dom:document.querySelectorAll("#name")[1].value
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

069_shipping
    [Documentation]    添加重量运费 输入内容后 直接关掉窗口 列表不存在运费信息
    [Tags]    P1
    Go To Shipping Page
    click element    ${locator_shipping_add_shipping}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    input text    dom:document.querySelectorAll('#desc')[0]    重量运费
    input text    id:range_min    10
    input text    id:range_max    100
    input text    id:rate_amount    100
    #execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    click element    dom:document.querySelectorAll(".ant-modal-close-x")[0]
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    page should not contain    dom:document.querySelectorAll("#name")[1].value
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp
