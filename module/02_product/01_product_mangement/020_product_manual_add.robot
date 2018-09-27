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
    [Tags]    P0    threshold
    add_launched_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	${attr}    Get Element Attribute    ${locatorB_productsMgmt_image_firstProductThumbnails}    class
	Should Be equal    '${attr}'    'center___1nHSZ'

products005
    [Documentation]    下架商品且未上传商品图，商品图片展示默认图
    [Tags]    P0    threshold
    add_min_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	${attr}    Get Element Attribute    ${locatorB_productsMgmt_image_firstProductThumbnails}    class
	Should Be equal    '${attr}'    ''

products007
    [Documentation]    验证商品无库存时展示正确
    [Tags]    P0
    add_empty_quantity_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	${inventoryQuantity}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductInventoryQuantity}
	Should Be Equal    '${inventoryQuantity}'    '0件'

products009
    [Documentation]    验证商品的创建时间正确
    [Tags]    P0
    ${time1}    Get Time
    add_min_product_py
    ${time2}    Get Time
    Reload Page And Start Ajax
    Select All Product Tag
	${createTime}    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[0]
	${status}    Evaluate    '${createTime}'=='${time1}' or '${createTime}'=='${time2}'
	Should Be True    ${status}

products011
    [Documentation]    无SKU时，SKU展示空白
    [Tags]    P0
    add_min_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	${sku}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductSku}
	Should Be Equal    '${sku}'    ''

products014
    [Documentation]    验证点击‘全部’无结果
    [Tags]    P0
    Reload Page And Start Ajax
    Select All Product Tag
	Wait Until Page Not Contains Locator    ${locatorB_page_text_totalRecord}

products018
    [Documentation]    验证点击删除按钮可删除商品
    [Tags]    P0    threshold
    add_min_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	Click Element And Confirm    ${locatorB_productsMgmt_icon_listDelete}[0]
	Wait Until Page Not Contains Locator    ${locatorB_productsMgmt_icon_listPreview}[0]

products019
    [Documentation]    验证可成功删除商品
    [Tags]    P0
    add_min_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	Click Element And Confirm    ${locatorB_productsMgmt_icon_listDelete}[0]
	Wait Until Page Not Contains Locator    ${locatorB_productsMgmt_icon_listPreview}[0]

products020
    [Documentation]    验证可取消删除商品
    [Tags]    P0
    add_min_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	Click Element And Cancel    ${locatorB_productsMgmt_icon_listDelete}[0]
	Wait Until Page Contains Locator    ${locatorB_productsMgmt_icon_listPreview}[0]

products021.1
    [Documentation]    验证展示的上架商品排序正确
    [Tags]    P0    threshold
    add_launched_product_py
    Sleep    1
	add_launched_product_py
	Reload Page And Start Ajax
    Select Launched Product Tag
    ${item1_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[0]
    ${item2_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[1]
    ${result}    lib_utils.compare_time_py    ${item1_createtime}    ${item2_createtime}
    Should Be Equal    ${result}    gt

products021.2
    [Documentation]    验证展示的上架商品数量正确
    [Tags]    P0    threshold
    add_launched_product_py
    add_launched_product_py
    add_discontinued_product_py
    Reload Page And Start Ajax
    Select Launched Product Tag
    ${total_record}    Wait And Get Text    ${locatorB_page_text_totalRecord}
    ${size}    lib_utils.searchStrs_py    ${total_record}
    Should Be Equal As Integers    ${size}    2
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listLaunched}    ${2}

products022
    [Documentation]    验证点击‘上架’无结果
    [Tags]    P0
    add_min_product_py
    Reload Page And Start Ajax
    Select Launched Product Tag
    Wait Until Page Not Contains Locator    ${locatorB_page_text_totalRecord}

products023.1
    [Documentation]    验证展示的下架商品排序正确
    [Tags]    P0    threshold
    add_discontinued_product_py
    Sleep    1
	add_discontinued_product_py
	Reload Page And Start Ajax
    Select Discontinued Product Tag
    ${item1_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[0]
    ${item2_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[1]
    ${result}    lib_utils.compare_time_py    ${item1_createtime}    ${item2_createtime}
    Should Be Equal    ${result}    gt

products023.2
    [Documentation]    验证展示的下架商品数量正确
    [Tags]    P0    threshold
    add_discontinued_product_py
    add_discontinued_product_py
    add_launched_product_py
    Reload Page And Start Ajax
    Select Discontinued Product Tag
    ${total_record}    Wait And Get Text    ${locatorB_page_text_totalRecord}
    ${size}    lib_utils.searchStrs_py    ${total_record}
    Should Be Equal As Integers    ${size}    2
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listDiscontinued}    ${2}

products037
    [Documentation]    验证能上架一个或多个商品成功
    [Tags]    P0    threshold
    add_discontinued_product_py
    add_discontinued_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	Select Products And Click Batch Menu
	Click Element And Confirm    ${locatorB_productsMgmt_select_launch}
	Wait Until Page Contains Text    上架成功
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listLaunched}    ${2}

products039
    [Documentation]    验证能下架一个或多个商品成功
    [Tags]    P0    threshold
    add_launched_product_py
    add_launched_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	Select Products And Click Batch Menu
	Click Element And Confirm    ${locatorB_productsMgmt_select_discontinue}
	Wait Until Page Contains Text    下架成功
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listDiscontinued}    ${2}

products041
    [Documentation]    验证能够成功批量删除商品
    [Tags]    P0    threshold
    add_launched_product_py
    add_launched_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	Select Products And Click Batch Menu
	Click Element And Confirm    ${locatorB_productsMgmt_select_batchDel}
	Wait Until Page Contains Text    删除成功
	Wait Until Page Contains Text    暂无数据
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${0}


products047
	[Documentation]    验证能成功添加新建的标签
    [Tags]    P0    threshold
    add_launched_product_py
    Reload Page And Start Ajax
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
    @{tagboxs}    Wait And Get Items List From Locator    ${locatorB_tagboxs}    ${locatorB_tagboxs}[0]
    :FOR    ${tagbox}    IN    @{tagboxs}
    \    ${text}    Wait And Get Text    ${tagbox}
    \    ${status}    Set Variable If    '${text}'=='manual_tag'    ${True}    ${False}
    \    Exit For Loop If    '${text}'=='manual_tag'
    Should Be True    ${status}


products052
	[Documentation]    验证可成功移除已有标签
    [Tags]    P0    threshold
    add_launched_product_py
    Reload Page And Start Ajax
    Select All Product Tag
    Select Products And Click Batch Menu
    Wait And Click Element    ${locatorB_productsMgmt_select_delTags}
    @{antTags}    Wait And Get Items List From Locator    ${locatorB_antTags}    ${locatorB_popUps_button_middle}
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
    [Tags]    P0    threshold
    add_launched_product_py
    del_all_collection_py
    add_collection_with_pic_py
    Reload Page And Start Ajax
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
    [Tags]    P0    threshold
    add_launched_product_py
    add_collection_with_pic_py
    add_collection_without_pic_py
    Reload Page And Start Ajax
    # 通过批量操作给商品添加入专辑1与专辑2
    Select All Product Tag
    Select Products And Click Batch Menu
    Wait And Click Element    ${locatorB_productsMgmt_select_addtoCategory}
    @{checkboxs}    Wait And Get Items List From Locator    ${locatorB_popUps_allCheckbox}    ${locatorB_popUps_allCheckbox}[0]
    :FOR    ${checkbox}    IN    @{checkboxs}
    \    Wait And Click Element    ${checkbox}
    Wait And Click Element    ${locatorB_popUps_button_middle}
    Wait Until Page Contains Text    添加成功
	# 批量删除专辑
    Select Products And Click Batch Menu
    Wait And Click Element    ${locatorB_productsMgmt_select_delfromCategory}
	@{checkboxs}    Wait And Get Items List From Locator    ${locatorB_popUps_allCheckbox}    ${locatorB_popUps_allCheckbox}[0]
    :FOR    ${checkbox}    IN    @{checkboxs}
    \    Wait And Click Element    ${checkbox}
    Wait And Click Element    ${locatorB_popUps_button_middle}
    Wait Until Page Contains Text    移除成功
    # 进入Collection中检查是否存在
    Go To Product Collection Page
    Wait And Click Element    ${locatorB_productsCollection_text_listCollectionNum}[0]
    Wait Until Page Contains Text    专辑商品(0)
    Go To Product Collection Page
    Wait And Click Element    ${locatorB_productsCollection_text_listCollectionNum}[1]
    Wait Until Page Contains Text    专辑商品(0)

#products070
#	[Documentation]    验证可全部取消自定义列表内容
#    [Tags]    P0    threshold
#    add_launched_product_py
#    Reload Page And Start Ajax
#    Select All Product Tag
#    Hide All Header
#	Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_textlist_itemsTitle}    ${5}
#    Show All Header
#	Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_textlist_itemsTitle}    ${11}

products076
	[Documentation]    输入最低价格，搜索大于等于该价格商品
    [Tags]    P0    threshold
    &{product_conf01} =    Create Dictionary
    ...    saleprice=1
    add_product_with_conf_py    ${product_conf01}
    &{product_conf02} =    Create Dictionary
    ...    saleprice=199
    add_product_with_conf_py    ${product_conf02}
    Reload Page And Start Ajax
    Select All Product Tag
    Wait And Input Text    ${locatorB_productsMgmt_input_minPrice}    99
    Wait And Click Element    ${locatorB_productsMgmt_button_search}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}

products077
	[Documentation]    输入最低价格，搜索大于等于该价格商品
    [Tags]    P0    threshold
    &{product_conf01} =    Create Dictionary
    ...    saleprice=1
    add_product_with_conf_py    ${product_conf01}
    &{product_conf02} =    Create Dictionary
    ...    saleprice=199
    add_product_with_conf_py    ${product_conf02}
    Reload Page And Start Ajax
    Select All Product Tag
    Wait And Input Text    ${locatorB_productsMgmt_input_maxPrice}    99
    Wait And Click Element    ${locatorB_productsMgmt_button_search}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}

products078
	[Documentation]    输入最低价格10，最高价格90，搜索价格在10~90之间的商品
    [Tags]    P0    threshold
    &{product_conf01} =    Create Dictionary
    ...    saleprice=1
    add_product_with_conf_py    ${product_conf01}
    &{product_conf02} =    Create Dictionary
    ...    saleprice=199
    add_product_with_conf_py    ${product_conf02}
    Reload Page And Start Ajax
    Select All Product Tag
    Wait And Input Text    ${locatorB_productsMgmt_input_minPrice}    10
    Wait And Input Text    ${locatorB_productsMgmt_input_maxPrice}    99
    Wait And Click Element    ${locatorB_productsMgmt_button_search}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${0}

products080
	[Documentation]    可模糊搜索出商品名称包含该单词的商品
    [Tags]    P0    threshold
    add_launched_product_py
    &{product_conf01} =    Create Dictionary
    ...    title=compareone
    add_product_with_conf_py    ${product_conf01}
    Reload Page And Start Ajax
    Select All Product Tag
    Wait And Input Text    ${locatorB_productsMgmt_input_name}    compare
    Wait And Click Element    ${locatorB_productsMgmt_button_search}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
    ${productName}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductName}
	Should Be Equal    '${productName}'    'compareone'

products081
	[Documentation]    可通过模糊搜索SKU，搜索出商品
    [Tags]    P0    threshold
    add_launched_product_py
    &{product_conf01} =    Create Dictionary
    ...    sku=123456
    ...    title=compareone
    add_product_with_conf_py    ${product_conf01}
    Reload Page And Start Ajax
    Select All Product Tag
    Wait And Input Text    ${locatorB_productsMgmt_input_name}    123456
    Wait And Click Element    ${locatorB_productsMgmt_button_search}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
    ${productName}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductName}
	Should Be Equal    '${productName}'    'compareone'

products082
	[Documentation]    可通过标签搜索出商品
    [Tags]    P0    threshold
    add_launched_product_py
    @{tags} =    Create List    'color'
    &{product_conf01} =    Create Dictionary
    ...    tags=@{tags}
    ...    title=compareone
    add_product_with_conf_py    ${product_conf01}
    Reload Page And Start Ajax
    Select All Product Tag
    Wait And Input Text    ${locatorB_productsMgmt_input_name}    color
    Wait And Click Element    ${locatorB_productsMgmt_button_search}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
    ${productName}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductName}
	Should Be Equal    '${productName}'    'compareone'

products084
	[Documentation]    验证只输入必填项可正常添加商品
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addProduct}
    Fill In Required Items When Create Product
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Wait Until Page Not Contains Locator    ${locatorB_productsNew_button_save}
    Go To Product Management Page
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
    ${productName}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductName}
    Should Be Equal    '${productName}'    'newproduct'

products093
	[Documentation]    验证可将商品上架
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addProduct}
    Fill In Required Items When Create Product
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Wait Until Page Not Contains Locator    ${locatorB_productsNew_button_save}
    Go To Product Management Page
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
    ${attr0} =    Get Element Attribute    ${locatorB_productsMgmt_switch_listLaunched}[0]    class
    Should Be Equal    '${attr0}'    'ant-switch ant-switch-checked'

products097
	[Documentation]    验证可正常添加供应商
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addProduct}
    Fill In Required Items When Create Product
    Wait And Input Text    ${locatorB_productsNew_input_supplier}    try_to_add_supplier
    Press Key    ${locatorB_productsNew_input_supplier}    ${keybord_enter}
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Wait Until Page Not Contains Locator    ${locatorB_productsNew_button_save}
    Go To Product Management Page
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
    ${attr0} =    Get Element Attribute    ${locatorB_productsNew_input_supplier}    value
    Should Be Equal    '${attr0}'    'try_to_add_supplier'

products099
	[Documentation]    验证可正常添加单个标签
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addProduct}
    Fill In Required Items When Create Product
    Wait And Input Text    ${locatorB_productsNew_input_tags}    try_to_add_tags
    Press Key    ${locatorB_productsNew_input_tags}    ${keybord_enter}
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Wait Until Page Not Contains Locator    ${locatorB_productsNew_button_save}
    Go To Product Management Page
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
    ${attr0} =    Wait And Get Text    ${locatorB_tagboxs}[0]
    Should Be Equal    '${attr0}'    'try_to_add_tags'

products112
	[Documentation]    验证可上传一张图片
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addProduct}
    Fill In Required Items When Create Product
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Wait Until Page Not Contains Locator    ${locatorB_productsNew_button_save}
    Go To Product Management Page
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
    ${productName}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductName}
    Should Be Equal    '${productName}'    'newproduct'

# 含点击‘编辑图片alt'icon，暂不实现
#products119
#	[Documentation]    验证可编辑图片alt
#    [Tags]    P0    threshold
#    Wait And Click Element    ${locatorB_productsMgmt_button_addProduct}
#    Wait Enabled And Choose File    ${locatorB_productsNew_input_addImage}    ${img_file}
#	Mouse Over    ${locatorB_productsNew_img_firstImage}
#	Wait And Click Element

# 无法点开'增加选项'，暂不实现
#products122
#	[Documentation]    验证可添加子产品
#    [Tags]    P1    threshold
#    Wait And Click Element    ${locatorB_productsMgmt_button_addProduct}
#    Fill In Required Items When Create Product
#    Execute JavaScript    document.querySelectorAll('button[data-robot="products_setting"]')[0].scrollIntoView()
#    Sleep    2
#    Wait And Click Element    ${locatorB_productsNew_button_setting}
#    Wait And Click Element    ${locatorB_productsNew_dropdown_addItems}
#    Wait And Click Element    ${locatorB_productsNew_dropdown_customize}
#    Wait And Input Text    ${locatorB_productsNew_input_firstStyleCategory}    firstStyleCategory
#    Wait And Input Text    ${locatorB_productsNew_input_firstSubStyleCategory}    firstSubStyleCategory
#	Press Key    ${locatorB_productsNew_input_firstSubStyleCategory}    ${keybord_enter}
#    Wait Until Page Contains Locator    ${locatorB_productsNew_checkbox_firstSubProduct}
#    Wait And Click Element    ${locatorB_productsNew_button_save}
#    Wait Until Page Not Contains Locator    ${locatorB_productsNew_button_save}
#    Go To Product Management Page
#    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
#    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
#    Wait Until Page Contains Locator    ${locatorB_productsNew_checkbox_firstSubProduct}
#
# 无法点开'增加选项'，暂不实现
#products123
#	[Documentation]    验证可自定义选项
#    [Tags]    P1    threshold
#    Wait And Click Element    ${locatorB_productsMgmt_button_addProduct}
#    Fill In Required Items When Create Product
#    Wait And Click Element    ${locatorB_productsNew_button_setting}
#    Wait And Click Element    ${locatorB_productsNew_dropdown_addItems}
#    Wait And Click Element    ${locatorB_productsNew_dropdown_customize}
#    Wait And Input Text    ${locatorB_productsNew_input_firstStyleCategory}    firstStyleCategory
#    Wait And Input Text    ${locatorB_productsNew_input_firstSubStyleCategory}    firstSubStyleCategory
#	Press Key    ${locatorB_productsNew_input_firstSubStyleCategory}    ${keybord_enter}
#    Wait Until Page Contains Locator    ${locatorB_productsNew_checkbox_firstSubProduct}
#    Wait And Click Element    ${locatorB_productsNew_button_save}
#    Wait Until Page Not Contains Locator    ${locatorB_productsNew_button_save}
#    Go To Product Management Page
#    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
#    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
#    Wait Until Page Contains Locator    ${locatorB_productsNew_checkbox_firstSubProduct}

# 元素不好定位，待多福添加robot-data之后，再写此用例
#products124
#	[Documentation]    验证可编辑SEO,成功保存
#    [Tags]    P1    threshold
#    Wait And Click Element    ${locatorB_productsMgmt_button_addProduct}
#    Fill In Required Items When Create Product
#    Wait And Click Element    ${locatorB_productsNew_icon_editSEO}
#    Wait And Input Text    ${locatorB_productsNew_input_homeTitle}    homeTitle
#    Wait And Input Text    ${locatorB_productsNew_textarea_homeSEODesc}    homeSEODesc
#    Wait And Input Text    ${locatorB_productsNew_input_homeSEOLink}    homeSEOLink
#    Wait And Input Text    ${locatorB_productsNew_input_homeSEOKeyword}    homeSEOKeyword
#	Press Key    ${locatorB_productsNew_input_homeSEOKeyword}    ${keybord_enter}
#	Sleep    20

products128
	[Documentation]    验证可批量上传商品
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_icon_uploadProduct}
    Wait Enabled And Choose File    ${locatorB_productsMgmt_input_uploadProduct}    ${file_products_template}
    Wait And Click Element    ${locatorB_productsMgmt_button_toImport}
    Wait Until Page Contains Text    导入完成    20
    Wait And Click Element    ${locatorB_productsMgmt_button_confirmAfterImport}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
    ${productName}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductName}
    Should Be Equal    '${productName}'    'Example T-Shirt'

products129
	[Documentation]    验证上传不合格的商品文件，无法上传
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_icon_uploadProduct}
    Wait Enabled And Choose File    ${locatorB_productsMgmt_input_uploadProduct}    ${file_products_wrong_template}
    Wait Until Page Contains Text    其中格式正确的有0条

# 有bug，并且之后需要重构
#products187
#	[Documentation]    不可批量上架无图片商品
#    [Tags]    P0    threshold
#    add_min_product_py
#    Reload Page And Start Ajax
#    Select All Product Tag
#    Select Products And Click Batch Menu
#    Click Element And Confirm    ${locatorB_productsMgmt_select_launch}
#    Wait Until Page Contains Text    全部商品上架失败：缺少图片
#    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listLaunched}    ${0}

products188
	[Documentation]    浏览量增加
    [Tags]    P0    threshold
    add_max_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsMgmt_icon_listPreview}[0]
    Sleep    2
    Open New And Close Other Windows    ${home_page}
    Go To Product Management Page
    Select All Product Tag
    ${text}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductViews}
    Should Be equal    '${text}'    '1'


