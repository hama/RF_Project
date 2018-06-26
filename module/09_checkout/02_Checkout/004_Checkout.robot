*** Settings ***
Documentation     测试商品批量上下架
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
Add_Sub_Product
    [Documentation]    点击商品预览后，进入checkout页面，在点击Submit前，在后台删除该商品，之后再点击Submit按钮，应该显示支付失败
    [Tags]    P0
    #---------------------------------前提环境：要去后台结账设置中选择在结账时要填写的内容，像first_name等--------------------------------------
    Sleep    2
    #点击个人账户按钮，展现出店铺名称
    #Wait And Click Element    dom:document.querySelectorAll(".xiala-choose")[0]
    #Sleep    1
    #获取店铺名称
    #${store_name}    Get Text    dom:document.querySelectorAll(".name___2AVIS")[0]
    #Sleep    2
    #获取第一个商品名称
    #Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    #Wait Until Element Is Visible    title
    #${title}    Get Text    title
    #Select_Order_Page    ${title}
    #返回后台页面给该商品增加子产品
    #Select Window    店匠科技
    #给该商品增加子产品
    #Add_Sub_Product_With_Already_Product
    #切换到商品submit页
    #Select Window    title=${store_name}
    #Complete_Order_Message
    #Sleep    5
    #点击pay now
    #Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #Sleep    5
    #显示支付成功
    #Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    #Page Should Contain    Your order has been submitted successfully.
    #-------------------case跑完之后要回到商品列表页才能删除第一个商品--------------------

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Test Account
    Start Ajax Listener
    Add Product
    Sleep    5
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品
    Delete_First_Product
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
