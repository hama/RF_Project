*** Settings ***
Documentation     checkout三页 公共方法
Resource          kw_common.robot

*** keywords ***
Checkout Multi Suite Setup
    [Documentation]    布置开始执行用例环境
    Login With Default User
    #初始化物流环境
    kwshipping.del_all_shipping_py
    kwproduct.del_all_products_py
    kwshipping.create_only_one_shipping_py
    kwcheckout.set_checkout_process_with_conf_py
    #添加一个商品价格为$444,名称：autotest_title
    public_method.create    product    {"title": "autotest_title","variants": [{"price": "444"}]}
    #激活COD货到付款方式
    kwpayment.activate_payment_cod_py
    kwcheckout.set_single_page_checkout_process_py

Checkout Multi Suite Teardown
    [Documentation]    每个用例执行结束步骤
    #还原初始化环境
#    kwshipping.del_all_shipping_py
#    kwproduct.del_all_products_py
    Close Test Suite Browser

Checkout Multi Case Setup
    [Documentation]    每个用例执行开始步骤
    kwcheckout.set_multi_page_checkout_process_py
    Reload Page And Start Ajax
    Go To First Product C Interface

checkout_001
    [Documentation]    验证从cart可进入checkout页面
    [Tags]    P0
    Wait And Click Element    ${locatorC_checkoutShipping_button_return}
    Sleep    1
    Wait And Click Element    ${locatorC_productDetail_button_addToCart}
    Sleep    1
    Wait And Click Element    ${locatorC_icon_card}
    Sleep    1
    Wait And Click Element    ${locatorC_cart_button_checkout}
    Sleep    1
    Wait Until Page Contains Text    Order summary
    Wait Until Page Contains Text    Shipping Address

checkout_002
    [Documentation]    验证从商品详情页面可进入checkout页面
    [Tags]    P0
    Sleep And Click Element    ${locatorC_productDetail_button_buyNow}
    Sleep    1
    Wait Until Page Contains Text    Order summary
    Wait Until Page Contains Text    Shipping Address

checkout_004
    [Documentation]    验证Customer Information页面，订单汇总，商品栏，商品标题显示正常
    [Tags]    P0
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Text Of Element Should Be Equal With Wait   ${locatorC_checkoutShipping_text_itemProductTitle}   women

checkout_005
    [Documentation]    验证Shipping Method页面，订单汇总，商品栏，商品标题显示正常
    [Tags]    P0
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_shippingMethod}
    Text Of Element Should Be Equal With Wait   ${locatorC_checkoutShipping_text_itemProductTitle}   women

checkout_006
    [Documentation]    验证Payment Method页面，订单汇总，商品栏，商品标题显示正常
    [Tags]    P0
    Sleep    1
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Text Of Element Should Be Equal With Wait   ${locatorC_checkoutShipping_text_itemProductTitle}   women

checkout_007
    [Documentation]    验证Customer Information页面，订单汇总，商品栏，商品子产品显示正常
    [Tags]    P0
    Wait And Click Element    ${locatorC_productDetail_button_buyNow}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemProducttype}[0]    color:blue
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemProducttype}[1]    size:XXl

checkout_008
    [Documentation]    验证Shipping Method页面，订单汇总，商品栏，商品子产品显示正常
    [Tags]    P0
    Add Address Common Step
    Wait And Click Element    ${locatorC_checkoutShipping_button_shippingMethod}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemProducttype}[0]    color:blue
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemProducttype}[1]    size:XXl

checkout_009
    [Documentation]    验证Payment Method页面，订单汇总，商品栏，商品子产品显示正常
    [Tags]    P0
    Sleep    1
    Wait And Click Element    ${locatorC_checkoutShipping_button_paymentMethod}
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemProducttype}[0]    color:blue
    Text Of Element Should Be Equal With Wait    ${locatorC_checkoutShipping_text_itemProducttype}[1]    size:XXl