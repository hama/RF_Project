*** Settings ***
Suite Setup       Shipping Suite Setup
Suite Teardown    Shipping Suite Teardown
Test Setup        Shipping Case Setup
Test Teardown     Shipping Case Teardown
#Test Setup        Shipping Case Setup Tmp Fix
#Test Teardown     Shipping Case Teardown Tmp Fix
Force Tags        shipping
Resource          ../../../resources/keywords/kw_common.robot

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
    sleep    4
    Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    sleep    4
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
    Sleep And Click Element    ${locatorB_shippingNew_popUp_checkbox_freeShipping}
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