*** Settings ***
Documentation     手动添加商品测试
Suite Setup       Product Collection Suite Setup
Suite Teardown    Product Collection Suite Teardown
Test Setup        Product Collection Case Setup
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_product_management.robot
Resource          ../../../resources/variable/var_product_collection.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_product_collection.robot
Library           ${CURDIR}/../../../lib/customlib/lib_utils.py


*** Test Cases ***
collection001
    [Documentation]    进入商品专辑界面，查看左上角标题
    [Tags]    P0    threshold
	${text}    Wait And Get Text    ${locatorB_productsCollection_text_collection}
	Should Be equal    '${text}'    '商品专辑'

collection007
    [Documentation]    进入商品专辑界面，查看左上角标题
    [Tags]    P0    threshold
    add_collection_with_pic_py
    Reload Page And Start Ajax
	Wait And Click Element    ${locatorB_productsCollection_icon_listDetail}[0]
	Wait Until Page Contains Text    商品(0)

collection008
    [Documentation]    进入商品专辑界面，查看左上角标题
    [Tags]    P0    threshold
	add_collection_with_pic_py
	add_collection_with_pic_py
    Reload Page And Start Ajax
    # 含2个listDetailOpen的元素
    Count Of Element Should Be Equal With Wait    ${locatorB_productsCollection_icon_listDetailOpen}    ${2}
    # 点击第一个专辑的详情按钮
	Wait And Click Element    ${locatorB_productsCollection_icon_listDetailOpen}[0]
    Count Of Element Should Be Equal With Wait    ${locatorB_productsCollection_icon_listDetailFold}    ${1}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsCollection_icon_listDetailOpen}    ${1}
    # 点击第二个专辑的详情按钮
    Wait And Click Element    ${locatorB_productsCollection_icon_listDetailOpen}[0]
    Count Of Element Should Be Equal With Wait    ${locatorB_productsCollection_icon_listDetailFold}    ${1}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsCollection_icon_listDetailOpen}    ${1}
	Wait Until Page Contains Text    商品(0)

collection012
    [Documentation]    列表单个删除
    [Tags]    P0    threshold
    add_collection_with_pic_py
    Reload Page And Start Ajax
	Wait And Click Element    ${locatorB_productsCollection_icon_listDel}[0]
	Wait Until Page Contains Text     确定删除吗？

collection013
    [Documentation]    列表单个删除点击确定
    [Tags]    P0    threshold
    add_collection_with_pic_py
    Reload Page And Start Ajax
	Wait And Click Element    ${locatorB_productsCollection_icon_listDel}[0]
	Wait And Click Element    ${locatorB_global_alert_confirm}
	Wait Until Page Contains Text     暂无数据

collection015
    [Documentation]    列表批量删除
    [Tags]    P0    threshold
    add_collection_with_pic_py
    Reload Page And Start Ajax
	Wait Enabled And Click Element    ${locatorB_productsCollection_checkbox_chooseCategories}
	Wait And Click Element    ${locatorB_productsCollection_button_delProducts}
	Wait Until Page Contains Text     确定删除吗？

collection016
    [Documentation]    列表批量删除点击确定
    [Tags]    P0    threshold
    add_collection_with_pic_py
    Reload Page And Start Ajax
	Wait Enabled And Click Element    ${locatorB_productsCollection_checkbox_chooseCategories}
	Wait And Click Element    ${locatorB_productsCollection_button_delProducts}
	Wait And Click Element    ${locatorB_global_alert_confirm}
	Wait Until Page Contains Text     暂无数据

collection023
    [Documentation]    专辑名称输入混合（包括中英文，特殊符号，数字）字符
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsCollection_button_addCategory}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}

