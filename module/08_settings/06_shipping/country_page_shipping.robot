*** Settings ***
Suite Setup       Common Suites Step
Suite Teardown    Close Test Suite Browser
Test Teardown     Teardown Test Case
Force Tags        Shipping
Resource          ../../../resources/variable/var_common.robot
Resource          ../../../resources/variable/var_shipping.robot
Resource          ../../../resources/keywords/kw_browser.robot
Resource          ../../../resources/keywords/kw_common.robot
Resource          ../../../resources/keywords/kw_shipping.robot
Library           ${CURDIR}/../../../lib/customlib/kwshipping.py


*** Test Cases ***
#-------------------------------------------------------------------------------------------------------#
#----------------------------------------------threshold_case-------------------------------------------#
#-------------------------------------------------------------------------------------------------------#
shipping005
    [Documentation]    测试方案名称输入框 > 输入：方案 > 保存成功
    [Tags]    P1    threshold
    Go To Shipping Page
    Quit Add Country
    Wait And Click Element    ${locatorB_shipping_country_element}
    Input Text    ${locatorB_shipping_first_input}    自动化测试
    Wait And Click Element    ${locatorB_shipping_country_save_btn}
    Page Should Contain Element    ${locatorB_shipping_country_data}
    Quit All Shipping

shipping006
    [Documentation]    测试方案名称输入框
    [Tags]    P1    threshold
    Go To Shipping Page
    Quit Add Country
    Wait And Click Element    ${locatorB_shipping_country_element}
    Wait And Click Element    ${locatorB_shipping_country_save_btn}
    Page Should Contain Element    ${locatorB_shipping_country_data}
    Quit All Shipping

shipping009
    [Documentation]    测试方案名称输入框 > "1.输入框不输入内容,2.点击保存" > 提示请输入物流方案
    [Tags]    P1    threshold
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Input Text    ${locatorB_shipping_first_input}    ${Empty}
    Wait And Click Element    ${locatorB_shipping_add_country}
    Wait And Click Element    ${locatorB_shipping_country_select}
    Wait And Click Element    ${locatorB_shipping_country_nums}
    Wait And Click Element    ${locatorB_shipping_country_save_btn}
    Wait And Click Element    dom:document.querySelectorAll('button')[1]
    Wait Until Page Contains Element    ${locatorB_shipping_freight_error_elm}
    Quit All Shipping

shipping012
    [Documentation]    添加国家
    [Tags]    P0    threshold
    Go To Shipping Page
    Quit Add Country
    Wait And Click Element    ${locatorB_shipping_country_element}
    Wait And Click Element    ${locatorB_shipping_country_save_btn}
    Page Should Contain Element    ${locatorB_shipping_country_data}
    Quit All Shipping

shipping016
    [Documentation]    搜索国家输入框输入内容 > 输入：中国 > 显示国家：中国
    [Tags]    P0    threshold
    Go To Shipping Page
    Quit Add Country
    Wait And Input Text    ${locatorB_shipping_country_ipt}    中国
    Wait And Click Element    ${locatorB_shipping_country_search_btn}
    Wait Until Page Contains    其他国家
    Wait Until Page Contains    China

shipping020
    [Documentation]    勾选1个国家 > 勾选：中国 > 左下角显示已选1个国家
    [Tags]    P0    threshold
    Go To Shipping Page
    Quit Add Country
    Wait And Input Text    ${locatorB_shipping_country_ipt}    中国
    Wait And Click Element    ${locatorB_shipping_country_search_btn}
    #.点击中国
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[67]
    Wait Until Page Contains    已选择1个地区

shipping024
    [Documentation]    勾选其他国家点击确认 > 勾选：其他国家 > 左下角显示其他国家
    [Tags]    P0    threshold
    Go To Shipping Page
    Quit Add Country
    #.点击其他国家
    Wait And Click Element    dom:document.querySelectorAll(".ant-checkbox")[0]
    Wait And Click Element    ${locatorB_shipping_country_save_btn}
    Wait Until Page Contains Element    ${locatorB_shipping_country_get_other}
    ${res}    Get Text    ${locatorB_shipping_country_get_other}
    Should Be True    '${res}'=='其他国家'

shipping029
    [Documentation]    测试价格运费添加运费按钮 >> 点击添加运费按钮 > 打开添加价格运费设置弹窗
    [Tags]    P0    threshold
    #.check button
    Go To Shipping Page
    Quantity All Setp
    page should contain button    ${locatorB_shipping_freight_save}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping035
    [Documentation]    输入50个字符点击保存
    [Tags]    P1    threshold
    Go To Shipping Page
    Quit Add Price Shipping
    ${str}    set variable    sssssssssssssssssssssssssssssssssssssssssssssssss
    Wait And Input Text    ${locatorB_shipping_freight_first_input}    ${str}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    Wait Until Page Contains Element    ${locatorB_shipping_freight_content_elm}
    Quit All Shipping

shipping039
    [Documentation]    测试添加价格运费弹窗界面说明输入框正常 > "1.说明输入框不输入内容,其他信息填写合法内容,点击保存" > 保存成功
    [Tags]    P1    threshold
    Go To Shipping Page
    Quit Add Price Shipping
    Wait And Input Text    ${locatorB_shipping_freight_first_input}    自动化测试
    Wait And Input Text    ${locatorB_shipping_range_min}    10
    Wait And Input Text    ${locatorB_shipping_range_max}    90
    Wait And Input Text    ${locatorB_shipping_price}    5
    Wait And Click Element    ${locatorB_shipping_freight_save}

shipping046
    [Documentation]    测试添加价格运费弹窗界面价格范围输入框正常 > 正常输入最小价格，最大价格 > 保存成功
    [Tags]    P0    threshold
    Go To Shipping Page
    Quit Add Price Shipping
    Common Input Step    价格运费    sssssssssssssssssssssssssssssssssssssssssssssss    10    100
    Wait And Click Element    ${locatorB_shipping_freight_save}
    Wait Until Page Contains Element    ${locatorB_shipping_freight_content_elm}
    Quit All Shipping

shipping048
    [Documentation]    最大单价输入100 最小单价输入200 最小单价变为99
    [Tags]    P0    threshold
    Go To Shipping Page
    Quit Add Price Shipping
    ${min}    set variable    200
    ${max}    set variable    100
    ${description}    set variable    sssssssssssssssssssssssssssssssssssssssssssssss
    Common Input Step    价格运费    ${description}    ${max}    ${min}
    Wait And Input Text    ${locatorB_shipping_price}    1
    ${data}    get value    ${locatorB_shipping_range_min}
    ${new_min}    evaluate    ${max}-1
    Should Be True    ${data}==${new_min}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping049
    [Documentation]    在运费价格框输入值 免运费的勾选离开框取消勾选
    [Tags]    P0    threshold
    Go To Shipping Page
    Quit Add Price Shipping
    ${min}    set variable    200
    ${max}    set variable    100
    ${description}    set variable    sssssssssssssssssssssssssssssssssssssssssssssss
    Common Input Step    价格运费    ${description}    ${max}    ${min}
    Wait And Input Text    ${locatorB_shipping_price}    ${max}
    page should not contain checkbox    execute javascript    return document.getElementsByClassName("ant-checkbox-input")[0]
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping050
    [Documentation]    测试添加价格运费弹窗界面运费栏功能正常 > 免运费勾选框处于未勾选状态时点击勾选框 > 勾选免运费
    [Tags]    P0    threshold
    Go To Shipping Page
    ${min}    set variable    200
    ${max}    set variable    100
    ${description}    set variable    sssssssssssssssssssssssssssssssssssssssssssssss
    Quit Add Price Shipping
    Common Input Step    价格运费    ${description}    ${max}    ${min}
    Wait And Input Text    ${locatorB_shipping_price}    ${max}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping051
    [Documentation]    测试添加价格运费弹窗界面运费栏功能正常 > 免运费勾选框处于勾选状态时，在运费价格输入框中输入内容 > 免运费勾选框自动取消勾选
    [Tags]    P0    threshold
    Go To Shipping Page
    ${min}    set variable    200
    ${max}    set variable    100
    ${description}    set variable    sssssssssssssssssssssssssssssssssssssssssssssss
    Quit Add Price Shipping
    Common Input Step    价格运费    ${description}    ${max}    ${min}
    Wait And Input Text    ${locatorB_shipping_price}    ${max}
    Checkbox Should Not Be Selected    dom:document.getElementsByClassName("ant-checkbox-input")[0]
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping055
    [Documentation]    勾选是否支持货到付款 列表显示支持
    [Tags]    P0    threshold
    Go To Shipping Page
    Quit Add Price Shipping
    ${min}    set variable    200
    ${max}    set variable    100
    ${description}    set variable    sssssssssssssssssssssssssssssssssssssssssssssss
    Common Input Step    价格运费    ${description}    ${max}    ${min}
    Wait And Click Element    dom:document.querySelectorAll(".ant-checkbox-checked")[0]
    Wait And Click Element    ${locatorB_shipping_freight_save}
    Wait Until Page Contains Element    dom:document.querySelectorAll(".ant-table-tbody tr td")[2]
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='支持'
    Quit All Shipping

shipping058
    [Documentation]    添加运费窗口输入内容后直接关闭 列表不存在数据
    [Tags]    P1    threshold
    Go To Shipping Page
    Quantity All Setp
    Wait And Input Text    ${locatorB_shipping_weight_first_input}    价格运费
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Wait Until Page Does Not Contain Element    dom:document.querySelectorAll(".ant-table-row-level-0")[0]

shipping060
    [Documentation]    测试价格运费添加界面关闭按钮 > 输入内容后点击取消 > 直接关闭窗口，没有添加价格运费，再次打开窗口时，所输入的内容全部清空
    [Tags]    P1    threshold
    Go To Shipping Page
    Quit Add Price Shipping
    ${min}    set variable    200
    ${max}    set variable    100
    ${description}    set variable    sssssssssssssssssssssssssssssssssssssssssssssss
    Common Input Step    价格运费    ${description}    ${max}    ${min}
    Wait And Click Element    ${locatorB_shipping_freight_cancel_btn}
    Wait And Click Element    ${locatorB_shipping_add_price_btn}
    ${res}    Execute JavaScript    return document.querySelectorAll("#name")[1].value==''
    Should Be True    '${res}'=='True'

shipping061
    [Documentation]    点击添加重量运费按钮出现编辑窗口
    [Tags]    P0    threshold
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait Until Page Contains Element    ${locatorB_shipping_freight_save}
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping082
    [Documentation]    添加运费重量 克。千克，磅
    [Tags]    P0    threshold
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    Wait And Click Element    ${locatorB_shipping_add_weight_btn}
    Wait And Click Element    dom:document.querySelectorAll(".ant-select-arrow")[0]
    Mouse Down    dom:document.querySelectorAll("div[role='combobox']")[0]
    Mouse Over    dom:document.querySelectorAll("div[role='combobox']")[0]
    Mouse Up    dom:document.querySelectorAll("div[role='combobox']")[0]
    Wait And Click Element    ${locatorB_shipping_country_close_btn}
    Quit All Setp

shipping131
    [Documentation]    测试添加物流界面保存按钮 > "1.不输入物流名称,2.其他信息正常填写,3.点击保存" > 保存失败，提示：请输入物流名称
    [Tags]    P0
    Go To Shipping Page
    Quit Add Country
    Wait And Click Element    ${locatorB_shipping_country_element}
    Wait And Click Element    ${locatorB_shipping_country_save_btn}
    Wait And Click Element    ${locatorB_shipping_save_btn}
    Wait Until Page Contains    请输入物流方案名称。

shipping134
    [Documentation]    只添加价格运费，重量和数量运费不添加
    [Tags]    P0    threshold
    Go To Shipping Page
    Wait And Click Element    ${locatorB_shipping_add_shipping}
    ${name}    Set Variable    自动化
    input text    id:name    ${name}
    Wait And Click Element    ${locatorB_shipping_add_country}
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0]
    Wait And Click Element    dom:document.getElementsByClassName("ant-tree-checkbox-inner")[1]
    Wait And Click Element    ${locatorB_shipping_country_save_btn}
    Wait And Click Element    id:test_shipping_add_weight_btn
    ${input}    set variable    重量运费
    ${desc}    set variable    重量运费说明
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    Common Input Step    ${input}    ${desc}    ${range_max}    ${range_min}
    Wait And Input Text    ${locatorB_shipping_price}    ${rate_amount}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    Wait And Click Element    ${locatorB_shipping_add_quantity_btn}
    ${input_a}    set variable    数量运费
    ${desc_a}    set variable    熟练给运费说明
    Common Input Step    ${input_a}    ${desc_a}    ${range_max}    ${range_min}
    Wait And Input Text    ${locatorB_shipping_price}    ${rate_amount}
    Wait And Click Element    ${locatorB_shipping_freight_save}
    Wait And Click Element    ${shipping_first_button}
    Wait Until Page Contains Element    dom:document.querySelectorAll("#test_shipping_list_0 li")[0]
    delShipping_py

shipping138
    [Documentation]    测试添加物流界面国家列表界面的修改和删除按钮 > "1.添加国家2.点击修改按钮3.取消勾选城市列表中的城市4.点击确认" >保存成功，关闭弹窗，添加的物流对取消勾选的城市不生效
    [Tags]    P0    threshold
    Go To Shipping Page
    Quit Add Country
    Wait And Click Element    ${locatorB_shipping_country_element}
    Wait And Click Element    ${locatorB_shipping_country_save_btn}
    Quit Add Country
    Wait And Click Element    ${locatorB_shipping_country_element}
    Wait And Click Element    ${locatorB_shipping_country_save_btn}


#-------------------------------------------------------------------------------------------------------#
#---------------------------------------------Ordinary Case---------------------------------------------#
#-------------------------------------------------------------------------------------------------------#
#shipping013
#    [Documentation]    tax price page should be normal atfer login
#    [Tags]    P0
#    Go To Shipping Page
#    Wait And Click Element    ${locatorB_shipping_add_shipping}
#    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
#    Input Text    ${locatorB_shipping_first_input}    中国
#    Wait And Click Element    dom:document.querySelectorAll("button")[1]
#    Page Should Not Contain Element    ${locatorB_shipping_send_address}
#    Quit All Shipping
#
#shipping017
#    [Documentation]    物流方案输入中
#    [Tags]    P1
#    Go To Shipping Page
#    Wait And Click Element    ${locatorB_shipping_add_shipping}
#    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
#    input text    ${locatorB_shipping_first_input}    中
#    Wait And Click Element    dom:document.querySelectorAll("button")[1]
#    Page Should Not Contain Element    ${locatorB_shipping_send_address}
#    Quit All Shipping
#
#shipping018
#    [Documentation]    物流方案输入 特殊字符
#    [Tags]    P1
#    Go To Shipping Page
#    Wait And Click Element    ${locatorB_shipping_add_shipping}
#    Wait Until Element Is Visible    dom:document.querySelectorAll("button")[1]
#    input text    ${locatorB_shipping_first_input}    @#￥
#    Wait And Click Element    dom:document.querySelectorAll("button")[1]
#    Page Should Not Contain Element    ${locatorB_shipping_send_address}
#    Quit All Shipping
#
#shipping019
#    [Documentation]    选择国家后 列表选中国家出现1
#    [Tags]    P0
#    Go To Shipping Page
#    Quit Add Country
#    Wait And Click Element    ${locatorB_shipping_country_select}
#    Wait And Click Element    ${locatorB_shipping_country_nums}
#    ${count}    get text    class:country_selected___1wa_o
#    ${res}    searchStr_py    ${count}
#    Should Be True    ${res}==1
#    Wait And Click Element    ${locatorB_shipping_country_close_btn}
#
#shipping022
#    [Documentation]    选择国家后 列表出现对应的国家
#    [Tags]    P0
#    Go To Shipping Page
#    Quit Add Country
#    Wait And Click Element    ${locatorB_shipping_country_select}
#    Wait And Click Element    ${locatorB_shipping_country_nums}
#    ${data}    execute javascript    return document.getElementsByClassName("info_cn___3-J7E")[1].innerHTML
#    Wait And Click Element    ${locatorB_shipping_country_save_btn}
#    ${res}    get text    ${locatorB_shipping_country_get_other}
#    Should Be True    '${data}'=='${res}'
#    Quit All Shipping
#
#shipping025
#    [Documentation]    选择国家的随意一个国家 列表不会出现`其他国家`
#    [Tags]    P0
#    Go To Shipping Page
#    Quit Add Country
#    Wait And Click Element    ${locatorB_shipping_country_select}
#    Wait And Click Element    ${locatorB_shipping_country_nums}
#    Wait And Click Element    ${locatorB_shipping_country_save_btn}
#    ${res}    get text    ${locatorB_shipping_country_get_other}
#    Should Be True    '${res}'<>'其他国家'
#    Quit All Shipping
#
#shipping027
#    [Documentation]    选择国家不选国家 列表提示暂无数据
#    [Tags]    P1
#    Go To Shipping Page
#    Quit Add Country
#    Wait And Click Element    ${locatorB_shipping_country_close_btn}
#    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-table-placeholder span")[0].innerText
#    #check data
#    Should Be True    '${res}'=='暂无数据'
#    Quit All Setp


*** keywords ***
Common Input Step
    [Documentation]    添加各种运费公共输入框
    [Arguments]    ${name}    ${description}    ${max}    ${min}
    Wait And Input Text    ${locatorB_shipping_freight_first_input}    ${name}
    Wait And Input Text    ${locatorB_shipping_description}    ${description}
    Wait And Input Text    ${locatorB_shipping_range_max}    ${max}
    Wait And Input Text    ${locatorB_shipping_range_min}    ${min}

Common Suites Step
    [Documentation]    公共suite步骤
    Login With Default User
    delShipping_py
