*** Settings ***
Documentation     先设置商品为跟踪库存并且库存为0时可购买,点击商品预览后，点击进入checkout页面，在点击Submit前，在后台修改该商品取消勾选库存为0时可购买，支付失败
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Products Test Case Setup
Test Teardown     Products Test Case Teardown
Force Tags        Products
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot

*** Test Cases ***
Cancel_Select_Buy_With_0_Quantity
    [Documentation]    先设置商品为跟踪库存并且库存为0时可购买,点击商品预览后，点击进入checkout页面，在点击Submit前，在后台修改该商品取消勾选库存为0时可购买
    [Tags]    P0
    #---------------------------------前提环境：要去后台结账设置中选择在结账时要填写的内容，像first_name等--------------------------------------
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
    #勾选该商品库存为0时仍可购买
    Select_Quantity_0
    Go To Products Page
    Select_Order_Page    ${title}
    #返回后台页面取消勾选该商品库存为0时仍可购买
    Select Window    店匠科技
    Cancel_Select_Quantity_0
    #切换到商品submit页
    Select Window    title=${store_name}
    Complete_Order_Message
    Sleep    5
    #支付页面应该显示支付失败
    Page Should Contain    Payment failure!

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Test Account
    Start Ajax Listener
    Add Product_Up
    Sleep    5
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
