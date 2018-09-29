*** Settings ***
Documentation     comment
Suite Setup       Product Comment Suite Setup
Suite Teardown    Product Comment Suite Teardown
Test Setup        Product Comment Case Setup
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_product_management.robot
Resource          ../../../resources/variable/var_product_comment.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_product_comment.robot
Library           ${CURDIR}/../../../lib/customlib/lib_utils.py


*** Test Cases ***
views001
    [Documentation]    进入评论界面，查看左上角标题
    [Tags]    P0    threshold
	${text}    Wait And Get Text    ${locatorB_productsReviews_text_comment}
	Should Be equal    '${text}'    '商品评论'

views002
    [Documentation]    进入全部评论界面
    [Tags]    P0    threshold
    add_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
	Wait Until Page Contains Text    评论内容
	Wait Until Page Contains Text    评论图片
	Wait Until Page Contains Text    点赞数
	Wait Until Page Contains Text    创建时间
	Wait Until Page Contains Text    操作

views003
    [Documentation]    进入全部评论界面，反馈筛选，点赞数量高到低
    [Tags]    P0    threshold
    add_comment_py
    add_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag

