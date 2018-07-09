*** Settings ***
Documentation     将本次购买的商品删除，submit之后直接显示"支付失败"
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
Delete_Product
    [Documentation]    点击商品预览后，进入checkout页面，在点击Submit前，在后台删除该商品，之后再点击Submit按钮，应该显示支付失败
    [Tags]    P0
    #---------------------------------前提环境：要去后台结账设置中选择在结账时要填写的内容，像first_name等--------------------------------------

    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    Select_Order_Page    ${title}
    #返回后台页面删除该商品
    Select Window    店匠科技
    #点击删除第一件商品
    Wait And Click Element    dom:document.querySelectorAll(".delete___2xfx-")[0]
    #点击确定按钮
    Wait And Click Element    ${locator_products_delBtn}
    #切换到商品submit页
    Select Window    title=${store_name}
    Complete_Order_Message
    #支付页面应该显示支付失败
    Page Should Contain    Payment failure!

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Test Account
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
