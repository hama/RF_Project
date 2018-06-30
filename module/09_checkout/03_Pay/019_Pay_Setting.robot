*** Settings ***
Documentation     结账设置中改变姓名填写格式，pay now后支付成功页面还是显示原来的信息
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

*** Variables ***
${last_name}      l    # 输入的last name

*** Test Cases ***
Change_Status
    [Documentation]    结账设置中改变姓名填写格式，pay now后支付成功页面还是显示原来的信息（先设置成只填写姓名，再设置成都要填写）
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #获取店铺名称
    ${store_name}    Get Text    dom:document.querySelectorAll(".greeting_txt___2NI7k")[1]
    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #先设置成（姓名）
    Modify_Set_Radio    0
    Sleep    5
    Go To Products Page
    Sleep    5
    Select_Order_Page    ${title}
    #填写完地址信息(只填写first name)，不点击提交按钮
    Complete_Order_Message_Without_Last_name
    #点击submit按钮
    Wait And Click Element    id:submitMbPay
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #进入后台，修改为(姓名分开填写)
    Select Window    店匠科技
    Modify_Set_Radio    1
    #跳回checkout页
    Select Window    title=${store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.
    #不包含last name
    Element Should Not Contain    dom:document.querySelectorAll(".content div")[0]    ${last_name}

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
