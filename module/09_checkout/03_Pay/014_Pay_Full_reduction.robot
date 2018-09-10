*** Settings ***
Documentation     先添加一个商品和一个包括全部商品的满减活动，点击商品预览，点击pay now之前，修改该商品参与的满减活动的优惠内容，还是按照之前的优惠内容计算
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

*** Variables ***
${name}           ceshi    # 满减活动的名称
${full}           10    # 满多少
${cut}            3    # 减多少
${cut2}           5    # 修改之后减多少

*** Test Cases ***
checkout155
    [Documentation]    先添加一个商品和一个包括全部商品的满减活动，点击商品预览，点击pay now之前，修改该商品参与的满减活动的优惠内容，还是按照之前的优惠内容计算
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------

    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #修改该满减活动内容
    Select Window    店匠科技
    Modify_First_Full_Reduction
    Select Window    title=${user_default_domain}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.
    #view orders
    Wait And Click Element    dom:document.querySelectorAll(".btn2")[1]
    #跳转到my orders页面
    Wait Until Page Contains Element    dom:document.querySelectorAll(".spec_order_item")[0]
    #点击查看订单详细信息
    Wait And Click Element    dom:document.querySelectorAll(".order_info")[0]
    #获取当前优惠的金额
    ${now_cut}    Get Text    dom:document.querySelectorAll(".rebate")[0]
    ${now_cut}    searchStrs    ${now_cut}
    #当前优惠的金额应该等于满减活动的金额
    Should Be Equal As Strings    ${cut}    ${now_cut}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品和一个包括全部商品的满减活动
    Login With Default User
    Start Ajax Listener
    Add Product_Up
    Sleep    8
    Add_Full_Reduction
    Sleep    5
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品
    Select Window    店匠科技
    Go To Products Page
    Delete_First_Product
    Sleep    5
    End_First_Full_Reduction
    Sleep    5
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
