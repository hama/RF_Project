*** Settings ***
Documentation     先添加一个商品和一个包括全部商品的满减活动，点击商品预览，商品详情submi进入checkout页面之后，提前结束该商品参与的满减活动，还是有之前的优惠，支付成功
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Products Test Case Setup
Test Teardown     Products Test Case Teardown
Force Tags        Checkout
Library           ${CURDIR}/../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot
Resource          ../../../resources/kw_checkout.robot
Library           customLibrary

*** Variables ***
${name}           ceshi    # 满减活动的名称
${full}           10    # 满多少
${cut}            3    # 减多少

*** Test Cases ***
checkout120
    [Documentation]    先添加一个商品和一个包括全部商品的满减活动，点击商品预览，商品详情submi进入checkout页面之后，提前结束该商品参与的满减活动
    [Tags]    P0
    #---------------------------------前提环境：要去后台结账设置中选择在结账时要填写的内容，像first_name等--------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    Select_Order_Page    ${title}
    #返回后台提前结束该商品参加的满减活动
    Select Window    店匠科技
    End_First_Full_Reduction
    Select Window    title=${user_default_domain}
    Complete_Order_Message
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.

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
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
