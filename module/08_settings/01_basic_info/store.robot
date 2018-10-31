*** Settings ***
Suite Setup       Store Suite Setup
Suite Teardown    Store Suite Teardown
Test Setup        Store Test Setup
Test Teardown     Teardown Test Case
Force Tags        store
Resource          ../../../resources/keywords/kw_common.robot


*** Testcases ***
store001
    [Documentation]    店铺信息-店铺名称里UI展示正确
    [tags]    P1
    wait until page contains    ${contextB_store_storeInfo}

store002
    [Documentation]    店铺名称可保存小于50个字符
    [tags]    P0
    clear Element Text    ${locatorB_store_input_storeName}
    wait and input text    ${locatorB_store_input_storeName}    zhoulidianpu
    wait and click element    ${locatorB_button_save00}
    wait until page contains    店铺信息更新成功。
    Reload page
    Value Of Element Should Be Equal With Wait    ${locatorB_store_input_storeName}    zhoulidianpu

store003
    [Documentation]    店铺名称不可保存大于50个字符
    [tags]    P0
    clear Element Text    ${locatorB_store_input_storeName}
    wait and input text    ${locatorB_store_input_storeName}    zhoulidianpuzhoulidianpuzhoulidianpuzhoulidianpuzhouli
    wait and click element    ${locatorB_button_save00}
    page should contain button    ${locatorB_button_save00}
    page should contain    不能超过50个字符

store004
    [Documentation]    店铺名称可保存50个字符
    [tags]    P0
    clear element text    ${locatorB_store_input_storeName}
    wait and input text    ${locatorB_store_input_storeName}    zhoulidianpuzhoulidianpuzhoulidianpuzhoulidianpuzh
    wait and click element    ${locatorB_button_save00}
    wait until page contains    店铺信息更新成功。
    Reload page
    Value Of Element Should Be Equal With Wait    ${locatorB_store_input_storeName}    zhoulidianpuzhoulidianpuzhoulidianpuzhoulidianpuzh

#store006
#    [Documentation]    输入店铺名称时字数统计对应变化
#    [tags]      P2
#    clear element text    ${locatorB_store_input_storeName}
#    ${textcon}    set variable    zhouli
#    ${textnum}    get length    ${textcon}
#    ${textnum_str}=    Convert To String    ${textnum}
#    wait and input text    ${locatorB_store_input_storeName}    ${textcon}
#    ${getnum}    get text   css:span[class='ant-input-suffix']
#    Text Of Element Should Contain With Wait    css:span[class='ant-input-suffix']    ${textnum_str}
#    log to console    ${getnum}
#    log to console    ${textnum}
#    Should Be Equal    ${getnum}    ${textnum} /50
#    ${containYN}    get count    str(${getnum})    str(${textnum})
#
#    should be true    ${containYN}==1

store007
    [Documentation]    验证‘店铺链接’UI展示正确
    [Tags]    P0    threshold
    Element Attribute Should Be Equal With Wait    ${locatorB_store_input_storeLink}     class    ant-input ant-input-disabled

#store008
#    [Documentation]    点击域名配置，正确跳转到域名信息页面
#    [tags]    P1
#    wait and click element    ${locatorB_store_a_domain}
#    wait until page contains    店铺主域名
#    page should contain button    css:button[class*="ant-btn middle"]
#
#store009
#    [Documentation]    使用邮箱注册时，店主邮箱默认显示注册时所使用的邮箱
#    [tags]    P1
#    ${user_default_contact}
#
#store010
#    [Documentation]    使用手机号注册时，店主邮箱显示为空
#    [tags]    P1

store011
    [Documentation]    店主邮箱输入正确格式的邮箱可保存成功
    [tags]    P0
    clear element text    ${locatorB_store_input_storeEmail}
    wait and input text    ${locatorB_store_input_storeEmail}    zhouli@shoplazza.com
    wait and click element    ${locatorB_button_save00}
    wait until page contains    店铺信息更新成功。
    Reload page
    Value Of Element Should Be Equal With Wait    ${locatorB_store_input_storeEmail}    zhouli@shoplazza.com

#store012
#    [Documentation]    店主邮箱输入格式错误的邮箱，不可保存
#    [tags]    P1
#    clear element text    ${locatorB_store_input_storeEmail}
#    wait and input text    ${locatorB_store_input_storeEmail}    @zhou@shop.com213
#    wait and click element    ${locatorB_button_save00}
#    page should contain button    ${locatorB_button_save00}
#    page should contain    请输入格式正确的邮箱
#
#store013
#    [Documentation]    店主邮箱不可为空，为空保存失败
#    [tags]    P1
#    clear element text    ${locatorB_store_input_storeEmail}
#    sleep    2
#    wait and click element    ${locatorB_button_save00}
#    page should contain button    ${locatorB_button_save00}
#    page should contain    请输入邮箱
#
#store014
#    [Documentation]    验证‘客服邮箱’UI显示正常
#    [tags]    P2
#    clear element text    ${locatorB_store_store_input_serviceEmail}
#    sleep    2
#    wait and click element    ${locatorB_store_store_input_serviceEmail}
#    #wait until page contains    请输入客服邮箱
#    page should contain    此邮箱将作为店铺联系顾客的默认邮箱。

store015
    [Documentation]    输入正确格式的客服邮箱可保存成功
    [tags]    P0
    clear element text    ${locatorB_store_store_input_serviceEmail}
    wait and input text    ${locatorB_store_store_input_serviceEmail}    zhouliservice@shoplazza.com
    wait and click element    ${locatorB_button_save00}
    wait until page contains    店铺信息更新成功。
    Reload page
    Value Of Element Should Be Equal With Wait    ${locatorB_store_store_input_serviceEmail}    zhouliservice@shoplazza.com

#store016
#    [Documentation]    输入非法格式的邮箱，不可保存
#    [tags]    P1
#    clear element text    ${locatorB_store_store_input_serviceEmail}
#    wait and input text    ${locatorB_store_store_input_serviceEmail}    @zhouliserviceshop
#    wait and click element    ${locatorB_button_save00}
#    page should contain button    ${locatorB_button_save00}
#    page should contain    请输入格式正确的邮箱
#
#store017
#    [Documentation]    客服邮箱不可为空
#    [tags]    P1
#
#store018
#    [Documentation]    验证‘网站favicon’UI展示正常
#    [tags]    P2
#    wait until page contains    Favicon为网站的缩略标识，会展示在浏览器标签、地址栏左边和收藏夹，一般尺寸为32x32 px。

store019
    [Documentation]    上传建议尺寸大小的‘网站favicon’可正常显示
    [tags]    P0
    Wait And Mouse Over    ${locatorB_store_div_favion}
    set focus to element    ${locatorB_store_div_favion}
    sleep    2
    wait and click element    ${locatorB_store_i_delete}
#   wait and click element    css:svg[data-icon="plus"]
    Wait Enabled And Choose File    dom:document.querySelectorAll('input[type="file"]')    ${file_products_addImg}
    wait and click element    ${locatorB_button_save00}
    wait until page contains    店铺信息更新成功。
    Reload page
    sleep    2
    page should contain element    dom:document.querySelectorAll('div[class="image_wrap_546e"] img')

store022
    [Documentation]    验证‘常规设置-店铺货币’UI展示正确
    [tags]    P0
    set focus to element    ${locatorB_store_select_currency}
    ${checkcurrency}    get text    ${locatorB_store_select_currency}
    should contain    ${checkcurrency}    USD
    wait until page contains    店铺正常运营之后，更改货币将影响您店铺的商品价格、订单和数据等信息，请谨慎操作

store023
    [Documentation]    验证‘常规设置-店铺时区’UI展示正确
    [tags]    P0
    set focus to element    ${locatorB_store_select_timezone}
    ${checktimezone}    get text    ${locatorB_store_select_timezone}
    should contain    ${checktimezone}    (GMT + 08:00) 北京，香港，台北，新加坡

store024
    [Documentation]    点击货币选择框，展开下拉框
    [tags]    P0
    wait and click element    css:i[class="djfont xiala-choose"]    #点击下拉列表箭头
    Wait Until Page Contains Text   USD
    Wait Until Page Contains Text   EUR
    Wait Until Page Contains Text   GBP
    Wait Until Page Contains Text   CAD
    Wait Until Page Contains Text   AFN
    Wait Until Page Contains Text   ALL

store025.1
    [Documentation]    可选择货币
    [tags]    P0
    wait and click element    css:i[class="djfont xiala-choose"]
    wait and click element    css:#currency ~ div ul li:nth-child(3)    #选择下拉列表中的第三个
    wait and click element    dom:document.querySelectorAll('button[class*="middle_btn"]')[1]    #点击确定按钮
    set focus to element    ${locatorB_store_select_currency}
    ${checkcurrency}    get text    ${locatorB_store_select_currency}
    should contain    ${checkcurrency}    GBP

store027
    [Documentation]    选择货币之后，下拉框自动收起
    [tags]    P0
    wait and click element    css:i[class="djfont xiala-choose"]
    wait and click element    css:#currency ~ div ul li:nth-child(4)    #选择店铺货币下拉列表中的第四个
    set focus to element    css:div[class="ant-modal-content"]   #出现弹窗，下拉列表自动收起
    wait and click element    dom:document.querySelectorAll('button[class*="middle_btn"]')[1]    #点击确定按钮
    set focus to element    ${locatorB_store_select_currency}
    ${checkcurrency}    get text    ${locatorB_store_select_currency}
    should contain    ${checkcurrency}    CAD

store029.1
    [Documentation]    可选择时区
    [tags]    P0
    wait and click element    css:#time_zone span[class="ant-select-arrow"]
    wait and click element    css:#time_zone ~ div ul li:nth-child(1)    #选择店铺时区下拉列表中的第一个
    wait and click element    ${locatorB_button_save00}
    wait until page contains    店铺信息更新成功。
    Reload page
    sleep    2
    set focus to element    ${locatorB_store_select_timezone}
    ${timezonecon}    get text    ${locatorB_store_select_timezone}
    should contain    ${timezonecon}    (GMT - 12:00) 国际日期变更线西

store032
    [Documentation]    选择店铺时区之后下拉框自动收起
    [tags]    P0
    wait and click element    css:#time_zone span[class="ant-select-arrow"]
    wait and click element    css:#time_zone ~ div ul li:nth-child(2)    #选择店铺时区下拉列表中的第二个
    page should contain button    ${locatorB_button_save00}
    sleep    2
    set focus to element    ${locatorB_store_select_timezone}
    ${timezonecon}    get text    ${locatorB_store_select_timezone}
    should contain    ${timezonecon}    (GMT - 11:00) 美属萨摩亚，中途岛

#*** Test Cases ***
#store001
#    [Documentation]    店铺信息-店铺名称里UI展示正确
#    [Tags]    P1
#    Wait Until Page Contains    ${contextB_store_storeInfo}
#
#store002
#    [Documentation]    店铺名称可保存小于50个字符
#    [Tags]    P0    threshold
#    Wait And Input Text    ${locatorB_store_input_storeName}    storeName
#    Wait And Click Element    ${locatorB_button_save00}
##    Wait Until Page Contains Text    店铺信息更新成功。
#    Wait Until Page Not Contains Locator     ${locatorB_button_save00}
#    Reload Page And Start Ajax
#    Value Of Element Should Be Equal With Wait    ${locatorB_store_input_storeName}    storeName
#
#store007
#    [Documentation]    验证‘店铺链接’UI展示正确
#    [Tags]    P0    threshold
#    Element Attribute Should Be Equal With Wait    ${locatorB_store_input_storeLink}     class    ant-input ant-input-disabled
#
#store025
#    [Documentation]    验证可选择货币
#    [Tags]    P0    threshold
#    Wait And Select From List By Clicking    ${locatorB_store_select_currency}     ${locatorB_store_select_childSetCurrency}[3]
#    Wait And Click Element    ${locatorB_popUps_button_footermiddle}
#    Wait And Click Element    ${locatorB_button_save00}
##    Wait Until Page Contains Text    店铺信息更新成功。
#    Reload Page And Start Ajax
#    Wait Until Page Not Contains Locator    ${locatorB_button_save00}
#    Text Of Element Should Be Equal With Wait     ${locatorB_store_select_currency}      CAD
#
#store027
#    [Documentation]    验证可选择时区
#    [Tags]    P0    threshold
#    Wait And Select From List By Clicking    ${locatorB_store_select_timeZone}     ${locatorB_store_select_childTime}[32]
#    Wait And Click Element    ${locatorB_button_save00}
##    Wait Until Page Contains Text    店铺信息更新成功。
#    Reload Page And Start Ajax
#    Wait Until Page Not Contains Locator    ${locatorB_button_save00}
#    Text Of Element Should Be Equal With Wait     ${locatorB_store_select_timeZone}    (GMT + 13:00) 努库阿洛法，萨摩亚

