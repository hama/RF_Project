*** Settings ***
Documentation     手动添加商品测试
Suite Setup       Product Collection Suite Setup
Suite Teardown    Product Collection Suite Teardown
Test Setup        Product Collection Case Setup
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/keywords/kw_common.robot


*** Test Cases ***
collection014
    [Documentation]    列表单个删除点击取消
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element Then Cancel    ${locatorB_productsCollection_icon_listDel}[0]
    Wait Until Page Contains Locator    ${locatorB_productsCollection_text_collectiontbody}

collection017
    [Documentation]    列表批量删除点击取消
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait Exist And Click Element    ${locatorB_productsCollection_checkbox_chooseCategories}
    Wait And Click Element Then Cancel    ${locatorB_productsCollection_button_delProducts}
    Wait Until Page Contains Locator    ${locatorB_productsCollection_text_collectiontbody}

collection019
    [Documentation]    专辑名称输入中文字符
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait And Input Text    ${locatorB_collectionDetail_input_title}    商品专辑一
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text     修改成功
    Go To Product Collection Page
    Text Of Element Should Contain With Wait     ${locatorB_productsCollection_text_collectiontbody_td}    商品专辑一

collection020
    [Documentation]    专辑名称输入英文字符
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait And Input Text    ${locatorB_collectionDetail_input_title}    productShoe
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text     修改成功
    Go To Product Collection Page
    Text Of Element Should Contain With Wait     ${locatorB_productsCollection_text_collectiontbody_td}    productShoe

collection021
    [Documentation]    专辑名称输入特殊符号字符
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait And Input Text    ${locatorB_collectionDetail_input_title}    !@#$$%%^^&&**(((&&*>
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text     修改成功
    Go To Product Collection Page
    Text Of Element Should Contain With Wait     ${locatorB_productsCollection_text_collectiontbody_td}    !@#$$%%^^&&**(((&&*>

collection022
    [Documentation]    专辑名称输入数字字符
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait And Input Text    ${locatorB_collectionDetail_input_title}    1234567890875546
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text     修改成功
    Go To Product Collection Page
    Text Of Element Should Contain With Wait     ${locatorB_productsCollection_text_collectiontbody_td}    1234567890875546

collection026
    [Documentation]    专辑名称输入50以上个字
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait And Input Text    ${locatorB_collectionDetail_input_title}    专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑，多余字数
    Set Focus To Element    ${locatorB_collectionDetail_input_title}
    ${titleText}    Get Value    ${locatorB_collectionDetail_input_title}
    ${titleLen}    Get Length    ${titleText}
    Should Be True    ${titleLen}==50
#    Text Of Element Should Be Equal With Wait    ${locatorB_collectionDetail_input_title}    专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑多余字数

collection027
    [Documentation]    专辑描述输入中文字符
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait And Input Text    ${locatorB_collectionDetail_input_description}    商品专辑一
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text     修改成功
    Go To Product Collection Page
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Text Of Element Should Contain With Wait     ${locatorB_collectionDetail_input_description}    商品专辑一

collection028
    [Documentation]    专辑描述输入英文字符
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait And Input Text    ${locatorB_collectionDetail_input_description}    productshoeOne
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text     修改成功
    Go To Product Collection Page
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Text Of Element Should Contain With Wait     ${locatorB_collectionDetail_input_description}    productshoeOne

collection029
    [Documentation]    专辑描述输入特殊符号字符
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait And Input Text    ${locatorB_collectionDetail_input_description}    %^$^&%$&%$^$##@^&*^%
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text     修改成功
    Go To Product Collection Page
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Text Of Element Should Contain With Wait     ${locatorB_collectionDetail_input_description}    %^$^&%$&%$^$##@^&*^%

collection030
    [Documentation]    专辑描述输入数字字符
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait And Input Text    ${locatorB_collectionDetail_input_description}    3267453267485237
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text     修改成功
    Go To Product Collection Page
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Text Of Element Should Contain With Wait     ${locatorB_collectionDetail_input_description}    3267453267485237

collection033
    [Documentation]    专辑描述输入256以上个字符
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait And Input Text    ${locatorB_collectionDetail_input_description}     专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑专辑nam多余字数部分%……¥&……%
    ${descriptionText}    Get Text    ${locatorB_collectionDetail_input_description}
    ${descriptionLen}    Get Length    ${descriptionText}
    Should Be True    ${descriptionLen}==255

collection035
    [Documentation]    专辑封面格式JPEG
    [Tags]    P0
    kwcollection.add_collection_without_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait Enabled And Choose File    ${locatorB_collectionDetail_input_addImage}    ${file_products_addImg3}
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text     修改成功
    Go To Product Collection Page
#    Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}
    sleep    4
    Wait Until Page Contains Locator     ${locatorB_productsCollection_img_listCollectionThumbnails}[0]

collection036
    [Documentation]    专辑封面格式GIF
    [Tags]    P0
    kwcollection.add_collection_without_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait Enabled And Choose File    ${locatorB_collectionDetail_input_addImage}    ${file_products_addImg4}
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text     修改成功
    Go To Product Collection Page
#    Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}
    Wait Until Page Contains Locator     ${locatorB_productsCollection_img_listCollectionThumbnails}[0]

collection037
    [Documentation]    专辑封面格式PNG
    [Tags]    P0
    kwcollection.add_collection_without_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Wait Enabled And Choose File    ${locatorB_collectionDetail_input_addImage}    ${file_products_addImg5}
    Wait And Click Element    ${locatorB_button_save}
    Wait Until Page Contains Text     修改成功
    Go To Product Collection Page
#    Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}
    Wait Until Page Contains Locator     ${locatorB_productsCollection_img_listCollectionThumbnails}[0]

collection117
    [Documentation]    专辑名称输入中文字符
    [Tags]    P0
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    商品专辑 衣饰系列
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
	Text Of Element Should Contain With Wait     ${locatorB_productsCollection_text_collectiontbody_td}    商品专辑 衣饰系列

collection118
    [Documentation]    专辑名称输入英文字符
    [Tags]    P0
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    productCollection shirtOfStyle
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
	Text Of Element Should Contain With Wait     ${locatorB_productsCollection_text_collectiontbody_td}    productCollection shirtOfStyle

collection119
    [Documentation]    专辑名称输入特殊符号字符
    [Tags]    P0
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    ！@#¥%¥……¥%&……%%&……¥……%¥
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
	Text Of Element Should Contain With Wait     ${locatorB_productsCollection_text_collectiontbody_td}    ！@#¥%¥……¥%&……%%&……¥……%¥

collection120
    [Documentation]    专辑名称输入数字字符
    [Tags]    P0
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    1235247561243651234
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
	Text Of Element Should Contain With Wait     ${locatorB_productsCollection_text_collectiontbody_td}    1235247561243651234

collection124
    [Documentation]    专辑名称输入256以上个字符（50以上个字）
    [Tags]    P0
    Wait And Click Element    ${locatorB_button_add}
    Wait And Input Text    ${locatorB_collectionDetail_input_title}    专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑，多余字数
    Set Focus To Element    ${locatorB_collectionDetail_input_title}
    ${titleText}    Get Value    ${locatorB_collectionDetail_input_title}
    ${titleLen}    Get Length    ${titleText}
    Should Be True    ${titleLen}==50

collection125
    [Documentation]    专辑描述输入中文字符
    [Tags]    P0
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    商品专辑名称
	Wait And Input Text    ${locatorB_collectionDetail_input_description}    商品专辑一描述
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Text Of Element Should Contain With Wait     ${locatorB_collectionDetail_input_description}    商品专辑一描述

collection126
    [Documentation]    专辑描述输入英文字符
    [Tags]    P0
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    商品专辑英文名称
	Wait And Input Text    ${locatorB_collectionDetail_input_description}    YFYHGFHGFHGFhk
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Text Of Element Should Contain With Wait     ${locatorB_collectionDetail_input_description}    YFYHGFHGFHGFhk

collection127
    [Documentation]    专辑描述输入特殊符号字符
    [Tags]    P0
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    商品专辑特殊符号名称
	Wait And Input Text    ${locatorB_collectionDetail_input_description}    ¥@#¥……%¥……%¥……%¥……
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Text Of Element Should Contain With Wait     ${locatorB_collectionDetail_input_description}    ¥@#¥……%¥……%¥……%¥……

collection128
    [Documentation]    专辑描述输入数字字符
    [Tags]    P0
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    商品专辑数字符号名称
	Wait And Input Text    ${locatorB_collectionDetail_input_description}    34656721531627835
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
    Wait And Click Element    ${locatorB_productsCollection_img_listCollectionThumbnails}[0]
    Text Of Element Should Contain With Wait     ${locatorB_collectionDetail_input_description}    34656721531627835

collection131
    [Documentation]    专辑描述输入256以上个字符
    [Tags]    P0
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    商品专辑名称
	Wait And Input Text    ${locatorB_collectionDetail_input_description}     专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑name专辑专辑nam多余字数部分%……¥&……%
    ${descriptionText}    Get Text    ${locatorB_collectionDetail_input_description}
    ${descriptionLen}    Get Length    ${descriptionText}
    Should Be True    ${descriptionLen}==255

collection133
    [Documentation]    专辑封面格式JPEG
    [Tags]    P0
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    商品专辑名称
	Wait Enabled And Choose File    ${locatorB_collectionDetail_input_addImage}    ${file_products_addImg3}
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
#	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}
	Wait Until Page Contains Locator     ${locatorB_productsCollection_img_listCollectionThumbnails}[0]

collection134
    [Documentation]    专辑封面格式GIF
    [Tags]    P0
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    商品专辑名称
	Wait Enabled And Choose File    ${locatorB_collectionDetail_input_addImage}    ${file_products_addImg4}
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
#	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}
	Wait Until Page Contains Locator     ${locatorB_productsCollection_img_listCollectionThumbnails}[0]

collection135
    [Documentation]    专辑封面格式PNG
    [Tags]    P0
    Wait And Click Element    ${locatorB_button_add}
	Wait And Input Text    ${locatorB_collectionDetail_input_title}    商品专辑名称
	Wait Enabled And Choose File    ${locatorB_collectionDetail_input_addImage}    ${file_products_addImg5}
	Wait And Click Element    ${locatorB_button_save}
	Wait Until Page Contains Text     添加成功
#	Wait Until Page Contains Locator     ${locatorB_productsCollection_text_firstCollectionNum}
	Wait Until Page Contains Locator     ${locatorB_productsCollection_img_listCollectionThumbnails}[0]

collection199
    [Documentation]    输入关键字为名称，点击搜索/按enter
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Set Selenium Implicit Wait    2
    ${listContent}    Get Text    ${locatorB_productsCollection_text_collectiontbody_td}
#    log to console    ${listContent}
#    ${listContentNum}    Evaluate    ${listContent[1:]}
    Wait And Input Text    ${locatorB_productsCollection_input_search}    商品专辑001\n
    Set Selenium Implicit Wait    2
    Wait Until Page Not Contains Locator    ${locatorB_productsCollection_text_collectiontbody}
    Clear Element Text    ${locatorB_productsCollection_input_search}
    Set Selenium Implicit Wait    2
    Wait And Input Text    ${locatorB_productsCollection_input_search}    ${listContent}\n
    Set Selenium Implicit Wait    2
    Wait Until Page Contains Locator    ${locatorB_productsCollection_text_collectiontbody}

collection200
    [Documentation]    输入关键字为编号，点击搜索/按enter
    [Tags]    P0
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Set Selenium Implicit Wait    2
    ${listContent}    Get Text    ${locatorB_productsCollection_text_firstCollectionNum}
    ${listContentNum}    Evaluate    ${listContent[1:]}
    Wait And Input Text    ${locatorB_productsCollection_input_search}    1234\n
    Set Selenium Implicit Wait    2
    Wait Until Page Not Contains Locator    ${locatorB_productsCollection_text_collectiontbody}
    Clear Element Text    ${locatorB_productsCollection_input_search}
    Set Selenium Implicit Wait    2
    Wait And Input Text    ${locatorB_productsCollection_input_search}    ${listContentNum}\n
    Set Selenium Implicit Wait    2
    Wait Until Page Contains Locator    ${locatorB_productsCollection_text_collectiontbody}
