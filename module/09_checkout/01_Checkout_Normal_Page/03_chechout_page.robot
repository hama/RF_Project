*** Settings ***
Documentation     Ckeckout Page Check
Suite Setup       Checkout Common Step
Suite Teardown    Common Teardown    # close the browser opened for this test suite
Test Teardown     Teardown Test Case
Force Tags        Checkout
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_checkout.robot
Resource          ../../../resources/variable/var_checkout.robot
Resource          ../../../resources/variable/var_product_management.robot
Resource          ../../../resources/keywords/kw_chechout_page.robot
Library           ${CURDIR}/../../../lib/customlib/kwproduct.py
Library           ${CURDIR}/../../../lib/customlib/kwshipping.py
Library           ${CURDIR}/../../../lib/customlib/kwtax.py
Library           ${CURDIR}/../../../lib/customlib/kwmarketing.py
Library           ${CURDIR}/../../../lib/customlib/lib_utils.py

Library           ${CURDIR}/../../../lib/customlib/kwcheckout.py


*** Testcases ***



checkout090
    [Documentation]    验证B端运费方案中，勾选免运费时，checkout shipping页面，运费栏显示的运费价格为$0.00 >1.B端物流方案中添加物流物流，国家：中国，运费：运费1 不限价格 免运费2.C端购买任意商品进入checkout shipping页面 3.国家选择中国4.查看shipping delivery栏运费
    [Tags]    P0    threshold    smoke
    #添加一个中国物流，默认免运费
    Add Shipping The Freight
    #进入商品详情页步骤
    Click Preview Step

    Wait Until Page Contains Text   0.00

checkout093
    [Documentation]    验证从商品详情页面buy now进入checkout shipping页面后，点击return可返回商品详情页面 > 1.C端进入任意一个商品详情页面 2.buy now进入checkout shipping页面 3.点击return
    [Tags]    P0    threshold    smoke
    #从B端进入商品详情页
    Click Preview Step
    Wait And Click Element    ${locatorB_checkout_by_now_btn}

    Wait Until Page Contains Text   Order summary
    Wait And Click Element  ${locator_checkout_button_checkoutBack}
    Wait Until Page Contains Locator    ${locatorB_checkout_by_now_btn}

checkout094
    [Documentation]    验证从购物车进入checkout shipping页面后，点击return可返回购物车 > 1.C端将任意商品加入购物车 2.进入购物车点击checkout按钮进入checkout shipping页面 3.点击return
    [Tags]    P0    threshold    smoke
    #从B端进入商品详情页
    Click Preview Step
    Wait And Click Element  ${locatorB_checkout_add_card_btn}

    Sleep Time
    Wait And Click Element  ${locatorB_checkout_card_img_btn}
    Wait And Click Element  ${locatorB_checkout_submit_shippingCart}
    Wait Until Page Contains Text   Order summary
    #.返回
    Wait And Click Element  ${locator_checkout_button_checkoutBack}
    Wait Until Page Contains Text   Shopping cart

checkout096
    [Documentation]    验证checkout shipping页面，点击payment method按钮可进入支付页面 > 1.shipping address中输入合法内容  2.点击payment method按钮

    #从B端进入商品详情页
    Click Preview Step
    Wait And Click Element  ${locatorB_checkout_by_now_btn}

    #添加是shipping address
    Add Address Common Step
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait Until Page Contains Text   order_summary





