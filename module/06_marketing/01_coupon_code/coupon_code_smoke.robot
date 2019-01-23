*** Settings ***
Documentation     测试商品列表
Suite Setup       Coupon Code Suite Setup
Suite Teardown    Coupon Code Suite Teardown
Test Setup        Coupon Code Case Setup
Test Teardown     Teardown Test Case
Force Tags        coupon code
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
CouponCode_Group001
    [Tags]    group
    #检查
    Check P0 Point From CouponCode001
    Check P0 Point From CouponCode003
    Check P0 Point From CouponCode004

CouponCode_Group002
    [Tags]    group
    #前置条件
    kwcoupon.add_before_coupon_code_py
    kwcoupon.add_doing_coupon_code_py
    kwcoupon.add_finish_coupon_code_py
    Reload Page And Start Ajax
    #检查点
    Check P0 Point From CouponCode005
    Check P0 Point From CouponCode006
    Check P0 Point From CouponCode007
    Check P0 Point From CouponCode008

CouponCode_Group003
    [Tags]    group
    #前置条件
    &{data_dic}=    Create Dictionary    value=20    greater_than_or_equal_to=100
    @{data_list}=    Create List    ${data_dic}
    &{conf_before}=    Create Dictionary    title=优惠码1    value_type=fixed_amount    prerequisite_quantity_range=${None}
    ...    prerequisite_subtotal_range=${data_list}
    kwcoupon.add_before_coupon_code_py    ${conf_before}
    &{conf_doing}=    Create Dictionary    title=优惠码2
    kwcoupon.add_doing_coupon_code_py    ${conf_doing}
    &{conf_finish}=    Create Dictionary    title=优惠码3
    kwcoupon.add_finish_coupon_code_py    ${conf_finish}
    Reload Page And Start Ajax
    #检查点
    Check P0 Point From CouponCode009
    Check P0 Point From CouponCode011
    Check P0 Point From CouponCode013
    Check P0 Point From CouponCode014
    Check P0 Point From CouponCode015

CouponCode_Group005
    [Tags]    group
    #前置条件
    :FOR    ${ONE}    IN RANGE    14
    \    kwcoupon.add_before_coupon_code_py
    \    kwcoupon.add_doing_coupon_code_py
    \    kwcoupon.add_finish_coupon_code_py
    Reload Page And Start Ajax
    #检查
    Check P0 Point From CouponCode025
    Check P0 Point From CouponCode026
    Check P0 Point From CouponCode027

CouponCode_Group006
    [Tags]    group
    #检查
    Check P0 Point From CouponCode034
    Check P0 Point From CouponCode035
    Check P0 Point From CouponCode037

CouponCode_Group007
    [Tags]    group
    #前置条件
    &{conf_two}=    Create Dictionary    title=product
    kwproduct.add_max_product_py    ${conf_two}
    &{conf_one}=    Create Dictionary    title=women
    kwproduct.add_max_product_py    ${conf_one}
    Reload Page And Start Ajax
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    #检查
    Check P0 Point From CouponCode038
    Check P0 Point From CouponCode039
    Check P0 Point From CouponCode040
    Check P0 Point From CouponCode041
    Check P0 Point From CouponCode042
    Check P0 Point From CouponCode043
    Check P0 Point From CouponCode044
    Check P0 Point From CouponCode045

CouponCode_Group012
    [Tags]    group
    #前置条件
    kwcoupon.add_doing_coupon_code_py
    Return Page And Start Ajax
    #检查
    Check P0 Point From CouponCode081
    Check P0 Point From CouponCode082
    Check P0 Point From CouponCode083

CouponCode_Group013
    [Tags]    group
    #前置条件
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    #检查
    Check P0 Point From CouponCode084
    Check P0 Point From CouponCode085
    Check P0 Point From CouponCode086
    Check P0 Point From CouponCode088
    Check P0 Point From CouponCode089
    Check P0 Point From CouponCode091
    Check P0 Point From CouponCode092

CouponCode_Group014
    [Tags]    group
    #前置条件
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    #检查
    Check P0 Point From CouponCode094
    Check P0 Point From CouponCode095
    Check P0 Point From CouponCode096
    Check P0 Point From CouponCode097

#CouponCode_Group015
#    [Tags]    group

#CouponCode_Group016
#    [Tags]    group

#CouponCode121
#    [Documentation]    验证添加商品弹窗，商品数量超过20个后，加载更多按钮可点击，点击后可添加商品
#    [Tags]    P0

CouponCode_Group020
    [Tags]    group
    #前置条件
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    #检查
    Check P0 Point From CouponCode123
    Check P0 Point From CouponCode124
    Check P0 Point From CouponCode125
    Check P0 Point From CouponCode126
    Check P0 Point From CouponCode127

CouponCode_Group021
    [Tags]    group
    #前置条件
    Sleep    2
    Wait And Click Element    ${locatorB_couponCodeNew_button_addActivity}
    Add Default Coupon Code Text    优惠码    20    10    10    5
    Wait And Click Element    ${locatorB_couponCodeNew_button_nextStep}
    #检查
    Check P0 Point From CouponCode128
    Check P0 Point From CouponCode129
    Check P0 Point From CouponCode130

#CouponCode_Group022
#    [Tags]    group

#CouponCode_Group023
#    [Tags]    group

CouponCode_Group024
    [Tags]    group
    #检查
    Check P0 Point From CouponCode141
    Check P0 Point From CouponCode142
    Check P0 Point From CouponCode143
    Check P0 Point From CouponCode144
    Check P0 Point From CouponCode145

CouponCode_Group025
    [Tags]    group
    #检查
    Check P0 Point From CouponCode146
    Check P0 Point From CouponCode147
    Check P0 Point From CouponCode148
    Check P0 Point From CouponCode149

#CouponCode_Group026
#    [Tags]    group

CouponCode_Group027
    [Tags]    group
    #检查
    Check P0 Point From CouponCode154
    Check P0 Point From CouponCode155

#CouponCode_Group028
#    [Tags]    group

#CouponCode163
#    [Documentation]    验证用户使用优惠码下单，并且下单信息只填写了邮箱时，优惠码使用详情中顾客信息显示为用户下单时填写的邮箱
#    [Tags]    P0

#CouponCode_Group031
#    [Tags]    group

#CouponCode_Group032
#    [Tags]    group

#CouponCode_Group034
#    [Tags]    group

#CouponCode_Group035
#    [Tags]    group