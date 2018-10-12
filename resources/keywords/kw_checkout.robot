*** Settings ***
Documentation     checkout 公共方法
Resource          ../variable/var_common.robot
Resource          ../variable/var_checkout.robot
Library           ${CURDIR}/../../lib/customlib/kwproduct.py
Library           ${CURDIR}/../../lib/customlib/kwshipping.py
Library           ${CURDIR}/../../lib/customlib/kwtax.py
Library           ${CURDIR}/../../lib/customlib/kwmarketing.py
Library           ${CURDIR}/../../lib/customlib/lib_utils.py

Library           ${CURDIR}/../../lib/customlib/kwcheckout.py

*** keywords ***
Add Shipping The Freight
    [Documentation]    封装添加运费
    Go To Shipping Page
    #.创建一个中国的物流方案
    Taxprice New Shipping China


Click Preview Step
    [Documentation]    点击预览的公共步骤
    Go To Product Management Page
    Sleep Time
    Wait And Click Element    ${locatorB_productsMgmt_icon_preview}
    Sleep Time
    Select Window    New
    Sleep Time

Common Teardown
    [Documentation]    结束公共步骤
    Close Test Suite Browser
<<<<<<< HEAD
=======
    kwshipping.del_all_shipping_py
>>>>>>> 05e6e30870962438b3e4a12d6dadd72748c57378


    #.关闭PC优化
    kwcheckout.start_pc_show_py

Checkout Common Step Out
    [Documentation]    checkout Suite Setup 开始
    #.登陆
    Login With Default User
    #.添加中国的物流
    kwshipping.add_shipping_py
    #.添加一个上架商品
    kwproduct.add_launched_product_py
    #.chechout 运行环境的初始化
    kwcheckout.set_checkout_process_py


Chenckout Product Initial
    [Documentation]    创建订单的初始化
    kwproduct.add_launched_product_py

Chenckout Add Shipping BouvetIsland
    [Documentation]    添加一个Bouvet Island国家物流信息
    &{conf}=   Create Dictionary
    ...    shipping_area=[{"country_id":"29","zone_ids":"-1"}]
    ...    shipping_name=autotest_shipping001
    kwshipping.add_shipping_with_conf_py    ${conf}

Chenckout Del Shipping Information
    [Documentation]    初始化物流信息，删除全部物流信息
    #.初始化物流信息
    kwshipping.del_all_shipping_py























Checkout Common Setp
    [Documentation]    封装公共步骤
    Go To    ${home_page}
    Sleep Time
    Wait And Click Element    ${locatorB_products}
    #点击商品预览
    Sleep Time
    Wait And Click Element    ${locatorB_productsMgmt_icon_listPreview}[0]
    Sleep Time    #.休息2s
    #.第二个窗口
    Select Window    New
    Sleep Time

Add Address Common Step
    [Documentation]    添加地址公共部分
    Wait And Input Text    ${locatorB_checkout_address_first_name}    123
    Wait And Input Text    ${locatorB_checkout_address_last_name}    345
    Select From List    ${locatorB_checkout_address_select_country}    China
    Wait And Input Text    ${locatorB_checkout_address_city}    深圳
    Wait And Input Text    ${locatorB_checkout_address_add}    深圳123
    Wait And Input Text    ${locatorB_checkout_address_zip}    123456
    Wait And Input Text    ${locatorB_checkout_address_email}    123456@zz.xx
    Wait And Input Text    ${locatorB_checkout_address_phone}    123456789
    Wait And Input Text    ${locatorB_checkout_address_company}    123456789

Add Credit Card Info
	[Documentation]    添加信用卡公共部分
	Wait And Input Text    ${locatorB_checkout_creditCard_input_name}    aaaaa
	Wait And Input Text    ${locatorB_checkout_creditCard_input_email}    123456@zz.xx
	Wait And Input Text    ${locatorB_checkout_creditCard_input_phone}    123456789
	Wait And Input Text    ${locatorB_checkout_creditCard_input_post}    0000
	Wait And Input Text    ${locatorB_checkout_creditCard_input_number}    123123123
	Wait And Input Text    ${locatorB_checkout_creditCard_input_expireDate}    1231
	Wait And Input Text    ${locatorB_checkout_creditCard_input_securityCode}    123

Add Payment
    [Documentation]    B端添加支付方式
    Go To    ${home_page}
    Wait And Click Element    ${locatorB_setting}    #.点击设置按钮
    Wait And Click Element    ${locatorB_setting_payment}    #.点击收款渠道按钮
    ${button}    Execute JavaScript    return document.querySelectorAll(".btn___2GFAg")[0]===undefined    #.开始设置按钮
    Run Keyword If    '${button}'=='False'    Wait And Click Element    dom:document.querySelectorAll(".btn___2GFAg")[0]
    ${condition}    Execute JavaScript    return document.querySelectorAll(".ant-switch-checked")[0]===undefined
    Run Keyword If    ${condition}    Wait And Click Element    dom:document.querySelectorAll("button")[1]    #.点击激活
    Run Keyword If    ${condition}    Wait And Click Element    dom:document.querySelectorAll("button")[0]    #.点击绑定按钮
    Run Keyword If    ${condition}    Wait And Click Element    dom:document.querySelectorAll("button")[1]    #.点击编辑
    Run Keyword If    ${condition}    Wait And Input Text    dom:document.querySelectorAll("#client_id")[0]    123456    #.绑定账号
    Run Keyword If    ${condition}    Wait And Input Text    dom:document.querySelectorAll("#secret_key")[0]    123123    #.绑定密码
    Run Keyword If    ${condition}    Wait And Click Element    dom:document.querySelectorAll("button")[2]    #.点击绑定按钮
    Run Keyword If    ${condition}    Wait And Click Element    class:ant-switch    #.点击开启按钮
    Run Keyword If    ${condition}    Wait And Click Element    dom:document.querySelectorAll("button")[6]    #.点击确定
    Sleep Time

Add Cod Payment
    [Documentation]    添加COD支付
    Go To    ${home_page}
    Wait And Click Element    ${locatorB_setting}    #.点击设置按钮
    Wait And Click Element    ${locatorB_setting_payment}    #.点击收款渠道按钮
    ${button}    Execute JavaScript    return document.querySelectorAll(".btn___2GFAg")[0]===undefined    #.开始设置按钮
    Run Keyword If    '${button}'=='False'    Wait And Click Element    dom:document.querySelectorAll(".btn___2GFAg")[0]
    ${condition}    Execute JavaScript    return document.querySelectorAll(".ant-switch-checked")[1]===undefined
    Run Keyword If    ${condition}    Wait And Click Element    dom:document.querySelectorAll(".ant-switch")[1]
    Run Keyword If    ${condition}    Wait And Click Element    dom:document.querySelectorAll("button")[5]
    Sleep Time

Checkout_Common_Address_Step
    [Documentation]    checkout页面 点击buynow-保存-提交 三步
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_btn}

Checkout_Common_Checkout_Step
    [Documentation]    checkout页面 点击buynow-保存-提交
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}

Sleep Time
    [Documentation]    睡眠时间 2s
    Sleep    2

Select_Order_Page
    [Arguments]    ${title}
    [Documentation]    点击预览第一个商品，跳转到商品详情页，点击submit按钮进入订单信息页面
    #点击第一个商品的预览icon
    Wait And Click Element    ${locatorB_productsMgmt_icon_listPreview}[0]
    #跳转到商品详情页
    Select Window    title=${title}
    Sleep    2
    #跳转到页面底部
    Execute Javascript    return document.querySelectorAll(".style-1")[0].scrollIntoView()
    #点击submit
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #进入到填写订单信息页面
    Wait And Click Element    ${locatorB_checkout_submit_btn_s}

Select_Order_Page_With_Sub_Product
    [Arguments]    ${title}
    [Documentation]    点击预览第一个商品，跳转到商品详情页，选中一个子产品后，点击submit按钮进入订单信息页面
    #点击第一个商品的预览icon
    Wait And Click Element    ${locatorB_productsMgmt_icon_listPreview}[0]
    #跳转到商品详情页
    Select Window    title=${title}
    Sleep    2
    #跳转到页面底部
    Execute Javascript    return document.querySelectorAll(".style-1")[0].scrollIntoView()
    #点击submit
    Wait And Click Element    ${locatorB_checkout_by_now_btn}
    #选中第一个规格属性
    Wait And Click Element    dom:document.querySelectorAll(".attribute-item")[0]
    #进入到填写订单信息页面
    Wait And Click Element    dom:document.querySelectorAll(".item-Color")[1]
    Wait And Click Element    dom:document.querySelectorAll(".footer-submit")[0]

Complete_Order_Message
    [Documentation]    点击添加地址按钮，填写信息，点击保存按钮，点击进入支付页
    #添加地址信息
    #${type}    Execute JavaScript    return document.querySelectorAll("#addAddress")[0]===undefined
    #Run Keyword If    '${type}'=='False'    Wait And Click Element    id:addAddress
    #first name
    Wait And Input Text    ${locatorB_checkout_address_first_name}    zc
    #last name
    Wait And Input Text    ${locatorB_checkout_address_last_name}    l
    #选择国家
    Select From List By Index    ${locatorB_checkout_address_select_country}    1
    Sleep    2
    #选择身份
    Select From List By Index    id:shipping_zone_id    1
    #city
    Wait And Input Text    ${locatorB_checkout_address_city}    shenzhen
    #address
    Wait And Input Text    ${locatorB_checkout_address_addr}    hhh
    #postal code
    Wait And Input Text    ${locatorB_checkout_address_zip}    333000
    #email
    Wait And Input Text    ${locatorB_checkout_address_email}    1004714019@qq.com
    #phone
    Wait And Input Text    ${locatorB_checkout_address_phone}    15297989918
    #company
    Wait And Input Text    ${locatorB_checkout_address_company}    dianjiangkeji
    #保存填写的地址信息
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}
    #点击Submit按钮进入支付页
    Wait And Click Element    ${locatorB_checkout_address_save_checkout_btn}
    Sleep    2

Complete_Order_Message_Not_Submit
    [Documentation]    点击添加地址按钮，填写信息，点击保存按钮，点击进入支付页
    #添加地址信息
    #Wait And Click Element    id:addAddress
    #first name
    Wait And Input Text    ${locatorB_checkout_address_first_name}    zc
    #last name
    Wait And Input Text    ${locatorB_checkout_address_last_name}    l
    #选择国家
    Select From List By Index    ${locatorB_checkout_address_select_country}    1
    Sleep    2
    #选择身份
    Select From List By Index    id:shipping_zone_id    1
    #city
    Wait And Input Text    ${locatorB_checkout_address_city}    shenzhen
    #address
    Wait And Input Text    ${locatorB_checkout_address_addr}    hhh
    #postal code
    Wait And Input Text    ${locatorB_checkout_address_zip}    333000
    #email
    Wait And Input Text    ${locatorB_checkout_address_email}    1004714019@qq.com
    #phone
    Wait And Input Text    ${locatorB_checkout_address_phone}    15297989918
    #company
    Wait And Input Text    ${locatorB_checkout_address_company}    dianjiangkeji
    #保存填写的地址信息
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}

Complete_Order_Message_Without_Phone
    [Documentation]    点击添加地址按钮，填写信息（只需填写邮箱），点击保存按钮，不点击进入支付页
    #添加地址信息
    #Wait And Click Element    id:addAddress
    #first name
    Wait And Input Text    ${locatorB_checkout_address_first_name}    zc
    #last name
    Wait And Input Text    ${locatorB_checkout_address_last_name}    l
    #选择国家
    Select From List By Index    ${locatorB_checkout_address_select_country}    1
    Sleep    2
    #选择身份
    Select From List By Index    id:shipping_zone_id    1
    #city
    Wait And Input Text    ${locatorB_checkout_address_city}    shenzhen
    #address
    Wait And Input Text    ${locatorB_checkout_address_addr}    hhh
    #postal code
    Wait And Input Text    ${locatorB_checkout_address_zip}    333000
    #email
    Wait And Input Text    ${locatorB_checkout_address_email}    1004714019@qq.com
    #company
    Wait And Input Text    ${locatorB_checkout_address_company}    dianjiangkeji
    #保存填写的地址信息
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}

Complete_Order_Message_Without_Last_name
    [Documentation]    点击添加地址按钮，填写信息（只需填写first name），点击保存按钮，不点击进入支付页
    #添加地址信息
    #first name
    Wait And Input Text    ${locatorB_checkout_address_first_name}    zc
    #选择国家
    Select From List By Index    ${locatorB_checkout_address_select_country}    1
    #city
    Wait And Input Text    ${locatorB_checkout_address_city}    shenzhen
    #address
    Wait And Input Text    ${locatorB_checkout_address_addr}    hhh
    #postal code
    Wait And Input Text    ${locatorB_checkout_address_zip}    333000
    #email
    Wait And Input Text    ${locatorB_checkout_address_email}    1004714019@qq.com
    #phone
    Wait And Input Text    ${locatorB_checkout_address_phone}    15297989918
    #company
    Wait And Input Text    ${locatorB_checkout_address_company}    dianjiangkeji
    #保存填写的地址信息
    Wait And Click Element    ${locatorB_checkout_address_save_address_btn}

Add_Sub_Product_With_Already_Product
    [Documentation]    给第一个现有的无子产品的商品添加两个子产品
    #点击第一件商品进入商品详情页
    Click And Page Contains Element With Refresh    dom:document.querySelectorAll(".ant-table-tbody tr")[0]    dom:document.getElementById("test_variant_setting_btn")
    Sleep    2
    #划到底部
    Execute Javascript    return document.getElementById("test_variant_setting_btn").scrollIntoView()
    #添加选项
    Wait And Click Element    id:test_variant_setting_btn
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    Mouse Over    dom:document.querySelectorAll(".ant-dropdown-trigger")[0]
    Wait And Click Element    dom:document.querySelectorAll(".ant-dropdown-menu-item")[1]
    #添加多个种类
    Wait And Input Text    id:option_values_0    red
    #回车保存
    Press Key    id:option_values_0    \\13
    Wait And Input Text    id:option_values_0    black
    #回车保存
    Press Key    id:option_values_0    \\13
    #点击保存
    Click And Page Contains Element With Refresh    ${locatorB_productsNew_button_save}    ${locatorB_productsMgmt_icon_listPreview}[0]
    Go To Product Management Page
    

Delete_Sub_Product_With_Already_Product
    [Arguments]    ${index}
    [Documentation]    此时第一个商品下有两个子产品，删除当前第一个商品下的第n个子商品（第一个子产品为下单时选中的子产品）
    Go To Product Management Page
    #点击第一件商品进入商品详情页
    Click And Page Contains Element With Refresh    dom:document.querySelectorAll(".ant-table-tbody tr")[0]    document.getElementById("test_single_variant_setting_btn")
    #划到底部
    Execute Javascript    return document.getElementById("test_single_variant_setting_btn").scrollIntoView()
    #删除第n个子商品
    Wait And Click Element    dom:document.querySelectorAll('tbody tr:nth-child(${index}) td i')[1]
    Wait And Click Element    dom:document.querySelectorAll('.ant-btn-sm')[1]
    #点击保存
    Click And Page Contains Element With Refresh    ${locatorB_productsNew_button_save}    ${locatorB_productsMgmt_text_firstProductName}

Select_Quantity_0
    [Documentation]    勾选该商品库存为0时仍可购买
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    2
    #划到底部
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-inner")[1].scrollIntoView()
    Sleep    2
    #点击跟踪库存
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-inner")[2].click()
    #点击库存为0时仍可购买
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-inner")[3].click()
    #点击保存
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Sleep    3

Cancel_Select_Quantity_0
    [Documentation]    取消勾选该商品库存为0时仍可购买
    #点击第一件商品进入商品详情页
    #Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Click And Page Contains Element With Refresh    dom:document.querySelectorAll(".ant-table-tbody tr")[0]    dom:document.querySelectorAll(".ant-checkbox-inner")[1]
    #划到底部
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-inner")[1].scrollIntoView()
    #点击取消库存为0时仍可购买
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-inner")[2].click()
    #点击保存
    Click And Page Contains Element With Refresh    ${locatorB_productsNew_button_save}    ${locatorB_productsMgmt_text_firstProductName}
    #点击确定按钮
    #Wait And Click Element    dom:document.querySelectorAll(".ant-confirm-btns .ant-btn-primary")[0]

Cancel_Select_Quantity
    [Documentation]    取消勾选该商品跟踪库存
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    2
    #划到底部
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-inner")[1].scrollIntoView()
    Sleep    2
    #点击取消库存为0时仍可购买
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-inner")[3].click()
    Sleep    1
    #点击取消跟踪库存
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-inner")[2].click()
    #点击保存
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Sleep    3

Set_Quantity_To_0
    [Documentation]    设置商品的库存为0
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    2
    #划到底部
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-inner")[1].scrollIntoView()
    Sleep    2
    #点击跟踪库存
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-inner")[2].click()
    Sleep    2
    #输入库存数量
    #Wait And Input Text    id:inventory_quantity    0
    #点击保存
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Sleep    2

Set_Quantity
    [Arguments]    ${num}    ${type}=false
    [Documentation]    设置商品的库存
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    2
    #划到底部
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-inner")[1].scrollIntoView()
    Sleep    2
    #点击跟踪库存
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-inner")[2].click()
    Sleep    2
    #输入库存数量
    Run Keyword If    '${type}'=='false'    Wait And Input Text    id:inventory_quantity    ${num}
    #点击保存
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Sleep    3

To_Change_Image
    [Documentation]    更换商品的图片，前提该商品已有一张图片
    Go To Product Management Page
    #点击第一件商品进入商品详情页
    Wait And Click Element    dom:document.querySelectorAll(".ant-table-tbody tr")[0]
    Sleep    2
    #划到底部
    Execute Javascript    return document.querySelectorAll(".ant-checkbox-inner")[2].scrollIntoView()
    Sleep    2
    #删除第一张图片
    Mouse Over    ${locatorB_productsMgmt_image_firstProductThumbnails}
    Wait And Click Element    dom:document.querySelectorAll(".delete")[0]
    #更新另外一张图片
    Sleep    2
    Choose File    ${locatorB_productsNew_input_addImage}    /Users/dianjiang/shoplaza/shoplaza_robot/resources/images/mv.jpg
    Sleep    2

Delete_All_Sub_Product_With_Already_Product
    [Documentation]    此时第一个商品下有两个子产品，删除当前第一个商品下的所有子商品
    Go To Product Management Page
    #点击第一件商品进入商品详情页
    Click And Page Contains Element With Refresh    dom:document.querySelectorAll(".ant-table-tbody tr")[0]    document.getElementById("test_single_variant_setting_btn")
    #划到底部
    Execute Javascript    return document.getElementById("test_single_variant_setting_btn").scrollIntoView()
    Sleep    2
    #点击单一款式按钮
    Wait And Click Element    id:test_single_variant_setting_btn
    #Click And Page Contains Element With Refresh    id:test_single_variant_setting_btn    dom:document.querySelectorAll("button span")[38]
    Sleep    2
    #点击确定按钮
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-body")[0].querySelectorAll(".middle_btn___2ExQc")[0]
    #Execute Javascript    return document.querySelectorAll("button span")[38].click()
    Sleep    2
    #点击保存
    Click And Page Contains Element With Refresh    ${locatorB_productsNew_button_save}    ${locatorB_productsMgmt_text_firstProductName}


End_First_Full_Reduction
    [Documentation]    提前结束第一个满减活动
    #进入满减活动页面
    Go To Marketing Page
    #点击第一个提前结束按钮
    Wait And Click Element    dom:document.querySelectorAll(".stop_icon___1u6D1")[0]
    Wait And Click Element    dom:document.querySelectorAll("button")[5]

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
    Wait And Click Element    ${locatorB_productsNew_button_save}
    Sleep    5

Change_Cash
    Wait And Click Element    dom:document.querySelectorAll("#cod .ant-switch")[0]
    Sleep    5
    Wait And Click Element    ${locatorB_products_popUps_confirm}
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
    Go To Tax Page
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
    Wait And Click Element    ${locatorB_products_popUps_confirm}
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