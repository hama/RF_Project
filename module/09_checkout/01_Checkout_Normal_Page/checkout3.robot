*** Settings ***
Documentation     Ckeckout
Suite Setup       Checkout Suite Setup
Suite Teardown    Checkout Suite Teardown    # close the browser opened for this test suite
#Test Setup        Checkout Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***

checkout_007
    [Documentation]    验证checkout shipping页面，订单汇总，商品栏，商品子产品显示正常 > "1.C端购买商品women的子款式：blue XXL,2.进入checkout shipping页面,3.查看订单汇总商品栏子产品" > "子产品显示为：,color：blue,size：XXL"
    [Tags]    P0    threshold    smoke
    # 删除全部商品
    kwproduct.del_all_products_py
    #添加一个待自产品的商品 子商品
    kwproduct.add_max_product_with_sub_py
    #进入商品详情步骤
    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_icon_preview}
    Select Window    New
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Text    Color:red
    Wait Until Page Contains Text    Size:min