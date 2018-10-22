*** Settings ***
Documentation     手动添加商品测试
Suite Setup       Product Collection Suite Setup
Suite Teardown    Product Collection Suite Teardown
Test Setup        Product Collection Case Setup
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/keywords/kw_common.robot


*** Test Cases ***
collection001
    [Documentation]    进入商品专辑界面，查看左上角标题
    [Tags]    P0    threshold
	${text}    Wait And Get Text    ${locatorB_productsCollection_text_collection}
	Should Be equal    '${text}'    '商品专辑'

collection007
    [Documentation]    进入专辑详情页面
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
	Wait And Click Element    ${locatorB_productsCollection_icon_listDetailOpen}[0]
	Wait Until Page Contains Text    商品(0)

collection008
    [Documentation]    不能同时展开两个专辑详情
    [Tags]    P0    threshold
	kwcollection.add_collection_with_pic_py
	kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    # 含2个listDetailOpen的元素
    Count Of Element Should Be Equal With Wait    ${locatorB_productsCollection_icon_listDetailOpen}    ${2}
    Sleep    1
    # 点击第一个专辑的详情按钮
	Wait And Click Element    ${locatorB_productsCollection_icon_listDetailOpen}[0]
    Count Of Element Should Be Equal With Wait    ${locatorB_productsCollection_icon_listDetailFold}    ${1}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsCollection_icon_listDetailOpen}    ${1}
    Sleep    1
    # 点击第二个专辑的详情按钮
    Wait And Click Element    ${locatorB_productsCollection_icon_listDetailOpen}[0]
    Count Of Element Should Be Equal With Wait    ${locatorB_productsCollection_icon_listDetailFold}    ${1}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsCollection_icon_listDetailOpen}    ${1}
	Wait Until Page Contains Text    商品(0)

collection012
    [Documentation]    列表单个删除
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Sleep    1
	Wait And Click Element    ${locatorB_productsCollection_icon_listDel}[0]
	Wait Until Page Contains Text     确定删除吗？

collection013
    [Documentation]    列表单个删除点击确定
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Sleep    1
	Wait And Click Element    ${locatorB_productsCollection_icon_listDel}[0]
	Wait And Click Element    ${locatorB_global_alert_confirm}
	Wait Until Page Contains Text     暂无数据

collection015
    [Documentation]    列表批量删除
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
	Wait Exist And Click Element    ${locatorB_productsCollection_checkbox_chooseCategories}
	Wait And Click Element    ${locatorB_productsCollection_button_delProducts}
	Wait Until Page Contains Text     确定删除吗？

collection016
    [Documentation]    列表批量删除点击确定
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
	Wait Exist And Click Element    ${locatorB_productsCollection_checkbox_chooseCategories}
	Sleep    1
	Wait And Click Element    ${locatorB_productsCollection_button_delProducts}
	Wait And Click Element    ${locatorB_global_alert_confirm}
	Wait Until Page Contains Text     暂无数据

collection023
    [Documentation]    专辑名称输入混合（包括中英文，特殊符号，数字）字符
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     修改成功
	Go To Product Collection Page
	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}

collection025
    [Documentation]    专辑名称输入1-255个字符
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     修改成功
	Go To Product Collection Page
	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}

collection031
    [Documentation]    专辑描述输入混合（包括中英文，特殊符号，数字）字符
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
	Wait And Input Text    ${locatorB_collectionDetail_input_description}    description@123
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     修改成功
	Go To Product Collection Page
	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}

collection032
    [Documentation]    专辑描述输入1-255个字符
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
	Wait And Input Text    ${locatorB_collectionDetail_input_description}    description@123
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     修改成功
	Go To Product Collection Page
	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}

collection034
    [Documentation]    专辑封面格式JPG
    [Tags]    P0    threshold
    kwcollection.add_collection_without_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
	Wait Enabled And Choose File    ${locatorB_collectionDetail_input_addImage}    ${file_products_addImg}
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     修改成功
	Go To Product Collection Page
	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}
	Wait Until Page Contains Locator     ${locatorB_productsCollection_img_listCollectionThumbnails}[0]

collection090
    [Documentation]    展开专辑快速查找
    [Tags]    P0    threshold
    kwcollection.add_collection_without_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait Until Page Contains Locator    ${locatorB_collectionDetail_icon_quickSearchToShow}
    Wait And Click Element    ${locatorB_collectionDetail_icon_quickSearchToShow}
    Wait Until Page Contains Locator    ${locatorB_collectionDetail_icon_quickSearchToClose}

collection091
    [Documentation]    收起专辑快速查找
    [Tags]    P0    threshold
    kwcollection.add_collection_without_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait Until Page Contains Locator    ${locatorB_collectionDetail_icon_quickSearchToShow}
    Wait And Click Element    ${locatorB_collectionDetail_icon_quickSearchToShow}
    Wait Until Page Contains Locator    ${locatorB_collectionDetail_icon_quickSearchToClose}
    Sleep 2 Then Click Element ${locatorB_collectionDetail_icon_quickSearchToClose}
    Wait Until Page Contains Locator    ${locatorB_collectionDetail_icon_quickSearchToShow}

collection093
    [Documentation]    切换为改专辑详情页
    [Tags]    P0    threshold
    &{collection_conf00} =    Create Dictionary
    ...    title=autotest_title0
    kwcollection.add_collection_with_conf_py    ${collection_conf00}
    Sleep    1
    &{collection_conf01} =    Create Dictionary
    ...    title=autotest_title1
    kwcollection.add_collection_with_conf_py    ${collection_conf01}
    Reload Page And Start Ajax
	# 点击进入专辑详情页
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Value Of Element Should Be Equal With Wait    ${locatorB_collectionDetail_input_title}    autotest_title1
    Wait And Click Element    ${locatorB_collectionDetail_icon_quickSearchToShow}
    Wait And Click Element    ${locatorB_collectionDetail_text_quickSearchListItemsName}[0]
    Value Of Element Should Be Equal With Wait    ${locatorB_collectionDetail_input_title}    autotest_title0

collection094
    [Documentation]    修改后未保存时点击切换专辑
    [Tags]    P0    threshold
    &{collection_conf00} =    Create Dictionary
    ...    title=autotest_title0
    kwcollection.add_collection_with_conf_py    ${collection_conf00}
    Sleep    1
    &{collection_conf01} =    Create Dictionary
    ...    title=autotest_title1
    kwcollection.add_collection_with_conf_py    ${collection_conf01}
    Reload Page And Start Ajax
	# 点击进入专辑详情页
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Value Of Element Should Be Equal With Wait    ${locatorB_collectionDetail_input_title}    autotest_title1
    Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
    Wait And Click Element    ${locatorB_collectionDetail_icon_quickSearchToShow}
    Wait And Click Element    ${locatorB_collectionDetail_text_quickSearchListItemsName}[0]
    Wait Until Page Contains Text    确定离开当前页面吗？

collection095
    [Documentation]    修改后未保存时点击切换专辑确定
    [Tags]    P0    threshold
    &{collection_conf00} =    Create Dictionary
    ...    title=autotest_title0
    kwcollection.add_collection_with_conf_py    ${collection_conf00}
    Sleep    1
    &{collection_conf01} =    Create Dictionary
    ...    title=autotest_title1
    kwcollection.add_collection_with_conf_py    ${collection_conf01}
    Reload Page And Start Ajax
	# 点击进入专辑详情页
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Value Of Element Should Be Equal With Wait    ${locatorB_collectionDetail_input_title}    autotest_title1
    Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
    Wait And Click Element    ${locatorB_collectionDetail_icon_quickSearchToShow}
    Wait And Click Element    ${locatorB_collectionDetail_text_quickSearchListItemsName}[0]
    Wait Until Page Contains Text    确定离开当前页面吗？
    Sleep    1
    Wait And Click Element    ${locatorB_popUps_button_bodymiddle}
    Value Of Element Should Be Equal With Wait    ${locatorB_collectionDetail_input_title}    autotest_title0

collection098
    [Documentation]    未保存点击返回按钮退出
    [Tags]    P0    threshold
    kwcollection.add_collection_without_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait And Click Element    ${locatorB_icon_back}
	${alert_msg}    Handle Alert
    Should Be Equal     页面上有未保存内容，是否确定退出?    ${alert_msg}

collection099
    [Documentation]    未保存点击返回按钮退出确定
    [Tags]    P0    threshold
    kwcollection.add_collection_without_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait And Click Element    ${locatorB_icon_back}
	Wait Alert Should Be Present And Accept    页面上有未保存内容，是否确定退出?
	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}

collection100
    [Documentation]    未保存点击返回按钮退出取消
    [Tags]    P0    threshold
    kwcollection.add_collection_without_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait And Click Element    ${locatorB_icon_back}
	Wait Alert Should Be Present And Dismiss    页面上有未保存内容，是否确定退出?
	Wait Until Page Contains Text    专辑预览

collection121
    [Documentation]    专辑名称输入混合（包括中英文，特殊符号，数字）字符
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}

collection123
    [Documentation]    专辑名称输入1-255个字符
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}

collection129
    [Documentation]    专辑描述输入混合（包括中英文，特殊符号，数字）字符
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait And Input Text    ${locatorB_collectionDetail_input_description}    description@123
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}

collection130
    [Documentation]    专辑描述输入1-255个字符
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait And Input Text    ${locatorB_collectionDetail_input_description}    description@123
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}

collection132
    [Documentation]    专辑封面格式JPG
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait Enabled And Choose File    ${locatorB_collectionDetail_input_addImage}    ${file_products_addImg}
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}
	Wait Until Page Contains Locator     ${locatorB_productsCollection_img_listCollectionThumbnails}[0]

# 暂时不写
#collection152
#    [Documentation]    删除商品
#    [Tags]    P0    threshold

collection181
    [Documentation]    未保存点击返回按钮退出
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait And Click Element    ${locatorB_icon_back}
	${alert_msg}    Handle Alert
	Should Be Equal     页面上有未保存内容，是否确定退出?    ${alert_msg}

collection182
    [Documentation]    未保存点击返回按钮退出确定
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait And Click Element    ${locatorB_icon_back}
	Wait Alert Should Be Present And Accept    页面上有未保存内容，是否确定退出?
	Wait Until Page Contains Text    暂无数据

collection183
    [Documentation]    未保存点击返回按钮退出确定
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    test@123
	Wait And Click Element    ${locatorB_icon_back}
	Wait Alert Should Be Present And Dismiss    页面上有未保存内容，是否确定退出?
	Wait Until Page Contains Text    新建专辑




