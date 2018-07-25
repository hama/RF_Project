*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Force Tags        Shipping
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_shipping.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_shipping.robot

*** Test Cases ***
shipping057
    [Documentation]    添加运费窗口直接关闭 列表不存在数据
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    sleep    1
    page should not contain element    dom:document.querySelectorAll(".ant-table-row-level-0")[0]

shipping058
    [Documentation]    添加运费窗口输入内容后直接关闭 列表不存在数据
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    input text    ${locatorB_shipping_weight_first_input}    价格运费
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    sleep    1
    page should not contain element    dom:document.querySelectorAll(".ant-table-row-level-0")[0]

shipping042
    [Documentation]    添加运费窗口输入内容后直接关闭 再次点击添加按钮 后的编辑窗口里没有数据
    [Tags]    P1
    Go To Shipping Page
    Quantity All Setp
    input text    ${locatorB_shipping_weight_first_input}    价格运费
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    sleep    2
    Wait And Click Element    ${locatorB_shipping_add_price_btn}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    page should contain element    ${locatorB_shipping_freight_error_elm}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping061
    [Documentation]    点击添加重量运费按钮出现编辑窗口
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    page should contain element    ${locatorB_shipping_freight_save}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping064
    [Documentation]    添加运费 在名称输入 重量运费 后 对应框里显示 重量运费
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_weight_first_input}    重量运费
    ${data}    execute javascript    return document.querySelectorAll("input[placeholder='Standard Shipping']")[0].value
    Should Be True    '${data}'=='重量运费'
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping066
    [Documentation]    添加运费 在名称输入 123 后 对应框里显示 123
    [Tags]    P0
    #.添加运费 在名称输入 123 后    对应框里显示 123
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    #.check button
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_weight_first_input}    123
    ${data}    execute javascript    return document.querySelectorAll("input[placeholder='Standard Shipping']")[0].value
    Should Be True    '${data}'=='123'
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping067
    [Documentation]    添加运费 在名称输入 123 后 保存 列表里显示 123对应信息
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_weight_first_input}    123
    Wait And Click Element    ${locatorB_shipping_freight_save}
    page should contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr
    Quit All Shipping

shipping068
    [Documentation]    添加运费 在名称输入超过50个字符 提示错误
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${ss}    set variable    sssssssssssssssssssssssssddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    input text    ${locatorB_shipping_weight_first_input}    ${ss}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    page should contain element    ${locatorB_shipping_freight_error_elm}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping071
    [Documentation]    添加运费 在名称输入正常字符 保存成功
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${ss}    set variable    重量运费
    input text    ${locatorB_shipping_weight_first_input}    ${ss}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    page should contain element    dom:document.querySelectorAll("table tbody tr")[0]
    Quit All Shipping

shipping069
    [Documentation]    添加运费 在名称输入正常字符 保存成功
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${ss}    set variable    重量运费
    input text    ${locatorB_shipping_weight_first_input}    ${ss}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    sleep    1.5
    page should contain element    dom:document.querySelectorAll(".ant-table-row-level-0")[0]
    Quit All Shipping

shipping073
    [Documentation]    添加运费 在说明框里输入超过200个字符 提示错误
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    sleep    1
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${ss}    set variable    重量运费
    ${sm}    set variable    ssssssssssssssssssssssddsadasdasdasdasdasdasdasdsadasdasdcxvcbvfghfghfghfghdfsdfsdfdsfsdfdsdsfsssddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    input text    ${locatorB_shipping_weight_first_input}    ${ss}
    input text    ${locatorB_shipping_description}    ${sm}
    click button    ${locatorB_shipping_freight_save}
    sleep    1.5
    page should contain element    ${locatorB_shipping_freight_error_elm}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping072
    [Documentation]    添加运费 在说明框里输入 200个以内的字符 保存成功
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${ss}    set variable    重量运费
    ${sm}    set variable    6as51d65a1d65sa65d165as1d56as165d1as56d156as1d56as156d1as65d16sa1d56as1d56as1d6d89f498dfg489fd4g89fd4g89df4gdfg1d3f2g132df1g
    input text    ${locatorB_shipping_weight_first_input}    ${ss}
    input text    ${locatorB_shipping_description}    ${sm}
    click button    ${locatorB_shipping_freight_save}
    sleep    1.5
    page should contain element    dom:document.querySelectorAll(".ant-table-row-level-0")[0]
    Quit All Shipping

shipping074
    [Documentation]    添加重量运费 在说明框里输入字符 保存提示 其他信息未填写
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${sm}    set variable    6as51d65a1d65sa65d165as1d56as165d1as56d156as1d56as156d1as65d16sa1d56as1d56as1d6d89f498dfg489fd4g89fd4g89df4gdfg1d3f2g132df1g
    input text    ${locatorB_shipping_description}    ${sm}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    sleep    1.5
    page should contain element    ${locatorB_shipping_freight_error_elm}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping075
    [Documentation]    添加重量运费 最小单价输入 454544454454545 提示输入10位数以内的数字
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${sm}    set variable    454544454454545
    input text    ${locatorB_shipping_range_min}    ${sm}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    sleep    1.5
    page should contain element    ${locatorB_shipping_freight_error_elm}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping076
    [Documentation]    添加重量运费 最大单价输入 454544454454545 提示输入10位数以内的数字
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${sm}    set variable    454544454454545
    input text    ${locatorB_shipping_range_max}    ${sm}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    sleep    1.5
    page should contain element    ${locatorB_shipping_freight_error_elm}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping078
    [Documentation]    "最小订单重量输入：10 最大订单重量输入： 100" 输入正常最小最大运费 保存成功
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${sm}    set variable    10
    ${sx}    set variable    100
    input text    ${locatorB_shipping_weight_first_input}    ${sm}
    input text    ${locatorB_shipping_range_min}    ${sm}
    input text    ${locatorB_shipping_range_max}    ${sx}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    sleep    1.5
    page should contain element    dom:document.querySelectorAll(".ant-table-row-level-0")[0]
    Quit All Shipping

shipping079
    [Documentation]    添加运费 最小订单重量输入：100 最大订单重量输入： 10 提示错误
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${sm}    set variable    100
    ${sx}    set variable    10
    input text    ${locatorB_shipping_range_min}    ${sm}
    input text    ${locatorB_shipping_range_max}    ${sx}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    ${data}    evaluate    ${sm}+1
    ${res}    get value    ${locatorB_shipping_range_max}
    Should Be True    ${data}==${res}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping080
    [Documentation]    添加运费 最小订单重量输入：200 最大订单重量输入： 100 提示错误
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${sm}    set variable    200
    ${sx}    set variable    100
    input text    ${locatorB_shipping_range_max}    ${sx}
    input text    ${locatorB_shipping_range_min}    ${sm}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    ${data}    evaluate    ${sx}-1
    ${res}    get value    ${locatorB_shipping_range_min}
    Should Be True    ${data}==${res}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping081
    [Documentation]    添加重量运费 默认单位是克
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    ${res}    execute javascript    return document.querySelectorAll(".ant-select-selection-selected-value")[0].innerHTML
    Should Be True    '${res}'=='克'
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping082
    [Documentation]    添加运费重量 克。千克，磅
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    #Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    #execute javascript    return document.querySelectorAll(".ant-select-arrow")[0].click()
    click element    dom:document.querySelectorAll(".ant-select-arrow")[0]
    #${res}    execute javascript    return document.querySelectorAll(“.ant-select-selection-selected-value”)[0].innerHTML
    Mouse Down    dom:document.querySelectorAll("div[role='combobox']")[0]
    Mouse Over    dom:document.querySelectorAll("div[role='combobox']")[0]
    Mouse Up    dom:document.querySelectorAll("div[role='combobox']")[0]
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping087
    [Documentation]    添加重量运费 取消勾选 免运费
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    #Wait And Click Element    dom:document.querySelectorAll(".ant-checkbox-input")[0]
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping089
    [Documentation]    添加重量运费 输入 运费 免运费的选中状态取消
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_price}    100
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    #click element    dom:document.querySelectorAll(".ant-checkbox-input")[1]
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    page should not contain element    document.querySelectorAll(".ant-checkbox-checked")[0]
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping090
    [Documentation]    添加重量运费 运费价格输入框输入超过10位以上的数字 提示错误
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    ${re}    set variable    456789456789
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_price}    ${re}
    page should contain element    ${locatorB_shipping_freight_error_elm}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping091
    [Documentation]    添加重量运费 运费价格输入框输入100 保存成功 列表出现该运费
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    ${re}    set variable    100
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_weight_first_input}    重量运费
    input text    ${locatorB_shipping_price}    ${re}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Should Be True    ${res}==${re}
    Quit All Shipping

shipping092
    [Documentation]    添加重量运费 运费价格输入框输入0 保存成功 列表出现该运费为0
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    ${re}    set variable    0
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_weight_first_input}    重量运费
    input text    ${locatorB_shipping_price}    ${re}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Should Be True    ${res}==${re}
    Quit All Shipping

shipping093
    [Documentation]    添加重量运费 勾选是否支持货到付款 列表出先支持
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    ${re}    set variable    0
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_weight_first_input}    重量运费
    input text    ${locatorB_shipping_price}    ${re}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='支持'
    Quit All Shipping

shipping094
    [Documentation]    添加重量运费 不勾选是否支持货到付款 列表出先不支持
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    ${re}    set variable    0
    Wait Until Element Is Visible    ${locatorB_shipping_freight_save}
    input text    ${locatorB_shipping_weight_first_input}    重量运费
    input text    ${locatorB_shipping_price}    ${re}
    Sleep    2
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    #Wait And Click Element    dom:document.querySelectorAll(".ant-checkbox-input")[1]
    click button    ${locatorB_shipping_freight_save}
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='不支持'
    Quit All Shipping

shipping095
    [Documentation]    添加重量运费 直接关掉窗口 列表不存在运费信息
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    #click element    ${locatorB_shipping_country_close_btn}
    page should not contain element    dom:document.querySelectorAll(".ant-table-row-level-0")[0]

shipping096
    [Documentation]    添加重量运费 直接关掉窗口 列表不存在运费信息
    [Tags]    P0
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    sleep    1
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    #execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    click element    ${locatorB_shipping_country_close_btn}
    sleep    1
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    page should not contain    dom:document.querySelectorAll("#name")[1].value
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping098
    [Documentation]    直接关闭窗口，没有添加重量运费，再次打开窗口时，所输入的内容全部清空
    [Tags]    P1
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    sleep    1
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    input text    ${locatorB_shipping_weight_first_input}    重量运费
    input text    ${locatorB_shipping_description}    重量运费
    input text    ${locatorB_shipping_range_min}    10
    input text    ${locatorB_shipping_range_max}    100
    input text    ${locatorB_shipping_price}    100
    #execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    sleep    1
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    page should not contain    dom:document.querySelectorAll("#name")[1].value
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp
