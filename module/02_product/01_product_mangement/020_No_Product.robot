*** Settings ***
Documentation     测试商品编辑
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

*** Test Cases ***
Shelf Drop List Should Empty
    [Documentation]    测试无上架下架商品时页面显示内容
    [Tags]    P0
    Wait And Click Element    ${locator_products_shelf}
    Wait Until Page Contains    ${content_products_empty}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case set up
    Login With Default User
    Start Ajax Listener
    Go To Products Page

Products Suite Teardown
    [Documentation]    商品 case set down
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
