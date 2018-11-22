*** Settings ***
Documentation     手动添加商品测试
Suite Setup       Product Management Common Suite Setup
Suite Teardown    Product Management Common Suite Teardown
Test Setup        Product Management Case Setup Clear Evn
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/keywords/kw_common.robot


*** Test Cases ***
# 有bug，已提单，暂不跑
#products052
#	[Documentation]    验证可成功移除已有标签
#    [Tags]    P0    threshold
#    kwproduct.add_launched_product_py
#    Reload Page And Start Ajax
#    Select All Product Tag
#    Select All Items Then Click Batch Menu
#    Wait And Click Element    ${locatorB_productsMgmt_select_delTags}
#    @{antTags}    Wait And Get Items List From Locator    ${locatorB_antTags}    ${locatorB_popUps_button_footermiddle}
#    :FOR    ${antTag}    IN    @{antTags}
#    \    Wait And Click Element    ${antTag}
#    Wait And Click Element    ${locatorB_popUps_button_footermiddle}
#    Wait Until Page Contains Text    移除成功
#    # 进入product中检查是否存在
#    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
#    Sleep    2
#    Wait Until Page Contains Locator    ${locatorB_productsNew_input_tags}
#    Wait Until Page Not Contains Locator    ${locatorB_tagboxs}

products055
	[Documentation]    验证可成功加入一个或多个专辑
    [Tags]    P0    threshold
    kwproduct.add_launched_product_py
    del_all_collections_py
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Select All Product Tag
    Select All Items Then Click Batch Menu
    Wait And Click Element    ${locatorB_productsMgmt_select_addtoCategory}
    Wait And Click Element    ${locatorB_popUps_allCheckbox}
    Wait And Click Element    ${locatorB_popUps_button_bodymiddle}
    Wait Until Page Contains Text    添加成功
    # 进入Collection中检查是否存在
    Go To Product Collection Page
    Wait And Click Element    ${locatorB_productsCollection_text_firstCollectionNum}
    Wait Until Page Contains Text    专辑商品(1)

products063
	[Documentation]    验证可成功将商品从已加入的专辑中移除
    [Tags]    P0    threshold
    kwproduct.add_launched_product_py
    kwcollection.add_collection_with_pic_py
    kwcollection.add_collection_without_pic_py
    Reload Page And Start Ajax
    # 通过批量操作给商品添加入专辑1与专辑2
    Select All Product Tag
    Select All Items Then Click Batch Menu
    Wait And Click Element    ${locatorB_productsMgmt_select_addtoCategory}
    @{checkboxs}    Wait And Get Items List From Locator    ${locatorB_popUps_allCheckbox}    ${locatorB_popUps_allCheckbox}[0]
    :FOR    ${checkbox}    IN    @{checkboxs}
    \    Wait And Click Element    ${checkbox}
    Wait And Click Element    ${locatorB_popUps_button_bodymiddle}
    Wait Until Page Contains Text    添加成功
	# 批量删除专辑
    Select All Items Then Click Batch Menu
    Wait And Click Element    ${locatorB_productsMgmt_select_delfromCategory}
	@{checkboxs}    Wait And Get Items List From Locator    ${locatorB_popUps_allCheckbox}    ${locatorB_popUps_allCheckbox}[0]
    :FOR    ${checkbox}    IN    @{checkboxs}
    \    Wait And Click Element    ${checkbox}
    Wait And Click Element    ${locatorB_popUps_button_bodymiddle}
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
#    kwproduct.add_launched_product_py
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
    kwproduct.add_product_with_conf_py    ${product_conf01}
    &{product_conf02} =    Create Dictionary
    ...    saleprice=199
    kwproduct.add_product_with_conf_py    ${product_conf02}
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
    kwproduct.add_product_with_conf_py    ${product_conf01}
    &{product_conf02} =    Create Dictionary
    ...    saleprice=199
    kwproduct.add_product_with_conf_py    ${product_conf02}
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
    kwproduct.add_product_with_conf_py    ${product_conf01}
    &{product_conf02} =    Create Dictionary
    ...    saleprice=199
    kwproduct.add_product_with_conf_py    ${product_conf02}
    Reload Page And Start Ajax
    Select All Product Tag
    Wait And Input Text    ${locatorB_productsMgmt_input_minPrice}    10
    Wait And Input Text    ${locatorB_productsMgmt_input_maxPrice}    99
    Wait And Click Element    ${locatorB_productsMgmt_button_search}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${0}

products080
	[Documentation]    可模糊搜索出商品名称包含该单词的商品
    [Tags]    P0    threshold
    kwproduct.add_launched_product_py
    &{product_conf01} =    Create Dictionary
    ...    title=compareone
    kwproduct.add_product_with_conf_py    ${product_conf01}
    Reload Page And Start Ajax
    Select All Product Tag
    Wait And Input Text    ${locatorB_productsMgmt_input_name}    compare
    Wait And Click Element    ${locatorB_productsMgmt_button_search}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
    ${productName}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductName}
	Should Be Equal    '${productName}'    'compareone'


products082
	[Documentation]    可通过标签搜索出商品
    [Tags]    P0    threshold
    kwproduct.add_launched_product_py
    @{tags} =    Create List    'color'
    &{product_conf01} =    Create Dictionary
    ...    tags=@{tags}
    ...    title=compareone
    kwproduct.add_product_with_conf_py    ${product_conf01}
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
    ${attr0} =    Wait And Get Element Attribute    ${locatorB_productsMgmt_switch_listLaunched}[0]    class
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
    Sleep    2
    ${attr0} =    Wait And Get Element Attribute    ${locatorB_productsNew_input_supplier}    value
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
    Sleep    2
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
#    Sleep    2
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
#    Sleep    2
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

# 有bug，已提单，暂不跑
#products128
#	[Documentation]    验证可批量上传商品
#    [Tags]    P0    threshold
#    Wait And Click Element    ${locatorB_productsMgmt_icon_uploadProduct}
#    Wait Enabled And Choose File    ${locatorB_productsMgmt_input_uploadProduct}    ${file_products_template}
#    Wait And Click Element    ${locatorB_productsMgmt_button_toImport}
#    Wait Until Page Contains Text    导入完成    30
#    Wait And Click Element    ${locatorB_productsMgmt_button_confirmAfterImport}
#    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
#    ${productName}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductName}
#    Should Be Equal    '${productName}'    'Example T-Shirt'

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
#    kwproduct.add_min_product_py
#    Reload Page And Start Ajax
#    Select All Product Tag
#    Select All Items Then Click Batch Menu
#    Wait And Click Element Then Confirm    ${locatorB_productsMgmt_select_launch}
#    Wait Until Page Contains Text    全部商品上架失败：缺少图片
#    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listLaunched}    ${0}

# 有bug，已提单，暂不跑
#products188
#	[Documentation]    浏览量增加
#    [Tags]    P0    threshold
#    kwproduct.add_max_product_py
#    Reload Page And Start Ajax
#    Wait And Click Element    ${locatorB_productsMgmt_icon_listPreview}[0]
#    Sleep    2
#    Open New And Close Other Windows    ${home_page}
#    Go To Product Management Page
#    Select All Product Tag
#    ${text}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductViews}
#    Should Be equal    '${text}'    '1'

