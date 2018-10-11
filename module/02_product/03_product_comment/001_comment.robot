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
reviews001
    [Documentation]    进入评论界面，查看左上角标题
    [Tags]    P0    threshold
	${text}    Wait And Get Text    ${locatorB_productsReviews_text_comment}
	Should Be equal    '${text}'    '商品评论'

reviews002
    [Documentation]    进入全部评论界面
    [Tags]    P0    threshold
    kwcomment.add_published_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
	Wait Until Page Contains Text    评论内容
	Wait Until Page Contains Text    评论图片
	Wait Until Page Contains Text    点赞数
	Wait Until Page Contains Text    创建时间
	Wait Until Page Contains Text    操作

reviews003
    [Documentation]    进入全部评论界面，反馈筛选，点赞数量高到低
    [Tags]    P0
    &{comment_conf00} =    Create Dictionary
    ...    praise=99
    kwcomment.add_comment_with_conf_py    ${comment_conf00}
    Sleep    1
    &{comment_conf01} =    Create Dictionary
    ...    praise=1
    kwcomment.add_comment_with_conf_py    ${comment_conf01}
    Reload Page And Start Ajax
    Select All Comment Tag
	Wait And Click Element    ${locatorB_productsReviews_icon_listArrowDown}[0]
	Wait And Click Element    ${locatorB_productsReviews_icon_listArrowUp}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[0]    1
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[1]    99

reviews004
    [Documentation]    进入全部评论界面，反馈筛选，点赞数量低到高
    [Tags]    P0
    &{comment_conf00} =    Create Dictionary
    ...    praise=99
    kwcomment.add_comment_with_conf_py    ${comment_conf00}
    Sleep    1
    &{comment_conf01} =    Create Dictionary
    ...    praise=1
    kwcomment.add_comment_with_conf_py    ${comment_conf01}
    Reload Page And Start Ajax
    Select All Comment Tag
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[0]    1
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[1]    99
	Wait And Click Element    ${locatorB_productsReviews_icon_listArrowDown}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[0]    99
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[1]    1

# 有bug，已提单，暂不跑
#reviews005
#    [Documentation]    进入全部评论界面，更多信息筛选，评论日期新到旧
#    [Tags]    P0
#    &{comment_conf00} =    Create Dictionary
#    ...    content=content00
#    kwcomment.add_comment_with_conf_py    ${comment_conf00}
#    Sleep    1
#    &{comment_conf01} =    Create Dictionary
#    ...    content=content01
#    kwcomment.add_comment_with_conf_py    ${comment_conf01}
#    Reload Page And Start Ajax
#    Select All Comment Tag
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[0]    content01
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[1]    content00
#	Wait And Click Element    ${locatorB_productsReviews_icon_listArrowDown}[1]
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[0]    content00
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[1]    content01

reviews006
    [Documentation]    进入全部评论界面，更多信息筛选，评论日期旧到新
    [Tags]    P0
    &{comment_conf00} =    Create Dictionary
    ...    content=content00
    kwcomment.add_comment_with_conf_py    ${comment_conf00}
    Sleep    1
    &{comment_conf01} =    Create Dictionary
    ...    content=content01
    kwcomment.add_comment_with_conf_py    ${comment_conf01}
    Reload Page And Start Ajax
    Select All Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_icon_listArrowDown}[1]
    Wait And Click Element    ${locatorB_productsReviews_icon_listArrowUp}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[0]    content00
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[1]    content01

reviews007
    [Documentation]    进入已发布评论界面
    [Tags]    P1
    kwcomment.add_published_comment_py
    Reload Page And Start Ajax
    Select Published Comment Tag
	Wait Until Page Contains Text    评论内容
	Wait Until Page Contains Text    评论图片
	Wait Until Page Contains Text    点赞数
	Wait Until Page Contains Text    创建时间
	Wait Until Page Contains Text    操作

reviews008
    [Documentation]    进入已发布评论界面，反馈筛选，点赞数量高到低
    [Tags]    P1
    &{comment_conf00} =    Create Dictionary
    ...    praise=99
    ...    status=1
    kwcomment.add_comment_with_conf_py    ${comment_conf00}
    Sleep    1
    &{comment_conf01} =    Create Dictionary
    ...    praise=1
    ...    status=1
    kwcomment.add_comment_with_conf_py    ${comment_conf01}
    Reload Page And Start Ajax
    Select Published Comment Tag
	Wait And Click Element    ${locatorB_productsReviews_icon_listArrowDown}[0]
	Wait And Click Element    ${locatorB_productsReviews_icon_listArrowUp}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[0]    1
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[1]    99

reviews009
    [Documentation]    进入已发布评论界面，反馈筛选，点赞数量低到高
    [Tags]    P1
    &{comment_conf00} =    Create Dictionary
    ...    praise=99
    ...    status=1
    kwcomment.add_comment_with_conf_py    ${comment_conf00}
    Sleep    1
    &{comment_conf01} =    Create Dictionary
    ...    praise=1
    ...    status=1
    kwcomment.add_comment_with_conf_py    ${comment_conf01}
    Reload Page And Start Ajax
    Select Published Comment Tag
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[0]    1
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[1]    99
	Wait And Click Element    ${locatorB_productsReviews_icon_listArrowDown}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[0]    99
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[1]    1

# 有bug，已提单，暂不跑
#reviews010
#    [Documentation]    进入已发布评论界面，更多信息筛选，评论日期新到旧
#    [Tags]    P1
#    &{comment_conf00} =    Create Dictionary
#    ...    content=content00
#    ...    status=1
#    kwcomment.add_comment_with_conf_py    ${comment_conf00}
#    Sleep    1
#    &{comment_conf01} =    Create Dictionary
#    ...    content=content01
#    ...    status=1
#    kwcomment.add_comment_with_conf_py    ${comment_conf01}
#    Reload Page And Start Ajax
#    Select Published Comment Tag
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[0]    content01
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[1]    content00
#	Wait And Click Element    ${locatorB_productsReviews_icon_listArrowDown}[1]
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[0]    content00
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[1]    content01

reviews011
    [Documentation]    进入已发布评论界面，更多信息筛选，评论日期旧到新
    [Tags]    P1
    &{comment_conf00} =    Create Dictionary
    ...    content=content00
    ...    status=1
    kwcomment.add_comment_with_conf_py    ${comment_conf00}
    Sleep    1
    &{comment_conf01} =    Create Dictionary
    ...    content=content01
    ...    status=1
    kwcomment.add_comment_with_conf_py    ${comment_conf01}
    Reload Page And Start Ajax
    Select Published Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_icon_listArrowDown}[1]
    Wait And Click Element    ${locatorB_productsReviews_icon_listArrowUp}[0]
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[0]    content00
    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[1]    content01

reviews012
    [Documentation]    进入未发布评论界面
    [Tags]    P1
    kwcomment.add_unpublished_comment_py
    Reload Page And Start Ajax
    Select Unpublished Comment Tag
	Wait Until Page Contains Text    评论内容
	Wait Until Page Contains Text    评论图片
	Wait Until Page Contains Text    点赞数
	Wait Until Page Contains Text    创建时间
	Wait Until Page Contains Text    操作

# 有bug，已提单，暂不跑
#reviews013
#    [Documentation]    进入未发布评论界面，反馈筛选，点赞数量高到低
#    [Tags]    P1
#    &{comment_conf00} =    Create Dictionary
#    ...    praise=99
#    ...    status=0
#    kwcomment.add_comment_with_conf_py    ${comment_conf00}
#    Sleep    1
#    &{comment_conf01} =    Create Dictionary
#    ...    praise=1
#    ...    status=0
#    kwcomment.add_comment_with_conf_py    ${comment_conf01}
#    Reload Page And Start Ajax
#    Select Published Comment Tag
#	Wait And Click Element    ${locatorB_productsReviews_icon_listArrowDown}[0]
#	Wait And Click Element    ${locatorB_productsReviews_icon_listArrowUp}[0]
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[0]    1
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[1]    99

# 有bug，已提单，暂不跑
#reviews014
#    [Documentation]    进入未发布评论界面，反馈筛选，点赞数量低到高
#    [Tags]    P1
#    &{comment_conf00} =    Create Dictionary
#    ...    praise=99
#    ...    status=0
#    kwcomment.add_comment_with_conf_py    ${comment_conf00}
#    Sleep    1
#    &{comment_conf01} =    Create Dictionary
#    ...    praise=1
#    ...    status=0
#    kwcomment.add_comment_with_conf_py    ${comment_conf01}
#    Reload Page And Start Ajax
#    Select Published Comment Tag
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[0]    1
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[1]    99
#	Wait And Click Element    ${locatorB_productsReviews_icon_listArrowDown}[0]
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[0]    99
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listThumbsUpNum}[1]    1

# 有bug，已提单，暂不跑
#reviews015
#    [Documentation]    进入未发布评论界面，更多信息筛选，评论日期新到旧
#    [Tags]    P1
#    &{comment_conf00} =    Create Dictionary
#    ...    content=content00
#    ...    status=0
#    kwcomment.add_comment_with_conf_py    ${comment_conf00}
#    Sleep    1
#    &{comment_conf01} =    Create Dictionary
#    ...    content=content01
#    ...    status=0
#    kwcomment.add_comment_with_conf_py    ${comment_conf01}
#    Reload Page And Start Ajax
#    Select Published Comment Tag
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[0]    content01
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[1]    content00
#	Wait And Click Element    ${locatorB_productsReviews_icon_listArrowDown}[1]
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[0]    content00
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[1]    content01

# 有bug，已提单，暂不跑
#reviews016
#    [Documentation]    进入未发布评论界面，更多信息筛选，评论日期旧到新
#    [Tags]    P1
#    &{comment_conf00} =    Create Dictionary
#    ...    content=content00
#    ...    status=0
#    kwcomment.add_comment_with_conf_py    ${comment_conf00}
#    Sleep    1
#    &{comment_conf01} =    Create Dictionary
#    ...    content=content01
#    ...    status=0
#    kwcomment.add_comment_with_conf_py    ${comment_conf01}
#    Reload Page And Start Ajax
#    Select Published Comment Tag
#    Wait And Click Element    ${locatorB_productsReviews_icon_listArrowDown}[1]
#    Wait And Click Element    ${locatorB_productsReviews_icon_listArrowUp}[0]
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[0]    content00
#    Text Of Element Should Be Equal With Wait    ${locatorB_productsReviews_text_listContent}[1]    content01

reviews021
    [Documentation]    点击商品名称
    [Tags]    P0    threshold
    kwcomment.add_published_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_link_listProductName}[0]
	Location Should Contain With Wait    /product/reviews

reviews023
    [Documentation]    点击商品链接
    [Tags]    P0    threshold
    kwcomment.add_published_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_link_listProductName}[0]
    Wait And Click Element    ${locatorB_pReviews_link_productName}
    Focus On New Window
    Wait Until Page Contains Locator    ${locatorC_products_icon_cart}


reviews035
    [Documentation]    商品详情页批量全选发布
    [Tags]    P0    threshold
    kwcomment.add_unpublished_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
	Wait And Click Element    ${locatorB_productsReviews_link_listProductName}[0]
    Select All Items Then Click Batch Menu
    Wait And Click Element    ${locatorB_productsReviews__select_publish}
	Wait Until Page Contains Locator    ${locatorB_productsReviews_switch_listPublished}

reviews037
    [Documentation]    商品详情页单个发布
    [Tags]    P0    threshold
    kwcomment.add_unpublished_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_link_listProductName}[0]
    Wait And Click Element    ${locatorB_productsReviews_switch_listUnpublished}[0]
	Wait Until Page Contains Locator    ${locatorB_productsReviews_switch_listPublished}

reviews038
    [Documentation]    商品详情页批量全选取消发布
    [Tags]    P0    threshold
    kwcomment.add_unpublished_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_link_listProductName}[0]
    Select All Items Then Click Batch Menu
    Wait And Click Element    ${locatorB_productsReviews__select_unpublish}
	Wait Until Page Contains Locator    ${locatorB_productsReviews_switch_listUnpublished}

reviews040
    [Documentation]    商品详情页单个取消发布
    [Tags]    P0    threshold
    kwcomment.add_published_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_link_listProductName}[0]
    Wait And Click Element    ${locatorB_productsReviews_switch_listPublished}[0]
	Wait Until Page Contains Locator    ${locatorB_productsReviews_switch_listUnpublished}

reviews041
    [Documentation]    商品详情页批量全选删除
    [Tags]    P0    threshold
    kwcomment.add_published_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_link_listProductName}[0]
    Select All Items Then Click Batch Menu
    Wait And Click Element Then Confirm    ${locatorB_productsReviews_select_del}
	Wait Until Page Not Contains Locator    ${locatorB_pReviews_text_listProductName}

reviews043
    [Documentation]    商品详情页单个删除
    [Tags]    P0    threshold
    kwcomment.add_published_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_link_listProductName}[0]
    Wait And Click Element Then Confirm    ${locatorB_pReviews_icon_listDelete}[0]
	Wait Until Page Not Contains Locator    ${locatorB_pReviews_text_listProductName}

reviews064
    [Documentation]    批量全选发布
    [Tags]    P0    threshold
    kwcomment.add_unpublished_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
    Select All Items Then Click Batch Menu
    Wait And Click Element    ${locatorB_productsReviews__select_publish}
	Wait Until Page Contains Locator    ${locatorB_productsReviews_switch_listPublished}

reviews066
    [Documentation]    单个发布
    [Tags]    P0    threshold
    kwcomment.add_unpublished_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_switch_listUnpublished}[0]
	Wait Until Page Contains Locator    ${locatorB_productsReviews_switch_listPublished}

reviews067
    [Documentation]    批量全选取消发布
    [Tags]    P0    threshold
    kwcomment.add_unpublished_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
    Select All Items Then Click Batch Menu
    Wait And Click Element    ${locatorB_productsReviews__select_unpublish}
	Wait Until Page Contains Locator    ${locatorB_productsReviews_switch_listUnpublished}

reviews069
    [Documentation]    单个取消发布
    [Tags]    P0    threshold
    kwcomment.add_published_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_switch_listPublished}[0]
	Wait Until Page Contains Locator    ${locatorB_productsReviews_switch_listUnpublished}

reviews070
    [Documentation]    批量全选删除
    [Tags]    P0    threshold
    kwcomment.add_published_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
    Select All Items Then Click Batch Menu
    Wait And Click Element Then Confirm    ${locatorB_productsReviews_select_del}
	Wait Until Page Not Contains Locator    ${locatorB_pReviews_text_listProductName}

reviews072
    [Documentation]    单个删除
    [Tags]    P0    threshold
    kwcomment.add_published_comment_py
    Reload Page And Start Ajax
    Select All Comment Tag
    Wait And Click Element Then Confirm    ${locatorB_pReviews_icon_listDelete}[0]
	Wait Until Page Not Contains Locator    ${locatorB_pReviews_text_listProductName}
