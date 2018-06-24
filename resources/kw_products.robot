*** Settings ***
Documentation     添加商品
Library           SeleniumLibrary
Library           ${CURDIR}/../lib/customLibrary
Resource          var_common.robot
Resource          var_products.robot
Resource          kw_browser.robot
Resource          kw_common.robot

*** keyword ***
Add Product
    [Documentation]    添加商品以做测试
    Go To Products Page
    Add Product Required Content
    # add other content
    Wait And Input Text    ${locator_products_addSubTitle}    ${content_products_addSubTitle}    # 添加副标题
    Wait And Input Text    ${locator_products_addRawPrice}    ${content_products_addRawPrice}    # 添加原价
    Wait And Input Text    ${locator_products_addWeight}    ${content_products_addWeight}    # 添加重量
    # add image
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    ${locator_products_uploadBtn}
    log    ${CURDIR}
    Choose File    ${locator_products_chooseFile}    ${file_products_addImg}    # 选择文件并自动上传
    Sleep    5
    Wait And Click Element    ${locator_products_save_product}

Add Product Required Content
    Go To Products Page
    Wait And Click Element    ${locator_products_add_product}    # 点击添加商品按钮
    Wait Until Page Contains    ${content_products_new}
    Wait And Input Text    ${locator_products_addTitle}    ${content_products_addTitle}    # 添加标题
    Wait And Input Text    ${locator_products_addPrice}    ${content_products_addPrice}    # 添加价格

Delete Product
    [Documentation]    删除商品列表的第一个商品
    Go To Products Page
    Wait And Click Element    ${locator_products_first}    # 商品列表第一条数据
    Wait And Click Button    ${locator_products_delBtn}

Delete All Product
    [Documentation]    删除商品列表的第一个商品
    Go To Products Page
    Wait And Click Element    ${locator_products_first}    # 商品列表第一条数据
    Wait And Click Button    ${locator_products_delBtn}

Wait For Save
    [Documentation]    等待商品保存成功
    : FOR    ${index}    IN RANGE    10
    \    Sleep    1
    \    ${api_done}=    Execute JavaScript    return responseMap.get("${api_products_add}")!=undefined;
    \    Continue For Loop If    ${api_done}==${False}
    \    ${state}=    Execute JavaScript    return responseMap.get("${api_products_add}").state;
    \    Should Be Equal As Strings    ${state}    0
    \    Exit For Loop

Wait For Upload
    [Documentation]    等待图片上传成功
    # TODO: 此处有 bug，无法获取到 upload 接口，暂时用 sleep 5 解决
    : FOR    ${index}    IN RANGE    5
    \    Sleep    1
    \    ${api_done}=    Execute JavaScript    return responseMap.get("${api_products_upload}")!=undefined;
    \    Continue For Loop If    ${api_done}==${False}
    \    ${state}=    Execute JavaScript    return responseMap.get("${api_products_upload}").state;
    \    Should Be Equal As Strings    ${state}    0
    \    Exit For Loop

Click_First_Product_And_Click_Batch_Menu
    [Documentation]    选中第一个商品,并且点击批量操作菜单
    #选中第一个商品
    Sleep    2
    Wait Until Page Contains Element    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    Select Checkbox    dom:document.querySelectorAll("tbody .ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__placeholder")[0]

Add_Collection
    [Documentation]    添加一个商品专辑
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击进入商品专辑界面
    Sleep    5
    Wait And Click Element    dom:document.querySelectorAll(".menu_item___3VgTh")[2]
    #点击新建一个商品专辑
    Wait And Click Element    dom:document.querySelectorAll(".large_btn___3RbRK")[0]
    #输入专辑名称
    Wait And Input Text    id:title    ceshi
    #输入专辑描述
    Wait And Input Text    id:description    ceshi collection
    #上传一张专辑封面
    Execute JavaScript    return document.querySelectorAll(".wrapper___TgZZ3")[0].scrollIntoView()
    Wait Until Page Contains Element    dom:document.querySelectorAll("input[type='file']")[0]
    Choose File    dom:document.querySelectorAll("input[type='file']")[0]    ${file_products_addImg}
    Sleep    5
    #点击保存按钮
    Wait And Click Element    dom:document.querySelectorAll(".middle_btn___2ExQc")[0]
    Sleep    5

Delete_Collection
    [Documentation]    删除专辑
    #进入商品模块
    Wait Until Element Is Visible    class:icon_product___2ZYHZ
    Click Element    class:icon_product___2ZYHZ
    #点击进入商品专辑界面
    Wait And Click Element    dom:document.querySelectorAll(".menu_item___3VgTh")[2]
    #点击删除第一个专辑按钮
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-row")[0].querySelectorAll(".card-delete")[0]
    #点击确定
    Wait And Click Element    id:test_delete_modal_sure_btn

Delete_First_Product
    [Documentation]    删除第一个商品
    Go To Products Page
    Wait And Click Element    dom:document.querySelectorAll(".delete___2xfx-")[0]
    Wait And Click Element    id:test_delete_modal_sure_btn
    Go TO    ${home_page}

Upload_Many_Products
    [Documentation]    批量上传多个商品，以供分页使用
    #上传商品成功
    #点击批量上传按钮
    Wait And Click Element    ${locator_products_upload_product}
    #等待上传按钮
    Wait Until Page Contains Element    id:sheets
    #上传文件
    Choose File    id:sheets    ${file_products_templates}
    #点击上传
    Wait And Click Element    dom:document.querySelectorAll(".ant-btn-submit")[0]
    #等待上传提示
    Sleep    200
    Wait Until Element Is Visible    dom:document.querySelectorAll(".tip___2LkVX")[0]
    Go TO    ${home_page}
