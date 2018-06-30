*** Settings ***
Documentation     结账设置中将只填写邮箱改为只填写手机或者手机邮箱都需填写，点击pay now后只显示邮箱，不显示未输入的手机号
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

*** Test Cases ***
Change_Status
    [Documentation]    结账设置中将只填写邮箱改为只填写手机或者手机邮箱都需填写，点击pay now后只显示邮箱，不显示未输入的手机号
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #点击个人账户按钮，展现出店铺名称
    Wait And Click Element    dom:document.querySelectorAll(".xiala-choose")[0]
    #获取店铺名称
    ${store_name}    Get Text    dom:document.querySelectorAll(".name___2AVIS")[0]
    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #先设置成只需填写邮箱
    Modify_Set    0
    Sleep    5
    Go To Products Page
    Sleep    5
    Select_Order_Page    ${title}
    #填写完地址信息(只填写邮箱)，不点击提交按钮
    Complete_Order_Message_Without_Phone
    #点击submit按钮
    Wait And Click Element    id:submitMbPay
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    Select Window    店匠科技
    #修改为填写手机和邮箱
    Modify_Set    2
    Sleep    5
    Select Window    title=${store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.
    #只显示邮箱信息，页面上不存在手机号
    Page Should Not Contain    15297989918

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Test Account
    Start Ajax Listener
    Add Product_Up
    Sleep    8
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品
    Select Window    店匠科技
    Go To Products Page
    Delete_First_Product
    Sleep    5
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
