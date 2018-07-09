*** Settings ***
Documentation     先设置商品为跟踪库存并且库存为10,点击商品预览后，点击进入checkout页面，在点击pay now前，在后台修改该商品库存为0，支付成功
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
checkout146
    [Documentation]    先设置商品为跟踪库存并且库存为10,点击商品预览后，点击进入checkout页面，在点击pay now前，在后台修改该商品库存为0，支付成功
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------

    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #设置该商品的库存为10
    Set_Quantity    10
    Go To Products Page
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #设置该商品的库存-0
    Select Window    店匠科技
    Set_Quantity_To_0
    #切换到商品submit页
    Select Window    title=${store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.

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
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
