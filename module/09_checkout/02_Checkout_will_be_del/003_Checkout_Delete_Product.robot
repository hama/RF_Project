*** Settings ***
Documentation     将本次购买的商品删除，submit之后直接显示"支付失败"
Suite Setup       Products Suite Setup
Suite Teardown    Close Test Suite Browser
Test Teardown     Teardown Test Case
Force Tags        Checkout
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_product_management.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_product_management.robot
Resource          ../../../resources/keywords/kw_checkout.robot

*** Test Cases ***
checkout106
    [Documentation]    点击商品预览后，进入checkout页面，在点击Submit前，在后台删除该商品，之后再点击Submit按钮，应该显示支付失败
    [Tags]    P0
    #---------------------------------前提环境：要去后台结账设置中选择在结账时要填写的内容，像first_name等--------------------------------------

    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    Select_Order_Page    ${title}
    #返回后台页面删除该商品
    Select Window    店匠科技
    #点击删除第一件商品
    Wait And Click Element    ${locatorB_productsMgmt_icon_listDelete}[0]
    #点击确定按钮
    Wait And Click Element    ${locatorB_productsNew_button_save}
    #切换到商品submit页
    Select Window    title=${user_default_domain}
    Complete_Order_Message
    #支付页面应该显示支付失败
    Page Should Contain    ${contentB_payment_failed}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Default User
    Add Product Wait
    Change Checkout Setp Wait    2
    Go To Product Management Page

Products Suite Teardown
    [Documentation]    商品 case set down
    Close Test Suite Browser

Products Test Case Setup
    Go To Product Management Page

Products Test Case Teardown
    Teardown Test Case
