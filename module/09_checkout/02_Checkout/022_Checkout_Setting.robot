*** Settings ***
Documentation     将必填改为选择天或将选填改为必填，跳转到支付界面，可支付成功
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
Modify_Pay_Setting
    [Documentation]    进入到checkout页面后，填写完地址信息后，返回后台修改结账设置修改为必填或选填，再去checkout页面点击submit，进入支付页后，点击支付成功
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
    #进入checkout页面
    Select_Order_Page    ${title}
    #填写完地址信息,不提交
    Complete_Order_Message_Not_Submit
    Sleep    2
    #进入后台，修改选填或必填
    Select Window    店匠科技
    Sleep    1
    Modify_Set_Radio    3
    #跳回checkout页
    Select Window    title=${store_name}
    Sleep    1
    #点击submit按钮
    Wait And Click Element    id:submitMbPay
    #进入支付页
    Sleep    5
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
    [Documentation]    删除商品，还原之前的设置
    Select Window    店匠科技
    Go To Products Page
    Delete_First_Product
    Modify_Set_Radio    2
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
