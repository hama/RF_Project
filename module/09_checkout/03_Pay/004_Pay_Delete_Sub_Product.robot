*** Settings ***
Documentation     在支付界面返回后台删除本次购买的子商品，再返回支付界面点击pay now，支付失败
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
    [Documentation]    在支付界面返回后台删除本次购买的子商品，再返回支付界面点击pay now，支付失败
    [Tags]    P0
    #-----------------------------------------选中一个有子商品的商品，进入到支付页面------------------------------------------
    Go TO    ${home_page}
    #获取店铺名称
    Wait Until Page Contains Element    dom:document.querySelectorAll(".greeting_txt___2NI7k")[1]
    ${store_name}    Get Text    dom:document.querySelectorAll(".greeting_txt___2NI7k")[1]
    Go To Products Page
    Sleep    2
    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #给该商品增加子产品
    Add_Sub_Product_With_Already_Product
    Select_Order_Page_With_Sub_Product    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个有子商品的商品，进入到支付页面------------------------------------------
    #返回后台页面删除该商品
    Select Window    店匠科技
    Delete_Sub_Product_With_Already_Product    0
    Select Window    title=${store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #支付失败
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
    [Documentation]    删除商品
    Select Window    店匠科技
    Go To Products Page
    Delete_First_Product
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
