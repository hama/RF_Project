*** Settings ***
Documentation     点击商品预览后，点击进入checkout页面，在点击pay now前，在后台更换该商品图片，支付界面应该显示最新图片
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
    [Documentation]    点击商品预览后，点击进入checkout页面，在点击pay now前，在后台更换该商品图片，支付界面应该显示最新图片
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
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.querySelectorAll(".row___3Mua7")[0].scrollIntoView()
    #记录下当前图片src
    ${src}    Execute Javascript    return document.querySelectorAll(".center___1nHSZ")[0].src
    ${src}    getImgName    ${src}
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #更换该商品图片
    Select Window    店匠科技
    To_Change_Image
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
    #切换到商品submit页
    Select Window    title=${store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.
    #view orders
    Wait And Click Element    dom:document.querySelectorAll(".btn2")[1]
    #跳转到my orders页面
    Wait Until Page Contains Element    dom:document.querySelectorAll(".spec_order_item")[0]
    #获取订单信息中的图片src
    ${src2}    Execute Javascript    return document.querySelectorAll(".order_item img")[0].src
    ${src2}    getImgName2    ${src2}
    #订单信息中的图片应该为修改之前的图片
    Should Be Equal As Strings    ${src}    ${src2}

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
