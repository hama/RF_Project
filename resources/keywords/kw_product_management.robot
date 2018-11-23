*** Settings ***
Documentation     product management keyword

Resource          kw_common.robot

*** keyword ***
Product Management Suite Setup Add Two Products
    [Documentation]    product
    Login With Default User
    kwproduct.del_all_products_py
    kwproduct.add_max_product_py
    Sleep    1   # 为构造两个产品创建时间不同
    kwproduct.add_discontinued_product_py
    Go To Product Management Page
    Show All Header

Product Management Common Suite Setup
    [Documentation]    product
    Login With Default User
    kwproduct.del_all_products_py
    kwcollection.del_all_collections_py
    Go To Product Management Page

Product Management Common Suite Teardown
    [Documentation]    product
    kwproduct.del_all_products_py
    kwcollection.del_all_collections_py
    Close Test Suite Browser

Product Management Case Setup Clear Evn
    [Documentation]    product
    kwproduct.del_all_products_py
    kwcollection.del_all_collections_py
    Go To Product Management Page


Select All Product Tag
    Wait And Click Element    ${locatorB_productsMgmt_button_all}
    Sleep    2

Select Launched Product Tag
    Wait And Click Element    ${locatorB_productsMgmt_button_launched}
	Sleep    2

Select Discontinued Product Tag
    Wait And Click Element    ${locatorB_productsMgmt_button_discontinued}
    Sleep    2

Show All Header
    Wait And Click Element    ${locatorB_productsMgmt_button_editTableHead}
    @{list}    Wait And Get Items List From Locator    ${locatorB_popUps_allUncheckedCheckbox}
    :FOR    ${i}    IN    @{list}
    \    Wait And Click Element    ${i}    5    0
    \    Sleep    0.2
    Wait And Click Element    ${locatorB_popUps_button_bodymiddle}
    Sleep    2

Hide All Header
    Wait And Click Element    ${locatorB_productsMgmt_button_editTableHead}
    @{list}    Wait And Get Items List From Locator    ${locatorB_popUps_allCheckedCheckbox}
    :FOR    ${i}    IN    @{list}
    \    Wait And Click Element    ${i}    5    0
    \    Sleep    0.2
    Wait And Click Element    ${locatorB_popUps_button_bodymiddle}
    Sleep    2

Fill In Required Items When Create Product
	Wait And Input Text    ${locatorB_productsNew_input_title}    newproduct
    Wait And Input Text    ${locatorB_productsNew_input_salePrice}    99
    Wait And Input Text    ${locatorB_productsNew_input_weight}    66
    Wait And Make Switch On    ${locatorB_productsNew_switch_status}
    Wait Enabled And Choose File    ${locatorB_productsNew_input_addImage}    ${file_products_addImg}

























Add Product
    [Documentation]    添加下架商品以做测试
    Go To Product Management Page
    Add Product Required Content
    # add other content
    Wait And Input Text    ${locatorB_productsNew_input_subTitle}    ${contentB_products_addSubTitle}    # 添加副标题
    Wait And Input Text    ${locatorB_productsNew_input_rawPrice}    ${contentB_products_addRawPrice}    # 添加原价
    Wait And Input Text    ${locatorB_productsNew_input_weight}    ${contentB_products_addWeight}    # 添加重量
    # add image
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    ${locatorB_productsNew_button_uploadBtn}
    log    ${CURDIR}
    Choose File    ${locatorB_productsNew_input_addImage}    ${file_products_addImg}    # 选择文件并自动上传
    Sleep    5
    Click And Page Contains Element With Refresh    ${locatorB_popUps_button_bodymiddle}    ${locatorB_popUps_button_bodymiddle}

Add Product_Up
    [Documentation]    添加上架商品以做测试，这里不能添加商品标签
    Add Product Required Content
    #选择商品上架
    Wait And Click Element    id:status
    Wait And Input Text    ${locatorB_productsNew_input_subTitle}    ${contentB_products_addSubTitle}    # 添加副标题
    Wait And Input Text    ${locatorB_productsNew_input_rawPrice}    ${contentB_products_addRawPrice}    # 添加原价
    Wait And Input Text    ${locatorB_productsNew_input_weight}    ${contentB_products_addWeight}    # 添加重量
    # add image
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    ${locatorB_productsNew_button_uploadBtn}
    log    ${CURDIR}
    Choose File    ${locatorB_productsNew_input_addImage}    ${file_products_addImg}    # 选择文件并自动上传
    Sleep    5
    Wait And Click Element    ${locatorB_products_button_confirm}

Add Product Required Content
    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_button_addProduct}    # 点击添加商品按钮
    Wait Until Page Contains    ${contentB_products_new}
    Wait And Input Text    ${locatorB_productsNew_input_title}    ${contentB_products_addTitle}    # 添加标题
    Wait And Input Text    ${locatorB_productsNew_input_salePrice}    ${contentB_products_addPrice}    # 添加价格

Delete Product
    [Documentation]    删除商品列表的第一个商品
    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_checkbox_chooseFirstProduct}    # 商品列表第一条数据
    Wait And Click Element    ${locatorB_popUps_button_bodymiddle}

Delete All Products
    [Documentation]    删除全部商品
    #判断是否存在商品，存在即删除，否则跳过
    ${is_exist_element}    Run Keyword And Return Status    Page Should Contain    条记录
    Run Keyword If    ${is_exist_element}==True    Delete All Product Execute

Delete All Product Execute
    [Documentation]     删除全部商品的执行办法
    ${size}    Get Text    ${locatorB_page_text_totalRecord}
    ${total_record}    searchStrs_py    ${size}
    ${page_num}    evaluate    int(math.ceil(${total_record}/20.0))    math
    Run Keyword If    ${page_num}>1     Delete Product Loop     ${page_num}
    ...    ELSE IF    ${page_num}==1     Delete Product Loop     1

Delete Product Loop
    [Documentation]     循环删除商品
    [Arguments]    ${page_num}
    :FOR    ${index}    IN RANGE    ${page_num}
         #选中当前页面所有商品
    \     Select Checkbox    ${locatorB_products_checkbox_chooseProducets}
         #批量按钮
    \     Wait And Click Element    ${locatorB_products_selection_batchOperations}
         #选择批量删除产品
    \     Assign Id To Element    ${locatorB_products_select_batchDel}    btn
    \     Set Focus To Element    btn
    \     Mouse Down    btn
    \     Mouse Up    btn
         #弹出框
    \     Wait Until Element Is Visible    ${locatorB_products_popUps}
         #点击确定
    \     Wait And Click Element    ${locatorB_productsNew_button_save}
    \     Sleep    2

Wait For Save
    [Documentation]    等待商品保存成功
    :FOR    ${index}    IN RANGE    10
    \    Sleep    1
    \    ${apiB_done}=    Execute JavaScript    return responseMap.get("${apiB_products_add}")!=undefined;
    \    Continue For Loop If    ${apiB_done}==${False}
    \    ${state}=    Execute JavaScript    return responseMap.get("${apiB_products_add}").state;
    \    Should Be Equal As Strings    ${state}    0
    \    Exit For Loop

Wait For Upload
    [Documentation]    等待图片上传成功
    # TODO: 此处有 bug，无法获取到 upload 接口，暂时用 sleep 5 解决
    :FOR    ${index}    IN RANGE    5
    \    Sleep    1
    \    ${apiB_done}=    Execute JavaScript    return responseMap.get("${apiB_products_upload}")!=undefined;
    \    Continue For Loop If    ${apiB_done}==${False}
    \    ${state}=    Execute JavaScript    return responseMap.get("${apiB_products_upload}").state;
    \    Should Be Equal As Strings    ${state}    0
    \    Exit For Loop



Add_Collection
    [Documentation]    添加一个商品专辑
    #进入商品模块
    Wait Until Element Is Visible    ${locatorB_products}
    Click Element    ${locatorB_products}
    #点击进入商品专辑界面
    Sleep    5
    Wait And Click Element    ${locatorB_product_collection}
    #点击新建一个商品专辑
    Wait And Click Element    ${locatorB_button_add}
    #输入专辑名称
    Wait And Input Text    id:title    ceshi
    #输入专辑描述
    Wait And Input Text    id:description    ceshi collection
    #上传一张专辑封面
    Execute JavaScript    return document.querySelectorAll(".wrapper___TgZZ3")[0].scrollIntoView()
    Wait Until Page Contains Locator    ${locatorB_productsNew_input_addImage}
    Choose File    ${locatorB_productsNew_input_addImage}    ${file_products_addImg}
    Sleep    5
    #点击保存按钮
    Wait And Click Element    ${locatorB_products_button_confirm}
    Sleep    5

Delete_Collection
    [Documentation]    删除专辑
    #进入商品模块
    Wait Until Element Is Visible    ${locatorB_products}
    Click Element    ${locatorB_products}
    #点击进入商品专辑界面
    Wait And Click Element    ${locatorB_product_collection}
    #点击删除第一个专辑按钮
    Wait And Click Element    ${locatorB_productsCollection_icon_listDel}[0]
    #点击确定
    Wait And Click Element    ${locatorB_popUps_button_bodymiddle}

Delete_First_Product
    [Documentation]    删除第一个商品
    Go To Product Management Page
    Sleep    5
    Wait And Click Element    ${locatorB_productsMgmt_icon_listDelete}[0]
    Sleep    5
    #Wait And Click Element    id:test_delete_modal_sure_btn
    Wait And Click Element    ${locatorB_popUps_button_bodymiddle}
    Go TO    ${home_page}

Upload_Many_Products
    [Documentation]    批量上传多个商品，以供分页使用
    #上传商品成功
    #点击批量上传按钮
    Wait And Click Element    ${locatorB_productsMgmt_icon_uploadProduct}
    #等待上传按钮
    Wait Until Page Contains Locator    id:sheets
    #上传文件
    Choose File    id:sheets    ${file_products_templates}
    #点击上传
    Wait And Click Element    dom:document.querySelectorAll(".ant-btn-submit")[0]
    #等待上传提示
    Sleep    200
    Wait Until Element Is Visible    dom:document.querySelectorAll(".tip___2LkVX")[0]
    Go TO    ${home_page}

Delete All Collection
    [Documentation]    删除所有专辑
    #进入商品模块
    Wait Until Element Is Visible    ${locatorB_products}
    Click Element    ${locatorB_products}
    #点击进入商品专辑界面
    Wait And Click Element    ${locatorB_product_collection}
    #点击选中所有专辑
    Select Checkbox    ${locatorB_productsCollection_checkbox_chooseCategories}
    #点击删除按钮
    Wait And Click Element    ${locatorB_productsCollection_button_delProducts}
    #点击确定按钮
    Wait And Click Element    ${locatorB_products_button_confirm}
    Go TO    ${home_page}

Add Order Products
    [Documentation]    添加订单和checkout所需商品
    Go To    ${home_page}
    Go To Product Management Page
    Add Product Required Content
    # add other content
    Wait And Input Text    ${locatorB_productsNew_input_subTitle}    ${contentB_products_addSubTitle}    # 添加副标题
    Wait And Input Text    ${locatorB_productsNew_input_rawPrice}    ${contentB_products_addRawPrice}    # 添加原价
    Wait And Input Text    ${locatorB_productsNew_input_weight}    ${contentB_products_addWeight}    # 添加重量
    Wait And Click Element    id:status
    # add image
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    ${locatorB_productsNew_button_uploadBtn}
    log    ${CURDIR}
    Choose File    ${locatorB_productsNew_input_addImage}    ${file_products_addImg}    # 选择文件并自动上传
    Sleep    5
    Click And Page Contains Element With Refresh    ${locatorB_popUps_button_bodymiddle}    ${locatorB_popUps_button_bodymiddle}

Add TenPrice Products
    [Documentation]    添加一个价格为10元的商品
    Add Custom Products    10

Add Custom Products
    [Documentation]    添加一个任意价格的商品
    [Arguments]    ${price}
    Go To    ${home_page}
    Go To Product Management Page
    Wait And Click Element    ${locatorB_productsMgmt_button_addProduct}    # 点击添加商品按钮
    Wait Until Page Contains    ${contentB_products_new}
    Wait And Input Text    ${locatorB_productsNew_input_title}    ${contentB_products_addTitle}    # 添加标题
    Wait And Input Text    ${locatorB_productsNew_input_salePrice}    ${price}    # 添加价格
    # add other content
    Wait And Input Text    ${locatorB_productsNew_input_subTitle}    ${contentB_products_addSubTitle}    # 添加副标题
    Wait And Input Text    ${locatorB_productsNew_input_rawPrice}    ${price}    # 添加原价
    Wait And Input Text    ${locatorB_productsNew_input_weight}    ${contentB_products_addWeight}    # 添加重量
    Wait And Click Element    id:status
    Wait And Click Element    dom:document.querySelectorAll('.ant-checkbox-wrapper span')[2]    #. 对此商品收税
    # add image
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    ${locatorB_productsNew_button_uploadBtn}
    log    ${CURDIR}
    Choose File    ${locatorB_productsNew_input_addImage}    ${file_products_addImg}    # 选择文件并自动上传
    Sleep    5
    Click And Page Contains Element With Refresh    ${locatorB_popUps_button_bodymiddle}    ${locatorB_popUps_button_bodymiddle}