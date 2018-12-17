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
    Wait Until Page Contains Text    商品专辑
    Wait Until Page Contains Locator    ${locatorB_CollectionsMgmt_button_addOneCollection}

collection007
    [Documentation]    hover预览图标
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Mouse Over    ${locatorB_CollectionsMgmt_icon_firstPreview}
    Wait Until Page Contains Text    预览

collection008
    [Documentation]    从专辑列表进入C端专辑详情页面
    [Tags]    P1    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Sleep    5
    ${collectionName}=    Wait And Get Text    ${locatorB_CollectionsMgmt_text_firstCollectionName}
    Wait And Click Element    ${locatorB_CollectionsMgmt_icon_firstPreview}
    Focus On New Window
    Wait Until Page Contains Text    ${collectionName}

collection009
    [Documentation]    hover删除图标
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Mouse Over    ${locatorB_CollectionsMgmt_icon_firstDelete}
    Wait Until Page Contains Text    删除

collection010
    [Documentation]    列表单个删除
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_CollectionsMgmt_icon_firstDelete}
    Wait Until Page Contains Text    确定删除该专辑？
    Wait Until Page Contains Text    删除后将不能找回, 请慎重操作!

collection011
    [Documentation]    列表单个删除点击确定
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element Then Confirm    ${locatorB_CollectionsMgmt_icon_firstDelete}
    Wait Until Page Contains Locator    ${locatorB_CollectionsMgmt_button_addOneCollection}

collection017
    [Documentation]    专辑名称输入混合（包括中英文，特殊符号，数字）字符
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_CollectionsMgmt_image_firstPicture}
    Sleep    3
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    ${Empty}
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    中文english$%*&(123
    Value Of Element Should Be Equal With Wait    ${locatorB_CollectionsNew_inoput_CollectionName}    中文english$%*&(123
    Wait And Click Element    ${locatorB_CollectionsNew_button_CollectionSave}
    Wait Until Page Not Contains Locator    ${locatorB_CollectionsNew_button_CollectionSave}
    Reload Page And Start Ajax
    Text Of Element Should Be Equal With Wait    ${locatorB_CollectionsMgmt_text_firstCollectionName}    中文english$%*&(123

collection019
    [Documentation]    专辑名称输入1-50个字符
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_CollectionsMgmt_image_firstPicture}
    Sleep    3
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    ${Empty}
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    中文字符123456中文字符123456中文字符123456
    Value Of Element Should Be Equal With Wait    ${locatorB_CollectionsNew_inoput_CollectionName}    中文字符123456中文字符123456中文字符123456
    Wait And Click Element    ${locatorB_CollectionsNew_button_CollectionSave}
    Wait Until Page Not Contains Locator    ${locatorB_CollectionsNew_button_CollectionSave}
    Reload Page And Start Ajax
    Text Of Element Should Be Equal With Wait    ${locatorB_CollectionsMgmt_text_firstCollectionName}    中文字符123456中文字符123456中文字符123456

collection025
    [Documentation]    专辑描述输入混合（包括中英文，特殊符号，数字）字符
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_CollectionsMgmt_image_firstPicture}
    Sleep    3
    Wait And Input Text    ${locatorB_CollectionsNew_textarea_CollectionDesc}    ${Empty}
    Wait And Input Text    ${locatorB_CollectionsNew_textarea_CollectionDesc}    中文english$%*&(123
    Text Of Element Should Be Equal With Wait    ${locatorB_CollectionsNew_textarea_CollectionDesc}    中文english$%*&(123
    Wait And Click Element    ${locatorB_CollectionsNew_button_CollectionSave}
    Wait Until Page Not Contains Locator    ${locatorB_CollectionsNew_button_CollectionSave}
    Reload Page And Start Ajax
    Text Of Element Should Be Equal With Wait    ${locatorB_CollectionsMgmt_text_firstCollectionDesc}    中文english$%*&(123

collection026
    [Documentation]    专辑描述输入1-200个字符
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_CollectionsMgmt_image_firstPicture}
    Sleep    3
    Wait And Input Text    ${locatorB_CollectionsNew_textarea_CollectionDesc}    ${Empty}
    Wait And Input Text    ${locatorB_CollectionsNew_textarea_CollectionDesc}    中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456
    Text Of Element Should Be Equal With Wait    ${locatorB_CollectionsNew_textarea_CollectionDesc}    中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456
    Wait And Click Element    ${locatorB_CollectionsNew_button_CollectionSave}
    Wait Until Page Not Contains Locator    ${locatorB_CollectionsNew_button_CollectionSave}
    Reload Page And Start Ajax
    Text Of Element Should Be Equal With Wait    ${locatorB_CollectionsMgmt_text_firstCollectionDesc}    中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456

#collection028
#    [Documentation]    专辑封面格式JPG
#    [Tags]    P0    threshold
#    kwcollection.add_collection_without_pic_py
#    Reload Page And Start Ajax
#    Wait And Click Element    ${locatorB_CollectionsMgmt_image_firstPicture}
#    Sleep    5
#    Wait Enabled And Choose File    ${locatorB_CollectionsNew_input_CollectionPicture}    ${file_products_addImg}
#    Sleep    5
#    Wait Until Page Contains Locator    ${locatorB_CollectionsNew_image_existPicture}

collection046
    [Documentation]    删除商品
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_CollectionsMgmt_image_firstPicture}
    Wait And Click Element Then Confirm    ${locatorB_CollectionsEdit_button_deleteCollection}
    Wait Until Page Contains Locator    ${locatorB_CollectionsMgmt_button_addOneCollection}

collection079
    [Documentation]    未保存点击返回按钮退出
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_CollectionsMgmt_image_firstPicture}
    Sleep    3
    Wait And Input Text    ${locatorB_CollectionsNew_textarea_CollectionDesc}    ${Empty}
    Wait And Input Text    ${locatorB_CollectionsNew_textarea_CollectionDesc}    中文english$%*&(123
    Wait And Click Element    ${locatorB_CollectionsNew_icon_Collectionlist}
    Wait Alert Should Be Present And Accept    页面上有未保存内容，是否确定退出?

collection080
    [Documentation]    未保存点击返回按钮退出确定
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Sleep    5
    ${collectionName}=    Wait And Get Text    ${locatorB_CollectionsMgmt_text_firstCollectionName}
    Wait And Click Element    ${locatorB_CollectionsMgmt_image_firstPicture}
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    ${Empty}
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    中文english$%*&(123
    Wait And Click Element    ${locatorB_CollectionsNew_icon_Collectionlist}
    Wait Alert Should Be Present And Accept    页面上有未保存内容，是否确定退出?
    Text Of Element Should Be Equal With Wait    ${locatorB_CollectionsMgmt_text_firstCollectionName}    ${collectionName}

collection081
    [Documentation]    未保存点击返回按钮退出取消
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_CollectionsMgmt_image_firstPicture}
    Sleep    3
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    ${Empty}
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    中文english$%*&(123
    Wait And Click Element    ${locatorB_CollectionsNew_icon_Collectionlist}
    Wait Alert Should Be Present And Dismiss    页面上有未保存内容，是否确定退出?
    Value Of Element Should Be Equal With Wait    ${locatorB_CollectionsNew_inoput_CollectionName}    中文english$%*&(123
    Wait Until Page Contains Text    专辑详情

collection097
    [Documentation]    从专辑详情进入C端专辑详情页面
    [Tags]    P1    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_CollectionsMgmt_image_firstPicture}
    Sleep    5
    ${collectionName}=    Wait And Get Value    ${locatorB_CollectionsNew_inoput_CollectionName}
    Wait And Click Element    ${locatorB_CollectionsNew_icon_CollectionPreview}
    Focus On New Window
    Wait Until Page Contains Text    ${collectionName}

collection105
    [Documentation]    专辑名称输入混合（包括中英文，特殊符号，数字）字符
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_CollectionsMgmt_button_addOneCollection}
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    中文english$%*&(123
    Wait And Click Element    ${locatorB_CollectionsNew_button_CollectionSave}
    Wait Until Page Not Contains Locator    ${locatorB_CollectionsNew_button_CollectionSave}
    Reload Page And Start Ajax
    Text Of Element Should Be Equal With Wait    ${locatorB_CollectionsMgmt_text_firstCollectionName}    中文english$%*&(123

collection107
    [Documentation]    专辑名称输入1-50个字符
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_CollectionsMgmt_button_addOneCollection}
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    中文字符123456中文字符123456中文字符123456
    Wait And Click Element    ${locatorB_CollectionsNew_button_CollectionSave}
    Wait Until Page Not Contains Locator    ${locatorB_CollectionsNew_button_CollectionSave}
    Reload Page And Start Ajax
    Text Of Element Should Be Equal With Wait    ${locatorB_CollectionsMgmt_text_firstCollectionName}    中文字符123456中文字符123456中文字符123456

collection113
    [Documentation]    专辑描述输入混合（包括中英文，特殊符号，数字）字符
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_CollectionsMgmt_button_addOneCollection}
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    测试专辑描述
    Wait And Input Text    ${locatorB_CollectionsNew_textarea_CollectionDesc}    中文english$%*&(123
    Wait And Click Element    ${locatorB_CollectionsNew_button_CollectionSave}
    Wait Until Page Not Contains Locator    ${locatorB_CollectionsNew_button_CollectionSave}
    Reload Page And Start Ajax
    Text Of Element Should Be Equal With Wait    ${locatorB_CollectionsMgmt_text_firstCollectionDesc}    中文english$%*&(123

collection114
    [Documentation]    专辑描述输入1-200个字符
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_CollectionsMgmt_button_addOneCollection}
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    测试专辑描述长度
    Wait And Input Text    ${locatorB_CollectionsNew_textarea_CollectionDesc}    中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456
    Wait And Click Element    ${locatorB_CollectionsNew_button_CollectionSave}
    Wait Until Page Not Contains Locator    ${locatorB_CollectionsNew_button_CollectionSave}
    Reload Page And Start Ajax
    Text Of Element Should Be Equal With Wait    ${locatorB_CollectionsMgmt_text_firstCollectionDesc}    中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456中文字符123456

collection134
    [Documentation]    删除商品
    [Tags]    P0    threshold
    :FOR    ${ONE}    IN RANGE    4
    \    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_CollectionsMgmt_button_addOneCollection}
    Sleep    3
    Wait And Click Element    ${locatorB_CollectionsNew_button_addProduct}
    Wait And Click Element    ${locatorB_CollectionsNew_checkbox_firstProduct}
    Wait And Click Element    ${locatorB_CollectionsNew_button_Productaddfoot}
    Wait And Mouse Over    ${locatorB_CollectionsNew_image_ProductImage}
    Wait And Click Element    ${locatorB_CollectionsNew_icon_ProductDelete}
    Wait Until Page Not Contains Locator    ${locatorB_CollectionsNew_image_ProductImage}

collection162
    [Documentation]    未保存点击返回按钮退出
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_CollectionsMgmt_button_addOneCollection}
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    中文english$%*&(123
    Wait And Click Element    ${locatorB_CollectionsNew_icon_Collectionlist}
    Wait Alert Should Be Present And Accept    页面上有未保存内容，是否确定退出?

collection163
    [Documentation]    未保存点击返回按钮退出确定
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_CollectionsMgmt_button_addOneCollection}
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    中文english$%*&(123
    Wait And Click Element    ${locatorB_CollectionsNew_icon_Collectionlist}
    Wait Alert Should Be Present And Accept    页面上有未保存内容，是否确定退出?
    Wait Until Page Contains Locator    ${locatorB_CollectionsMgmt_button_addOneCollection}

collection164
    [Documentation]    未保存点击返回按钮退出取消
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_CollectionsMgmt_button_addOneCollection}
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    中文english$%*&(123
    Wait And Click Element    ${locatorB_CollectionsNew_icon_Collectionlist}
    Wait Alert Should Be Present And Dismiss    页面上有未保存内容，是否确定退出?
    Value Of Element Should Be Equal With Wait    ${locatorB_CollectionsNew_inoput_CollectionName}    中文english$%*&(123
    Wait Until Page Contains Text    专辑详情

collection180
    [Documentation]    新建专辑名称与已存在专辑名称相同
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Sleep    5
    ${collectionName}=    Wait And Get Text    ${locatorB_CollectionsMgmt_text_firstCollectionName}
    Wait And Click Element    ${locatorB_CollectionsMgmt_button_newCollection}
    Wait And Input Text    ${locatorB_CollectionsNew_inoput_CollectionName}    ${collectionName}
    Wait And Click Element    ${locatorB_CollectionsNew_button_CollectionSave}
    Wait Until Page Contains Text    Title已经被使用