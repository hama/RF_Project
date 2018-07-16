*** Settings ***
Documentation     添加商品
Library           SeleniumLibrary
Library           ${CURDIR}/../lib/customLibrary
Resource          var_common.robot
Resource          var_marketing.robot
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
    Add Product Required Content
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
    [Documentation]    删除全部商品
    #判断是否存在商品，存在即删除，否则跳过
    ${is_exist_element}    Run Keyword And Return Status    Page Should Contain    条记录
    Run Keyword If    ${is_exist_element}==True    Delete All Product Execute

Delete All Product Execute
    [Documentation]     删除全部商品的执行办法
    ${size}    Get Text    ${locator_page_total_record}
    ${total_record}    searchStrs    ${size}
    ${page_num}    evaluate    int(math.ceil(${total_record}/20.0))    math
    Run Keyword If    ${page_num}>1     Delete Product Loop     ${page_num}
    ...    ELSE IF    ${page_num}==1     Delete Product Loop     1

Delete Product Loop
    [Documentation]     循环删除商品
    [Arguments]    ${page_num}
    : FOR    ${index}    IN RANGE    ${page_num}
         #选中当前页面所有商品
    \     Select Checkbox    ${locator_products_checkbox_chooseProducets}
         #批量按钮
    \     Wait And Click Element    ${locator_products_selection_batchOperations}
         #选择批量删除产品
    \     Assign Id To Element    ${locator_products_dropdown_batchDel}    btn
    \     Set Focus To Element    btn
    \     Mouse Down    btn
    \     Mouse Up    btn
         #弹出框
    \     Wait Until Element Is Visible    ${locator_products_popUps}
         #点击确定
    \     Wait And Click Element    ${locator_products_save_product}
    \     Sleep    2

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
    Wait Until Page Contains Element    ${locator_products_checkbox_chooseFirstProducet}
    Select Checkbox    ${locator_products_checkbox_chooseFirstProducet}
    #点击批量操作菜单
    Wait And Click Element    ${locator_products_selection_batchOperations}

Add_Collection
    [Documentation]    添加一个商品专辑
    #进入商品模块
    Wait Until Element Is Visible    ${locator_products}
    Click Element    ${locator_products}
    #点击进入商品专辑界面
    Sleep    5
    Wait And Click Element    ${locator_product_collection}
    #点击新建一个商品专辑
    Wait And Click Element    ${locator_products_add_category}
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
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5

Delete_Collection
    [Documentation]    删除专辑
    #进入商品模块
    Wait Until Element Is Visible    ${locator_products}
    Click Element    ${locator_products}
    #点击进入商品专辑界面
    Wait And Click Element    ${locator_product_collection}
    #点击删除第一个专辑按钮
    Wait And Click Element    dom:document.querySelectorAll(".djfont.delete")[0]
    #点击确定
    Wait And Click Element    dom:document.querySelectorAll(".ant-btn.middle_btn___2ExQc")[0]

Delete_First_Product
    [Documentation]    删除第一个商品
    Go To Products Page
    Sleep    5
    Wait And Click Element    ${locator_products_deleteIcon}
    Sleep    5
    #Wait And Click Element    id:test_delete_modal_sure_btn
    Wait And Click Element    dom:document.querySelectorAll('.middle_btn___2ExQc')[0]
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
    Wait And Click Element    dom:document.querySelectorAll(".preview")[0]
    #跳转到商品详情页
    Select Window    title=${title}
    Sleep    1
    #跳转到页面底部
    Execute Javascript    return document.querySelectorAll(".buy-now")[0].scrollIntoView()
    #点击submit
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    #进入到填写订单信息页面
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]

Select_Order_Page_With_Sub_Product
    [Arguments]    ${title}
    [Documentation]    点击预览第一个商品，跳转到商品详情页，选中一个子产品后，点击submit按钮进入订单信息页面
    #点击第一个商品的预览icon
    Wait And Click Element    dom:document.querySelectorAll(".preview")[0]
    #跳转到商品详情页
    Select Window    title=${title}
    Sleep    1
    #跳转到页面底部
    Execute Javascript    return document.querySelectorAll(".buy-now")[0].scrollIntoView()
    #点击submit
    Wait And Click Element    dom:document.querySelectorAll(".buy-now")[0]
    #选中第一个规格属性
    Wait And Click Element    dom:document.querySelectorAll(".attribute-item")[0]
    #进入到填写订单信息页面
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]

Complete_Order_Message
    [Documentation]    点击添加地址按钮，填写信息，点击保存按钮，点击进入支付页
    #添加地址信息
    Wait And Click Element    id:addAddress
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
    Sleep    2

Complete_Order_Message_Not_Submit
    [Documentation]    点击添加地址按钮，填写信息，点击保存按钮，点击进入支付页
    #添加地址信息
    Wait And Click Element    id:addAddress
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

Complete_Order_Message_Without_Phone
    [Documentation]    点击添加地址按钮，填写信息（只需填写邮箱），点击保存按钮，不点击进入支付页
    #添加地址信息
    Wait And Click Element    id:addAddress
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
    #company
    Wait And Input Text    dom:document.querySelectorAll("input[name=company]")[0]    dianjiangkeji
    #保存填写的地址信息
    Wait And Click Element    dom:document.querySelectorAll(".form-footer")[0]

Complete_Order_Message_Without_Last_name
    [Documentation]    点击添加地址按钮，填写信息（只需填写first name），点击保存按钮，不点击进入支付页
    #添加地址信息
    Wait And Click Element    id:addAddress
    #first name
    Wait And Input Text    dom:document.querySelectorAll("input[name=first_name]")[0]    zc
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

Add_Sub_Product_With_Already_Product
    [Documentation]    给第一个现有的无子产品的商品添加两个子产品
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.getElementById("test_variant_setting_btn").scrollIntoView()
    Sleep    2
    #添加选项
    Wait And Click Element    id:test_variant_setting_btn
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    Mouse Over    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    Wait And Click Element    dom:document.querySelectorAll(".ant-dropdown-menu-item")[1]
    #添加多个种类
    Wait And Input Text    id:option_values_0    red
    #回车保存
    Press Key    id:option_values_0    \\13
    Sleep    1
    Wait And Input Text    id:option_values_0    black
    #回车保存
    Press Key    id:option_values_0    \\13
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    10

Delete_Sub_Product_With_Already_Product
    [Arguments]    ${index}
    [Documentation]    此时第一个商品下有两个子产品，删除当前第一个商品下的第n个子商品（第一个子产品为下单时选中的子产品）
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
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    10

Select_Quantity_0
    [Documentation]    勾选该商品库存为0时仍可购买
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].scrollIntoView()
    Sleep    2
    #点击跟踪库存
    Select Checkbox    dom:document.querySelectorAll(".wrapper_row___V4M9G")[4].querySelectorAll(".ant-checkbox-input")[0]
    Sleep    2
    #点击库存为0时仍可购买
    Select Checkbox    dom:document.querySelectorAll(".wrapper_row___V4M9G")[4].querySelectorAll(".ant-checkbox-input")[1]
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    10

Cancel_Select_Quantity_0
    [Documentation]    取消勾选该商品库存为0时仍可购买
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].scrollIntoView()
    Sleep    2
    #点击取消库存为0时仍可购买
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].querySelectorAll(".ant-checkbox-input")[1].click()
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
    #点击确定按钮
    Wait And Click Element    dom:document.querySelectorAll(".ant-confirm-btns .ant-btn-primary")[0]
    Sleep    5

Cancel_Select_Quantity
    [Documentation]    取消勾选该商品跟踪库存
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].scrollIntoView()
    Sleep    2
    #点击取消库存为0时仍可购买
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].querySelectorAll(".ant-checkbox-input")[1].click()
    Sleep    1
    #点击取消跟踪库存
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].querySelectorAll(".ant-checkbox-input")[0].click()
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5

Set_Quantity_To_0
    [Documentation]    设置商品的库存为0
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].scrollIntoView()
    Sleep    2
    #点击跟踪库存
    Select Checkbox    dom:document.querySelectorAll(".wrapper_row___V4M9G")[4].querySelectorAll(".ant-checkbox-input")[0]
    Sleep    2
    #输入库存数量
    Wait And Input Text    id:inventory_quantity    0
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
    #点击确定按钮
    Wait And Click Element    dom:document.querySelectorAll(".ant-confirm-btns .ant-btn-primary")[0]
    Sleep    5

Set_Quantity
    [Arguments]    ${num}
    [Documentation]    设置商品的库存
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.querySelectorAll(".wrapper_row___V4M9G")[4].scrollIntoView()
    Sleep    2
    #点击跟踪库存
    Select Checkbox    dom:document.querySelectorAll(".wrapper_row___V4M9G")[4].querySelectorAll(".ant-checkbox-input")[0]
    Sleep    2
    #输入库存数量
    Wait And Input Text    id:inventory_quantity    ${num}
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5

To_Change_Image
    [Documentation]    更换商品的图片，前提该商品已有一张图片
    Go To Products Page
    Sleep    5
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.querySelectorAll(".row___3Mua7")[0].scrollIntoView()
    Sleep    2
    #删除第一张图片
    Mouse Over    dom:document.querySelectorAll(".center___1nHSZ")[0]
    Wait And Click Element    dom:document.querySelectorAll(".delete")[0]
    #更新另外一张图片
    Choose File    ${locator_products_chooseFile}    ${file_products_addImg2}
    Sleep    2

Delete_All_Sub_Product_With_Already_Product
    [Documentation]    此时第一个商品下有两个子产品，删除当前第一个商品下的所有子商品
    Go To Products Page
    Sleep    5
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.getElementById("test_single_variant_setting_btn").scrollIntoView()
    Sleep    2
    #点击单一款式按钮
    Wait And Click Element    id:test_single_variant_setting_btn
    Sleep    5
    #点击确定按钮
    Wait And Click Element    id:test_delete_modal_sure_btn
    Sleep    2
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5

Add_Full_Reduction
    [Documentation]    添加全部商品的满减活动，适用时要先定义变量name,full,cut
    #进入满减活动页面
    Go To Marketing Page
    Sleep    2
    #点击新增活动按钮
    Wait And Click Element    ${locator_marketing_add_substraction}
    Sleep    5
    #活动名称
    Wait And Input Text    id:name    ${name}
    #活动开始时间
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-picker-input")[0]    #点击弹出时间选择器
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-selected-day .ant-calendar-date")[0]    #点击选择亮起的时间
    Wait And Click Element    dom:document.querySelectorAll(".ant-calendar-ok-btn")[0]    #点击时间选择器中的确定按钮，起始时间为当前时间
    Sleep    1
    #选择“长期”
    Select Checkbox    dom:document.querySelectorAll(".ant-checkbox-input")[0]
    #优惠类型,这里默认选中“满额减元”
    #满10
    Wait And Input Text    id:totalPrice0    ${full}
    #点击满减checkbox
    Select Checkbox    dom:document.querySelectorAll(".ant-checkbox-input")[2]
    #减3
    Wait And Input Text    id:cutPrice0    ${cut}
    #选择适用范围
    Wait And Click Element    dom:document.querySelectorAll(".li___2Fxhj")[0]
    #点击保存按钮
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5

End_First_Full_Reduction
    [Documentation]    提前结束第一个满减活动
    #进入满减活动页面
    Go To Marketing Page
    Sleep    2
    #点击第一个提前结束按钮
    Wait And Click Element    dom:document.querySelectorAll(".stop_icon___1u6D1")[0]
    Sleep    5
    Wait And Click Element    id:test_delete_modal_sure_btn
    Sleep    2

Modify_First_Full_Reduction
    [Documentation]    修改第一个满减活动的优惠内容
    #进入满减活动页面
    Go To Marketing Page
    Sleep    2
    #点击进入第一个满减活动的详情
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #修改优惠的金额
    Wait And Input Text    id:cutPrice0    ${cut2}
    Sleep    3
    #点击保存按钮
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5

Change_Cash
    Wait And Click Element    dom:document.querySelectorAll("#cod .ant-switch")[0]
    Sleep    5
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-content .middle_btn___2ExQc")[0]
    Sleep    2

Close_Cash
    [Documentation]    关闭"货到付款"
    Go TO    ${home_page}
    Sleep    2
    Go To Setting Page
    Sleep    5
    Execute Javascript    return document.getElementById("test_setting_pay").scrollIntoView()
    #点击收款渠道
    Execute Javascript    return document.getElementById("test_setting_pay").click()
    Sleep    5
    #记录当前“货到付款”是否开启
    ${class}    Execute Javascript    return document.querySelectorAll("#cod .ant-switch")[0].getAttribute("class")
    Run Keyword If    '${class}'=='ant-switch ant-switch-checked'    Change_Cash    #关闭

Open_Cash
    [Documentation]    开启"货到付款"
    Go TO    ${home_page}
    Sleep    2
    Go To Setting Page
    Sleep    5
    Execute Javascript    return document.getElementById("test_setting_pay").scrollIntoView()
    #点击收款渠道
    Execute Javascript    return document.getElementById("test_setting_pay").click()
    Sleep    5
    #记录当前“货到付款”是否开启
    ${class}    Execute Javascript    return document.querySelectorAll("#cod .ant-switch")[0].getAttribute("class")
    Run Keyword If    '${class}'=='ant-switch'    Change_Cash    #开启

Modify_Other_Tax_Price
    [Documentation]    修改其他国家税费金额
    Go TO    ${home_page}
    Go To Tax Price Page
    Sleep    5
    #点击第一个税率设置操作按钮
    Wait And Click Element    dom:document.querySelectorAll(".card-col-Setting")[0]
    Sleep    2
    #输入国家税率
    Wait And Input Text    dom:document.querySelectorAll(".uniteInput___3eUiu")[0]    ${tax_price}
    #点击保存按钮
    Wait And Click Element    dom:document.querySelectorAll(".save___ldv3D")[0]

Modify_Set
    [Arguments]    ${index}
    [Documentation]    修改结账设置(0:邮箱，1:手机，2:邮箱和手机)
    #返回后台修改结账设置
    Go TO    ${home_page}
    Sleep    2
    Go To Setting Page
    Sleep    3
    #进入结账设置页面
    Execute Javascript    return document.getElementById("test_setting_checkout").scrollIntoView()
    Execute Javascript    return document.getElementById("test_setting_checkout").click()
    Sleep    5
    #选择填写信息
    Wait And Click Element    dom:document.querySelectorAll(".translatedContent1___3mue7 .grid___1j8eN")[${index}]
    #点击保存按钮
    Wait And Click Element    id:test_save_btn

Modify_Set_Radio
    [Arguments]    ${index}
    [Documentation]    修改结账设置
    #返回后台修改结账设置
    Go TO    ${home_page}
    Sleep    2
    Go To Setting Page
    Sleep    3
    #进入结账设置页面
    Execute Javascript    return document.getElementById("test_setting_checkout").scrollIntoView()
    Execute Javascript    return document.getElementById("test_setting_checkout").click()
    Sleep    5
    #选择填写信息
    Execute Javascript    return document.querySelectorAll(".ant-radio-input")[0].scrollIntoView()
    Execute Javascript    return document.querySelectorAll(".ant-radio-input")[${index}].click()
    #点击保存按钮
    Wait And Click Element    id:test_save_btn

Change_Card
    Wait And Click Element    dom:document.querySelectorAll(".payment_wrap___3m1lo")[1].querySelectorAll(" .ant-switch")[0]
    Sleep    5
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-content .middle_btn___2ExQc")[0]
    Sleep    2

Open_Card
    [Documentation]    开启银行卡支付
    Go TO    ${home_page}
    Sleep    2
    Go To Setting Page
    Sleep    5
    Execute Javascript    return document.getElementById("test_setting_pay").scrollIntoView()
    #点击收款渠道
    Execute Javascript    return document.getElementById("test_setting_pay").click()
    Sleep    5
    #记录当前“银行卡支付”是否开启
    ${class}    Execute Javascript    return document.querySelectorAll(".payment_wrap___3m1lo")[1].querySelectorAll(" .ant-switch")[0].getAttribute("class")
    Run Keyword If    '${class}'=='ant-switch'    Change_Card    #开启

Close_Card
    [Documentation]    关闭银行卡支付
    Go TO    ${home_page}
    Sleep    2
    Go To Setting Page
    Sleep    5
    Execute Javascript    return document.getElementById("test_setting_pay").scrollIntoView()
    #点击收款渠道
    Execute Javascript    return document.getElementById("test_setting_pay").click()
    Sleep    5
    #记录当前“银行卡支付”是否开启
    ${class}    Execute Javascript    return document.querySelectorAll(".payment_wrap___3m1lo")[1].querySelectorAll(" .ant-switch")[0].getAttribute("class")
    Run Keyword If    '${class}'=='ant-switch ant-switch-checked'    Change_Card    #关闭

Delete_All_Products
    [Documentation]    删除所有商品
    [Tags]    P0
    Sleep    5
    #点击选中全部的商品
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    #Wait And Click Element    dom:document.querySelectorAll(".ant-checkbox-input")[0]
    #点击批量操作菜单
    Wait And Click Element    ${locator_products_selection_batchOperations}
    #选择删除商品
    Assign Id To Element    ${locator_products_dropdown_batchDel}    btn
    Set Focus To Element    btn
    Mouse Down    btn
    Mouse Up    btn
    #弹出框
    Wait Until Element Is Visible    ${locator_products_popUps}
    #点击确定
    Wait And Click Element    ${locator_products_delBtn}
    Go TO    ${home_page}

Delete_All_Collection
    [Documentation]    删除所有专辑
    #进入商品模块
    Wait Until Element Is Visible    ${locator_products}
    Click Element    ${locator_products}
    #点击进入商品专辑界面
    Wait And Click Element    ${locator_product_collection}
    #点击选中所有专辑
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    #点击删除按钮
    Wait And Click Element    dom:document.querySelectorAll(".batchSelectTable_btn___40HNR")[0]
    #点击确定按钮
    Wait And Click Element    ${locator_products_save_product}
    Go TO    ${home_page}

Add Order Products
    [Documentation]    添加订单和checkout所需商品
    Go To Products Page
    Add Product Required Content
    # add other content
    Wait And Input Text    ${locator_products_addSubTitle}    ${content_products_addSubTitle}    # 添加副标题
    Wait And Input Text    ${locator_products_addRawPrice}    ${content_products_addRawPrice}    # 添加原价
    Wait And Input Text    ${locator_products_addWeight}    ${content_products_addWeight}    # 添加重量
    Wait And Click Element    id:status
    # add image
    Execute JavaScript    return document.getElementById("test_upload_btn").scrollIntoView()
    Wait Until Element Is Visible    ${locator_products_uploadBtn}
    log    ${CURDIR}
    Choose File    ${locator_products_chooseFile}    ${file_products_addImg}    # 选择文件并自动上传
    Sleep    5
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
