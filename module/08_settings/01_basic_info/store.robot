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
    [Tags]    P1
    Wait Until Page Contains    ${contextB_store_storeInfo}

store002
    [Documentation]    店铺名称可保存小于50个字符
    [Tags]    P0
    Clear Element Text    ${locatorB_store_input_storeName}
    Wait And Input Text    ${locatorB_store_input_storeName}    zhoulidianpu
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains    店铺信息更新成功。
    Reload Page
    Value Of Element Should Be Equal With Wait    ${locatorB_store_input_storeName}    zhoulidianpu

store003
    [Documentation]    店铺名称不可保存大于50个字符
    [Tags]    P0
    Clear Element Text    ${locatorB_store_input_storeName}
    Wait And Input Text    ${locatorB_store_input_storeName}    zhoulidianpuzhoulidianpuzhoulidianpuzhoulidianpuzhouli
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Locator    ${locatorB_button_save00}
    Page Should Contain    不能超过50个字符

store004
    [Documentation]    店铺名称可保存50个字符
    [Tags]    P0
    Clear Element Text    ${locatorB_store_input_storeName}
    Wait And Input Text    ${locatorB_store_input_storeName}    zhoulidianpuzhoulidianpuzhoulidianpuzhoulidianpuzh
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains    店铺信息更新成功。
    Reload Page
    Value Of Element Should Be Equal With Wait    ${locatorB_store_input_storeName}    zhoulidianpuzhoulidianpuzhoulidianpuzhoulidianpuzh

store006
    [Documentation]    输入店铺名称时字数统计对应变化
    [Tags]      P2
    Clear Element Text    ${locatorB_store_input_storeName}
    ${textcon}    Set Variable    zhouli
    ${textnum}    Get Length    ${textcon}
    ${textnum_str}=    Convert To String    ${textnum}
    Wait And Input Text    ${locatorB_store_input_storeName}    ${textcon}
    Text Of Element Should Contain With Wait    ${locatorB_store_input_storeName_nameNum}    ${textnum_str}

store007
    [Documentation]    验证‘店铺链接’UI展示正确
    [Tags]    P0    threshold
    Element Attribute Should Be Equal With Wait    ${locatorB_store_input_storeLink}     class    ant-input ant-input-disabled

store008
    [Documentation]    点击域名配置，正确跳转到域名信息页面
    [Tags]    P1
    Wait And Click Element    ${locatorB_store_a_domain}
    Wait Until Page Contains    店铺主域名
    Wait Until Page Contains Locator    ${locatorB_store_a_domain_ant_btn}

store011
    [Documentation]    店主邮箱输入正确格式的邮箱可保存成功
    [Tags]    P0
    Clear Element Text    ${locatorB_store_input_storeEmail}
    Wait And Input Text    ${locatorB_store_input_storeEmail}    zhouli@shoplazza.com
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains    店铺信息更新成功。
    Reload Page
    Value Of Element Should Be Equal With Wait    ${locatorB_store_input_storeEmail}    zhouli@shoplazza.com

store012
    [Documentation]    店主邮箱输入格式错误的邮箱，不可保存
    [Tags]    P1
    Clear Element Text    ${locatorB_store_input_storeEmail}
    Wait And Input Text    ${locatorB_store_input_storeEmail}    @zhou@shop.com213
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Locator    ${locatorB_button_save00}
    Page Should Contain    请输入格式正确的邮箱

store015
    [Documentation]    输入正确格式的客服邮箱可保存成功
    [Tags]    P0
    Clear Element Text    ${locatorB_store_store_input_serviceEmail}
    Wait And Input Text    ${locatorB_store_store_input_serviceEmail}    zhouliservice@shoplazza.com
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains    店铺信息更新成功。
    Reload Page
    Value Of Element Should Be Equal With Wait    ${locatorB_store_store_input_serviceEmail}    zhouliservice@shoplazza.com

store016
    [Documentation]    输入非法格式的邮箱，不可保存
    [Tags]    P1
    Clear Element Text    ${locatorB_store_store_input_serviceEmail}
    Wait And Input Text    ${locatorB_store_store_input_serviceEmail}    @zhouliserviceshop
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains Locator    ${locatorB_button_save00}
    Page Should Contain    请输入格式正确的邮箱

store019
    [Documentation]    上传建议尺寸大小的‘网站favicon’可正常显示
    [Tags]    P0
    Wait And Mouse Over    ${locatorB_store_div_favion}
    Set Focus To Element    ${locatorB_store_div_favion}
    Wait And Click Element    ${locatorB_store_i_delete}
    Wait Enabled And Choose File    dom:document.querySelectorAll('input[type="file"]')    ${file_products_addImg}
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Not Contains Locator    ${locatorB_button_save00}
    Reload Page
    Wait Until Page Contains Locator    ${locatorB_store_div_favion_img}

store022
    [Documentation]    验证‘常规设置-店铺货币’UI展示正确
    [Tags]    P0
    Set Focus To Element    ${locatorB_store_select_currency}
    Text Of Element Should Contain With Wait    ${locatorB_store_select_currency}    USD
    Wait Until Page Contains    店铺正常运营之后，更改货币将影响您店铺的商品价格、订单和数据等信息，请谨慎操作

store023
    [Documentation]    验证‘常规设置-店铺时区’UI展示正确
    [Tags]    P0
    Set Focus To Element    ${locatorB_store_select_timezone}
    Text Of Element Should Contain With Wait    ${locatorB_store_select_timezone}    (GMT + 08:00) 北京，香港，台北，新加坡

store024
    [Documentation]    点击货币选择框，展开下拉框
    [Tags]    P0
    Wait And Click Element    ${locatorB_store_select_currency_listIcon}    #点击下拉列表箭头
    Wait Until Page Contains Text   USD
    Wait Until Page Contains Text   EUR
    Wait Until Page Contains Text   GBP
    Wait Until Page Contains Text   CAD
    Wait Until Page Contains Text   AFN
    Wait Until Page Contains Text   ALL

store025.1
    [Documentation]    可选择货币
    [Tags]    P0
    Wait And Click Element    ${locatorB_store_select_currency_listIcon}
    Wait And Click Element Then Confirm    ${locatorB_store_select_currency_listContent}[2]
    Text Of Element Should Contain With Wait    ${locatorB_store_select_currency}    GBP

store027
    [Documentation]    选择货币之后，下拉框自动收起
    [Tags]    P0
    Wait And Click Element    ${locatorB_store_select_currency_listIcon}
    Wait And Click Element    ${locatorB_store_select_currency_listContent}[2]    #选择店铺货币下拉列表中的第四个
    Set Focus To Element    dom:document.querySelectorAll('button[class*="middle_btn"]')[1]   #出现弹窗，下拉列表自动收起

store029.1
    [Documentation]    可选择时区
    [Tags]    P0
    Wait And Click Element    ${locatorB_store_select_timezone_listIcon}
    Wait And Click Element    ${locatorB_store_select_timezone_listContent}[0]    #选择店铺时区下拉列表中的第一个
    Wait And Click Element    ${locatorB_button_save00}
    Wait Until Page Contains    店铺信息更新成功。
    Reload Page
    Text Of Element Should Be Equal With Wait    ${locatorB_store_select_timezone}    (GMT - 12:00) 国际日期变更线西

store032
    [Documentation]    选择店铺时区之后下拉框自动收起
    [Tags]    P0
    Wait And Click Element    ${locatorB_store_select_timezone_listIcon}
    Wait And Click Element    ${locatorB_store_select_timezone_listContent}[1]    #选择店铺时区下拉列表中的第二个
    Wait Until Page Contains Locator    ${locatorB_button_save00}

