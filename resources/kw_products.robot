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
    [Documentation]    添加下架商品以做测试
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

Add Product_Up
    [Documentation]    添加上架商品以做测试，这里不能添加商品标签
    Go To Products Page
    Add Product Required Content
    # add other content
    #选择商品上架
    Wait And Click Element    id:status
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
    Sleep    5
    Wait And Click Element    dom:document.querySelectorAll(".delete___2xfx-")[0]
    Sleep    5
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

Select_Order_Page
    [Arguments]    ${title}
    [Documentation]    点击预览第一个商品，跳转到商品详情页，点击submit按钮进入订单信息页面
    #点击第一个商品的预览icon
    Wait And Click Element    dom:document.querySelectorAll(".tw-see")[0]
    #跳转到商品详情页
    Select Window    title=${title}
    Sleep    1
    #跳转到页面底部
    Execute Javascript    return document.querySelectorAll(".buy-now")[0].scrollIntoView()
    #点击submit
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Sleep    1
    #进入到填写订单信息页面
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]

Select_Order_Page_With_Sub_Product
    [Arguments]    ${title}
    [Documentation]    点击预览第一个商品，跳转到商品详情页，选中一个子产品后，点击submit按钮进入订单信息页面
    #点击第一个商品的预览icon
    Wait And Click Element    dom:document.querySelectorAll(".tw-see")[0]
    #跳转到商品详情页
    Select Window    title=${title}
    Sleep    1
    #跳转到页面底部
    Execute Javascript    return document.querySelectorAll(".buy-now")[0].scrollIntoView()
    #点击submit
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    Sleep    3
    #选中第一个规格属性
    Wait And Click Element    dom:document.querySelectorAll(".attribute-item")[0]
    #进入到填写订单信息页面
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]

Complete_Order_Message
    [Documentation]    点击添加地址按钮，填写信息，点击保存按钮，点击进入支付页
    Sleep    1
    #添加地址信息
    Wait And Click Element    id:addAddress
    Sleep    1
    #first name
    Wait And Input Text    dom:document.querySelectorAll("input[name=first_name]")[0]    zc
    #last name
    Wait And Input Text    dom:document.querySelectorAll("input[name=last_name]")[0]    l
    #选择国家
    Select From List By Index    id:shipping_country_id    1
    Sleep    2
    #选择身份
    Select From List By Index    id:shipping_zone_id    1
    #city
    Wait And Input Text    dom:document.querySelectorAll("input[name=city]")[0]    shenzhen
    #address
    Wait And Input Text    dom:document.querySelectorAll("input[name=address]")[0]    hhh
    #postal code
    Wait And Input Text    dom:document.querySelectorAll("input[name=zip]")[0]    333000
    #email
    Wait And Input Text    dom:document.querySelectorAll("input[name=email]")[0]    1004714019@qq.com
    #phone
    Wait And Input Text    dom:document.querySelectorAll("input[name=phone]")[0]    15297989918
    #company
    Wait And Input Text    dom:document.querySelectorAll("input[name=company]")[0]    dianjiangkeji
    #保存填写的地址信息
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]
    #点击Submit按钮进入支付页
    Wait And Click Element    id:submitMbPay

Add_Sub_Product_With_Already_Product
    [Documentation]    给第一个现有的无子产品的商品添加两个子产品
    Sleep    2
    Go To Products Page
    Sleep    5
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.getElementById("test_variant_setting_btn").scrollIntoView()
    Sleep    5
    #添加选项
    Wait And Click Element    id:test_variant_setting_btn
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    Mouse Over    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    Wait And Click Element    dom:document.querySelectorAll(".ant-dropdown-menu-item")[1]
    #添加多个种类
    Wait And Input Text    id:option_values_0    red
    #回车保存
    Press Key    id:option_values_0    \\13
    Sleep    2
    Wait And Input Text    id:option_values_0    black
    #回车保存
    Press Key    id:option_values_0    \\13
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5

Delete_Sub_Product_With_Already_Product
    [Arguments]    ${index}
    [Documentation]    此时第一个商品下有两个子产品，删除当前第一个商品下的第n个子商品（第一个子产品为下单时选中的子产品）
    Sleep    2
    Go To Products Page
    Sleep    5
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.getElementById("test_single_variant_setting_btn").scrollIntoView()
    Sleep    2
    #删除第n个子商品
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-selection__choice__remove")[${index}]
    Sleep    2
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5

Select_Quantity_0
    [Documentation]    勾选该商品库存为0时仍可购买
    Sleep    2
    Go To Products Page
    Sleep    5
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].scrollIntoView()
    Sleep    5
    #点击跟踪库存
    Select Checkbox    dom:document.querySelectorAll(".wrapper_row___V4M9G")[4].querySelectorAll(".ant-checkbox-input")[0]
    Sleep    2
    #点击库存为0时仍可购买
    Select Checkbox    dom:document.querySelectorAll(".wrapper_row___V4M9G")[4].querySelectorAll(".ant-checkbox-input")[1]
    Sleep    1
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5

Cancel_Select_Quantity_0
    [Documentation]    取消勾选该商品库存为0时仍可购买
    Sleep    2
    Go To Products Page
    Sleep    5
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].scrollIntoView()
    Sleep    5
    #点击取消库存为0时仍可购买
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].querySelectorAll(".ant-checkbox-input")[1].click()
    Sleep    1
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
    #点击确定按钮
    Wait And Click Element    dom:document.querySelectorAll(".ant-confirm-btns .ant-btn-primary")[0]
    Sleep    5

Cancel_Select_Quantity
    [Documentation]    取消勾选该商品跟踪库存
    Sleep    2
    Go To Products Page
    Sleep    5
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].scrollIntoView()
    Sleep    5
    #点击取消库存为0时仍可购买
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].querySelectorAll(".ant-checkbox-input")[1].click()
    Sleep    1
    #点击取消跟踪库存
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].querySelectorAll(".ant-checkbox-input")[0].click()
    Sleep    1
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
