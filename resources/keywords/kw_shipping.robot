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

# 由于使用封装的Open New And Close Other Windows方法导致为止chrome错误，且只有shipping模块会报错
# （只有在docker中跑会出错，无法截图，暂时找不到错误原因。）
# 先使用每个用例重新登录的方法跑用例
Shipping Case Setup
	[Documentation]
	Login With Default User
	kwshipping.del_all_shipping_py
    Go To Shipping Page

Shipping Case Teardown
	[Documentation]
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