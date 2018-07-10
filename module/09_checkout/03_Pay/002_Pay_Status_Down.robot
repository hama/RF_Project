*** Settings ***
Documentation     在支付界面返回后台修改本次购买的商品状态为下架，再返回支付界面点击pay now，支付失败
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
checkout139
    [Documentation]    在支付界面返回后台修改本次购买的商品状态为下架，再返回支付界面点击pay now，支付失败
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------

    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #选中商品，点击进入checkout页面
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #返回后台页面修改商品状态为下架
    Select Window    店匠科技
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #修改状态
    Wait And Click Element    id:status
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
    #切换到支付页
    Select Window    title=${store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #支付失败
    Page Should Contain    ${payment_failed}

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
