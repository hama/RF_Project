*** Settings ***
Suite Setup       Login With Default User
Suite Teardown    Close Test Suite Browser
Test Setup        Go To Home Page    #.进入到主页
Test Teardown     Teardown Test Case
Force Tags        Tutorial
Resource          ../../resources/keywords/kw_common.robot


*** Test Cases ***    
BeginnerTutorial001
    [Documentation]    测试概览页面可以正常进入 > 进入概览页面，显示新手教程，添加商品，店铺装饰，物流方案以及收款方式添加
    [Tags]    P0    threshold
    Wait Until Page Contains    1、添加一个商品
    Wait Until Page Contains    2、装修店铺门面
    Wait Until Page Contains    3、设置物流方案
    Wait Until Page Contains    4、设置收款方式

BeginnerTutorial003
    [Documentation]    测试新手教程页面添加商品栏 > 点击去添加按钮时跳转到商品界面，添加商品后返回新手教程商品栏图标变为√，去添加按钮变为已完成并置灰不可点击
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_button_commodity}
    Select Window    New
    kwproduct.add_launched_product_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_overview}
    #.添加完商品返回新手教程，验证
    Focus On New Window
    Element Attribute Should Contain With Wait     ${locatorB_button_commodity}    disabled    ${empty}
    Wait Until Page Contains Text    已完成

BeginnerTutorial008
    [Documentation]    测试新手教程页面店铺装饰栏 > 1.点击去装饰,2.查看结果 > 新开窗口跳转到卡片编辑页面
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_button_decorate}
    Wait Until Page Contains Locator     ${locatorB_theme_button_editor}

BeginnerTutorial009
    [Documentation]    测试新手教程页面店铺装饰栏 > 1.点击去装饰,2.在卡片页面编辑卡片并保存,3.返回新手教程页面查看 > 店铺装饰栏图标变为√，去装饰按钮变为已完成并置灰不可点击
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_button_decorate}
    Select Window    New
    #.打开一个新窗口，聚焦到新窗口操作元素
    Focus On New Window
    #.点击去装修
    Wait And Click Element    ${locatorB_theme_button_editor}
    #.打开一个新窗口，聚焦到新窗口操作元素
    Focus On New Window
    #,点击发布
    Wait And Click Element    dom:document.querySelectorAll('[class*="operation-item"]')[2]
    #.点击确定
    Wait Alert Should Be Present And Accept    确定要保存吗?
    #.返回B端
    Wait And Click Element    dom:document.querySelectorAll('[class*="go_back"]')[0]
    Wait Until Page Contains    概览
    Go To Home Page
    Focus On New Window
    Element Attribute Should Contain With Wait     ${locatorB_button_decorate}    disabled    ${empty}
    Wait Until Page Contains Text    已完成

#因只要创建完物流方案，系统就会默认开启货到付款的支付方式，所以开启支付方式放到添加物流之前执行
BeginnerTutorial014
    [Documentation]    测试新手教程页面物流栏 > 1.点击去配置按钮 > 跳转到支付方式设置界面
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_button_collection}
    Select Window    New
    Wait Until Page Contains    信用卡收款
    Wait Until Page Contains    货到付款

BeginnerTutorial015
    [Documentation]    测试新手教程页面物流栏 >  添加支付方式 > 收款方式栏图标变为√，去配置按钮变为已完成并置灰不可点击
    [Tags]    P1    threshold
    Wait And Click Element    ${locatorB_button_collection}
    Select Window    New
    #激活COD货到付款方式
    kwpayment.activate_payment_cod_py
    #.激活stripe 信用卡支付方式
    kwpayment.activate_payment_credit_card_py
    #.刷新
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_overview}
    #.添加完商品返回新手教程，验证
    Focus On New Window
    Element Attribute Should Contain With Wait     ${locatorB_button_collection}    disabled    ${empty}
    Wait Until Page Contains Text    已完成
    #关闭credit_card  信用卡支付方式
    kwpayment.inactivate_payment_credit_card_py

BeginnerTutorial011
    [Documentation]    测试新手教程页面物流栏 > 1.点击去设置按钮,2.查看界面 > 跳转到物流设置界面
    [Tags]    P1    threshold
    #.点击去物流页面
    Wait And Click Element    ${locatorB_button_shipping}
    Wait Until Page Contains    物流方案

BeginnerTutorial012
    [Documentation]    测试新手教程页面物流栏 > 添加物流 > 物流栏图标变为√，去设置按钮变为已完成并置灰不可点击
    [Tags]    P1    threshold
    #.点击去物流页面
    Wait And Click Element    ${locatorB_button_shipping}
    Select Window    New
    kwshipping.add_shipping_with_conf_py
    Reload Page And Start Ajax
    Wait And Click Element    ${locatorB_overview}
    Focus On New Window
    Wait Until Page Contains Locator     ${locatorB_overview_notPay}





#BeginnerTutorial018
#    [Documentation]    测试新手教程变为概览数据页面 > 所有教程完成是概览页面会变为数据统计页面
#   [Tags]    P1    threshold
#    #.添加支付方式
#    kwpayment.activate_payment_cod_py
#    #.添加商品
#    kwproduct.add_launched_product_py
#    #添加一个物流
#    &{conf}=   Create Dictionary
#    ...    shipping_area=[{"country_id":"45","zone_ids":"-1"}]
#    ...    shipping_name=shipping_yunfei
#    kwshipping.add_shipping_with_conf_py    ${conf}


