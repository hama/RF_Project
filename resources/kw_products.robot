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
    Wait For Upload
    Wait And Click Element    ${locator_products_saveBtn}
    Wait For Save

Add Product Required Content
    Go To Products Page
    Wait And Click Element    ${locator_products_addBtn}    # 点击添加商品按钮
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
