*** Settings ***
Documentation     将手机和邮箱都需填写改成只需填写邮箱，点击pay now之后，显示的还是之前的内容
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
    [Documentation]    将手机和邮箱都需填写改成只需填写邮箱，点击pay now之后，显示的还是之前的内容
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    Sleep    2
    #点击个人账户按钮，展现出店铺名称
    Wait And Click Element    dom:document.querySelectorAll(".xiala-choose")[0]
    Sleep    1
    #获取店铺名称
    ${store_name}    Get Text    dom:document.querySelectorAll(".name___2AVIS")[0]
    Sleep    2
    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    Sleep    5
    Select_Order_Page    ${title}
    #填写完地址信息
    Complete_Order_Message
    Sleep    5
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    Sleep    5
    #进入后台，修改为只需填写邮箱
    Select Window    店匠科技
    Sleep    1
    Modify_Set    0
    Sleep    1
    Select Window    title=${store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    Sleep    5
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Test Account
    Start Ajax Listener
    Add Product_Up
    Sleep    5
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品，重新将结账设置替换为要填写邮箱和手机号
    Select Window    店匠科技
    Go To Products Page
    Delete_First_Product
    Modify_Set    2
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
