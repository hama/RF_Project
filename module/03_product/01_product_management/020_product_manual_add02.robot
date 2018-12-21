*** Settings ***
Documentation     手动添加商品测试
Suite Setup       Product Management Common Suite Setup
Suite Teardown    Product Management Common Suite Teardown
Test Setup        Product Management Case Setup Clear Evn
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/keywords/kw_common.robot


*** Test Cases ***
product179
    [Documentation]    款式设置选择'添加多个款式‘
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Some Style
    Element Attribute Should Contain With Wait    ${locatorB_productsNew_radio_moreStyle}    class    ant-radio ant-radio-checked
    Wait Until Page Contains Locator    ${locatorB_productsNew_input_needPicture}
    Wait Until Page Contains Locator    ${locatorB_productsNew_button_addStyle}

product180
    [Documentation]    款式设置选择'添加多个款式‘且勾选需要配图
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Some Style
    Select Need Picture
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    x1    0    x1\n
    Wait And Click Element     ${locatorB_productsNew_button_styleSure}[3]
    Wait Until Page Contains Locator    ${locatorB_productsNew_icon_AddstyleListPic}

product183
    [Documentation]    多款式-添加一个商品款式名称
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Some Style
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    color1    0    款式1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait Until Page Contains Text    color1

product184
    [Documentation]    多款式-添加两个商品款式名称
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Some Style
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    color1    0    款式1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    color2    1    款式2\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait Until Page Contains Text    color1
    Wait Until Page Contains Text    color2

product185
    [Documentation]    多款式-添加三个商品属性
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Some Style
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    color1    0    款式1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    color2    1    款式2\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    2    color3    2    款式3\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait Until Page Contains Text    color1
    Wait Until Page Contains Text    color2
    Wait Until Page Contains Text    color3

product188
    [Documentation]    多款式-添加一个属性单个款式
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Some Style
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    xx    0    yy\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait Until Page Contains Text    yy

product189
    [Documentation]    多款式-添加一个款式名称多个款式
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Some Style
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    xx    0    x1\ny1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait Until Page Contains Text    x1
    Wait Until Page Contains Text    y1

product190
    [Documentation]    多款式-添加多个属性多个款式
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Some Style
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    xxx    0    x1\ny1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    xxxx    1    a1\nb1\nc1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait Until Page Contains Text    x1
    Wait Until Page Contains Text    y1
    Wait Until Page Contains Text    a1
    Wait Until Page Contains Text    b1
    Wait Until Page Contains Text    c1

product197
    [Documentation]    多款式-添加‘独立款式’
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Some Style
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    x1    0    x1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    a1    1    a1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait And Click Element    ${locatorB_productsNew_button_IndependentStyle}
    Wait And Input Text    ${locatorB_productsNew_input_StyleContent}[0]    x1修改\n
    Wait And Input Text    ${locatorB_productsNew_input_StyleContent}[1]    a1修改\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[2]
    Wait Until Page Contains Text    x1修改
    Wait Until Page Contains Text    a1修改

product200
    [Documentation]    多款式-修改款式
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Some Style
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    x1    0    x1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    a1    1    a1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait And Click Element    ${locatorB_productsNew_button_changeStyle}
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    2    c1    2    c1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[2]
    Wait Until Page Contains Text    x1
    Wait Until Page Contains Text    a1
    Wait Until Page Contains Text    c1

product203
    [Documentation]    多款式-批量删除全部款式
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Some Style
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    x1    0    x1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    a1    1    a1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    sleep    10
    ${class}    Wait And Get Element Attribute    ${locatorB_productsNew_checkbox_AllStyle}    class
    Run Keyword If    $class=='ant-checkbox'    Wait And Click Element    ${locatorB_productsNew_checkbox_AllStyle}
    Wait And Click Element     ${locatorB_productsNew_button_batchDelete}
    Wait Until Page Contains Locator    ${locatorB_productsNew_button_addStyle}

product204
    [Documentation]    多款式-点击‘批量修改’
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Follow Stock
    Select Add Some Style
    Select Need Picture
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    x1    0    x1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    a1    1    a1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    ${class}    Wait And Get Element Attribute    ${locatorB_productsNew_checkbox_AllStyle}    class
    Run Keyword If    $class=='ant-checkbox'    Wait And Click Element    ${locatorB_productsNew_checkbox_AllStyle}
    Wait And Click Element     ${locatorB_productsNew_button_batchEdit}
    Wait Until Page Contains Text    已选中1个SKU
    Wait Until Page Contains Text    售价
    Wait Until Page Contains Text    原价
    Wait Until Page Contains Text    重量

product208
    [Documentation]    多款式-批量修改全部款式
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Follow Stock
    Select Add Some Style
    Select Need Picture
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    x1    0    x1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    a1    1    a1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait Enabled And Choose File    ${locatorB_productsNew_input_imageUp}    ${file_products_addImg}
    Wait And Click Element    ${locatorB_productsNew_checkbox_AllStyle}
    Wait And Click Element    ${locatorB_productsNew_button_batchEdit}
    Wait And Input Text    ${locatorB_productsNew_input_styleEditPrice}    120
    Wait And Input Text    ${locatorB_productsNew_input_styleEditComparePrice}    124
    Wait And Input Text    ${locatorB_productsNew_input_styleEditWeight}    2
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[2]
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_salePrice}    120
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_rawPrice}    124

product210
    [Documentation]    多款式-批量修改弹框点击’上传‘图片
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Some Style
    Select Need Picture
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    x1    0    x1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    a1    1    a1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    ${class}    Wait And Get Element Attribute    ${locatorB_productsNew_checkbox_AllStyle}    class
    Run Keyword If    $class=='ant-checkbox'    Wait And Click Element    ${locatorB_productsNew_checkbox_AllStyle}
    Wait And Click Element     ${locatorB_productsNew_button_batchEdit}
    Wait And Click Element    ${locatorB_productsNew_image_StylePic}
    Wait And Click Element    ${locatorB_productsNew_button_PictureUp}

product213
    [Documentation]    多款式-已上传图片时子产品列表点击添加图片按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Wait Enabled And Choose File    ${locatorB_productsNew_input_imageUp}    ${file_products_addImg}
    Select Add Some Style
    Select Need Picture
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    x1    0    x1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    a1    1    a1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait And Click Element    ${locatorB_productsNew_icon_AddstyleListPic}
    Wait And Click Element    ${locatorB_productsNew_popUp_styleListPic}

product216
    [Documentation]    商品列表-已存在商品时‘全部’商品展示
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    kwproduct.add_min_product_py
    kwproduct.add_min_product_py
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsMgmt_tab_ProductAll}
    ${productNum}=    kwproduct.get_all_products_count_py
    Should Be True    ${productNum}==${4}

product218
    [Documentation]    商品列表-存在上架商品时‘上架’商品展示
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    kwproduct.add_max_product_py
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsMgmt_tab_ProductOn}
    ${productNum}=    kwproduct.get_all_products_count_py
    Should Be True    ${productNum}==${3}

product220
    [Documentation]    商品列表-存在下架商品时‘下架’商品展示
    [Tags]    P0    threshold
    kwproduct.add_min_product_py
    kwproduct.add_min_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsMgmt_tab_ProductDown}
    ${productNum}=    kwproduct.get_all_products_count_py
    Should Be True    ${productNum}==${2}

product222
    [Documentation]    商品列表-批量删除当前页全部商品
    [Tags]    P0    threshold
    kwproduct.add_min_product_py
    kwproduct.add_min_product_py
    kwproduct.add_min_product_py
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsMgmt_checkbox_chooseProducets}
    Sleep    5
    Wait And Click Element Then Confirm    ${locatorB_productsMgmt_button_BatchDelete}
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_button_addSomePro}

products0225
    [Documentation]    商品列表-批量上架当前页全部商品
    [Tags]    P0
    kwproduct.add_min_product_py
    kwproduct.add_min_product_py
    kwproduct.add_min_product_py
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsMgmt_checkbox_chooseProducets}
    Sleep    5
    Wait And Click Element Then Confirm    ${locatorB_productsMgmt_button_BatchOn}
    Reload Page And Start Ajax
    Element Attribute Should Be Equal With Wait    ${locatorB_productsMgmt_button_ProductUpDown}    class    ant-switch ant-switch-checked

product229
    [Documentation]    商品列表-批量下架当前页全部商品
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsMgmt_checkbox_chooseProducets}
    Sleep    5
	Wait And Click Element Then Confirm    ${locatorB_productsMgmt_button_BatchDown}
	Reload Page And Start Ajax
	Element Attribute Should Be Equal With Wait    ${locatorB_productsMgmt_button_ProductUpDown}    class    ant-switch

product234
    [Documentation]    商品列表商品展示
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_checkbox_chooseProducets}
    Wait Until Page Contains Text    操作
    Wait Until Page Contains Text    商品图片
    Wait Until Page Contains Text    商品名称
    Wait Until Page Contains Text    售价
    Wait Until Page Contains Text    原价
    Wait Until Page Contains Text    库存
    Wait Until Page Contains Text    SKU
    Wait Until Page Contains Text    是否上架
    Wait Until Page Contains Text    所属专辑
    Wait Until Page Contains Text    最后修改时间

product235
    [Documentation]    商品列表-点击商品主图
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsMgmt_image_firstProductImage}
    Wait Until Page Contains Text    基本信息
    Wait Until Page Contains Text    基本属性

product237
    [Documentation]    商品列表-点击商品名称
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsMgmt_text_firstProductName}
    Wait Until Page Contains Text    基本信息
    Wait Until Page Contains Text    基本属性

product238
    [Documentation]    商品列表-点击预览icon
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    ${productTitle}    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductName}
    Wait And Click Element    ${locatorB_productsMgmt_icon_firstpreview}
    Wait Until Page Contains Text    ${productTitle}

product239
    [Documentation]    商品列表-点击删除icon
    [Tags]    P0    threshold
    kwproduct.add_min_product_py
    Reload Page And Start Ajax
    Sleep    5
    Wait And Click Element Then Confirm    ${locatorB_productsMgmt_icon_firstdelete}
    Reload Page And Start Ajax
    Wait Until Page Contains Text    新建并上架你的商品
    Wait Until Page Contains Text    新建并上架你的第一件商品，上架完你的优质商品后，用户才可以在你的网站上进行购物。
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_button_addSomePro}

product260
    [Documentation]    商品列表-上架商品
    [Tags]    P0    threshold
    kwproduct.add_min_product_py
    Reload Page And Start Ajax
    Wait And Click Element Then Confirm    ${locatorB_productsMgmt_button_ProductUpDown}[0]
    Reload Page And Start Ajax
    Element Attribute Should Be Equal With Wait    ${locatorB_productsMgmt_button_ProductUpDown}[0]    class    ant-switch ant-switch-checked

product261
    [Documentation]    商品列表-下架商品
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Wait And Click Element Then Confirm    ${locatorB_productsMgmt_button_ProductUpDown}[0]
    Reload Page And Start Ajax
    Element Attribute Should Be Equal With Wait    ${locatorB_productsMgmt_button_ProductUpDown}[0]    class    ant-switch

products269
    [Documentation]    商品列表-修改商品所属专辑
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Click Element    ${locatorB_productsNew_span_SelectCollection}
    Sleep    5
    Wait And Click Element    ${locatorB_productsNew_button_newCollection}
    Wait And Input Text    ${locatorB_productsNew_input_newCollectionName}    xinjianshanpinzhuanji
    Wait And Click Element    ${locatorB_productsNew_button_addCollectionSave}
    Wait Until Page Contains Text    xinjianshanpinzhuanji

product270
    [Documentation]    全部-输入内容进行搜索
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    kwproduct.add_min_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsMgmt_tab_ProductAll}
    ${firstproName}=    Wait And Get Text    ${locatorB_productsMgmt_text_firstProductName}
    Wait And Input Text    ${locatorB_productsMgmt_input_ProductSelect}    ${firstproName}
    Wait And Click Element    ${locatorB_productsMgmt_button_ProductSelect}
    Text Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_text_firstProductName}    ${firstproName}

product272
    [Documentation]    多款式批量修改商品售价
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Follow Stock
    Select Add Some Style
    Select Need Picture
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    x1    0    x1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    a1    1    a1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait And Click Element    ${locatorB_productsNew_checkbox_AllStyle}
    Wait And Click Element    ${locatorB_productsNew_button_batchEdit}
    Wait And Input Text    ${locatorB_productsNew_input_styleEditPrice}    120
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[2]
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_salePrice}    120

product273
    [Documentation]    多款式批量修改商品原价
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Follow Stock
    Select Add Some Style
    Select Need Picture
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    x1    0    x1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    a1    1    a1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait And Click Element    ${locatorB_productsNew_checkbox_AllStyle}
    Wait And Click Element    ${locatorB_productsNew_button_batchEdit}
    Wait And Input Text    ${locatorB_productsNew_input_styleEditComparePrice}    120
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[2]
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_rawPrice}    120

product275
    [Documentation]    多款式批量修改重量
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Follow Stock
    Select Add Some Style
    Select Need Picture
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    x1    0    x1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    a1    1    a1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait And Click Element    ${locatorB_productsNew_checkbox_AllStyle}
    Wait And Click Element    ${locatorB_productsNew_button_batchEdit}
    Wait And Input Text    ${locatorB_productsNew_input_styleEditWeight}    2
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[2]
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_weight}    2

product276
    [Documentation]    多款式批量修改库存
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Follow Stock
    Select Add Some Style
    Select Need Picture
    Wait And Click Element    ${locatorB_productsNew_button_addStyle}
    Add One Product Style    0    x1    0    x1\n
    Wait And Click Element    ${locatorB_productsNew_button_productAttribute}
    Add One Product Style    1    a1    1    a1\n
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[3]
    Wait And Click Element    ${locatorB_productsNew_checkbox_AllStyle}
    Wait And Click Element    ${locatorB_productsNew_button_batchEdit}
    Wait And Input Text    ${locatorB_productsNew_input_styleEditQuantity}    124
    sleep    5
    Wait And Click Element    ${locatorB_productsNew_button_styleSure}[2]
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_stock}    124

#图片上传无法实现，原因未知
#product279
#    [Documentation]    新建一个填写了所有必填项和非必填项的商品
#    [Tags]    P0    threshold
#    kwcollection.add_collection_with_pic_py
#    Reload Page And Start Ajax
#    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
#    Fill All Items When Create Product
#    Sleep    5
#    Wait And Click Element    ${locatorB_productsNew_button_save}
#    Sleep    5
#    Wait And Click Element    ${locatorB_productsNew_button_productList}
#    Reload Page And Start Ajax
#    Wait Until Page Contains Locator    ${locatorB_productsMgmt_list_firstProduct}

