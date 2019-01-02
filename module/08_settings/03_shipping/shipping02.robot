#*** Settings ***
#Suite Setup       Shipping Suite Setup
#Suite Teardown    Shipping Suite Teardown
#Test Setup        Shipping Case Setup
#Test Teardown     Shipping Case Teardown
##Test Setup        Shipping Case Setup Tmp Fix
##Test Teardown     Shipping Case Teardown Tmp Fix
#Force Tags        shipping
#Resource          ../../../resources/keywords/kw_common.robot
#
#*** Test Cases ***
#shipping126
#    [Documentation]    测试添加物流界面保存按钮
#    [Tags]    P0    threshold
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    输入中文
#    Add Default Shipping Country
#	Add Default Price Shipping
#    Wait And Click Element    ${locatorB_button_save}
#    Wait Until Page Contains Text    操作成功
#    Wait Until Page Contains Text    物流方案设置
#    Wait Until Page Contains Element    ${locatorB_shipping_items_listShippingItems}[0]
#
#shipping130
#    [Documentation]    测试添加物流界面国家列表界面的修改和删除按钮
#    [Tags]    P0    threshold
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
#    Wait And Click Element    ${locatorB_shippingNew_popUp_arrow_listArrow}[0]
#    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_firstCountry}
#    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_secondCountry}
#    Wait And Click Element    ${locatorB_shippingNew_btn_popUpConfirm}
#    Text Of Element Should Contain With Wait    ${locatorB_shippingNew_text_listCountryName}[0]    阿尔及利亚
#    Text Of Element Should Contain With Wait    ${locatorB_shippingNew_text_listCountryName}[1]    安哥拉
#	Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
#    Wait And Click Element    ${locatorB_shippingNew_popUp_arrow_listArrow}[0]
#    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_secondCountry}
#    Wait And Click Element    ${locatorB_shippingNew_btn_popUpConfirm}
#	Count Of Element Should Be Equal With Wait    ${locatorB_shippingNew_text_listCountryName}    ${1}
#
#shipping131
#    [Documentation]    测试添加物流界面国家列表界面的修改和删除按钮
#    [Tags]    P0    threshold
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
#    Wait And Click Element    ${locatorB_shippingNew_popUp_arrow_listArrow}[0]
#    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_firstCountry}
#    Wait And Click Element    ${locatorB_shippingNew_btn_popUpConfirm}
#    Text Of Element Should Contain With Wait    ${locatorB_shippingNew_text_listCountryName}[0]    阿尔及利亚
#    Wait And Click Element Then Confirm    ${locatorB_shippingNew_icon_listDelCountryItem}[0]
#	Count Of Element Should Be Equal With Wait    ${locatorB_shippingNew_text_listCountryName}    ${0}
#
#shipping134
#    [Documentation]    测试添加物流界面运费列表中修改和删除按钮
#    [Tags]    P0    threshold
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Add Default Price Shipping
#    Wait And Click Element    ${locatorB_shippingNew_icon_listEditPriceShippingItem}[0]
#	Text Of Element Should Be Equal With Wait    ${locatorB_popUps_title}    编辑autotest_shipping_name的运费
#
#shipping141
#    [Documentation]    测试添加物流界面运费列表中修改和删除按钮
#    [Tags]    P0    threshold
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Add Default Price Shipping
#	Wait And Click Element Then Confirm    ${locatorB_shippingNew_icon_listDelPriceShippingItem}[0]
#	Count Of Element Should Be Equal With Wait    ${locatorB_shippingNew_text_listCountryName}    ${0}
#
#shipping142
#    [Documentation]    测试物流类表中显示所有已添加的物流
#    [Tags]    P0    threshold
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    输入中文
#    Add Default Shipping Country
#    Wait And Click Element    ${locatorB_button_save}
#    Wait Until Page Contains Text    操作成功
#    Wait Until Page Contains Text    物流方案设置
#    Wait Until Page Contains Element    ${locatorB_shipping_items_listShippingItems}[0]
#
#shipping145
#    [Documentation]    测试物流详情界面可修改内容
#    [Tags]    P0    threshold
#    kwshipping.add_shipping_with_conf_py
#    Reload Page And Start Ajax
#    Wait And Click Element    ${locatorB_shipping_items_listShippingItems}[0]
#    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    123
#    Wait And Click Element    ${locatorB_button_save}
#    Wait Until Page Contains Text    操作成功
#    Wait Until Page Contains Text    物流方案设置
#    Wait Until Page Contains Element    ${locatorB_shipping_items_listShippingItems}[0]
#	Text Of Element Should Contain With Wait    ${locatorB_shipping_text_listShippingItemsName}    123
#
#shipping146
#    [Documentation]    测试物流详情界面可修改内容
#    [Tags]    P0    threshold
#    kwshipping.add_shipping_with_conf_py
#    Reload Page And Start Ajax
#    Wait And Click Element    ${locatorB_shipping_items_listShippingItems}[0]
#    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    输入中文
#    Wait And Click Element    ${locatorB_icon_back}
#    Wait Alert Should Be Present And Accept    页面上有未保存内容，是否确定退出?
#    Wait Until Page Contains Element    ${locatorB_shipping_items_listShippingItems}[0]
#    Text Of Element Should Contain With Wait    ${locatorB_shipping_text_listShippingItemsName}    autotest_shipping
#
#shipping146.1
#    [Documentation]    测试物流详情界面可修改内容
#    [Tags]    P0    threshold
#    kwshipping.add_shipping_with_conf_py
#    Reload Page And Start Ajax
#    Wait And Click Element    ${locatorB_shipping_items_listShippingItems}[0]
#    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    输入中文
#    Wait And Click Element    ${locatorB_icon_back}
#    Wait Alert Should Be Present And Dismiss    页面上有未保存内容，是否确定退出?
#    Wait Until Page Contains Element    ${locatorB_shippingNew_btn_addCountry}
#
#shipping147
#    [Documentation]    测试物流详情界面可修改内容
#    [Tags]    P0    threshold
#    kwshipping.add_shipping_with_conf_py
#    Reload Page And Start Ajax
#    Wait And Click Element    ${locatorB_shipping_items_listShippingItems}[0]
#    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    输入中文
#    Wait And Click Element Then Confirm    ${locatorB_shippingNew_btn_delShipping}
#    Wait Until Page Contains Element    ${locatorB_shipping_items_listShippingItems}[0]
#    Count Of Element Should Be Equal With Wait    ${locatorB_shippingNew_text_listCountryName}    ${0}
#
#shipping147.1
#    [Documentation]    测试物流详情界面可修改内容
#    [Tags]    P0    threshold
#    kwshipping.add_shipping_with_conf_py
#    Reload Page And Start Ajax
#    Wait And Click Element    ${locatorB_shipping_items_listShippingItems}[0]
#    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    输入中文
#    Wait And Click Element Then Cancel    ${locatorB_shippingNew_btn_delShipping}
#    Wait Until Page Contains Element    ${locatorB_shippingNew_btn_addCountry}
#
#
#
##基础信息-物流p0用例（周莉编写）
##shipping013
##    [Documentation]    测试添加国家按钮（双击）
##    [Tags]    P0
##    Wait And Click Element    ${locatorB_shipping_btn_startSet}
##    Sleep    2
##    Double Click Element    ${locatorB_shippingNew_btn_addCountry}
##    Wait Until Page Contains Locator    ${locatorB_popUps_title}
##    Wait Until Page Contains Text    国家选择
##
##shipping014
##    [Documentation]    测试添加国家按钮（长按）
##    [Tags]    P0
##    Wait And Click Element    ${locatorB_shipping_btn_startSet}
##    Sleep    2
##    Mouse Down    ${locatorB_shippingNew_btn_addCountry}
##    Wait Until Page Not Contains Locator    ${locatorB_popUps_title}
##    Wait Until Page Not Contains Text    国家选择
#
#shipping015
#    [Documentation]    测试添加国家弹窗界面功能(输入为空)
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
#    Wait And Input Text    ${locatorB_shippingNew_popUp_input_countryName}    ${Empty}
#    Wait Until Page Contains Locator    ${locatorB_shippingNew_popUp_ul_listContinent}
#
#shipping017
#    [Documentation]    测试添加国家弹窗界面功能(输入'中')
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
#    Wait And Input Text    ${locatorB_shippingNew_popUp_input_countryName}    中
#    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_search}
#    Wait Until Page Contains Text    中
#    Wait Until Page Contains Text    其他国家
#
#
#shipping018
#    [Documentation]    测试添加国家弹窗界面功能(输入特殊字符)
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
#    Wait And Input Text    ${locatorB_shippingNew_popUp_input_countryName}    ！%¥@#%……@¥#！……@#¥
#    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_search}
#    Wait Until Page Contains Text    其他国家
#
#shipping019
#    [Documentation]    测试添加国家弹窗界面功能(不勾选显示)
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
#    Wait And Input Text    ${locatorB_shippingNew_popUp_input_countryName}    中国
#    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_search}
#    Set Focus To Element    ${locatorB_shippingNew_popUp_span_selectedContent}
#    Text Of Element Should Contain With Wait    ${locatorB_shippingNew_popUp_span_selectedContent}    已选择0个地区
#
#shipping021
#    [Documentation]    测试添加国家弹窗界面功能
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
#    Wait And Click Element    ${locatorB_shippingNew_popUp_arrow_listArrow}
#    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_firstCountry}[0]
#    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_firstCountry}[1]
#    Wait And Click Element    ${locatorB_shippingNew_btn_popUpConfirm}
#    Wait Until Page Contains Text    阿尔及利亚
#    Wait Until Page Contains Text    安哥拉
#
#shipping023
#    [Documentation]    测试添加国家弹窗界面功能(勾选其他国家后勾选国家列表中的国家)
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
#    Wait And Input Text    ${locatorB_shippingNew_popUp_input_countryName}    阿尔及利亚
#    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_search}
#    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_otherCountry}
#    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_firstCountry}[0]
#    Wait And Click Element    ${locatorB_shippingNew_btn_popUpConfirm}
#    Text Of Element Should Contain With Wait    ${locatorB_shippingNew_text_listCountryName}    阿尔及利亚
#
#shipping024
#    [Documentation]    测试添加国家弹窗界面功能(勾选国家后点击窗口的关闭按钮)
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
#    Wait And Input Text    ${locatorB_shippingNew_popUp_input_countryName}    阿尔及利亚
#    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_search}
#    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_firstCountry}[0]
#    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_cancel}
#    Wait Until Page Contains Text    暂无数据
#
#shipping025
#    [Documentation]    测试添加国家弹窗界面功能(不勾选国家点击窗口的关闭按钮)
#    [Tags]    P0
#    Wait And Click Element    ${locatorB_shipping_btn_startSet}
#    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
#    Wait And Input Text    ${locatorB_shippingNew_popUp_input_countryName}    阿尔及利亚
#    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_search}
#    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_cancel}
#    Wait Until Page Contains Text    暂无数据
#
##shipping027
##    [Documentation]    双击价格栏添加运费按钮
##    [Tags]    P0
##    Wait And Click Element    ${locatorB_shipping_btn_startSet}
##    sleep    2
##    Double Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
##    Text Of Element Should Be Equal With Wait    ${locatorB_popUps_title}    添加基于价格的运费
#
#
#
#
#
#
#
#
#
#
#
#
#
##shipping_group001
##    [Documentation]    shipping_group001检查
##    [Tags]    group
##    Sleep And Click Element    dom:document.querySelectorAll('[role="tab"]')[1]
##    Sleep And Click Element    dom:document.querySelectorAll('[class*="ant-btn middle_btn"]')[1]
##    Wait And Mouse Over    dom:document.querySelectorAll('[class*="logo_area"]')[0]
##    Sleep And Click Element    dom:document.querySelectorAll('[class*="ant-btn middle_btn_e01e btn_add"]')[0]
##
##    Check P1 Point shipping001 By shippinggroup001
##    Check P1 Point shipping002 By shippinggroup002
##    Check P1 Point shipping003 By shippinggroup003
##    Check P0 Point shipping004 By shippinggroup004
##    Check P0 Point shipping005 By shippinggroup005
##    Check P0 Point shipping006 By shippinggroup006
##    Check P0 Point shipping007 By shippinggroup007
##
##
##*** Key Words ***
##shippinggroup001
##    [Documentation]      验证添加汉邮物流商弹窗中，货代名称输入框不可为空
##     Wait And Input Text     dom:document.querySelectorAll('[id="channel_name"]')[0]    ${Empty}
##     Wait And Input Text     dom:document.querySelectorAll('[id="client_id"]')[0]    1234567890
##     Wait And Input Text     dom:document.querySelectorAll('[id="secret_key"]')[0]    1234567890asdasdasdasd
##     Wait And Click Element    dom:document.querySelectorAll('[class="ant-btn middle_btn_e01e undefined confirm_btn_fbba"]')[0]
##     Wait Until Page Contains Text    请输入货代名称
##
##
##shippinggroup002
##    [Documentation]      验证添加汉邮物流商弹窗中，账户ID输入框不可为空
##     Wait And Input Text     dom:document.querySelectorAll('[id="channel_name"]')[0]    1231231231231
##     Wait And Input Text     dom:document.querySelectorAll('[id="client_id"]')[0]    1
##     Press Key     dom:document.querySelectorAll('[id="client_id"]')[0]    \\8
##     Wait And Input Text     dom:document.querySelectorAll('[id="secret_key"]')[0]    1234567890asdasdasdasd
##     Wait And Click Element    dom:document.querySelectorAll('[class="ant-btn middle_btn_e01e undefined confirm_btn_fbba"]')[0]
##     Wait Until Page Contains Text    请输入账户ID
##
##
##shippinggroup003
##    [Documentation]      验证添加汉邮物流商弹窗中，账户密钥输入框不可为空
##     Wait And Input Text     dom:document.querySelectorAll('[id="channel_name"]')[0]    1231231231231
##     Wait And Input Text     dom:document.querySelectorAll('[id="client_id"]')[0]    sdasda12312312
##     Wait And Input Text     dom:document.querySelectorAll('[id="client_id"]')[0]    1
##     Press Key     dom:document.querySelectorAll('[id="client_id"]')[0]    \\8
##     Wait And Click Element    dom:document.querySelectorAll('[class="ant-btn middle_btn_e01e undefined confirm_btn_fbba"]')[0]
##     Wait Until Page Contains Text    请输入账户密钥
##
##
##shippinggroup004
##    [Documentation]      验证添加汉邮物流商弹窗中，账户ID输入框输入错误内容不可添加
##     Wait And Input Text     dom:document.querySelectorAll('[id="channel_name"]')[0]    1231231231231
##     Wait And Input Text     dom:document.querySelectorAll('[id="client_id"]')[0]    asdasdas4345345
##     Wait And Input Text     dom:document.querySelectorAll('[id="secret_key"]')[0]     asdasdas4345345wqewqeqw
##     Sleep And Click Element    dom:document.querySelectorAll('[class="ant-btn middle_btn_e01e undefined confirm_btn_fbba"]')[0]
##     Wait Until Page Contains Text    输入的账户ID或密钥有误，请重新输入
##
##
##shippinggroup005
##    [Documentation]      验证添加汉邮物流商弹窗中，账户密钥输入框输入错误内容不可添加
##     Wait And Input Text     dom:document.querySelectorAll('[id="channel_name"]')[0]    1231231231231
##     Wait And Input Text     dom:document.querySelectorAll('[id="client_id"]')[0]    asdasdas4345345
##     Wait And Input Text     dom:document.querySelectorAll('[id="secret_key"]')[0]     asdasdas4345345wqewqeqw
##     Sleep And Click Element    dom:document.querySelectorAll('[class="ant-btn middle_btn_e01e undefined confirm_btn_fbba"]')[0]
##     Wait Until Page Contains Text    输入的账户ID或密钥有误，请重新输入
##
##
##shippinggroup006
##    [Documentation]      验证添加汉邮物流商弹窗中，查看官网了解更多 文本连接可点击
##     Wait And Click Element    dom:document.querySelectorAll('[href=" http://uaibest.com/"]')[0]
##     Focus On New Window
##     Location Should Be    http://uaibest.com/
##
##shippinggroup007
##    [Documentation]      验证添加汉邮物流商弹窗中，弹窗可关闭
##     Wait And Click Element    dom:document.querySelectorAll('[class="ant-drawer-close-x"]')[1]
##     Wait Until Page Not Contains Text     添加物流商
