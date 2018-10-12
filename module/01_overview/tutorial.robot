*** Settings ***
Suite Setup       Common Suite
Suite Teardown    Close Test Suite Browser
Test Setup        del_tutorial    #.删除所有的新手教程前置信息
Test Teardown     Teardown Test Case
Force Tags        Tutorial
Resource          ../../resources/keywords/kw_browser.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/variable/var_common.robot
Library           ${CURDIR}/../../lib/customlib/kwproduct.py
Library           ${CURDIR}/../../lib/customlib/kwstore.py
Library           ${CURDIR}/../../lib/customlib/kwshipping.py
Library           ${CURDIR}/../../lib/customlib/kwpayment.py


*** Test Cases ***    
BeginnerTutorial001
    [Documentation]    测试概览页面可以正常进入 > 进入概览页面，显示新手教程，添加商品，店铺装饰，物流方案以及收款方式添加
    [Tags]    P0    threshold
    Go To Home Page
    Wait Until Page Contains    1、添加一个商品
    Wait Until Page Contains    2、装修店铺门面
    Wait Until Page Contains    3、设置物流方案
    Wait Until Page Contains    4、设置收款方式

BeginnerTutorial003
    [Documentation]    测试新手教程页面添加商品栏 > 点击去添加按钮时跳转到商品界面，添加商品后返回新手教程商品栏图标变为√，去添加按钮变为已完成并置灰不可点击
    [Tags]    P1    threshold
    add_discontinued_product_py
    Execute JavaScript    return location.reload()
    Wait Until Page Contains Locator    dom:document.querySelectorAll('button span')[0]
    ${res}    Execute JavaScript    return document.querySelectorAll('button')[0].innerText
    Should Be True    '${res}'=='已完成'

BeginnerTutorial005
    [Documentation]    测试新手教程页面添加商品栏 > 点击去添加按钮时跳转到商品界面，上传商品后返回新手教程商品栏图标变为√，去添加按钮变为已完成并置灰不可点击
    [Tags]    P1    threshold
    add_discontinued_product_py
    Execute JavaScript    return location.reload()
    Wait Until Page Contains Locator    dom:document.querySelectorAll('button span')[0]
    ${res}    Execute JavaScript    return document.querySelectorAll('button')[0].innerText
    Should Be True    '${res}'=='已完成'
    
BeginnerTutorial008
    [Documentation]    测试新手教程页面店铺装饰栏 > 1.点击去装饰,2.查看结果 > 新开窗口跳转到卡片编辑页面
    [Tags]    P1    threshold
    Wait Until Page Contains Locator    dom:document.querySelectorAll('button span')[1]
    #.点击去装修
    Wait And Click Element    dom:document.querySelectorAll('button')[1]
    Select Window    New
    Wait Until Page Contains    预览模式

BeginnerTutorial009
    [Documentation]    测试新手教程页面店铺装饰栏 > 1.点击去装饰,2.在卡片页面编辑卡片并保存,3.返回新手教程页面查看 > 店铺装饰栏图标变为√，去装饰按钮变为已完成并置灰不可点击
    [Tags]    P1    threshold
    Wait Until Page Contains Locator    dom:document.querySelectorAll('button span')[1]
    #.点击去装修
    Wait And Click Element    dom:document.querySelectorAll('button')[1]
    Select Window    New
    Wait Until Page Contains    预览模式
    #.点击专辑集合
    Wait And Click Element    dom:document.querySelectorAll('.dj-albumCollections')[0]
    #,点击发布
    Wait And Click Element    dom:document.querySelectorAll('.btn___2AIvz')[4]
    #.点击确定
    Wait And Click Element    dom:document.querySelectorAll('button')[3]
    #.返回B端
    Wait And Click Element    dom:document.querySelectorAll('.dj-fanhuishouye')[0]
    Wait Until Page Contains    概览
    Go To Home Page
    Sleep    2
    Wait Until Page Contains Locator    dom:document.querySelectorAll('button')[1]
    ${res}    Execute JavaScript    return document.querySelectorAll('button')[1].innerText
    Should Be True    '${res}'=='已完成'

BeginnerTutorial011
    [Documentation]    测试新手教程页面物流栏 > 1.点击去设置按钮,2.查看界面 > 跳转到物流设置界面
    [Tags]    P1    threshold
    Go To Home Page
    Wait Until Page Contains Locator    dom:document.querySelectorAll('button')[2]
    #.点击去物流页面
    Wait And Click Element    dom:document.querySelectorAll('button')[2]
    Wait Until Page Contains    物流方案

BeginnerTutorial012
    [Documentation]    测试新手教程页面物流栏 > 添加物流 > 物流栏图标变为√，去设置按钮变为已完成并置灰不可点击
    [Tags]    P1    threshold
    Go To Home Page
    #.先删除物流
    kwshipping.del_all_shipping_py
    #. 添加物流
    addShipping_py
    Execute JavaScript    return location.reload()
    Wait Until Page Contains Locator    dom:document.querySelectorAll('button')[2]
    ${res}    Execute JavaScript    return document.querySelectorAll('button')[2].innerText
    Should Be True    '${res}'=='已完成'


BeginnerTutorial014
    [Documentation]    测试新手教程页面物流栏 > 1.点击去配置按钮 > 跳转到支付方式设置界面
    [Tags]    P1    threshold
    Go To Home Page
    Wait And Click Element    dom:document.querySelectorAll('button')[3]
    Select Window    New
    Wait Until Page Contains    信用卡收款
    Wait Until Page Contains    货到付款

BeginnerTutorial015
    [Documentation]    测试新手教程页面物流栏 >  添加支付方式 > 收款方式栏图标变为√，去配置按钮变为已完成并置灰不可点击
    [Tags]    P1    threshold
    Go To Home Page
    #.添加支付方式
    activate_payment_cod_py
    #.刷新
    Execute JavaScript    return location.reload()
    Wait Until Page Contains Locator    dom:document.querySelectorAll('button')[3]
    ${res}    Execute JavaScript    return document.querySelectorAll('button')[3].innerText
    Should Be True    '${res}'=='已完成'
    #.删除支付方式
    inactivate_payment_cod_py

BeginnerTutorial018
    [Documentation]    测试新手教程变为概览数据页面 > 所有教程完成是概览页面会变为数据统计页面
    [Tags]    P1    threshold
    Go To Home Page
    #.添加支付方式
    activate_payment_cod_py
    #.添加商品
    add_discontinued_product_py
    #. 添加物流
    addShipping_py

*** keywords ***
Common Suite
    [Documentation]    公共suite
    Login With Default User

Wait Add Product
    [Documentation]    添加商品
    :FOR    ${i}    IN RANGE    ${count}
    \    ${res_status}    add_discontinued_product_py
    \    Run Keyword If    '${res_status}'=='True'    Exit For Loop
    \    ...    ELSE    Sleep    1