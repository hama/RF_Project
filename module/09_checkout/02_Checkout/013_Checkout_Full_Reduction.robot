*** Settings ***
Documentation     先添加一个商品和一个包括全部商品的满减活动，点击商品预览，商品详情submi进入checkout页面之后，提前结束该商品参与的满减活动，还是有之前的优惠，支付成功
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
Resource          ../../../resources/keywords/kw_subtraction.robot
Library           ${CURDIR}/../../../lib/customlib/kwmarketing.py


*** Variables ***
${name}           ceshi    # 满减活动的名称
${full}           10    # 满多少
${cut}            3    # 减多少

*** Test Cases ***
checkout120
    [Documentation]    先添加一个商品和一个包括全部商品的满减活动，点击商品预览，商品详情submi进入checkout页面之后，提前结束该商品参与的满减活动
    [Tags]    P0
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    Select_Order_Page    ${title}
    #返回后台提前结束该商品参加的满减活动
    Select Window    店匠科技
    End_First_Full_Reduction
    Select Window    title=${user_default_domain}
    Complete_Order_Message
    #点击pay now
    Execute Javascript    return document.querySelectorAll("label[for='cod']")[0].scrollIntoView()
    Wait And Click Element    ${locator_checkout_payment_cod_elm}
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    #显示支付成功
    Wait Until Page Contains    ${locatorB_checkout_submitOrderPass_msg}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品和一个包括全部商品的满减活动
    Login With Default User
    Add Product Wait
    delSubtraction_fromdb    all
    Add Subtraction Wait Step    2
    Add Payment Cod Wait
    Go To Product Management Page


Products Test Case Teardown
    Teardown Test Case
