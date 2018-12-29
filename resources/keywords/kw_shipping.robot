*** Settings ***
Documentation     物流
Resource          kw_common.robot

*** keyword ***
Shipping Suite Setup
	[Documentation]
    Login With Default User

Shipping Suite Teardown
    [Documentation]
    kwshipping.del_all_shipping_merchant_py
    kwshipping.del_all_shipping_py
    Close Test Suite Browser

Shipping Case Setup
	[Documentation]
	kwshipping.del_all_shipping_merchant_py
	kwshipping.del_all_shipping_py
    Go To Shipping Page

Shipping Case Teardown
	[Documentation]
    Teardown Test Case

Transportation Expense Page
    [Documentation]    运费设置tab
    Sleep    2
    Wait And Click Element    ${locatorB_shipping_tab_PriceSettings}
    Sleep    2

Shipping Settings Page
    [Documentation]    物流设置tab
    Sleep    2
    Wait And Click Element    ${locatorB_shipping_tab_shippingSettings}
    Sleep    2

shipping_130
    [Documentation]    验证添加物流商弹窗中，可添加汉邮物流商
    Sleep And Click Element    ${locatorB_settingShipping_button_addMerchant}
    Sleep And Click Element    ${locatorB_merchantSettings_button_addUaiBest}
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    汉邮001
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    SHOPLAZZA
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    cf73b069ff5349d19d9a40583d26283e
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    汉邮物流华南地区专门服务大陆出口跨境电商的物流服务商主做业务为东南亚各市场的电商快件提供代收货款服务。
    Wait Until Page Contains Text    货代名称：汉邮001
    Sleep And Click Element    ${locatorB_merchantSettings_icon_shipiingWay}
    Wait Until Page Contains Text    物流渠道
    Wait Until Page Contains Text    平邮小包
    Sleep And Click Element    ${locatorB_merchantSettings_icon_shipiingWayClose}

shipping_131
    [Documentation]    验证物流商列表中，汉邮物流商栏，可切换汉邮物流商账号
    Sleep And Click Element    ${locatorB_merchantSettings_icon_changeAccount}
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    hanyou
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    货代名称：hanyou

shipping_133
    [Documentation]    验证物流商列表中，可删除汉邮物流商
    Reload Page And Start Ajax
    Shipping Settings Page
    Sleep    5
    Wait And Click Element Then Confirm    ${locatorB_merchantSettings_icon_deleteAccount}
    Wait Until Page Not Contains Text    货代名称：hanyou

shipping_137
    [Documentation]    验证添加汉邮物流商弹窗中，账户ID输入框输入错误的内容不可添加
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    汉邮
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    test
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    cf73b069ff5349d19d9a40583d26283e
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    输入的账户ID或秘钥有误，请重新输入

shipping_138
    [Documentation]    验证添加汉邮物流商弹窗中，账户秘钥输入框输入错误的内容不可添加
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    汉邮
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    SHOPLAZZA
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    test
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    输入的账户ID或秘钥有误，请重新输入

shipping_139
    [Documentation]    验证添加汉邮物流商弹窗中，查看官网了解更多 文本链接可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_link_uaibestLink}
    Focus On New Window
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    Location Should Be    http://uaibest.com/
    Sleep    2
    Select Window    title=${title1}

shipping_140
    [Documentation]    验证添加汉邮物流商弹窗可关闭
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    汉邮测试关闭
    Sleep And Click Element    ${locatorB_merchantSettings_icon_uaiBestClose}
    Wait Until Page Contains Text    添加物流商

shipping_143
    [Documentation]     验证添加物流商弹窗中，可添加鸿速达物流商
    Sleep And Click Element    ${locatorB_settingShipping_button_addMerchant}
    Sleep And Click Element    ${locatorB_merchantSettings_button_addHSD}
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    鸿速达
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    SZDJKJ
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    123456
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    鸿速达国际物流丨跨境物流服务商丨COD货到付款丨四大国际快递丨电商挂号小包丨专线快递丨10年国际物流经验、为商家量身定制物流方案！
    Wait Until Page Contains Text    货代名称：鸿速达
    Wait Until Page Contains Locator    ${locatorB_merchantSettings_icon_shipiingWay}

shipping_144
    [Documentation]    验证物流商列表中，鸿速达物流商栏，可切换鸿速达物流商账号
    Sleep And Click Element    ${locatorB_merchantSettings_icon_changeAccount}
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    hongsuda
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    货代名称：hongsuda

shipping_146
    [Documentation]    验证物流商列表中，可删除鸿速达物流商
    Reload Page And Start Ajax
    Shipping Settings Page
    Sleep    2
    Wait And Click Element Then Confirm    ${locatorB_merchantSettings_icon_deleteAccount}
    Wait Until Page Not Contains Text    货代名称：hongsuda

shipping_150
    [Documentation]    验证添加鸿速达物流商弹窗中，账户ID输入框输入错误的内容不可添加
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    鸿速达
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    test
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    123456
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    输入的账户ID或秘钥有误，请重新输入

shipping_151
    [Documentation]    验证添加鸿速达物流商弹窗中，账户秘钥输入框输入错误的内容不可添加
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    鸿速达
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    SZDJKJ
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    test
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    输入的账户ID或秘钥有误，请重新输入

shipping_152
    [Documentation]    验证添加鸿速达物流商弹窗中，查看官网了解更多 文本链接可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_link_HSDLink}
    Focus On New Window
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    Location Should Be    http://www.hsd-express.cn/
    Sleep    2
    Select Window    title=${title1}

shipping_153
    [Documentation]    验证添加鸿速达物流商弹窗中，无账号？点击注册 文本链接可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_link_HSDregister}
    Focus On New Window
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    ${title3}=    Get From List    ${titles}    2
    Location Should Be    http://www.hsd-express.cn/
    Sleep    2
    Select Window    title=${title1}

shipping_154
    [Documentation]    验证添加鸿速达物流商弹窗可关闭
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    鸿速达测试关闭
    Sleep And Click Element    ${locatorB_merchantSettings_icon_uaiBestClose}
    Wait Until Page Contains Text    添加物流商

shipping_156
    [Documentation]    验证物流商列表中，鸿速达物流商栏，物流渠道按钮可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_icon_shipiingWay}
    sleep    2
    @{checkoutList}=    Get WebElements    ${locatorB_merchantSettings_checkbox_waySelect}
    ${lengthList}=    Get Length    ${checkoutList}
    Should Be Equal As Integers    ${lengthList}    ${160}

#shipping_157
#    [Documentation]    验证鸿速达物流渠道弹窗中，物流渠道可勾选，添加后物流渠道会显示在订单详情发货弹窗中
#    Sleep    2
#    Sleep And Click Element    ${locatorB_merchantSettings_icon_shipiingWay}
#    Sleep And Click Element    ${locatorB_merchantSettings_checkbox_waySelect}[0]
#    Sleep And Click Element    ${locatorB_merchantSettings_button_shipiingWaySave}

shipping_160
    [Documentation]    验证添加物流商弹窗中，可添加youkesi物流商
    Sleep And Click Element    ${locatorB_settingShipping_button_addMerchant}
    Sleep And Click Element    ${locatorB_merchantSettings_button_addYokesi}
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    优客思
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    20006
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    b6d95276-f504-40e4-88f7-52ebca33190620006
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    深圳市优客思供应链有限公司通过自建国内电商仓、阿联酋海外仓、沙特海外仓，整合中东跨境运输、口岸清关、目的地派送等优势资源。
    Wait Until Page Contains Text    货代名称：优客思
    Wait Until Page Contains Locator    ${locatorB_merchantSettings_icon_shipiingWay}

shipping_161
    [Documentation]    验证物流商列表中，youkesi物流商栏，可切换youkesi物流商账号
    Sleep And Click Element    ${locatorB_merchantSettings_icon_changeAccount}
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    youkesi
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    货代名称：youkesi

shipping_163
    [Documentation]    验证物流商列表中，可删除youkesi物流商
    Reload Page And Start Ajax
    Shipping Settings Page
    Sleep    2
    Wait And Click Element Then Confirm    ${locatorB_merchantSettings_icon_deleteAccount}
    Wait Until Page Not Contains Text    货代名称：youkesi

shipping_167
    [Documentation]    验证添加youkesi物流商弹窗中，账户ID输入框输入错误的内容不可添加
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    优客思
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    test
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    b6d95276-f504-40e4-88f7-52ebca33190620006
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    输入的账户ID或秘钥有误，请重新输入

shipping_168
    [Documentation]    验证添加youkesi物流商弹窗中，账户秘钥输入框输入错误的内容不可添加
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    优客思
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    20006
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    test
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    输入的账户ID或秘钥有误，请重新输入

shipping_169
    [Documentation]    验证添加youkesi物流商弹窗中，查看官网了解更多 文本链接可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_link_YokesiLink}
    Focus On New Window
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    Location Should Be    http://www.yokesi.com/
    Sleep    2
    Select Window    title=${title1}

shipping_170
    [Documentation]    验证添加youkesi物流商弹窗中，无账号？点击注册 文本链接可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_link_Yokesiregister}
    Focus On New Window
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    ${title3}=    Get From List    ${titles}    2
    Location Should Be    http://z.yokesi.com:8088/Home/Registration
    Sleep    2
    Select Window    title=${title1}

shipping_171
    [Documentation]    验证添加youkesi物流商弹窗可关闭
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    youkesi测试关闭
    Sleep And Click Element    ${locatorB_merchantSettings_icon_uaiBestClose}
    Wait Until Page Contains Text    添加物流商

shipping_173
    [Documentation]    验证物流商列表中，youkesi物流商栏，物流渠道按钮可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_icon_shipiingWay}
    sleep    2
    @{checkoutList}=    Get WebElements    ${locatorB_merchantSettings_checkbox_waySelect}
    ${lengthList}=    Get Length    ${checkoutList}
    Should Be Equal As Integers    ${lengthList}    ${40}

shipping_177
    [Documentation]    验证添加物流商弹窗中，可添加皇家物流商
    Sleep And Click Element    ${locatorB_settingShipping_button_addMerchant}
    Sleep And Click Element    ${locatorB_merchantSettings_button_addPFC}
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    皇家
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    80000
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    92cdbbbf-e0a2-45d6-a527-7c3ec276aade80000
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    PFC EXPRESS是国内第一批跨境电商物流企业， 我们一直以来为致力于发展为跨境电商进出口物流和全球电商仓储提供专业第三方物流服务。
    Wait Until Page Contains Text    货代名称：皇家
    Wait Until Page Contains Locator    ${locatorB_merchantSettings_icon_shipiingWay}

shipping_178
    [Documentation]    验证物流商列表中，皇家物流商栏，可切换皇家物流商账号
    Sleep And Click Element    ${locatorB_merchantSettings_icon_changeAccount}
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    huangjia
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    货代名称：huangjia

shipping_180
    [Documentation]    验证物流商列表中，可删除皇家物流商
    Reload Page And Start Ajax
    Shipping Settings Page
    Sleep    2
    Wait And Click Element Then Confirm    ${locatorB_merchantSettings_icon_deleteAccount}
    Wait Until Page Not Contains Text    货代名称：huangjia

shipping_185
    [Documentation]    验证添加皇家物流商弹窗中，账户秘钥输入框输入错误的内容不可添加
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    皇家
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    80000
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    test
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    输入的账户ID或秘钥有误，请重新输入

shipping_186
    [Documentation]    验证添加皇家物流商弹窗中，查看官网了解更多 文本链接可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_link_PFCLink}
    Focus On New Window
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    Location Should Be    http://www.pfcexpress.com/
    Sleep    2
    Select Window    title=${title1}

shipping_187
    [Documentation]    验证添加皇家物流商弹窗可关闭
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    皇家测试关闭
    Sleep And Click Element    ${locatorB_merchantSettings_icon_uaiBestClose}
    Wait Until Page Contains Text    添加物流商

shipping_189
    [Documentation]    验证物流商列表中，皇家物流商栏，物流渠道按钮可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_icon_shipiingWay}
    sleep    2
    @{checkoutList}=    Get WebElements    ${locatorB_merchantSettings_checkbox_waySelect}
    ${lengthList}=    Get Length    ${checkoutList}
    Should Be Equal As Integers    ${lengthList}    ${570}

shipping_193
    [Documentation]    验证添加物流商弹窗中，可添加润成通物流商
    Sleep And Click Element    ${locatorB_settingShipping_button_addMerchant}
    Sleep And Click Element    ${locatorB_merchantSettings_button_addRCT}
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    润成通
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    CS
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    123456
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    润成通国际物流做为一家专业的跨境电商物流服务商，主要经营范围包括：润邮宝小包、华南邮政小包、欧美日本加拿大FBA专线、美国小包专线、国外代收货款等相关业务。
    Wait Until Page Contains Text    货代名称：润成通
    Wait Until Page Contains Locator    ${locatorB_merchantSettings_icon_shipiingWay}

shipping_194
    [Documentation]    验证物流商列表中，润成通物流商栏，可切换润成通物流商账号
    Sleep And Click Element    ${locatorB_merchantSettings_icon_changeAccount}
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    runchengtong
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    货代名称：runchengtong

shipping_196
    [Documentation]    验证物流商列表中，可删除润成通物流商
    Reload Page And Start Ajax
    Shipping Settings Page
    Sleep    2
    Wait And Click Element Then Confirm    ${locatorB_merchantSettings_icon_deleteAccount}
    Wait Until Page Not Contains Text    货代名称：runchengtong

shipping_200
    [Documentation]    验证添加润成通物流商弹窗中，账户ID输入框输入错误的内容不可添加
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    润成通
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    test
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    123456
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    输入的账户ID或秘钥有误，请重新输入

shipping_201
    [Documentation]    验证添加润成通物流商弹窗中，账户秘钥输入框输入错误的内容不可添加
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    润成通
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    CS
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    test
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    输入的账户ID或秘钥有误，请重新输入

shipping_202
    [Documentation]    验证添加润成通物流商弹窗中，查看官网了解更多 文本链接可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_link_RCTLink}
    Focus On New Window
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    Location Should Be    http://www.rct56.com/
    Sleep    2
    Select Window    title=${title1}

shipping_203
    [Documentation]    验证添加润成通物流商弹窗可关闭
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    润成通测试关闭
    Sleep And Click Element    ${locatorB_merchantSettings_icon_uaiBestClose}
    Wait Until Page Contains Text    添加物流商

shipping_205
    [Documentation]    验证物流商列表中，润成通物流商栏，物流渠道按钮可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_icon_shipiingWay}
    sleep    2
    @{checkoutList}=    Get WebElements    ${locatorB_merchantSettings_checkbox_waySelect}
    ${lengthList}=    Get Length    ${checkoutList}
    Should Be Equal As Integers    ${lengthList}    ${134}

shipping_226
    [Documentation]    验证添加物流商弹窗中，可添加龙讯物流商
    Sleep And Click Element    ${locatorB_settingShipping_button_addMerchant}
    Sleep And Click Element    ${locatorB_merchantSettings_button_addLX}【5】
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    龙讯
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    DJ
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    123456
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
#    Wait Until Page Contains Text    龙讯是一家专注为东南亚市场的跨境进出口B2C卖家提供一站式解決方案，致立于打造特色跨境电商专线为客户提供优质稳定的服务。可提供相应的增值服务，诸如海外仓，一件代发，仓储中转集货等。
    Wait Until Page Contains Text    货代名称：龙讯
    Wait Until Page Contains Locator    ${locatorB_merchantSettings_icon_shipiingWay}

shipping_227
    [Documentation]    验证物流商列表中，龙讯物流商栏，可切换龙讯物流商账号
    Sleep And Click Element    ${locatorB_merchantSettings_icon_changeAccount}
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    longxun
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    货代名称：longxun

shipping_229
    [Documentation]    验证物流商列表中，可删除龙讯物流商
    Reload Page And Start Ajax
    Shipping Settings Page
    Sleep    2
    Wait And Click Element Then Confirm    ${locatorB_merchantSettings_icon_deleteAccount}
    Wait Until Page Not Contains Text    货代名称：longxun

shipping_233
    [Documentation]    验证添加龙讯物流商弹窗中，账户ID输入框输入错误的内容不可添加
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    龙讯
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    test
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    123456
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    输入的账户ID或秘钥有误，请重新输入

shipping_234
    [Documentation]    验证添加龙讯物流商弹窗中，账户秘钥输入框输入错误的内容不可添加
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    龙讯
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    DJ
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    test
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    输入的账户ID或秘钥有误，请重新输入

shipping_235
    [Documentation]    验证添加龙讯物流商弹窗中，查看官网了解更多 文本链接可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_link_LXLink}
    Focus On New Window
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    Location Should Be    http://www.ldlog.com.cn/
    Sleep    2
    Select Window    title=${title1}

shipping_236
    [Documentation]    验证添加龙讯物流商弹窗可关闭
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    龙讯测试关闭
    Sleep And Click Element    ${locatorB_merchantSettings_icon_uaiBestClose}
    Wait Until Page Contains Text    添加物流商

shipping_238
    [Documentation]    验证物流商列表中，龙讯物流商栏，物流渠道按钮可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_icon_shipiingWay}
    sleep    2
    @{checkoutList}=    Get WebElements    ${locatorB_merchantSettings_checkbox_waySelect}
    ${lengthList}=    Get Length    ${checkoutList}
    Should Be Equal As Integers    ${lengthList}    ${70}

shipping_242
    [Documentation]    验证添加物流商弹窗中，可添加buffalo物流商
    Sleep And Click Element    ${locatorB_settingShipping_button_addMerchant}
    Sleep And Click Element    ${locatorB_merchantSettings_button_addBuffalo}[6]
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    buffalo
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    1131905668254061
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    ${locatorB_merchantSettings_text_Buffalopwd}
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    BUFFALO是一家线上贸易物流服务提供商，旨在为所有中非跨境物流服务，和南非本地海外仓、代发货、COD、商品售后等专属增值服务。
    Wait Until Page Contains Text    货代名称：buffalo
    Wait Until Page Contains Locator    ${locatorB_merchantSettings_icon_shipiingWay}

shipping_243
    [Documentation]    验证物流商列表中，buffalo物流商栏，可切换buffalo物流商账号
    Sleep And Click Element    ${locatorB_merchantSettings_icon_changeAccount}
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    海外仓
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    货代名称：海外仓

shipping_245
    [Documentation]    验证物流商列表中，可删除buffalo物流商
    Reload Page And Start Ajax
    Shipping Settings Page
    Sleep    2
    Wait And Click Element Then Confirm    ${locatorB_merchantSettings_icon_deleteAccount}
    Wait Until Page Not Contains Text    货代名称：海外仓

shipping_250
    [Documentation]    验证添加buffalo物流商弹窗中，账户秘钥输入框输入错误的内容不可添加
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    buffalo
    Wait And Input Text    ${locatorB_merchantSettings_input_clientID}    1131905668254061
    Execute Javascript     document.querySelectorAll('[id="secret_key"]')[0].scrollIntoView()
    Sleep    1
    Wait And Input Text    ${locatorB_merchantSettings_input_secretKey}    test
    Sleep And Click Element    ${locatorB_merchantSettings_button_addSave}
    Wait Until Page Contains Text    输入的账户ID或秘钥有误，请重新输入

shipping_251
    [Documentation]    验证添加buffalo物流商弹窗中，查看官网了解更多 文本链接可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_link_BuffaloLink}
    Focus On New Window
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    Location Should Be    http://www.buffaloex.com/
    Sleep    2
    Select Window    title=${title1}

shipping_252
    [Documentation]    验证添加buffalo物流商弹窗可关闭
    Sleep    2
    Wait And Input Text    ${locatorB_merchantSettings_input_channelName}    buffalo测试关闭
    Sleep And Click Element    ${locatorB_merchantSettings_icon_uaiBestClose}
    Wait Until Page Contains Text    添加物流商

shipping_254
    [Documentation]    验证物流商列表中，龙讯物流商栏，物流渠道按钮可点击
    Sleep    2
    Sleep And Click Element    ${locatorB_merchantSettings_icon_shipiingWay}
    sleep    2
    @{checkoutList}=    Get WebElements    ${locatorB_merchantSettings_checkbox_waySelect}
    ${lengthList}=    Get Length    ${checkoutList}
    Should Be Equal As Integers    ${lengthList}    ${4}


# 由于使用封装的Open New And Close Other Windows方法导致为止chrome错误，且只有shipping模块会报错
# （只有在docker中跑会出错，无法截图，暂时找不到错误原因。）
# 先使用每个用例重新登录的方法跑用例
Shipping Case Setup Tmp Fix
	[Documentation]
	Login With Default User
	kwshipping.del_all_shipping_py
    Go To Shipping Page

Shipping Case Teardown Tmp Fix
	[Documentation]
    Close Browser

Add Default Shipping Country
	[Documentation]    添加默认的物流国家（即第一个大洲的第一个国家），并保存
	Wait And Click Element    ${locatorB_shippingNew_btn_addCountry}
	Sleep    0.2
    Wait And Click Element    ${locatorB_shippingNew_popUp_arrow_listArrow}
	Sleep    0.2
    Wait And Click Element    ${locatorB_shippingNew_popUp_checkbox_firstCountry}
	Sleep    0.2
    Wait And Click Element    ${locatorB_shippingNew_btn_popUpConfirm}

Add Default Price Shipping
	[Documentation]    添加默认的价格运费（即不除了运费名，其余不填写）
	Wait And Click Element    ${locatorB_shippingNew_btn_addPriceShipping}
    Wait And Input Text    ${locatorB_shippingNew_popUp_input_shippingName}    autotest_shipping_name
    Wait And Click Element    ${locatorB_shippingNew_popUp_btn_save}

Edit Default Weight Shipping
    [Documentation]    修改重量物流的首重、续重、单位kg
    Wait And Click Element    ${locatorB_shipping_button_EidtShipping}
    Wait And Click Element    ${locatorB_priceSettings_icon_EidtShipping}
    Wait And Click Element    ${locatorB_priceSettings_radio_firstWeight}
    Wait And Input Text    ${locatorB_priceSettings_input_firstWeightPrice}    10
    Wait And Input Text    ${locatorB_priceSettings_input_firstWeightRange}    10
    Wait And Click Element    ${locatorB_priceSettings_select_firstWeightUnit}
    Wait And Click Element    ${locatorB_priceSettings_input_firstWeightUnit}
    Wait And Input Text    ${locatorB_priceSettings_input_continuousWeightPrice}    2
    Wait And Input Text    ${locatorB_priceSettings_input_continuousWeightRange}    1
    Wait And Click Element    ${locatorB_priceSettings_select_continuousWeightUnit}
    Wait And Click Element    ${locatorB_priceSettings_input_continuousWeightUnit}
    Sleep And Click Element    ${locatorB_priceSettings_button_popUpsave}