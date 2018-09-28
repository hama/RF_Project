*** Settings ***
Documentation     views
Suite Setup       Product Collection Suite Setup
Suite Teardown    Product Collection Suite Teardown
Test Setup        Product Collection Case Setup
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_product_management.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Library           ${CURDIR}/../../../lib/customlib/lib_utils.py


*** Test Cases ***
views001
    [Documentation]    进入评论界面，查看左上角标题
    [Tags]    P0    threshold
	${text}    Wait And Get Text    ${locatorB_productsCollection_text_collection}
	Should Be equal    '${text}'    '商品专辑'

