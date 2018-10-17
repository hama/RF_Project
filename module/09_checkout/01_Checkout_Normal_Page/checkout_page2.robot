*** Settings ***
Documentation     Ckeckout
Suite Setup       Checkout Suite Setup
Suite Teardown    Checkout Suite Teardown    # close the browser opened for this test suite
#Test Setup        Checkout Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_checkout.robot
Resource          ../../../resources/variable/var_checkout.robot
Library           ${CURDIR}/../../../lib/customlib/lib_utils.py
Library           ${CURDIR}/../../../lib/customlib/kwcheckout.py

*** Test Cases ***

#第二个环境下执行的用例
checkout_007
    [Documentation]    验证checkout shipping页面，订单汇总，商品栏，商品子产品显示正常 > "1.C端购买商品women的子款式：blue XXL,2.进入checkout shipping页面,3.查看订单汇总商品栏子产品" > "子产品显示为：,color：blue,size：XXL"
    [Tags]    P0    threshold    smoke
    # 删除全部商品
    kwproduct.del_all_products_py
    #添加一个待自产品的商品 子商品
    kwproduct.add_max_product_with_sub_py
    #进入商品详情步骤
    Checkout Case Setup
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Text    Color:red
    Wait Until Page Contains Text    Size:min

checkout_019
    [Documentation]    验证checkout shipping页面，商品不收取税费时，价格详情中的tax显示为：+ $0.00  >  1.C端购买商品women进入checkout shipping页面   2.查看价格详情中tax
    [Tags]    P0    threshold
    #.添加一个不收税费的商品
    &{conf}=   Create Dictionary
    ...    requires_shipping=0
    kwproduct.add_product_with_conf_py   ${conf}
    #进入商品详情步骤
    Checkout Case Setup
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait Until Page Contains Locator    ${locatorB_checkout_address_select_country}
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Text Of Element Should Be Equal With Wait     ${locatorC_checkout_shipping_preferential}    + $0.00


