*** Settings ***
Documentation     将必填改为选择天或将选填改为必填，跳转到支付界面，可支付成功
Suite Setup       Products Suite Setup
Test Teardown     Teardown Test Case
Suite Teardown    Close Test Suite Browser
Force Tags        Checkout
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_products.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_products.robot
Resource          ../../../resources/keywords/kw_checkout.robot

*** Test Cases ***
checkout136
    [Documentation]    进入到checkout页面后，填写完地址信息后，返回后台修改结账设置修改为必填或选填，再去checkout页面点击submit，进入支付页后，点击支付成功
    [Tags]    P0
    #---------------------------------前提环境：要去后台结账设置中选择在结账时要填写的内容，像first_name等--------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #进入checkout页面
    Select_Order_Page    ${title}
    #填写完地址信息,不提交
    Complete_Order_Message_Not_Submit
    #修改选填或必填
    Change Checkout Setp Wait    2
    #点击submit按钮
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Execute Javascript    return document.querySelectorAll("label[for='cod']")[0].scrollIntoView()
    Wait And Click Element    ${locator_checkout_payment_cod_elm}
    #点击pay now
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    #显示支付成功
    Wait Until Page Contains    ${locatorB_checkout_submitOrderPass_msg}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Default User
    Add Product Wait
    Add Payment Cod Wait
    Go To Product Management Page

Products Test Case Teardown
    Teardown Test Case
