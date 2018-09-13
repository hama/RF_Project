*** Settings ***
Documentation     手动添加商品测试
Suite Setup       Products Single Suite Setup
Suite Teardown    Close Test Suite Browser
Test Setup        Product Manual Add Case Setup
Test Teardown     Product Manual Add Case Teardown
Force Tags        Products
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_products.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_products.robot
Library           ${CURDIR}/../../../lib/customlib/lib_utils.py

*** Test Cases ***
products004
    [Documentation]    上架商品图片展示商品主图
    [Tags]    P0
    add_launched_product_py
    Reload Page
    Select All Product Tag
	${attr}    Get Element Attribute    ${locatorB_productsMgmt_image_firstProductThumbnails}    class
	Should Be equal    '${attr}'    'center___1nHSZ'

products005
    [Documentation]    下架商品且未上传商品图，商品图片展示默认图
    [Tags]    P0
    add_discontinued_product_py
    Reload Page
    Select All Product Tag
	${attr}    Get Element Attribute    ${locatorB_productsMgmt_image_firstProductThumbnails}    class
	Should Be equal    '${attr}'    ''

products007
    [Documentation]    验证商品无库存时展示正确
    [Tags]    P0
    add_empty_quantity_product_py
    Reload Page
    Select All Product Tag
	${inventoryQuantity}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductInventoryQuantity}
	Should Be Equal    '${inventoryQuantity}'    '0件'

products009
    [Documentation]    验证商品的创建时间正确
    [Tags]    P0
    ${time1}    Get Time
    add_min_product_py
    ${time2}    Get Time
    Reload Page
    Select All Product Tag
	${createTime}    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[0]
	${status}    Evaluate    '${createTime}'=='${time1}' or '${createTime}'=='${time2}'
	Should Be True    ${status}

products011
    [Documentation]    无SKU时，SKU展示空白
    [Tags]    P0
    add_min_product_py
    Reload Page
    Select All Product Tag
	${sku}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductSku}
	Should Be Equal    '${sku}'    ''

products014
    [Documentation]    验证点击‘全部’无结果
    [Tags]    P0
    Reload Page
    Select All Product Tag
	Wait Until Page Not Contains Locator    ${locatorB_page_text_totalRecord}

products018
    [Documentation]    验证点击删除按钮可删除商品
    [Tags]    P0
    add_min_product_py
    Reload Page
    Select All Product Tag
	Click Element And Confirm    ${locatorB_productsMgmt_icon_listDelete}[0]
	Wait Until Page Not Contains Locator    ${locatorB_productsMgmt_icon_listPreview}[0]

products019
    [Documentation]    验证可成功删除商品
    [Tags]    P0
    add_min_product_py
    Reload Page
    Select All Product Tag
	Click Element And Confirm    ${locatorB_productsMgmt_icon_listDelete}[0]
	Wait Until Page Not Contains Locator    ${locatorB_productsMgmt_icon_listPreview}[0]

products020
    [Documentation]    验证可取消删除商品
    [Tags]    P0
    add_min_product_py
    Reload Page
    Select All Product Tag
	Click Element And Cancel    ${locatorB_productsMgmt_icon_listDelete}[0]
	Wait Until Page Contains Locator    ${locatorB_productsMgmt_icon_listPreview}[0]

products021.1
    [Documentation]    验证展示的上架商品排序正确
    [Tags]    P0
    add_launched_product_py
    Sleep    60
	add_launched_product_py
	Reload Page
    Select Launched Product Tag
    ${item1_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[0]
    ${item2_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[1]
    ${result}    lib_utils.compare_time_py    ${item1_createtime}    ${item2_createtime}
    Should Be Equal    ${result}    gt

products021.2
    [Documentation]    验证展示的上架商品数量正确
    [Tags]    P0
    add_launched_product_py
    add_launched_product_py
    add_discontinued_product_py
    Reload Page
    Select Launched Product Tag
    ${total_record}    Wait And Get Text    ${locatorB_page_text_totalRecord}
    ${size}    lib_utils.searchStrs_py    ${total_record}
    Should Be Equal As Integers    ${size}    2
    Length Should Be Equal    ${locatorB_productsMgmt_switch_listLaunched}    ${2}

products022
    [Documentation]    验证点击‘上架’无结果
    [Tags]    P0
    add_min_product_py
    Reload Page
    Select Launched Product Tag
    Wait Until Page Not Contains Locator    ${locatorB_page_text_totalRecord}

products023.1
    [Documentation]    验证展示的下架商品排序正确
    [Tags]    P0
    add_discontinued_product_py
    Sleep    60
	add_discontinued_product_py
	Reload Page
    Select Discontinued Product Tag
    ${item1_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[0]
    ${item2_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[1]
    ${result}    lib_utils.compare_time_py    ${item1_createtime}    ${item2_createtime}
    Should Be Equal    ${result}    gt

products023.2
    [Documentation]    验证展示的下架商品数量正确
    [Tags]    P0
    add_discontinued_product_py
    add_discontinued_product_py
    add_launched_product_py
    Reload Page
    Select Discontinued Product Tag
    ${total_record}    Wait And Get Text    ${locatorB_page_text_totalRecord}
    ${size}    lib_utils.searchStrs_py    ${total_record}
    Should Be Equal As Integers    ${size}    2
    Length Should Be Equal    ${locatorB_productsMgmt_switch_listDiscontinued}    ${2}

products037
    [Documentation]    验证能上架一个或多个商品成功
    [Tags]    P0
    add_discontinued_product_py
    add_discontinued_product_py
    Reload Page
    Select All Product Tag
	Select Products And Click Batch Menu
	Click Element And Confirm    ${locatorB_productsMgmt_select_launch}
	Wait Until Page Contains Text    上架成功
    Length Should Be Equal    ${locatorB_productsMgmt_switch_listLaunched}    ${2}

products039
    [Documentation]    验证能下架一个或多个商品成功
    [Tags]    P0
    add_launched_product_py
    add_launched_product_py
    Reload Page
    Select All Product Tag
	Select Products And Click Batch Menu
	Click Element And Confirm    ${locatorB_productsMgmt_select_discontinue}
	Wait Until Page Contains Text    下架成功
    Length Should Be Equal    ${locatorB_productsMgmt_switch_listDiscontinued}    ${2}

products041
    [Documentation]    验证能够成功批量删除商品
    [Tags]    P0
    add_launched_product_py
    add_launched_product_py
    Reload Page
    Select All Product Tag
	Select Products And Click Batch Menu
	Click Element And Confirm    ${locatorB_productsMgmt_select_batchDel}
	Wait Until Page Contains Text    删除成功
	Wait Until Page Contains Text    暂无数据
    Length Should Be Equal    ${locatorB_productsMgmt_icon_listPreview}    ${0}







