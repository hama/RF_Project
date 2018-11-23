*** Settings ***
Documentation     手动添加商品测试
Suite Setup       Product Management Common Suite Setup
Suite Teardown    Product Management Common Suite Teardown
Test Setup        Product Management Case Setup Clear Evn
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/keywords/kw_common.robot


*** Test Cases ***
products004
    [Documentation]    上架商品图片展示商品主图
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	${attr}    Wait And Get Element Attribute    ${locatorB_productsMgmt_image_firstProductThumbnails}    class
	Should Be equal    '${attr}'    'center___1nHSZ'

products005
    [Documentation]    下架商品且未上传商品图，商品图片展示默认图
    [Tags]    P0    threshold
    kwproduct.add_min_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	${attr}    Wait And Get Element Attribute    ${locatorB_productsMgmt_image_firstProductThumbnails}    class
	Should Be equal    '${attr}'    ''

products007
    [Documentation]    验证商品无库存时展示正确
    [Tags]    P0
    kwproduct.add_empty_quantity_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	${inventoryQuantity}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductInventoryQuantity}
	Should Be Equal    '${inventoryQuantity}'    '0件'

products009
    [Documentation]    验证商品的创建时间正确
    [Tags]    P0
    ${time1}    Get Time
    kwproduct.add_min_product_py
    ${time2}    Get Time
    Reload Page And Start Ajax
    Select All Product Tag
	${createTime}    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[0]
	${status}    Evaluate    '${createTime}'=='${time1}' or '${createTime}'=='${time2}'
	Should Be True    ${status}

#products011
#    [Documentation]    无SKU时，SKU展示空白
#    [Tags]    P0
#    kwproduct.add_min_product_py
#    Reload Page And Start Ajax
#    Select All Product Tag
#	${sku}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductSku}
#	Should Be Equal    '${sku}'    ''

products014
    [Documentation]    验证点击‘全部’无结果
    [Tags]    P0
    Reload Page And Start Ajax
    Select All Product Tag
	Wait Until Page Not Contains Locator    ${locatorB_page_text_totalRecord}

products018
    [Documentation]    验证点击删除按钮可删除商品
    [Tags]    P0    threshold
    kwproduct.add_min_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	Wait And Click Element Then Confirm    ${locatorB_productsMgmt_icon_listDelete}[0]
	Wait Until Page Not Contains Locator    ${locatorB_productsMgmt_icon_listPreview}[0]

products019
    [Documentation]    验证可成功删除商品
    [Tags]    P0
    kwproduct.add_min_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	Wait And Click Element Then Confirm    ${locatorB_productsMgmt_icon_listDelete}[0]
	Wait Until Page Not Contains Locator    ${locatorB_productsMgmt_icon_listPreview}[0]

products020
    [Documentation]    验证可取消删除商品
    [Tags]    P0
    kwproduct.add_min_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	Wait And Click Element Then Cancel    ${locatorB_productsMgmt_icon_listDelete}[0]
	Wait Until Page Contains Locator    ${locatorB_productsMgmt_icon_listPreview}[0]

products021.1
    [Documentation]    验证展示的上架商品排序正确
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    Sleep    1
	kwproduct.add_max_product_py
	Reload Page And Start Ajax
    Select Launched Product Tag
    ${item1_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[0]
    ${item2_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[1]
    ${result}    lib_utils.compare_time_py    ${item1_createtime}    ${item2_createtime}
    ${status} =    Evaluate    ${result}>0
    Should Be Equal    '${status}'    'True'

products021.2
    [Documentation]    验证展示的上架商品数量正确
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    kwproduct.add_max_product_py
    kwproduct.add_discontinued_product_py
    Reload Page And Start Ajax
    Select Launched Product Tag
    ${total_record}    Wait And Get Text    ${locatorB_page_text_totalRecord}
    ${size}    lib_utils.searchStrs_py    ${total_record}
    Should Be Equal As Integers    ${size}    2
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listLaunched}    ${2}

products022
    [Documentation]    验证点击‘上架’无结果
    [Tags]    P0
    kwproduct.add_min_product_py
    Reload Page And Start Ajax
    Select Launched Product Tag
    Wait Until Page Not Contains Locator    ${locatorB_page_text_totalRecord}

products023.1
    [Documentation]    验证展示的下架商品排序正确
    [Tags]    P0    threshold
    kwproduct.add_discontinued_product_py
    Sleep    1
	kwproduct.add_discontinued_product_py
	Reload Page And Start Ajax
    Select Discontinued Product Tag
    ${item1_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[0]
    ${item2_createtime}=    Wait And Get Text    ${locatorB_productsMgmt_text_listCreateTime}[1]
    ${result}    lib_utils.compare_time_py    ${item1_createtime}    ${item2_createtime}
    ${status} =    Evaluate    ${result}>0
    Should Be Equal    '${status}'    'True'

products023.2
    [Documentation]    验证展示的下架商品数量正确
    [Tags]    P0    threshold
    kwproduct.add_discontinued_product_py
    kwproduct.add_discontinued_product_py
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Select Discontinued Product Tag
    ${total_record}    Wait And Get Text    ${locatorB_page_text_totalRecord}
    ${size}    lib_utils.searchStrs_py    ${total_record}
    Should Be Equal As Integers    ${size}    2
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listDiscontinued}    ${2}

products034
    [Documentation]    修改包含子产品的商品后保存
    [Tags]    P0    threshold
    kwproduct.add_max_product_with_sub_py
    Reload Page And Start Ajax
    Select All Product Tag
    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
    Sleep    2
    Wait And Input Text    ${locatorB_productsNew_input_title}    newproduct
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Wait Until Page Not Contains Locator    ${locatorB_productsNew_button_save}
    Go To Product Management Page
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
    ${productName}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductName}
    Should Be Equal    '${productName}'    'newproduct'

products035
    [Documentation]    修改不包含子产品的商品后保存
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Select All Product Tag
    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
    Sleep    2
    Wait And Input Text    ${locatorB_productsNew_input_title}    newproduct
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Wait Until Page Not Contains Locator    ${locatorB_productsNew_button_save}
    Go To Product Management Page
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${1}
    ${productName}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductName}
    Should Be Equal    '${productName}'    'newproduct'

products037
    [Documentation]    验证能上架一个或多个商品成功
    [Tags]    P0    threshold
    kwproduct.add_discontinued_product_py
    kwproduct.add_discontinued_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	Select All Items Then Click Batch Menu
	Wait And Click Element Then Confirm    ${locatorB_productsMgmt_select_launch}
	Wait Until Page Contains Text    上架成功
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listLaunched}    ${2}

products039
    [Documentation]    验证能下架一个或多个商品成功
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	Select All Items Then Click Batch Menu
	Wait And Click Element Then Confirm    ${locatorB_productsMgmt_select_discontinue}
	Wait Until Page Contains Text    下架成功
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_switch_listDiscontinued}    ${2}

products041
    [Documentation]    验证能够成功批量删除商品
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Select All Product Tag
	Select All Items Then Click Batch Menu
	Wait And Click Element Then Confirm    ${locatorB_productsMgmt_select_batchDel}
	Wait Until Page Contains Text    删除成功
	Wait Until Page Contains Text    暂无数据
    Count Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_icon_listPreview}    ${0}

products047
	[Documentation]    验证能成功添加新建的标签
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Select All Product Tag
    Select All Items Then Click Batch Menu
    Wait And Click Element    ${locatorB_productsMgmt_select_addTags}
	Wait And Input Text    ${locatorB_productsMgmt_popUps_firstInput}    manual_tag
	# 回车
    Press Key    ${locatorB_productsMgmt_popUps_firstInput}    ${keybord_enter}
    Wait And Click Element    ${locatorB_productsMgmt_text_tagInPopUps}
    Wait And Click Element    ${locatorB_popUps_button_footermiddle}
    Wait Until Page Contains Text    添加成功
    # 进入product中检查是否存在
    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
    Sleep    2
    @{tagboxs}    Wait And Get Items List From Locator    ${locatorB_tagboxs}    ${locatorB_tagboxs}[0]
    :FOR    ${tagbox}    IN    @{tagboxs}
    \    ${text}    Wait And Get Text    ${tagbox}
    \    ${status}    Set Variable If    '${text}'=='manual_tag'    ${True}    ${False}
    \    Exit For Loop If    '${text}'=='manual_tag'
    Should Be True    ${status}