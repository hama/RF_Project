*** Settings ***
Documentation     点击商品预览后，点击进入checkout页面，在点击Submit前，在后台更换该商品图片，支付界面应该显示最新图片
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
Change_Image
    [Documentation]    点击商品预览后，点击进入checkout页面，在点击Submit前，在后台更换该商品图片
    [Tags]    P0
    #---------------------------------前提环境：要去后台结账设置中选择在结账时要填写的内容，像first_name等--------------------------------------
    #获取店铺名称
    ${store_name}    Get Text    dom:document.querySelectorAll(".greeting_txt___2NI7k")[1]
    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    Select_Order_Page    ${title}
    #更换该商品图片
    Select Window    店匠科技
    To_Change_Image
    #保存之前记录下最新的图片src
    ${src}    Execute Javascript    return document.querySelectorAll(".center___1nHSZ")[0].src
    ${src}    getImgName    ${src}
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
    #切换到商品submit页
    Select Window    title=${store_name}
    Complete_Order_Message
    #验证图片是否为最新
    ${src2}    Execute Javascript    return document.querySelectorAll(".detail_img img")[0].src
    ${src2}    getImgName    ${src2}
    Should Be Equal As Strings    ${src}    ${src2}
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
