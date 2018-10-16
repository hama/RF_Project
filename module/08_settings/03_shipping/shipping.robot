*** Settings ***
#Suite Setup       Shipping Suite Setup
Suite Teardown    Shipping Suite Teardown
Test Setup        Shipping Case Setup
#Test Teardown     Teardown Test Case
Test Teardown     Shipping Case Teardown
Force Tags        Shipping
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_shipping.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_shipping.robot
Library           ${CURDIR}/../../../lib/customlib/kwshipping.py


*** Test Cases ***
shipping006
    [Documentation]    测试方案名称输入框输入中文
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    输入中文
    Add Default Shipping Country
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text    操作成功
    Wait Until Page Contains Text    物流方案设置
    Wait Until Page Contains Element    ${locatorB_shipping_items_listShippingItems}[0]

shipping007
    [Documentation]    测试方案名称输入框输入数字
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    123
    Add Default Shipping Country
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text    操作成功
    Wait Until Page Contains Text    物流方案设置
    Wait Until Page Contains Element    ${locatorB_shipping_items_listShippingItems}[0]

shipping008
    [Documentation]    测试方案名称输入框输入字符
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    111111111111111111111111111111111111111111111111112
    Add Default Shipping Country
    Value Of Element Should Be Equal With Wait    ${locatorB_shippingNew_input_shippingName}    11111111111111111111111111111111111111111111111111
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text    操作成功
    Wait Until Page Contains Text    物流方案设置
    Wait Until Page Contains Element    ${locatorB_shipping_items_listShippingItems}[0]

shipping009
    [Documentation]    测试方案名称输入框输入为空
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    ${Empty}
    Add Default Shipping Country
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text    请输入物流方案名称。

shipping012
    [Documentation]    测试添加国家按钮
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Add Default Shipping Country

shipping016
    [Documentation]    测试添加国家弹窗界面功能
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_countryName}    中国
    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_search}
    Wait Until Page Contains Text    其他国家
    Wait Until Page Contains Text    China

shipping020
    [Documentation]    测试添加国家弹窗界面功能
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_countryName}    阿尔及利亚
    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_search}
    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_firstCountry}
    Wait And Click Element    ${locatorB_shippingNew_btn_popUpConfirm}
    Text Of Element Should Contain With Wait    ${locatorB_shippingNew_text_listCountryName}    阿尔及利亚

shipping022
    [Documentation]    测试添加国家弹窗界面功能
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_otherCountry}
    Wait And Click Element    ${locatorB_shippingNew_btn_popUpConfirm}
    Text Of Element Should Contain With Wait    ${locatorB_shippingNew_text_listCountryName}    其他国家

shipping026
    [Documentation]    点击价格栏添加运费按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Text Of Element Should Be Equal With Wait    ${locatorB_popUps_title}    添加基于价格的运费

shipping035
    [Documentation]    测试添加价格运费弹窗界面说明输入框正常
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_shippingName}    autotest_shipping_name
    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_save}
    Count Of Element Should Be Equal With Wait    ${locatorB_shippingNew_items_listItemsOfPrice}    ${1}

shipping042
    [Documentation]    测试添加价格运费弹窗界面说明输入框正常
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_shippingName}    autotest_shipping_name
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_minPrice}    1
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_maxPrice}    10
    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_save}
    Count Of Element Should Be Equal With Wait    ${locatorB_shippingNew_items_listItemsOfPrice}    ${1}

shipping044
    [Documentation]    测试添加价格运费弹窗界面说明输入框正常
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_shippingName}    autotest_shipping_name
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_maxPrice}    100
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_minPrice}    200
    Wait And Click Element    ${locatorB_popUps_title}
    Value Of Element Should Be Equal With Wait    ${locatorB_shippingNew_popUp_input_minPrice}    99.00

shipping045
    [Documentation]    测试添加价格运费弹窗界面运费栏功能正常
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Element Attribute Should Be Equal With Wait    ${locatorB_shippingNew_popUp_checkbox_freeShipping}    class    ant-checkbox ant-checkbox-checked
    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_freeShipping}
    Element Attribute Should Be Equal With Wait    ${locatorB_shippingNew_popUp_checkbox_freeShipping}    class    ant-checkbox

shipping046
    [Documentation]    测试添加价格运费弹窗界面运费栏功能正常
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Element Attribute Should Be Equal With Wait    ${locatorB_shippingNew_popUp_checkbox_freeShipping}    class    ant-checkbox ant-checkbox-checked
    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_freeShipping}
    Element Attribute Should Be Equal With Wait    ${locatorB_shippingNew_popUp_checkbox_freeShipping}    class    ant-checkbox

shipping047
    [Documentation]    测试添加价格运费弹窗界面运费栏功能正常
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_shippingPrice}    100
    Element Attribute Should Be Equal With Wait    ${locatorB_shippingNew_popUp_checkbox_freeShipping}    class    ant-checkbox

shipping054
    [Documentation]    测试价格运费添加界面取消按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_shippingName}    autotest_shipping_name
    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_cancel}
    Count Of Element Should Be Equal With Wait    ${locatorB_shippingNew_items_listItemsOfPrice}    ${0}
    Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Value Of Element Should Be Equal With Wait    ${locatorB_shippingNew_popUp_input_shippingName}    ${Empty}

shipping056
    [Documentation]    测试价格运费添加界面关闭按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_shippingName}    autotest_shipping_name
    Wait And Click Element    ${locatorB_button_close}
    Count Of Element Should Be Equal With Wait    ${locatorB_shippingNew_items_listItemsOfPrice}    ${0}
    Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Value Of Element Should Be Equal With Wait    ${locatorB_shippingNew_popUp_input_shippingName}    ${Empty}

shipping057
    [Documentation]    测试重量运费添加运费按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addWeightShipping}
    Text Of Element Should Be Equal With Wait    ${locatorB_popUps_title}    添加基于重量的运费

shipping126
    [Documentation]    测试添加物流界面保存按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    输入中文
    Add Default Shipping Country
	Add Default Price Shipping
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text    操作成功
    Wait Until Page Contains Text    物流方案设置
    Wait Until Page Contains Element    ${locatorB_shipping_items_listShippingItems}[0]

shipping130
    [Documentation]    测试添加物流界面国家列表界面的修改和删除按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
    Wait And Click Element    ${locatorB_shippingNew_popUp_arrow_listArrow}[0]
    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_firstCountry}
    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_secondCountry}
    Wait And Click Element    ${locatorB_shippingNew_btn_popUpConfirm}
    Text Of Element Should Contain With Wait    ${locatorB_shippingNew_text_listCountryName}[0]    阿尔及利亚
    Text Of Element Should Contain With Wait    ${locatorB_shippingNew_text_listCountryName}[1]    安哥拉
	Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
    Wait And Click Element    ${locatorB_shippingNew_popUp_arrow_listArrow}[0]
    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_secondCountry}
    Wait And Click Element    ${locatorB_shippingNew_btn_popUpConfirm}
	Count Of Element Should Be Equal With Wait    ${locatorB_shippingNew_text_listCountryName}    ${1}

shipping131
    [Documentation]    测试添加物流界面国家列表界面的修改和删除按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
    Wait And Click Element    ${locatorB_shippingNew_popUp_arrow_listArrow}[0]
    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_firstCountry}
    Wait And Click Element    ${locatorB_shippingNew_btn_popUpConfirm}
    Text Of Element Should Contain With Wait    ${locatorB_shippingNew_text_listCountryName}[0]    阿尔及利亚
    Wait And Click Element Then Confirm    ${locatorB_shippingNew_icon_listDelCountryItem}[0]
	Count Of Element Should Be Equal With Wait    ${locatorB_shippingNew_text_listCountryName}    ${0}

shipping134
    [Documentation]    测试添加物流界面运费列表中修改和删除按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Add Default Price Shipping
    Wait And Click Element    ${locatorB_shippingNew_icon_listEditPriceShippingItem}[0]
	Text Of Element Should Be Equal With Wait    ${locatorB_popUps_title}    编辑autotest_shipping_name的运费

shipping141
    [Documentation]    测试添加物流界面运费列表中修改和删除按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Add Default Price Shipping
	Wait And Click Element Then Confirm    ${locatorB_shippingNew_icon_listDelPriceShippingItem}[0]
	Count Of Element Should Be Equal With Wait    ${locatorB_shippingNew_text_listCountryName}    ${0}

shipping142
    [Documentation]    测试物流类表中显示所有已添加的物流
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_shipping_btn_startSet}
    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    输入中文
    Add Default Shipping Country
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text    操作成功
    Wait Until Page Contains Text    物流方案设置
    Wait Until Page Contains Element    ${locatorB_shipping_items_listShippingItems}[0]

shipping145
    [Documentation]    测试物流详情界面可修改内容
    [Tags]    P0    threshold
    kwshipping.add_max_shipping_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_shipping_items_listShippingItems}[0]
    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    123
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text    操作成功
    Wait Until Page Contains Text    物流方案设置
    Wait Until Page Contains Element    ${locatorB_shipping_items_listShippingItems}[0]
	Text Of Element Should Contain With Wait    ${locatorB_shipping_text_listShippingItemsName}    123

shipping146
    [Documentation]    测试物流详情界面可修改内容
    [Tags]    P0    threshold
    kwshipping.add_max_shipping_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_shipping_items_listShippingItems}[0]
    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    输入中文
    Wait And Click Element    ${locatorB_icon_back}
    Wait Alert Should Be Present And Accept    页面上有未保存内容，是否确定退出?
    Wait Until Page Contains Element    ${locatorB_shipping_items_listShippingItems}[0]
    Text Of Element Should Contain With Wait    ${locatorB_shipping_text_listShippingItemsName}    autotest_shipping

shipping146.1
    [Documentation]    测试物流详情界面可修改内容
    [Tags]    P0    threshold
    kwshipping.add_max_shipping_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_shipping_items_listShippingItems}[0]
    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    输入中文
    Wait And Click Element    ${locatorB_icon_back}
    Wait Alert Should Be Present And Dismiss    页面上有未保存内容，是否确定退出?
    Wait Until Page Contains Element    ${locatorB_shippingNew_btn_addCountry}

shipping147
    [Documentation]    测试物流详情界面可修改内容
    [Tags]    P0    threshold
    kwshipping.add_max_shipping_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_shipping_items_listShippingItems}[0]
    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    输入中文
    Wait And Click Element Then Confirm    ${locatorB_shippingNew_btn_delShipping}
    Wait Until Page Contains Element    ${locatorB_shipping_items_listShippingItems}[0]
    Count Of Element Should Be Equal With Wait    ${locatorB_shippingNew_text_listCountryName}    ${0}

shipping147.1
    [Documentation]    测试物流详情界面可修改内容
    [Tags]    P0    threshold
    kwshipping.add_max_shipping_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_shipping_items_listShippingItems}[0]
    Wait And Input Text    ${locatorB_shippingNew_input_shippingName}    输入中文
    Wait And Click Element Then Cancel    ${locatorB_shippingNew_btn_delShipping}
    Wait Until Page Contains Element    ${locatorB_shippingNew_btn_addCountry}
