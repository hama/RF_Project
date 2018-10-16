*** Settings ***
Documentation     物流
Resource          kw_common.robot

*** keyword ***

Shipping Suite Setup
	[Documentation]
#    Login With Default User

Shipping Suite Teardown
    [Documentation]
    kwshipping.del_all_shipping_py
    Close Test Suite Browser

Shipping Case Setup
	[Documentation]
	Login With Default User
	kwshipping.del_all_shipping_py
    Go To Shipping Page

Shipping Case Teardown
	kwshipping.del_all_shipping_py
    Close Browser

Add Default Shipping Country
	[Documentation]    添加默认的物流国家（即第一个大洲的第一个国家），并保存
	Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
    Wait And Click Element    ${locatorB_shippingNew_popUp_arrow_listArrow}
    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_firstCountry}
    Wait And Click Element    ${locatorB_shippingNew_btn_popUpConfirm}

Add Default Price Shipping
	[Documentation]    添加默认的价格运费（即不除了运费名，其余不填写）
	Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_shippingName}    autotest_shipping_name
    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_save}