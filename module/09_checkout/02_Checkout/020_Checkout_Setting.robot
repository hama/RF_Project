*** Settings ***
Documentation     结账设置中改变姓名填写格式，submit后不跳转新页面，刷新当前页面，显示最新信息
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

*** Test Cases ***
Modify_Pay_Setting
    [Documentation]    进入到checkout页面后，填写完地址信息后(姓名分开填写)，返回后台修改结账设置改为（姓名），再去checkout页面点击submit，页面将会刷新，地址信息将会刷新变化
    [Tags]    P0
    #---------------------------------前提环境：要去后台结账设置中选择在结账时要填写的内容，像first_name等--------------------------------------

    #获取第一个商品名称
    Assign id To Element    dom:document.querySelectorAll(".product_name___Ul4W-")[0]    title
    Wait Until Element Is Visible    title
    ${title}    Get Text    title
    #先设置成（姓名）
    Modify_Set_Radio    0
    Sleep    1
    Go To Products Page
    #进入checkout页面
    Select_Order_Page    ${title}
    #填写完地址信息(只填写邮箱)，不点击提交按钮
    Complete_Order_Message_Without_Last_name
    #进入后台，修改为(姓名分开填写)
    Select Window    店匠科技
    Modify_Set_Radio    1
    #跳回checkout页
    Select Window    title=${store_name}
    #点击submit按钮后，页面将刷新
    Wait And Click Element    id:submitMbPay
    #验证当前要填写的是不是(姓名分开填写)
    #点击添加地址信息
    Wait And Click Element    id:addAddress
    #last_name
    Element Should Be Visible    dom:document.querySelectorAll("input[name=last_name]")[0]

*** Keywords ***
Products Suite Setup
    [Documentation]    商品 case setup,每次预览时都新增一个上架商品
    Login With Test Account
    Start Ajax Listener
    Add Product_Up
    Sleep    8
    Go To Products Page

Products Suite Teardown
    [Documentation]    删除商品
    Select Window    店匠科技
    Go To Products Page
    Delete_First_Product
    Close Test Suite Browser

Products Test Case Setup
    Go To Products Page

Products Test Case Teardown
    Teardown Test Case
