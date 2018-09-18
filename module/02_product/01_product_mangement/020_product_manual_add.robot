*** Settings ***
Documentation     手动添加商品测试
Suite Setup       Product Management Common Suite Setup
Suite Teardown    Product Management Common Suite Teardown
Test Setup        Product Management Case Setup Clear Evn
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_product_management.robot
Resource          ../../../resources/variable/var_product_collection.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_product_management.robot
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
    add_min_product_py
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
    Length Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listLaunched}    ${2}

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
    Length Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listDiscontinued}    ${2}

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
    Length Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listLaunched}    ${2}

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
    Length Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listDiscontinued}    ${2}

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
    Length Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${0}


products047
	[Documentation]    验证能成功添加新建的标签
    [Tags]    P0
    add_launched_product_py
    Reload Page
    Select All Product Tag
    Select Products And Click Batch Menu
    Wait And Click Element    ${locatorB_productsMgmt_select_addTags}
	Wait And Input Text    ${locatorB_productsMgmt_popUps_firstInput}    manual_tag
	# 回车
    Press Key    ${locatorB_productsMgmt_popUps_firstInput}    ${keybord_enter}
    Wait And Click Element    ${locatorB_popUps_button_middle}
    Wait Until Page Contains Text    添加成功
    # 进入product中检查是否存在
    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
    @{tagboxs}    Wait And Get List Items    ${locatorB_tagboxs}    ${locatorB_tagboxs}[0]
    :FOR    ${tagbox}    IN    @{tagboxs}
    \    ${text}    Wait And Get Text    ${tagbox}
    \    ${status}    Set Variable If    '${text}'=='manual_tag'    ${True}    ${False}
    \    Exit For Loop If    '${text}'=='manual_tag'
    Should Be True    ${status}


products052
	[Documentation]    验证可成功移除已有标签
    [Tags]    P0
    add_launched_product_py
    Reload Page
    Select All Product Tag
    Select Products And Click Batch Menu
    Wait And Click Element    ${locatorB_productsMgmt_select_delTags}
    @{antTags}    Wait And Get List Items    ${locatorB_antTags}    ${locatorB_popUps_button_middle}
    :FOR    ${antTag}    IN    @{antTags}
    \    Wait And Click Element    ${antTag}
    Wait And Click Element    ${locatorB_popUps_button_middle}
    Wait Until Page Contains Text    移除成功
    # 进入product中检查是否存在
    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
    Wait Until Page Contains Locator    ${locatorB_productsNew_input_tags}
    Wait Until Page Not Contains Locator    ${locatorB_tagboxs}

products055
	[Documentation]    验证可成功加入一个或多个专辑
    [Tags]    P0
    add_launched_product_py
    del_all_collection_py
    add_collection_with_pic_py
    Reload Page
    Select All Product Tag
    Select Products And Click Batch Menu
    Wait And Click Element    ${locatorB_productsMgmt_select_addtoCategory}
    Wait And Click Element    ${locatorB_popUps_allCheckbox}
    Wait And Click Element    ${locatorB_popUps_button_middle}
    Wait Until Page Contains Text    添加成功
    # 进入Collection中检查是否存在
    Go To Product Collection Page
    Wait And Click Element    ${locatorB_productsCollection_text_firstCollectionNum}
    Wait Until Page Contains Text    专辑商品(1)

products063
	[Documentation]    验证可成功将商品从已加入的专辑中移除
    [Tags]    P0
    add_launched_product_py
    add_collection_with_pic_py
    add_collection_without_pic_py
    Reload Page
    # 通过批量操作给商品添加入专辑1与专辑2
    Select All Product Tag
    Select Products And Click Batch Menu
    Wait And Click Element    ${locatorB_productsMgmt_select_addtoCategory}
    @{checkboxs}    Wait And Get List Items    ${locatorB_popUps_allCheckbox}    ${locatorB_popUps_allCheckbox}[0]
    :FOR    ${checkbox}    IN    @{checkboxs}
    \    Wait And Click Element    ${checkbox}
    Wait And Click Element    ${locatorB_popUps_button_middle}
    Wait Until Page Contains Text    添加成功
	# 批量删除专辑
    Select Products And Click Batch Menu
    Wait And Click Element    ${locatorB_productsMgmt_select_delfromCategory}
	@{checkboxs}    Wait And Get List Items    ${locatorB_popUps_allCheckbox}    ${locatorB_popUps_allCheckbox}[0]
    :FOR    ${checkbox}    IN    @{checkboxs}
    \    Wait And Click Element    ${checkbox}
    Wait And Click Element    ${locatorB_popUps_button_middle}
    Wait Until Page Contains Text    移除成功
    # 进入Collection中检查是否存在
    Go To Product Collection Page
    Wait And Click Element    ${locatorB_productsCollection_text_collectionNum}[0]
    Wait Until Page Contains Text    专辑商品(0)
    Go To Product Collection Page
    Wait And Click Element    ${locatorB_productsCollection_text_collectionNum}[1]
    Wait Until Page Contains Text    专辑商品(0)

#products070
#	[Documentation]    验证可全部取消自定义列表内容
#    [Tags]    P0
#    add_launched_product_py
#    Reload Page
#    Select All Product Tag
#    Hide All Header
#	Length Should Be Equal With Wait    ${locatorB_productsMgmt_textlist_itemsTitle}    ${5}
#    Show All Header
#	Length Should Be Equal With Wait    ${locatorB_productsMgmt_textlist_itemsTitle}    ${11}

products076
	[Documentation]    输入最低价格，搜索大于等于该价格商品
    [Tags]    P0
    &{product_conf01} =    Create Dictionary
    ...    saleprice=1
    add_product_with_conf_py    ${product_conf01}
    &{product_conf02} =    Create Dictionary
    ...    saleprice=199
    add_product_with_conf_py    ${product_conf02}
    Reload Page
    Select All Product Tag
    Wait And Input Text    ${locatorB_productsMgmt_input_minPrice}    99
    Wait And Click Element    ${locatorB_productsMgmt_button_search}
    Length Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}

products077
	[Documentation]    输入最低价格，搜索大于等于该价格商品
    [Tags]    P0
    &{product_conf01} =    Create Dictionary
    ...    saleprice=1
    add_product_with_conf_py    ${product_conf01}
    &{product_conf02} =    Create Dictionary
    ...    saleprice=199
    add_product_with_conf_py    ${product_conf02}
    Reload Page
    Select All Product Tag
    Wait And Input Text    ${locatorB_productsMgmt_input_maxPrice}    99
    Wait And Click Element    ${locatorB_productsMgmt_button_search}
    Length Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}

products078
	[Documentation]    输入最低价格10，最高价格90，搜索价格在10~90之间的商品
    [Tags]    P0
    &{product_conf01} =    Create Dictionary
    ...    saleprice=1
    add_product_with_conf_py    ${product_conf01}
    &{product_conf02} =    Create Dictionary
    ...    saleprice=199
    add_product_with_conf_py    ${product_conf02}
    Reload Page
    Select All Product Tag
    Wait And Input Text    ${locatorB_productsMgmt_input_minPrice}    10
    Wait And Input Text    ${locatorB_productsMgmt_input_maxPrice}    99
    Wait And Click Element    ${locatorB_productsMgmt_button_search}
    Length Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${0}

products080
	[Documentation]    可模糊搜索出商品名称包含该单词的商品
    [Tags]    P0
    add_launched_product_py
    &{product_conf01} =    Create Dictionary
    ...    title=compareone
    add_product_with_conf_py    ${product_conf01}
    Reload Page
    Select All Product Tag
    Wait And Input Text    ${locatorB_productsMgmt_input_name}    title
    Wait And Click Element    ${locatorB_productsMgmt_button_search}
    Length Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
    ${productName}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductName}
	Should Be Equal    '${productName}'    'autotest_title'