*** Settings ***
Documentation     物流
Resource          kw_common.robot

*** keyword ***

Shipping Suite Setup
	[Documentation]
    Login With Default User

Shipping Suite Teardown
    [Documentation]
    kwshipping.del_all_shipping_py
    Close Test Suite Browser

Shipping Case Setup
	[Documentation]
	kwshipping.del_all_shipping_py
    Go To Shipping Page

Shipping Case Teardown
	[Documentation]
    Teardown Test Case

# 由于使用封装的Open New And Close Other Windows方法导致为止chrome错误，且只有shipping模块会报错
# （只有在docker中跑会出错，无法截图，暂时找不到错误原因。）
# 先使用每个用例重新登录的方法跑用例
#Shipping Case Setup Tmp Fix
#	[Documentation]
#	Login With Default User
#	kwshipping.del_all_shipping_py
#    Go To Shipping Page
#
#Shipping Case Teardown Tmp Fix
#	[Documentation]
#    Close Browser

Add Default Shipping Country
	[Documentation]    添加默认的物流国家（即第一个大洲的第一个国家），并保存
	Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
	Sleep    0.2
    Wait And Click Element    ${locatorB_shippingNew_popUp_arrow_listArrow}
	Sleep    0.2
    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_firstCountry}
	Sleep    0.2
    Wait And Click Element    ${locatorB_shippingNew_btn_popUpConfirm}

Add Default Price Shipping
	[Documentation]    添加默认的价格运费（即不除了运费名，其余不填写）
	Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_shippingName}    autotest_shipping_name
    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_save}

Edit Default Weight Shipping
    [Documentation]    修改重量物流的首重、续重、单位kg
    Wait And Click Element    ${locatorB_shipping_button_EidtShipping}
    Wait And Click Element    ${locatorB_priceSettings_icon_EidtShipping}
    Wait And Click Element    ${locatorB_priceSettings_radio_firstWeight}
    Wait And Input Text    ${locatorB_priceSettings_input_firstWeightPrice}    10
    Wait And Input Text    ${locatorB_priceSettings_input_firstWeightRange}    10
    Wait And Click Element    ${locatorB_priceSettings_select_firstWeightUnit}
    Wait And Click Element    ${locatorB_priceSettings_input_firstWeightUnit}
    Wait And Input Text    ${locatorB_priceSettings_input_continuousWeightPrice}    2
    Wait And Input Text    ${locatorB_priceSettings_input_continuousWeightRange}    1
    Wait And Click Element    ${locatorB_priceSettings_select_continuousWeightUnit}
    Wait And Click Element    ${locatorB_priceSettings_input_continuousWeightUnit}
    Sleep And Click Element    ${locatorB_priceSettings_button_popUpsave}