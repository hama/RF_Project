*** Settings ***
Documentation     将本次购买的商品下架，submit之后直接显示"支付失败"
Suite Setup       Products Suite Setup

Suite Teardown    Close Test Suite Browser
Test Teardown     Teardown Test Case
Force Tags        Checkout
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_products.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_products.robot
Resource          ../../../resources/keywords/kw_checkout.robot

*** Variable ***
${name}           Cash on Delivery222
${tax_price}      1

*** Test Cases ***
checkout105
    [Documentation]    "1.将本次购买的商品下架2.点击submit" submit之后直接跳转到支付失败界面
    [Tags]    P0
    #获取第一个商品名称
    Common Add GoTo Page
    Wait Until Element Is Visible    ${locatorB_productsMgmt_text_firstProductName}
    ${title}    Get Text    ${locatorB_productsMgmt_text_firstProductName}
    Select_Order_Page    ${title}
    #返回后台页面修改商品状态为下架
    Select Window    店匠科技
    #点击第一件商品进入商品详情页
    Click And Page Contains Element With Refresh    dom:document.querySelectorAll(".ant-table-tbody tr")[0]    ${locatorB_productsNew_tabindex_status}
    #修改状态
    Sleep    2
    Wait And Click Element    ${locatorB_productsNew_tabindex_status}
    #点击保存
    Click And Page Contains Element With Refresh    ${locatorB_products_button_confirm}    ${locatorB_productsMgmt_text_firstProductName}
    #切换到商品submit页
    Select Window    title=${user_default_domain}
    Complete_Order_Message
    #支付页面应该显示支付失败
    Wait Until Page Contains    ${contentB_payment_failed}

checkout107
    [Documentation]    此时第一个商品下有两个子产品，删除当前第一个商品下的第1个子商品（第一个子产品为下单时选中的子产品）
    [Tags]    P0
    Common Click Header
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #给该商品增加子产品
    Add_Sub_Product_With_Already_Product
    Select_Order_Page_With_Sub_Product    ${title}
    Select Window    店匠科技
    Delete_Sub_Product_With_Already_Product    2
    Select Window    title=${user_default_domain}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Complete_Order_Message
    #支付页面应该显示支付失败
    Wait Until Page Contains    ${contentB_payment_failed}

checkout108
    [Documentation]    删除其他子商品，可支付成功
    [Tags]    P0
    Common Click Header
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #给该商品增加子产品
    Add_Sub_Product_With_Already_Product
    Select_Order_Page_With_Sub_Product    ${title}
    Select Window    店匠科技
    Delete_Sub_Product_With_Already_Product    1
    Select Window    title=${user_default_domain}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Complete_Order_Message
    Execute Javascript    return document.querySelectorAll('label[for="cod"]')[0].scrollIntoView()
    Wait And Click Element    ${locator_checkout_payment_cod_elm}
    #点击pay now
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    #显示支付成功
    Wait Until Page Contains    ${locatorB_checkout_submitOrderPass_msg}

checkout109
    [Documentation]    添加一个子商品，支付成功
    [Tags]    P0
    Common Add GoTo Page
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #给该商品增加子产品
    Add_Sub_Product_With_Already_Product
    Select_Order_Page_With_Sub_Product    ${title}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Complete_Order_Message
    Execute Javascript    return document.querySelectorAll('label[for="cod"]')[0].scrollIntoView()
    Wait And Click Element    ${locator_checkout_payment_cod_elm}
    #点击pay now
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    #显示支付成功
    Wait Until Page Contains    ${locatorB_checkout_submitOrderPass_msg}

checkout110
    [Documentation]    先设置商品为跟踪库存并且库存为0时可购买,点击商品预览后，点击进入checkout页面，在点击Submit前，在后台修改该商品取消勾选库存为0时可购买
    [Tags]    P0
    Common Add GoTo Page
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #勾选该商品库存为0时仍可购买
    Select_Quantity_0
    Go To Products Page
    Select_Order_Page    ${title}
    #返回后台页面取消勾选该商品库存为0时仍可购买
    Select Window    店匠科技
    Cancel_Select_Quantity_0
    #切换到商品submit页
    Select Window    title=${user_default_domain}
    #Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Complete_Order_Message
    #支付页面应该显示支付失败
    Wait Until Page Contains    ${contentB_payment_failed}

checkout111
    [Documentation]    先设置商品为跟踪库存并且库存为0时可购买,点击商品预览后，点击进入checkout页面，在点击Submit前，在后台修改该商品取消勾选库存为0时可购买,取消跟踪库存
    [Tags]    P0
    Common Add GoTo Page
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #勾选该商品库存为0时仍可购买
    Select_Quantity_0
    Go To Products Page
    Select_Order_Page    ${title}
    #返回后台页面取消勾选该商品库存为0时仍可购买
    Select Window    店匠科技
    Cancel_Select_Quantity
    #切换到商品submit页
    Select Window    title=${user_default_domain}
    Complete_Order_Message
    #支付页面应该显示支付失败
    Wait Until Page Contains    ${contentB_payment_failed}
    

checkout112
    [Documentation]    先设置商品为跟踪库存并且库存为1,点击商品预览后，点击进入checkout页面，在点击Submit前，在后台修改该商品库存为0
    [Tags]    P0
    Common Add GoTo Page
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #设置该商品的库存为1
    Set_Quantity    1
    Go To Products Page
    Select_Order_Page    ${title}
    #设置该商品的库存-0
    Select Window    店匠科技
    Set_Quantity_To_0
    #切换到商品submit页
    Select Window    title=${user_default_domain}
    Complete_Order_Message
    #支付页面应该显示支付失败
    Wait Until Page Contains    ${contentB_payment_failed}

checkout113
    [Documentation]    先设置商品为跟踪库存并且库存为1,点击商品预览后，点击进入checkout页面，在点击Submit前，在后台修改该商品库存为2
    [Tags]    P0
    Common Add GoTo Page
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #设置该商品的库存为1
    Set_Quantity    1
    Go To Products Page
    Select_Order_Page    ${title}
    #设置该商品的库存为2
    Select Window    店匠科技
    Set_Quantity    2    true
    #切换到商品submit页
    Select Window    title=${user_default_domain}
    Complete_Order_Message
    #支付页面应该显示支付失败
    Wait Until Page Contains    ${contentB_payment_failed}

checkout116
    [Documentation]    点击商品预览后，点击进入checkout页面，在点击Submit前，在后台更换该商品图片
    [Tags]    P0
    Common Add GoTo Page
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    Select_Order_Page    ${title}
    #更换该商品图片
    Select Window    店匠科技
    To_Change_Image
    #点击保存
    Wait And Click Element    ${locatorB_products_button_confirm}
    Sleep    2
    #切换到商品submit页
    Select Window    title=${user_default_domain}
    Complete_Order_Message
    #支付页面应该显示支付失败
    Wait Until Page Contains    ${contentB_payment_failed}

checkout127
    [Documentation]    关闭“货到付款”支付方式，在支付界面不显示“货到付款”的支付方式（若之前货到付款是开启的，把支持货到付款的物流方案都删除，则会自动关闭”货到付款“的支付方式）
    [Tags]    P0
    Common Add GoTo Page
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #进入设置-收款渠道，关闭货到付款
    Del Payment Cod Wait
    Select_Order_Page    ${title}
    Complete_Order_Message
    #不应该包含货到付款等字样
    Page Should Not Contain    ${locatorB_checkout_Cod_font}

checkout128
    [Documentation]    开启“货到付款”支付方式，在支付界面显示“货到付款”的支付方式（若之前货到付款是开启的，把支持货到付款的物流方案都删除，则会自动关闭”货到付款“的支付方式）
    [Tags]    P0
    Common Add GoTo Page
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #进入设置-收款渠道，开启货到付款
    Add Payment Cod Wait
    Select_Order_Page    ${title}
    Complete_Order_Message
    #应该包含货到付款等字样
    Wait Until Page Contains    ${locatorB_checkout_Cod_font}

checkout129
    [Documentation]    开启“货到付款”支付方式，在支付界面显示“货到付款”的支付方式（若之前货到付款是开启的，把支持货到付款的物流方案都删除，则会自动关闭”货到付款“的支付方式）
    [Tags]    P0
    Common Add GoTo Page
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #进入设置-收款渠道，开启货到付款
    Add Payment Cod Wait
    Select_Order_Page    ${title}
    Complete_Order_Message
    #应该包含货到付款等字样
    Wait Until Page Contains    ${locatorB_checkout_Cod_font}
    
checkout130
    [Documentation]    "1.税费关闭时开启 2.点击submit"  > 提交成功，跳转到支付界面，价格刷新，收取税费
    [Tags]    P0
    Common Add GoTo Page
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    Select_Order_Page    ${title}    
    #返回后台页面修改商品-对此商品收税
    Select Window    店匠科技
    #点击第一件商品进入商品详情页
    Click And Page Contains Element With Refresh    dom:document.querySelectorAll(".ant-table-tbody tr")[0]    ${locatorB_productsNew_tabindex_status}
    Sleep    2
    Wait And Click Element    dom:document.querySelectorAll(".operableTxt___ycvdI span")[2]
    #点击保存
    Click And Page Contains Element With Refresh    ${locatorB_products_button_confirm}    ${locatorB_productsMgmt_text_firstProductName}
    Select Window    title=${user_default_domain}
    Complete_Order_Message
    Wait Until Page Contains    ${contentB_payment_failed}


checkout133
    [Documentation]    进入到checkout页面后，修改其他国家税费金额，再点击submit
    [Tags]    P0
    Add Product Wait
    Add OtherTaxPrice Wait
    Add Payment Cod Wait
    Go To Products Page
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #修改其他国家税费金额
    Select_Order_Page    ${title}
    Complete_Order_Message
    #点击pay now
    Execute Javascript    return document.querySelectorAll("label[for='cod']")[0].scrollIntoView()
    Wait And Click Element    ${locator_checkout_payment_cod_elm}
    Wait And Click Element    ${locator_checkout_submit_save_btn}
    #显示支付成功
    Wait Until Page Contains    ${locatorB_checkout_submitOrderPass_msg}

checkout134
    [Documentation]    进入到checkout页面后，填写完地址信息（邮箱）后，返回后台修改结账设置改为两者都需填写，再去checkout页面点击submit，页面将会刷新，地址信息将会变成两者都需填写
    [Tags]    P0
    Common Add GoTo Page
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #先设置成只需填写邮箱
    Add StoreInfo Wait    ''    ''   
    #进入checkout页面
    Select_Order_Page    ${title}
    #填写完地址信息(只填写邮箱)，不点击提交按钮
    Complete_Order_Message_Without_Phone
    #进入后台，修改为填写手机和邮箱
    Select Window    店匠科技
    Add StoreInfo Wait    ''    ''
    #跳回checkout页
    Select Window    title=${user_default_domain}
    #手机
    Element Should Be Visible    ${locatorB_checkout_address_phone}
    #邮箱
    Element Should Be Visible    ${locatorB_checkout_address_email}

checkout135
    [Documentation]    进入到checkout页面后，填写完地址信息后(姓名分开填写)，返回后台修改结账设置改为（姓名），再去checkout页面点击submit，页面将会刷新，地址信息将会刷新变化
    [Tags]    P0
    Common Add GoTo Page
    #. 修改付款流程的地址为 输入名字
    Change Checkout Setp Wait    ${empty}
    #获取第一个商品名称
    Assign id To Element    ${locatorB_productsMgmt_text_firstProductName}    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #进入checkout页面
    Select_Order_Page    ${title}
    #填写完地址信息(只填写邮箱)，不点击提交按钮
    Complete_Order_Message_Without_Last_name
    #点击添加地址信息
    Wait And Click Element    id:changeaddress
    #last_name
    Wait Until Element Is Not Visible    ${locatorB_checkout_address_last_name}

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Default User
    Add Payment Cod Wait
    #.将结账流程的 地址里的 姓名输入改回来
    Change Checkout Setp Wait    2



Common Click Header
    [Documentation]    头部公共点击步骤
    Add Product Wait
    Go To Home By Url
    Go To Products Page

Common Add GoTo Page
    [Documentation]    共用部分
    Add Product Wait
    Go To Products Page

