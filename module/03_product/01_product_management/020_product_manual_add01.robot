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
    [Documentation]    商品管理页点击‘添加商品’按钮
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait Until Page Contains Text    新建商品
    Wait Until Page Contains Locator    ${locatorB_productsNew_input_title}

products005
    [Documentation]    进入已添加商品的商品管理页面
    [Tags]    P0    threshold
    kwproduct.add_max_product_py
    Reload Page And Start Ajax
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_button_addNewProduct}
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_tab_ProductAll}
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_tab_ProductOn}
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_tab_ProductDown}
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_input_ProductSelect}
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_button_ProductSelect}
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_button_SelectReset}
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_list_firstProduct}

product006
    [Documentation]  新建商品页面展示(展示返回商品管理，下一步按钮，商品标题输入框，商品副标题输入框，富文本框，基本属性，专辑，标签，供应商，SEO)
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait Until Page Contains Locator    ${locatorB_productsNew_button_productList}
    Wait Until Page Contains Locator    ${locatorB_productsNew_button_NextStep}
    Wait Until Page Contains Locator    ${locatorB_productsNew_input_title}
    Wait Until Page Contains Locator    ${locatorB_productsNew_input_subTitle}
    Wait Until Page Contains Locator    ${locatorB_productsNew_iframe_desc}
    Wait Until Page Contains Text    基本属性
    Wait Until Page Contains Locator    ${locatorB_productsNew_span_SelectCollection}
    Wait Until Page Contains Locator    ${locatorB_productsNew_input_tags}
    Wait Until Page Contains Locator    ${locatorB_productsNew_input_supplier}
    Wait Until Page Contains Text    SEO

product007
    [Documentation]    新建一个商品
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Fill In Required Items When Create Product
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Sleep And Click Element    ${locatorB_productsNew_button_productList}
    Text Of Element Should Be Equal With Wait    ${locatorB_productsMgmt_text_firstProductName}    newproduct

product014
    [Documentation]    新建商品取消时挽留弹框点击确定（停留在当前页）
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Input Text    ${locatorB_productsNew_input_title}    newproduct
    Wait And Click Element Then Confirm    ${locatorB_productsNew_button_cancel}
    Wait Until Page Contains Text    新建商品
    Wait Until Page Contains Locator    ${locatorB_productsNew_input_title}

product016
    [Documentation]    新建商品未填写标题点击下一步
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Click Element    ${locatorB_productsNew_button_NextStep}
    Wait Until Page Contains Text    商品名称不能为空

product017
    [Documentation]    新建商品填写标题后点击下一步
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Input Text    ${locatorB_productsNew_input_title}    newproduct
    Wait And Click Element    ${locatorB_productsNew_button_NextStep}
    Wait Until Page Contains Text    图片
    Wait Until Page Contains Text    款式设置

product022
    [Documentation]    新建商品页面副标题输入少于255个字符的内容
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Input Text    ${locatorB_productsNew_input_subTitle}    newproductsubtitlenewproductsubtitle
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_subTitle}    newproductsubtitlenewproductsubtitle
    Text Of Element Should Contain With Wait    ${locatorB_productsNew_span_subTitleNum}    36 /255

product024
    [Documentation]    新建商品页面输入副标题后点击下一步
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Input Text    ${locatorB_productsNew_input_title}    newproduct title
    Wait And Input Text    ${locatorB_productsNew_input_subTitle}    newproduct subtitle
    Wait And Click Element    ${locatorB_productsNew_button_NextStep}
    Wait Until Page Contains Text    图片
    Wait Until Page Contains Text    款式设置

product026
    [Documentation]    富文本框输入内容点击下一步
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Input Text    ${locatorB_productsNew_input_title}    newproduct title
    Select Frame    ${locatorB_productsNew_iframe_desc}
    Wait And Input Text    ${locatorB_productsNew_input_desc}    富文本输入内容
    Unselect Frame
    Wait And Click Element    ${locatorB_productsNew_button_NextStep}
    Wait Until Page Contains Text    图片
    Wait Until Page Contains Text    款式设置

product029
    [Documentation]    新建商品页面开启上架商品按钮点击下一步
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Input Text    ${locatorB_productsNew_input_title}    newproduct title
    Wait And Click Element    ${locatorB_productsNew_button_productOn}
    Wait And Click Element    ${locatorB_productsNew_button_NextStep}
    Wait Until Page Contains Text    图片
    Wait Until Page Contains Text    款式设置

product030
    [Documentation]    新建商品页面关闭上架商品按钮点击下一步
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Input Text    ${locatorB_productsNew_input_title}    newproduct title
    Wait And Click Element    ${locatorB_productsNew_button_productOn}
    ${class}    Wait And Get Element Attribute     ${locatorB_productsNew_button_productOn}    class
    Run Keyword If    $class=='ant-switch ant-switch-checked'    Wait And Click Element    ${locatorB_productsNew_button_productOn}
    Wait And Click Element    ${locatorB_productsNew_button_NextStep}
    Wait Until Page Contains Text    图片
    Wait Until Page Contains Text    款式设置

product036
    [Documentation]    专辑弹框选择一个专辑并确定
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Click Element    ${locatorB_productsNew_span_SelectCollection}
    ${collname}    Wait And Get Text    ${locatorB_productsNew_text_firstCollName}
    Wait And Click Element    ${locatorB_productsNew_textarea_firstCollCheckbox}
    Wait And Click Element    ${locatorB_productsNew_button_addCollectionSave}
    Wait Until Page Contains Text    ${collname}

products042
    [Documentation]    专辑弹框输入已存在的专辑名称点击搜索
    [Tags]    P0    threshold
    kwcollection.add_collection_with_pic_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Click Element    ${locatorB_productsNew_span_SelectCollection}
    ${collname}    Wait And Get Text    ${locatorB_productsNew_text_firstCollName}
    Wait And Input Text    ${locatorB_productsNew_input_selectCollName}    ${collname}
    Wait And Click Element    ${locatorB_productsNew_button_selectCollbtn}
    Text Of Element Should Be Equal With Wait    ${locatorB_productsNew_text_firstCollName}    ${collname}

product057
    [Documentation]    专辑弹框‘新建专辑’输入少于50个字的专辑名称点击确定
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Click Element    ${locatorB_productsNew_span_SelectCollection}
    Wait And Click Element    ${locatorB_productsNew_button_newCollection}
    Wait And Input Text    ${locatorB_productsNew_input_newCollectionName}    测试专辑名称长度测试专辑名称长度测试专辑名称长度测试专辑名称长度测试专辑名称长度测试专辑名称长度测试
    Wait And Click Element    ${locatorB_productsNew_button_addCollectionSave}
    Text Of Element Should Be Equal With Wait    ${locatorB_productsNew_text_firstCollName}    测试专辑名称长度测试专辑名称长度测试专辑名称长度测试专辑名称长度测试专辑名称长度测试专辑名称长度测试

product071
    [Documentation]    输入少于20个字的供应商名称
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Input Text    ${locatorB_productsNew_input_supplier}    供应商输入测试供应商输入测试供应商输入测
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_supplier}    供应商输入测试供应商输入测试供应商输入测

product085
    [Documentation]    新建商品页面输入商品标题后SEO链接默认展示
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Wait And Input Text    ${locatorB_productsNew_input_title}    newproduct title
    ${user_domain}=    Convert To Lowercase    ${user_default_domain}
    Text Of Element Should Contain With Wait    ${locatorB_productsNew_text_seouUrl}    ${user_domain}
    Text Of Element Should Contain With Wait    ${locatorB_productsNew_text_seouUrl}    products
    Text Of Element Should Contain With Wait    ${locatorB_productsNew_text_seouUrl}    newproduct title

product104
    [Documentation]    hover图片点击删除icon
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Wait Enabled And Choose File    ${locatorB_productsNew_input_imageUp}    ${file_products_addImg}
    Drag And Drop By Offset    ${locatorB_productsNew_list_picture}[0]    0    0
    Wait And Click Element    ${locatorB_productsNew_icon_imageDelete}
    Wait Until Page Not Contains Locator    ${locatorB_productsNew_list_picture}[0]

product105
    [Documentation]   添加一张图片
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Wait Enabled And Choose File    ${locatorB_productsNew_input_imageUp}    ${file_products_addImg}
    Wait Until Page Contains Locator    ${locatorB_productsNew_list_picture}

product106
    [Documentation]    一次性添加多张图片
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Wait Enabled And Choose File    ${locatorB_productsNew_input_imageUp}    ${file_products_addImg}
    Wait Enabled And Choose File    ${locatorB_productsNew_input_imageUp}    ${file_products_addImg2}
    Wait Enabled And Choose File    ${locatorB_productsNew_input_imageUp}    ${file_products_addImg3}
    Count Of Element Should Be Equal With Wait    ${locatorB_productsNew_list_picture}    ${3}

product108
    [Documentation]    上传png格式的图片
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Wait Enabled And Choose File    ${locatorB_productsNew_input_imageUp}    ${file_products_addImg5}
    Wait Until Page Contains Locator    ${locatorB_productsNew_list_picture}

product109
    [Documentation]   上传jpg格式的图片
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Wait Enabled And Choose File    ${locatorB_productsNew_input_imageUp}    ${file_products_addImg}
    Wait Until Page Contains Locator    ${locatorB_productsNew_list_picture}

product110
    [Documentation]    上传gif格式的图片
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Wait Enabled And Choose File    ${locatorB_productsNew_input_imageUp}    ${file_products_addImg4}
    Wait Until Page Contains Locator    ${locatorB_productsNew_list_picture}

product116
    [Documentation]    一次性删除所有图片
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Wait Enabled And Choose File    ${locatorB_productsNew_input_imageUp}    ${file_products_addImg2}
    Wait Enabled And Choose File    ${locatorB_productsNew_input_imageUp}    ${file_products_addImg3}
    Wait And Click Element Then Confirm    ${locatorB_productsNew_icon_DeletePictureAll}
    Wait Until Page Not Contains Locator    ${locatorB_productsNew_list_picture}

product118
    [Documentation]    未上传图片点击保存
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Wait And Input Text    ${locatorB_productsNew_input_salePrice}    100
    Wait And Input Text    ${locatorB_productsNew_input_rawPrice}    199
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Wait Until Page Contains Text    请上传图片

product121
    [Documentation]   选择‘单一款式’时款式列表的展示
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Single Style
    Wait Until Page Contains Text    售价
    Wait Until Page Contains Text    原价
    Wait Until Page Contains Text    重量
    Wait Until Page Contains Text    SKU
    Wait Until Page Contains Text    条形码

product122
    [Documentation]    ‘单一款式’售价输入小于9位数的正整数
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Single Style
    Wait And Input Text    ${locatorB_productsNew_input_salePrice}    99999999
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_salePrice}    99999999

product124
    [Documentation]    ‘单一款式’售价输入9位整数以内+2位小数以内
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Single Style
    Wait And Input Text    ${locatorB_productsNew_input_salePrice}    999999.88
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_salePrice}    999999.88

product127
    [Documentation]    ‘单一款式’输入的售价小于原价
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Single Style
    Wait And Input Text    ${locatorB_productsNew_input_rawPrice}    9999
    Wait And Input Text    ${locatorB_productsNew_input_salePrice}    8888
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_salePrice}    8888

product130
    [Documentation]    ‘单一款式’原价输入小于9位数的正整数
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Single Style
    Wait And Input Text    ${locatorB_productsNew_input_rawPrice}    99999999
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_rawPrice}    99999999

product132
    [Documentation]    ‘单一款式’原价输入9位整数以内+2位小数以内
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Single Style
    Wait And Input Text    ${locatorB_productsNew_input_rawPrice}    9999.88
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_rawPrice}    9999.88

product135
    [Documentation]    ‘单一款式’输入的原价小于售价
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Single Style
    Wait And Input Text    ${locatorB_productsNew_input_salePrice}    8888
    Wait And Input Text    ${locatorB_productsNew_input_rawPrice}    6666
    Wait And Click Element    ${locatorB_productsNew_input_weight}
    Wait Until Page Contains Text    原价需大于等于售价

product136
    [Documentation]     ‘单一款式’输入的原价大于售价
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Single Style
    Wait And Input Text    ${locatorB_productsNew_input_salePrice}    8888
    Wait And Input Text    ${locatorB_productsNew_input_rawPrice}    9999
    Wait And Click Element    ${locatorB_productsNew_input_weight}
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_rawPrice}    9999

product139
    [Documentation]    重量单位下拉框展示
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Sleep And Click Element    ${locatorB_productsNew_select_weightUnit}
    Wait Until Page Contains Text    kg
    Wait Until Page Contains Text    g
    Wait Until Page Contains Text    lb
    Wait Until Page Contains Text    oz

product144
    [Documentation]    重量输入小于1000的整数
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Add Single Style
    Wait And Input Text    ${locatorB_productsNew_input_weight}    999
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_weight}    999

product151
    [Documentation]    库存选择库存为0允许购买
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Follow Stock
    Wait And Click Element    ${locatorB_productsNew_input_followText}
    Wait And Click Element    ${locatorB_productsNew_select_ContentTwo}
    Wait Until Page Contains Text    库存为0允许购买

product152
    [Documentation]    库存选择库存为0不允许购买
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Follow Stock
    Wait And Click Element    ${locatorB_productsNew_input_followText}
    Wait And Click Element    ${locatorB_productsNew_select_ContentOne}
    Wait Until Page Contains Text    库存为0时不允许购买

product153
    [Documentation]    库存选择库存为0自动下架
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Follow Stock
    Wait And Click Element    ${locatorB_productsNew_input_followText}
    Wait And Click Element    ${locatorB_productsNew_select_ContentThere}
    Wait Until Page Contains Text    库存为0自动下架

product155
    [Documentation]    库存为小于等于5位数的整数
    [Tags]    P0    threshold
    Wait And Click Element    ${locatorB_productsMgmt_button_addSomePro}
    Add Product Second Step    newproduct title
    Select Follow Stock
    Wait And Input Text    ${locatorB_productsNew_input_stock}   6666
    Value Of Element Should Be Equal With Wait    ${locatorB_productsNew_input_stock}   6666