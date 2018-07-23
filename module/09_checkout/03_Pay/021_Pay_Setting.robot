*** Settings ***
Documentation     进入支付页后,返回后台修改结账设置修改为必填或选填,点击pay now支付成功
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Products Test Case Setup
Test Teardown     Products Test Case Teardown
Force Tags        Checkout
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot
Resource          ../../../resources/kw_checkout.robot
Resource          ../../../resources/var_checkout.robot


*** Test Cases ***
ksksksksksk
    Add Custom Products    11
    Checkout Common Setp
    Wait And Click Element    ${locator_checkout_by_now_btn}
    Wait And Click Element    ${locator_checkout_submit_btn_s}
    Wait And Click Element    ${locator_checkout_address_save_checkout_btn}
    Add Address Common Setp    # 添加地址公共部分
checkout171
    [Documentation]    进入支付页后,返回后台修改结账设置修改为必填或选填,点击pay now支付成功
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    Select_Order_Page    ${title}
    #填写完地址信息
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #进入后台，修改选填或必填
    Select Window    店匠科技
    Modify_Set_Radio    3
    #跳回checkout页
    Select Window    title=${user_default_domain}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Default User
    Start Ajax Listener
    Add Product_Up
    Sleep    8
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品，还原之前的设置
    Select Window    店匠科技
    Go To Products Page
    Delete_First_Product
    Modify_Set_Radio    2
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
