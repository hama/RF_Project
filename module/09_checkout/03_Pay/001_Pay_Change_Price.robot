*** Settings ***
Documentation     在支付界面返回后台修改本次购买的商品价格，再返回支付界面点击pay now，将以原来的价格支付成功
Suite Setup       Products Suite Setup
Suite Teardown    Products Suite Teardown
Test Setup        Products Test Case Setup
Test Teardown     Products Test Case Teardown
Force Tags        Checkout
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_products.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_products.robot

*** Variables ***
${price1}         666    # 第一次修改的售价
${name}           ceshi    # 满减活动的名称
${full}           10    # 满多少
${cut}            3    # 减多少
${tax_price}      1    # 修改后的税费
${last_name}      l    # 输入的last name

*** Test Cases ***
checkout138
    [Documentation]    在支付界面返回后台修改本次购买的商品价格，再返回支付界面点击pay now，将以原来的价格支付成功
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #选中商品，点击进入checkout页面
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #返回后台页面修改商品售价
    Select Window    店匠科技
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #修改售价
    Wait And Input Text    id:price    ${price1}
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
    #切换到支付页
    Select Window    title=${content_store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.
    #view orders
    Wait And Click Element    dom:document.querySelectorAll(".btn2")[1]
    #跳转到my orders页面
    Wait Until Page Contains Element    dom:document.querySelectorAll(".spec_order_item")[0]
    #记录购买的商品价格
    ${buy_price}    Get Text    dom:document.querySelectorAll(".spec_order_item")[0]
    ${buy_price}    searchStrs    ${buy_price}
    #与之前添加的价格应该相同
    Should Be Equal As Strings    ${buy_price}    ${content_products_addPrice}

checkout139
    [Documentation]    在支付界面返回后台修改本次购买的商品状态为下架，再返回支付界面点击pay now，支付失败
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #选中商品，点击进入checkout页面
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #返回后台页面修改商品状态为下架
    Select Window    店匠科技
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #修改状态
    Wait And Click Element    id:status
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
    #切换到支付页
    Select Window    title=${content_store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #支付失败
    Page Should Contain    ${content_payment_failed}

checkout141
    [Documentation]    在支付界面返回后台删除本次购买的子商品，再返回支付界面点击pay now，支付失败
    [Tags]    P0
    #-----------------------------------------选中一个有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #给该商品增加子产品
    Add_Sub_Product_With_Already_Product
    Select_Order_Page_With_Sub_Product    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个有子商品的商品，进入到支付页面------------------------------------------
    #返回后台页面删除该商品
    Select Window    店匠科技
    Delete_Sub_Product_With_Already_Product    0
    Select Window    title=${content_store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #支付失败
    Page Should Contain    ${content_payment_failed}

checkout142
    [Documentation]    在支付界面返回后台删除其他的子商品，再返回支付界面点击pay now，支付成功
    [Tags]    P0
    #-----------------------------------------选中一个有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #给该商品增加子产品
    Add_Sub_Product_With_Already_Product
    Select_Order_Page_With_Sub_Product    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个有子商品的商品，进入到支付页面------------------------------------------
    #返回后台页面删除其他商品
    Select Window    店匠科技
    Delete_Sub_Product_With_Already_Product    1
    Select Window    title=${content_store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.

checkout143
    [Documentation]    在支付界面返回后台新增一个子商品，再返回支付界面点击pay now，支付成功
    [Tags]    P0
    #-----------------------------------------选中一个有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #给该商品增加子产品
    Add_Sub_Product_With_Already_Product
    Select_Order_Page_With_Sub_Product    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个有子商品的商品，进入到支付页面------------------------------------------
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.

checkout144
    [Documentation]    先设置商品为跟踪库存并且库存为0时可购买,点击商品预览后，点击进入checkout页面，在点击pay now前，在后台修改该商品取消勾选库存为0时可购买
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #勾选该商品库存为0时仍可购买
    Select_Quantity_0
    Go To Products Page
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #在后台修改该商品取消勾选库存为0时可购买
    Select Window    店匠科技
    Cancel_Select_Quantity_0
    #切换到商品submit页
    Select Window    title=${content_store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.

checkout145
    [Documentation]    先设置商品为跟踪库存并且库存为0时可购买,点击商品预览后，点击进入checkout页面，在点击pay now前，在后台修改该商品取消勾选库存为0时可购买,取消跟踪库存
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #勾选该商品库存为0时仍可购买
    Select_Quantity_0
    Go To Products Page
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #在后台修改该商品取消跟踪库存
    Select Window    店匠科技
    Cancel_Select_Quantity
    #切换到商品submit页
    Select Window    title=${content_store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.

checkout146
    [Documentation]    先设置商品为跟踪库存并且库存为10,点击商品预览后，点击进入checkout页面，在点击pay now前，在后台修改该商品库存为0，支付成功
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #设置该商品的库存为10
    Set_Quantity    10
    Go To Products Page
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #设置该商品的库存-0
    Select Window    店匠科技
    Set_Quantity_To_0
    #切换到商品submit页
    Select Window    title=${content_store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.

checkout147
    [Documentation]    先设置商品为跟踪库存并且库存为5,点击商品预览后，点击进入checkout页面，在点击pay now前，在后台修改该商品库存为10，支付成功
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面-----------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #设置该商品的库存为10
    Set_Quantity    5
    Go To Products Page
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #设置该商品的库存-0
    Select Window    店匠科技
    Set_Quantity    10
    #切换到商品submit页
    Select Window    title=${content_store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.

checkout150
    [Documentation]    点击商品预览后，点击进入checkout页面，在点击pay now前，在后台更换该商品图片，支付界面应该显示最新图片
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    5
    #划到底部
    Execute Javascript    return document.querySelectorAll(".row___3Mua7")[0].scrollIntoView()
    #记录下当前图片src
    ${src}    Execute Javascript    return document.querySelectorAll(".center___1nHSZ")[0].src
    ${src}    getImgName    ${src}
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #更换该商品图片
    Select Window    店匠科技
    To_Change_Image
    #点击保存
    Wait And Click Element    ${locator_products_save_product}
    Sleep    5
    #切换到商品submit页
    Select Window    title=${content_store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.
    #view orders
    Wait And Click Element    dom:document.querySelectorAll(".btn2")[1]
    #跳转到my orders页面
    Wait Until Page Contains Element    dom:document.querySelectorAll(".spec_order_item")[0]
    #获取订单信息中的图片src
    ${src2}    Execute Javascript    return document.querySelectorAll(".order_item img")[0].src
    ${src2}    getImgName2    ${src2}
    #订单信息中的图片应该为修改之前的图片
    Should Be Equal As Strings    ${src}    ${src2}

checkout151
    [Documentation]    此时第一个商品下有两个子产品，在点击pay now按钮之前，删除当前第一个商品下的所有子商品（一共有两个子产品），支付失败
    [Tags]    P0
    #-----------------------------------------选中一个有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #给该商品增加子产品
    Add_Sub_Product_With_Already_Product
    Select_Order_Page_With_Sub_Product    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个有子商品的商品，进入到支付页面------------------------------------------
    #返回后台删除该商品的所有子商品
    Select Window    店匠科技
    Delete_All_Sub_Product_With_Already_Product
    Select Window    title=${content_store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.

checkout167
    [Documentation]    修改其他国家税费金额
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    Select_Order_Page    ${title}
    #填写地址信息，保存并点击submit后，进入支付页面
    Complete_Order_Message
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    Select Window    店匠科技
    #修改其他国家税费金额
    Modify_Other_Tax_Price
    Select Window    title=${content_store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.

checkout168
    [Documentation]    结账设置中将只填写邮箱改为只填写手机或者手机邮箱都需填写，点击pay now后只显示邮箱，不显示未输入的手机号
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #先设置成只需填写邮箱
    Modify_Set    0
    Sleep    5
    Go To Products Page
    Sleep    5
    Select_Order_Page    ${title}
    #填写完地址信息(只填写邮箱)，不点击提交按钮
    Complete_Order_Message_Without_Phone
    #点击submit按钮
    Wait And Click Element    id:submitMbPay
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    Select Window    店匠科技
    #修改为填写手机和邮箱
    Modify_Set    2
    Sleep    5
    Select Window    title=${content_store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.
    #只显示邮箱信息，页面上不存在手机号
    Page Should Not Contain    15297989918

checkout169
    [Documentation]    结账设置中改变姓名填写格式，pay now后支付成功页面还是显示原来的信息（先设置成只填写姓名，再设置成都要填写）
    [Tags]    P0
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #获取第一个商品名称
    Assign id To Element    ${locator_products_first_name}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #先设置成（姓名）
    Modify_Set_Radio    0
    Sleep    5
    Go To Products Page
    Sleep    5
    Select_Order_Page    ${title}
    #填写完地址信息(只填写first name)，不点击提交按钮
    Complete_Order_Message_Without_Last_name
    #点击submit按钮
    Wait And Click Element    id:submitMbPay
    #-----------------------------------------选中一个没有子商品的商品，进入到支付页面------------------------------------------
    #进入后台，修改为(姓名分开填写)
    Select Window    店匠科技
    Modify_Set_Radio    1
    #跳回checkout页
    Select Window    title=${content_store_name}
    #点击pay now
    Wait And Click Element    dom:document.querySelectorAll(".submitPaymentMb")[0]
    #显示支付成功
    Wait Until Element Is Visible    dom:document.querySelectorAll(".show_success")[0]
    Page Should Contain    Your order has been submitted successfully.
    #不包含last name
    Element Should Not Contain    dom:document.querySelectorAll(".content div")[0]    ${last_name}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Default User
    Start Ajax Listener

Products Suite Teardown
    [Documentation]    删除商品
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page
    Add Product_Up
    Sleep    8
    Go To Products Page

Products Test Case Teardown
    Select Window    店匠科技
    Go To Products Page
    Delete_First_Product
    Teardown Test Case
