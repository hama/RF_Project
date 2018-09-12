*** Settings ***
Documentation     测试添加商品
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Setup Test Case
Test Teardown     Teardown Test Case
Force Tags        Products
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_products.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_products.robot

*** Test Cases ***
products074
    [Documentation]    只填写必要字段
    [Tags]    P0
    Add Product Required Content
    Wait And Click Element    ${locatorB_products_button_confirm}
    Wait For Save
    # check
    Sleep    3
    ${product_id}=    Execute JavaScript    return responseMap.get("${apiB_products_add}").data.product_id;
    ${product_url}=    Get Location
    Location Should Contain    ${product_id}
    Page Should Contain    ${contentB_products_addTitle}

products076
    [Documentation]    填写必要字段+状态字段
    [Tags]    P0
    # 添加必要字段
    Add Product Required Content
    Wait And Input Text    ${locatorB_productsNew_input_addRawPrice}    ${contentB_products_addRawPrice}    # 添加原价
    Wait And Input Text    ${locatorB_productsNew_input_addWeight}    ${contentB_products_addWeight}    # 添加重量
    # 添加描述
    Wait And Click Element    ${locatorB_productsNew_input_addDesc}
    Execute Javascript    document.querySelectorAll(".fr-view")[0].querySelectorAll("p")[0].innerText='Description'
    # 添加供应商
    Wait And Input Text    ${locatorB_productsNew_input_addSupplier}    ${contentB_products_addSupplier}
    Sleep    1
    Press Key    ${locatorB_productsNew_input_addSupplier}    ${keybord_enter}
    # 添加状态
    Wait And Click Element    ${locatorB_productsNew_tabindex_status}
    # 添加分类
    Wait And Click Element    ${locatorB_productsNew_input_productType}
    Wait And Input Text    ${locatorB_productsNew_input_productType}    三级分类C
    Wait And Click Element    ${locatorB_productsNew_cascader_chooseCategoryItem}
    # 输入标签
    Wait And Input Text    ${locatorB_productsNew_input_tags}    ${contentB_products_addTags}
    Press Key    ${locatorB_productsNew_input_tags}    ${keybord_enter}
    # 输入 SKU
    ${rand_value}=    Evaluate    random.randint(0, 100)    modules=random
    ${sku}=    Convert To String    ${rand_value}
    Wait And Input Text    ${locatorB_productsNew_input_addSku}    ${rand_value}
    # 条形码
    Wait And Input Text    ${locatorB_productsNew_input_addBarcode}    ${contentB_products_addBarcode}
    # 图片
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    ${locatorB_productsNew_button_uploadBtn}
    Choose File    ${locatorB_productsNew_input_chooseFile}    ${file_products_addImg}    # 选择文件并自动上传
    Wait For Upload
    # 保存
    Wait And Click Element    ${locatorB_products_button_confirm}
    Wait For Save
    # 跳转到商品详情页面
    # check
    Sleep    3
    Go To Products Page
    Page Should Contain    ${contentB_products_addTitle}
    Page Should Contain    ${sku}

products094
    [Documentation]    添加商品时图片的增加以及编辑功能
    [Tags]    P0
    # 添加必要字段
    Add Product Required Content
    #上传图片
    Upload_Image    ${file_products_addImg}
    Sleep    2
    Upload_Image    ${file_products_addImg2}
    # 保存
    Wait And Click Element    ${locatorB_products_button_confirm}
    Wait For Save
    # 保存之后检测该商品包含添加的多张图片数量是否一致
    Wait Until Page Contains Locator    dom:document.querySelectorAll(".wrapper___3TwjV")[0]
    ${count}    Execute Javascript    return document.querySelectorAll(".wrapper___3TwjV").length
    Should Be True    ${count}==3
    #接着图片预览，编辑替代文本，删除图片
    #预览
    #点击预览
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_image_firstProductThumbnails}
    Mouse Over    ${locatorB_productsMgmt_image_firstProductThumbnails}
    Sleep    2
    Wait And Click Element    dom:document.querySelectorAll(".preview")[1]
    Sleep    2
    #展示图片大图
    #Wait Until Page Contains Locator    ${locatorB_products_popUps}
    #Sleep    2
    #关闭大图
    #Wait And Click Element    dom:document.querySelectorAll(".ant-modal-close-x")[0]
    Execute Javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    Sleep    5
    #编辑替代文本
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_image_firstProductThumbnails}
    Mouse Over    ${locatorB_productsMgmt_image_firstProductThumbnails}
    Wait And Click Element    dom:document.querySelectorAll(".altbianji")[0]
    #展现弹出框
    Wait And Input Text    dom:document.querySelectorAll(".alt_input___1RvXO")[0]    test
    #确定
    Wait And Click Element    ${locatorB_productsMgmt_button_delTags}
    #点击删除图片
    Wait Until Page Contains Locator    ${locatorB_productsMgmt_image_firstProductThumbnails}
    Mouse Over    ${locatorB_productsMgmt_image_firstProductThumbnails}
    Wait And Click Element    dom:document.querySelectorAll(".delete")[0]
    ${now_count}    Execute Javascript    return document.querySelectorAll(".wrapper___3TwjV").length
    Should Be True    ${now_count}==2
    #移除所有图片
    Wait And Click Element    dom:document.querySelectorAll(".headerExtra___3kmgB a")[0]
    #弹窗选择“是”
    Wait And Click Element    ${locatorB_productsMgmt_button_delTags}
    ${final_count}    Execute Javascript    return document.querySelectorAll(".wrapper___3TwjV").length
    Should Be True    ${final_count}==1
    Wait And Click Element    ${locatorB_products}
    Handle Alert

*** KeyWords ***
Upload_Image
    [Arguments]    ${image}
    #上传一张图片
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    ${locatorB_productsNew_button_uploadBtn}
    Choose File    ${locatorB_productsNew_input_chooseFile}    ${image}
    Sleep    3

Products Suite Setup
    [Documentation]    商品 case setup
    Login With Default User
    Add Default Category    # 添加默认分类
    Start Ajax Listener

Products Suite Teardown
    [Documentation]    删除分类
    Delete All Category    # 删除所有分类
    Close Test Suite Browser

Add Default Category
    [Documentation]    添加商品类别
    Go To    ${apiB_products_addProductsType}
    ${category_empty}=    Execute Javascript    return document.querySelectorAll("input")[0]===undefined
    Run Keyword If    ${category_empty}    Add Category

Add Category
    Click Button    dom:document.querySelectorAll("button")[0]
    Wait And Input Text    dom:document.querySelectorAll("input")[0]    一级分类A
    Click Button    dom:document.querySelectorAll("button")[0]
    Wait And Input Text    dom:document.querySelectorAll("input")[1]    二级分类B
    Click Button    dom:document.querySelectorAll("button")[0]
    Wait And Input Text    dom:document.querySelectorAll("input")[2]    三级分类C
    Wait And Click Element    ${locatorB_productType_button_saveBtn}

Delete All Category
    [Documentation]    删除分类
    Go To    ${apiB_products_addProductsType}
    ${length}=    Execute Javascript    return document.querySelectorAll(".djfont.remove").length
    : FOR    ${index}    IN RANGE    ${length}
    \    ${remove_bt}=    Execute Javascript    return document.querySelectorAll(".djfont.remove")[0]
    \    ${length}=  	Execute Javascript     return document.querySelectorAll(".djfont.remove").length
    \    Run Keyword If    ${length} == 0     Exit For Loop
    \    Click Button    ${remove_bt}
    Click Element    ${locatorB_productType_button_saveBtn}