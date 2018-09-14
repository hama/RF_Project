*** Settings ***
Suite Setup       Common Suite
Suite Teardown    Close Test Suite Browser
Test Teardown     Teardown Test Case
Force Tags        Store
Resource          ../../resources/keywords/kw_browser.robot
Resource          ../../resources/keywords/kw_common.robot
Resource          ../../resources/variable/var_store.robot
Library           ${CURDIR}/../../lib/customlib/kwstore.py


*** Test Cases ***
store001
    [Documentation]    店铺信息-店铺名称里UI展示正确 > 进入到设置/基础信息 > 店铺名称、前有红色必填型号必填标识，名称默认为注册时填写的名称，有x/50字数的显示
    [Tags]    P1
    Repetir Common Step
    Sleep    2
    #.从页面获取店铺名称
    ${name}    Get Value    ${locatorB_storeLst_storename_ipt}
    #.查询关键字- 店铺名称
    Should Be True    '${name}'=='${user_default_domain}'

store002
    [Documentation]    店铺名称可保存小于50个字符 > "1.更改名称，输入字数小于50个字符,点击保存" > 保存成功
    [Tags]    P0
    StoreName Common Step    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    Wait Until Page Contains    ${locatorB_storeLst_storeText}

store003
    [Documentation]    店铺名称不可保存大于50个字符 > "1.更改名称，输入字数大于50个字符,点击保存" > 提示‘不能超过50个字符’，保存失败
    [Tags]    P0
    StoreName Common Step    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    Wait Until Page Contains Element    ${locatorB_storeLst_error_msg}

store004
    [Documentation]     店铺名称可保存50个字符 > "1.更改名称，输入字数等于50个字符,点击保存" > 保存成功
    [Tags]    P0
    StoreName Common Step    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

store005
    [Documentation]    店铺名称不可为空 > 店铺名输入为空 > 提示‘请输入店铺名称’，保存失败 [现在逻辑：可以输入空格]
    [Tags]    P0
    StoreName Common Step    ${Empty}
    Wait And Click Element    ${locatorB_storeLst_moneda_elm}
    Wait Until Page Does Not Contain Element    ${locatorB_storeLst_error_msg}

store006
    [Documentation]    输入店铺名称时字数统计对应变化 > "1.输入名称,2.查看字数显示" > 展示对应的字数，格式为字数/50
    [Tags]    P2
    StoreName Common Step    22
    #.获取 输入店铺名称时字数统计对应变化
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-input-suffix")[0].innerText
    Should Be True    '${res}'<>''

store007
    [Documentation]    验证‘店铺链接’UI展示正确 > 
    [Tags]    P0
    Repetir Common Step
    #.获取店铺url
    Wait Until Element Is Visible    dom:document.querySelectorAll("#domain")[0]
    Sleep    2
    ${res}    Execute JavaScript    return document.querySelectorAll("#domain")[0].value===''
    Should Be True    '${res}'<>'True'

store008
    [Documentation]    点击域名配置，正确跳转到域名信息页面
    [Tags]    P1
    Repetir Common Step
    #.点击配置域名
    Wait And Click Element    ${locatorB_storeLst_storedomain_txt}
    Sleep    20
    Wait Until Page Contains    域名

store009
    [Documentation]    使用邮箱注册时，店主邮箱默认显示注册时所使用的邮箱
    [Tags]    P1
    Repetir Common Step
    ${res}    Execute JavaScript    return document.querySelectorAll("#email")[0].value===undefined
    Should Be True    '${res}'=='False'

store010
    [Documentation]    使用手机号注册时，店主邮箱显示为空
    [Tags]    P1
    Repetir Common Step
    ${res}    Execute JavaScript    return document.querySelectorAll("#email")[0].value==15220581724
    Should Be True    '${res}'=='False'

store011
    [Documentation]    店主邮箱输入正确格式的邮箱可保存成功
    [Tags]    P0
    Repetir Common Step
    Wait And Input Text    ${locatorB_storeLst_storeemail_ipt}    ooppww22@ss.cc
    Wait And Click Element    ${locatorB_storeLst_save_btn}

store012
    [Documentation]    店主邮箱输入格式错误的邮箱，不可保存 > 输入非法格式的邮箱：@qq@192 > 提示‘请输入正确的邮箱’，不可保存
    [Tags]    P1
    Repetir Common Step
    Wait And Input Text    ${locatorB_storeLst_storeemail_ipt}    @qq@192
    Wait And Click Element    ${locatorB_storeLst_save_btn}
    Wait Until Page Contains Element    ${locatorB_storeLst_error_msg}

store013
    [Documentation]    店主邮箱不可为空，为空保存失败
    [Tags]    P2
    Repetir Common Step
    Wait And Input Text    ${locatorB_storeLst_storeemail_ipt}    ''
    Wait Until Page Contains Element    ${locatorB_storeLst_error_msg}

store014
    [Documentation]    验证‘客服邮箱’UI显示正常
    [Tags]    P0
    Repetir Common Step
    Wait Until Page Contains Locator    ${locatorB_storeLst_store_seremail_ipt}

store015
    [Documentation]    输入正确格式的客服邮箱可保存成功
    [Tags]    P0
    StoreEmail Common Step    ${store_email}
    Wait And Click Element    ${locatorB_storeLst_save_btn}

store016
    [Documentation]    输入非法格式的邮箱，不可保存
    [Tags]    P1
    StoreEmail Common Step    $$kkfd@#
    Wait And Click Element    ${locatorB_storeLst_save_btn}
    Wait Until Page Contains Element    ${locatorB_storeLst_error_msg}

store017
    [Documentation]    客服邮箱不可为空
    [Tags]    P1
    StoreEmail Common Step    ''
    Wait Until Page Contains Element    ${locatorB_storeLst_error_msg}

store018
    [Documentation]    验证‘网站favicon’UI展示正常
    [Tags]    P2
    Repetir Common Step
    Wait Until Page Contains Locator    ${locatorB_storeLst_icon_btn}

store019
    [Documentation]    "上传建议尺寸大小的‘网站favicon’可正常显示 
    [Tags]    P0
    Repetir Common Step
    #.上传图片
    Choose File    dom:document.querySelectorAll("input[type='file']")[0]    ${img_file}
    Wait And Click Element    ${locatorB_storeLst_save_btn}

store022
    [Documentation]    验证‘常规设置-店铺货币’UI展示正确
    [Tags]    P0
    Repetir Common Step
    Wait Until Page Contains Locator    ${locatorB_storeLst_moneda_elm}

store023
    [Documentation]    验证‘常规设置-店铺时区’UI展示正确
    [Tags]    P0
    Repetir Common Step
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection-selected-value")[1]
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-select-selection-selected-value")[1].innerText
    Should Be True    '${res}'=='(GMT + 08:00) 北京，香港，台北，新加坡'

store024
    [Documentation]    点击货币选择框，展开下拉框 > 展开下拉框，默认展示6种货币单位在页面上
    [Tags]    P1
    Repetir Common Step
    #.点击店铺货币 展开下拉框
    Wait And Click Element    ${locatorB_storeLst_moneda_elm}
    Sleep    3.5
    ${one}    Execute JavaScript    return document.querySelectorAll('.ant-select-dropdown-menu-item')[0].innerText
    ${two}    Execute JavaScript    return document.querySelectorAll('.ant-select-dropdown-menu-item')[1].innerText
    ${three}    Execute JavaScript    return document.querySelectorAll('.ant-select-dropdown-menu-item')[2].innerText
    ${four}    Execute JavaScript    return document.querySelectorAll('.ant-select-dropdown-menu-item')[3].innerText
    ${five}    Execute JavaScript    return document.querySelectorAll('.ant-select-dropdown-menu-item')[4].innerText
    ${six}    Execute JavaScript    return document.querySelectorAll('.ant-select-dropdown-menu-item')[5].innerText
    Should Be True    '${one}'=='USD' and '${two}'=='EUR' and '${three}'=='GBP' and '${four}'=='CAD' and '${five}'=='AFN' and '${six}'=='ALL'

store025
    [Documentation]    点击货币选择框，收起下拉框 > 点击货币选择框 > 下拉框收起
    [Tags]    P0
    Repetir Common Step
    #.点击店铺货币 展开下拉框
    Wait And Click Element    ${locatorB_storeLst_moneda_elm}
    #.收起下拉框
    Wait And Click Element    ${locatorB_storeLst_moneda_elm} 

store026
    [Documentation]    点击展开下拉框，点击空白处可收起下拉框
    [Tags]    P1
    Repetir Common Step
    #.点击店铺货币 展开下拉框
    Wait And Click Element    ${locatorB_storeLst_moneda_elm}
    #.收起下拉框
    Wait And Click Element    class:headerTitle_20f4

store027
    [Documentation]    选择货币之后，下拉框自动收起
    [Tags]    P0
    Repetir Common Step
    #.点击店铺货币 展开下拉框
    Wait And Click Element    ${locatorB_storeLst_moneda_elm}
    #.选择货币
    Wait And Click Element    ${locatorB_storeLst_moneda_elm}
    Sleep    4
    ${one}    Execute JavaScript    return document.querySelectorAll('.ant-select-dropdown-menu-vertical li')[0].innerText
    Should Be True    '${one}'=='USD'

store028
    [Documentation]    货币下拉框可滚动查看更多
    [Tags]    P1
    Repetir Common Step
    #.点击店铺货币 展开下拉框
    Wait And Click Element    ${locatorB_storeLst_moneda_elm}
    Sleep    3
    #.滑动下拉条
    Execute JavaScript    return document.querySelectorAll('.ant-select-dropdown-menu-item')[6].scrollIntoView()

store029
    [Documentation]    点击店铺时区展示下拉框
    [Tags]    P1
    Repetir Common Step
    #,点击时区
    Wait And Click Element    ${locatorB_storeLst_timezone_elm}

store030
    [Documentation]    点击店铺时区展示下拉框 > 展开下拉框，默认展示6个时区
    [Tags]    P1
    Repetir Common Step
    #.点击时区
    Wait And Click Element    ${locatorB_storeLst_timezone_elm}
    Wait Until Page Contains    (GMT + 08:00) 北京，香港，台北，新加坡
    Wait Until Page Contains    (GMT + 07:00) 河内，雅加达，新西伯利亚
    Wait Until Page Contains    (GMT + 06:30) 仰光
    Wait Until Page Contains    (GMT + 06:00) 阿拉木图，达卡，乌鲁木齐
    Wait Until Page Contains    (GMT + 05:45) 加德满都
    Wait Until Page Contains    (GMT + 05:30) 新德里

store032
    [Documentation]     选择店铺时区之后下拉框自动收起
    [Tags]    P0
    Repetir Common Step
    #.点击时区
    Wait And Click Element    ${locatorB_storeLst_timezone_elm}
    Wait Until Element Is Visible    dom:document.querySelectorAll(".ant-select-selection__rendered")[1]
    Sleep    2
    ${res}    Execute JavaScript    return document.querySelectorAll(".ant-select-selection__rendered")[1].innerText
    Should Be True    '${res}'=='(GMT + 08:00) 北京，香港，台北，新加坡'

store033
    [Documentation]    点击店铺时区选框，下拉框收起
    [Tags]    P1
    Repetir Common Step
    #.点击时区
    Wait And Click Element    ${locatorB_storeLst_timezone_elm}
    Wait And Click Element    ${locatorB_storeLst_timezone_elm}
    
store034
    [Documentation]    点击店铺时区下拉框以为位置，下拉框收起
    [Tags]    P1
    Repetir Common Step
    Wait And Click Element    ${locatorB_storeLst_timezone_elm}
    Wait And Click Element    class:headerTitle_20f4

store036
    [Documentation]    验证‘联系地址’说明文案展示正确
    [Tags]    P2
    Repetir Common Step
    Wait Until Page Contains    联系地址

store037
    [Documentation]    
    [Tags]
    Repetir Common Step
    Wait And Click Element    dom:document.querySelectorAll(".icon_more_2419")[0]
    Wait Until Page Contains    1. 店匠联系您：店匠可能会使用此地址邮寄一些店铺的账单、协议等文件给您；

store038
    [Documentation]    联系地址各字段显示正确
    [Tags]    P1
    Repetir Common Step
    Wait Until Page Contains    联系地址
    Wait Until Page Contains    国家
    Wait Until Page Contains    省份

store040
    [Documentation]    点击【国家】选框，展开下拉框 > 展开下拉框，默认展示6个国家
    [Tags]    P1
    Repetir Common Step
    Wait And Click Element    ${locatorB_storeLst_country_elm}
    Wait Until Page Contains    佛得角
    Wait Until Page Contains    开曼群岛
    Wait Until Page Contains    中非
    Wait Until Page Contains    乍得
    Wait Until Page Contains    智利
    Wait Until Page Contains    中国

#==================================================================================================================================================================#
#==================================================================================================================================================================#
#===========================================================================keywords===============================================================================#
#==================================================================================================================================================================#
#==================================================================================================================================================================#

*** keywords ***
Common Suite
    [Documentation]    公共suite
    Login With Default User
    Wait Add StoreInfo
Repetir Common Step
    [Documentation]    重复步骤
    Go To Store Page
    Wait Until Page Contains    ${locatorB_storeLst_storeText}

StoreName Common Step
    [Documentation]    店铺名称case封装
    [Arguments]    ${name}
    Repetir Common Step
    Wait And Input Text    ${locatorB_storeLst_storename_ipt}    ${name}
    Wait And Click Element    ${locatorB_storeLst_save_btn}

StoreEmail Common Step
    [Documentation]    店铺邮箱case封装
    [Arguments]    ${name}
    Repetir Common Step
    Wait Until Page Contains Locator    ${locatorB_storeLst_store_seremail_ipt}
    Wait And Input Text    ${locatorB_storeLst_storeemail_ipt}    ${name}
    Wait And Input Text    ${locatorB_storeLst_store_seremail_ipt}    ${name}
