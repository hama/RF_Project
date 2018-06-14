*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Library           ../../../lib/customLibrary

*** Test Cases ***
040_shipping
    #.添加运费窗口直接关闭 列表不存在数据
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    click element    class:ant-modal-close-x
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr

041_shipping
    #.添加运费窗口输入内容后直接关闭 列表不存在数据
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    click element    class:ant-modal-close-x
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr

042_shipping
    #.添加运费窗口输入内容后直接关闭 再次点击添加按钮 后的编辑窗口里没有数据
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    click element    class:ant-modal-close-x
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain

043_shipping
    #.点击添加重量运费按钮出现编辑窗口
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    page should contain element    id:test_shipping_edit_modal_sure_btn

044_shipping
    #.添加运费 在名称输入 重量运费 后    对应框里显示 重量运费
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    ${data}    execute javascript    return document.querySelectorAll("input[placeholder='物流名称']")[0].value
    Run keyword If    '${data}'=='重量运费'    log    success
    ...    ELSE    Run keyword    page should contain element    sjkdkj2

045_shipping
    #.添加运费 在名称输入 123 后    对应框里显示 123
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    123
    ${data}    execute javascript    return document.querySelectorAll("input[placeholder='物流名称']")[0].value
    Run keyword If    '${data}'=='123'    log    success
    ...    ELSE    Run keyword    page should contain element    sjkdkj2

046_shipping
    #.添加运费 在名称输入 123 后    保存 列表里显示 123对应信息
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    123
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr

047_shipping
    #.添加运费 在名称输入超过50个字符 提示错误
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    sssssssssssssssssssssssssddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain

048_shipping
    #.添加运费 在名称输入正常字符 保存 提示其他信息未填写错误
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    重量运费
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain

049_shipping
    #.添加运费 在名称输入正常字符 保存成功
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    重量运费
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr

050_shipping
    #.添加运费 在说明框里输入超过200个字符 提示错误
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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

051_shipping
    #.添加运费 在说明框里输入 200个以内的字符 保存成功
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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

052_shipping
    #.添加重量运费 在说明框里输入字符 保存提示 其他信息未填写
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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

053_shipping
    #.添加重量运费 最小单价输入 454544454454545 提示输入10位数以内的数字
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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

054_shipping
    #.添加重量运费 最大单价输入 454544454454545 提示输入10位数以内的数字
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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

055_shipping
    #.添加运费 输入正常最小最大运费 保存成功
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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

056_shipping
    #.添加运费    最小订单重量输入：100    最大订单重量输入： 10 提示错误
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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
    Run keyword If    ${data}==${res}    log    success
    ...    ELSE    Run keyword    page should contain element    sdfh2

057_shipping
    #.添加运费    最小订单重量输入：200    最大订单重量输入： 100 提示错误
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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
    Run keyword If    ${data}==${res}    log    success
    ...    ELSE    Run keyword    page should contain element    sdfh2

058_shipping
    #.添加重量运费 默认单位是克
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${res}    execute javascript    return document.querySelectorAll(".ant-select-selection-selected-value")[0].innerHTML
    Run keyword If    '${res}'=='克'    log    success
    ...    ELSE    Run keyword    page should contain element    sd56f1s

059_shipping
    #.添加运费重量    克。千克，磅
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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

060_shipping
    #.添加重量运费 取消勾选 免运费
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    click element    dom:document.querySelectorAll(".ant-checkbox-input")[0]

061_shipping
    #.添加重量运费 输入 运费    免运费的选中状态取消
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    id:rate_amount    100
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    click element    dom:document.querySelectorAll(".ant-checkbox-input")[1]
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    page should not contain element    document.querySelectorAll(".ant-checkbox-checked")[0]

062_shipping
    #.添加重量运费    运费价格输入框输入超过10位以上的数字 提示错误
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    ${re}    set variable    456789456789
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    id:rate_amount    ${re}
    page should contain element    class:ant-form-explain

063_shipping
    #.添加重量运费    运费价格输入框输入100 保存成功 列表出现该运费
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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
    Run keyword If    ${res}==${re}    log    success
    ...    ELSE    Run keyword    page should contain element    ds2121

064_shipping
    #.添加重量运费    运费价格输入框输入0 保存成功 列表出现该运费为0
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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
    Run keyword If    ${res}==${re}    log    success
    ...    ELSE    Run keyword    page should contain element    ds2121

065_shipping
    #.添加重量运费    勾选是否支持货到付款    列表出先支持
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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
    Run keyword If    '${data}'=='支持'    log    success
    ...    ELSE    Run keyword    page should contain element    ds2121

066_shipping
    #.添加重量运费    不勾选是否支持货到付款    列表出先不支持
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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
    Run keyword If    '${data}'=='不支持'    log    success
    ...    ELSE    Run keyword    page should contain element    ds2121

067_shipping
    #.添加重量运费    直接关掉窗口 列表不存在运费信息
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    #execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    click element    dom:document.querySelectorAll(".ant-modal-close-x")[0]
    page should not contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr

068_shipping
    #.添加重量运费    直接关掉窗口 列表不存在运费信息
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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

069_shipping
    #.添加重量运费    输入内容后 直接关掉窗口 列表不存在运费信息
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${add_shipping_btn}
    click element    ${add_shipping_btn}
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
    close browser
