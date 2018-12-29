*** Settings ***
Documentation     comment
Suite Setup       Product Comment Suite Setup
Suite Teardown    Product Comment Suite Teardown
Test Setup        Product Comment Case Setup
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/keywords/kw_common.robot


*** Test Cases ***
reviews_group001
    [Tags]    group
    Check P1 Point From reviews001

reviews_group002
    [Tags]    group
    #前置条件
    kworder.add_deading_order_with_finished_status_py
    Reload Page And Start Ajax
    Sleep And Click Element    ${locatorB_productsReviews_icon_fisrtPreview}
    Write C Comment Review
    Reload Page And Start Ajax
    Check P1 Point From reviews002
    Check P0 Point From reviews003

