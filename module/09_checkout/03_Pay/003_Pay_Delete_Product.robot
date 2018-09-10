*** Settings ***
Documentation     在支付界面返回后台删除本次购买的商品，再返回支付界面点击pay now，支付失败
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Products Test Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_products.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_products.robot
Resource          ../../../resources/keywords/kw_checkout.robot

*** Test Cases ***
checkout140
    [Documentation]    在支付界面返回后台删除本次购买的商品，再返回支付界面点击pay now，支付失败
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #选中商品，点击进入checkout页面
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #返回后台页面删除该商品
    Select Window    店匠科技
    #点击删除第一件商品
    Wait And Click Element    ${locatorB_productsMgmt_icon_delete}
    #点击确定按钮
    Wait And Click Element    ${locatorB_popUps_button_middle}
    #切换到支付页
    Select Window    title=${user_default_domain}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #支付失败
    Page Should Contain    ${contentB_payment_failed}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Default User
    Start Ajax Listener
    Add Product_Up
    Sleep    8
    Go To Products Page

Products Suite Teardown
    [Documentation]    商品 case set down
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
