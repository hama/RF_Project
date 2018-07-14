*** Settings ***
Documentation     checkout 公共方法
Resource          var_common.robot

*** keywords ***
Checkout Common Setp
    [Documentation]    封装公共步骤
    Go To    ${home_page}
    Sleep Time
    Wait And Click Element    ${add_products_btn}
    #点击商品预览
    Sleep Time
    Wait And Click Element    dom:document.querySelectorAll(".preview___37DtU")[0]
    Sleep Time    #.休息2s
    #.第二个窗口
    Select Window    New
    Sleep Time

Add Payment
    [Documentation]    添加支付方式
    Wait And Click Element    ${locator_setting}    #.点击设置按钮
    Wait And Click Element    ${locator_setting_payment}    #.点击收款渠道按钮
    Wait And Click Element    dom:document.querySelectorAll(".title___3MGDq span")[1]    #. 点击更换收款方式
    Wait And Click Element    dom:document.querySelectorAll("button")[1]    #.选择paylinks
    Wait And Click Element    dom:document.querySelectorAll("button")[1]    #.点击编辑
    Wait And Input Text    dom:document.querySelectorAll("#client_id")[0]    123456    #.绑定账号
    Wait And Input Text    dom:document.querySelectorAll("#secret_key")[0]    123123    #.绑定密码
    Wait And Click Element    dom:document.querySelectorAll("button")[2]    #.点击绑定按钮
    Wait And Click Element    class:ant-switch    #.点击开启按钮
    Wait And Click Element    dom:document.querySelectorAll("button")[6]    #.点击确定
    Sleep Time

Sleep Time
    [Documentation]    睡眠时间 2s
    Sleep    2
