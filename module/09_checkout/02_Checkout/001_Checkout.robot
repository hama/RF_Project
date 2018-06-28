*** Settings ***
Documentation     修改本次购买的商品价格，跳转到支付界面，价格刷新为修改之后的，支付成功
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

*** Variables ***
${price1}         666    # 第一次修改的售价
${price2}         233    # 第二次修改的售价

*** Test Cases ***
Change_Price
    [Documentation]    点击商品预览后，进入checkout页面，在点击Submit前，在后台修改该商品的售价，之后再点击Submit按钮，查看该商品售价是否变化
    [Tags]    P0
    #---------------------------------此处测试服的代码逻辑还有问题--------------------------------------
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
    Select_Order_Page    ${title}
    #返回后台页面修改商品售价
    Select Window    店匠科技
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #修改售价
    Wait And Input Text    id:price    ${price1}
    Sleep    3
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
    #切换到商品submit页
    Select Window    title=${store_name}
    Complete_Order_Message
    Sleep    2
    #点击查看订单价格详情
    Wait And Click Element    dom:document.querySelectorAll(".icon-card-hd-shouhui")[0]
    Sleep    2
    #获取total price
    ${total_price}    Get Text    dom:document.querySelectorAll(".detail_total_price span")[1]
    ${total_price}    searchStrs    ${total_price}
    ${total_price}    Convert To Number    ${total_price}
    #获取Subtotal Price
    ${subtotal_price}    Get Text    dom:document.querySelectorAll(".paydetail-line")[0].querySelectorAll("span")[1]
    ${subtotal_price}    searchStrs    ${subtotal_price}
    ${subtotal_price}    Convert To Number    ${subtotal_price}
    #获取discount amount
    ${discount_amount}    Get Text    dom:document.querySelectorAll(".paydetail-line")[1].querySelectorAll("span")[1]
    ${discount_amount}    searchStrs    ${discount_amount}
    ${discount_amount}    Convert To Number    ${discount_amount}
    #获取tax price
    ${tax_price}    Get Text    dom:document.querySelectorAll(".paydetail-line")[2].querySelectorAll("span")[1]
    ${tax_price}    searchStrs    ${tax_price}
    ${tax_price}    Convert To Number    ${tax_price}
    #将各种价格进行汇总计算：total_price = subtotal_price - discount_amount + tax_price
    ${now_price}    Evaluate    ${subtotal_price}-${discount_amount}+${tax_price}
    Should Be True    ${total_price}==${now_price}
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
    [Documentation]    删除商品
    Select Window    店匠科技
    Go To Products Page
    Delete_First_Product
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
