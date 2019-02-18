*** Settings ***
Documentation     Checkout三页 每个用例使用同一个上架商品,默认物流,COD结账方式
Suite Setup       Checkout Multi Suite Setup
Suite Teardown    Checkout Multi Suite Teardown    # close the browser opened for this test suite
Test Setup        Checkout Multi Case Setup
Test Teardown     Teardown Test Case
Force Tags        Checkout

Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
Checkout_Group_001
    [Tags]    group
    #检查点
    Check P0 Point From checkout_002
    Check P0 Point From checkout_001

Checkout_Group_002
    [Tags]    group
    #预置条件
    [Setup]    public_method.create    product    {"title": "women","variants": [{"price": "444"}]}
    kwcheckout.set_multi_page_checkout_process_py
    Reload Page And Start Ajax
    Go To First Product C Interface
    #检查点
    Check P0 Point From checkout_004
    Check P0 Point From checkout_005
    Check P0 Point From checkout_006

Checkout_Group_003
    [Tags]    group
    #预置条件
    [Setup]    public_method.create    product    {"title": "women", "has_only_default_variant": False, "inventory_tracking": False, "options": [{"name": "color", "values": ["blue"]}, {"name": "size", "values": ["xxl"]}], "variants": [{"price": "444", "option1": "blue", "option2": "xxl","_key": "{\\"color\\":\\"blue\\",\\"size\\":\\"xxl\\"}"}]}
    kwcheckout.set_multi_page_checkout_process_py
    Reload Page And Start Ajax
    Go To First Product C Interface
    #检查点
    Check P0 Point From checkout_007
    Check P0 Point From checkout_008
    Check P0 Point From checkout_009




