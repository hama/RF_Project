*** Settings ***
Suite Setup       Shipping Suite Setup
Suite Teardown    Shipping Suite Teardown
Test Setup        Shipping Case Setup
Test Teardown     Shipping Case Teardown
Force Tags        shipping
Resource          ../../../resources/keywords/kw_common.robot

*** Test Cases ***
shipping_group001
    [Tags]    group
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    # 检查点
    Check P0 Point From shipping_130
    Check P0 Point From shipping_131
    Check P0 Point From shipping_133

shipping_group002
    [Tags]    group
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    Sleep And Click Element    ${locatorB_settingShipping_icon_addMerchant}
    Sleep And Click Element    ${locatorB_merchantSettings_button_addUaiBest}
    # 检查点
    Check P0 Point From shipping_137
    Check P0 Point From shipping_138
    Check P0 Point From shipping_139
    Check P0 Point From shipping_140

#shipping_group003
#    [Tags]    group
#    # 前置条件
#    kworder.add_deading_order_with_delivering_status_py
#    kwshipping.add_shipping_merchant_with_conf_py
#    Reload Page And Start Ajax
#    Shipping Settings Page
#    # 检查点
#
#    Sleep And Click Element    ${locatorB_merchantSettings_icon_shipiingWay}
#    Sleep And Click Element    ${locatorB_merchantSettings_checkbox_waySelect}
#    Sleep And Click Element    ${locatorB_merchantSettings_button_shipiingWaySave}
#    Sleep    2
#    Go To Dealing Order Page
#    Sleep    2
#    Wait And Click Element    ${locatorB_orderDealing_items_listOrder}[0]
#    Wait And Click Element    ${locatorB_orderDetail_button_toDelivery}
#    Sleep And Click Element    ${locatorB_orderDetail_popUp_radio_autoGet}
#    Sleep And Click Element    ${locatorB_orderDetail_popUp_select_shippingWay}
#    Wait Until Page Contains Text    汉邮-平邮小包

shipping_group004
    [Tags]    group
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    # 检查点
    Check P0 Point From shipping_143
    Check P0 Point From shipping_144
    Check P0 Point From shipping_146

shipping_group005
    [Tags]    group
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    Wait And Click Element    ${locatorB_settingShipping_icon_addMerchant}
    Wait And Click Element    ${locatorB_merchantSettings_button_addHSD}
    # 检查点
    Check P0 Point From shipping_150
    Check P0 Point From shipping_151
    Check P0 Point From shipping_152
    Check P0 Point From shipping_153
    Check P0 Point From shipping_154

#shipping_group006
#    [Tags]    group
#    # 前置条件
#    &{conf}=    Create Dictionary    channel_name=鸿速达    client_id=SZDJKJ    secret_key=123456    name=hongsuda
#    kwshipping.add_shipping_merchant_with_conf_py    ${conf}
#    Reload Page And Start Ajax
#    Shipping Settings Page
#    # 检查点
#    Check P0 Point From shipping_156

shipping_group007
    [Tags]    group
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    # 检查点
    Check P0 Point From shipping_160
    Check P0 Point From shipping_161
    Check P0 Point From shipping_163

shipping_group008
    [Tags]    group
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    Wait And Click Element    ${locatorB_settingShipping_icon_addMerchant}
    Wait And Click Element    ${locatorB_merchantSettings_button_addYokesi}
    # 检查点
#    Check P0 Point From shipping_167
#    Check P0 Point From shipping_168
    Check P0 Point From shipping_169
    Check P0 Point From shipping_170
    Check P0 Point From shipping_171

shipping_group009
    [Tags]    group
    # 前置条件
    &{conf}=    Create Dictionary    channel_name=youkesi    client_id=20006    secret_key=b6d95276-f504-40e4-88f7-52ebca33190620006    name=yokesi
    kwshipping.add_shipping_merchant_with_conf_py    ${conf}
    Reload Page And Start Ajax
    Shipping Settings Page
    # 检查点
    Check P0 Point From shipping_173

shipping_group010
    [Tags]    group
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    # 检查点
    Check P0 Point From shipping_177
    Check P0 Point From shipping_178
    Check P0 Point From shipping_180

shipping_group011
    [Tags]    group
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    Wait And Click Element    ${locatorB_settingShipping_icon_addMerchant}
    Wait And Click Element    ${locatorB_merchantSettings_button_addPFC}
    # 检查点
    Check P0 Point From shipping_185
    Check P0 Point From shipping_186
    Check P0 Point From shipping_187

#shipping_group012
#    [Tags]    group
#    # 前置条件
#    &{conf}=    Create Dictionary    channel_name=皇家    client_id=80000    secret_key=92cdbbbf-e0a2-45d6-a527-7c3ec276aade80000    name=pfcexpress
#    kwshipping.add_shipping_merchant_with_conf_py    ${conf}
#    Reload Page And Start Ajax
#    Shipping Settings Page
#    # 检查点
#    Check P0 Point From shipping_189

shipping_group013
    [Tags]    group
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    # 检查点
    Check P0 Point From shipping_193
    Check P0 Point From shipping_194
    Check P0 Point From shipping_196

shipping_group014
    [Tags]    group
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    Wait And Click Element    ${locatorB_settingShipping_icon_addMerchant}
    Wait And Click Element    ${locatorB_merchantSettings_button_addRCT}
    # 检查点
    Check P0 Point From shipping_200
    Check P0 Point From shipping_201
    Check P0 Point From shipping_202
    Check P0 Point From shipping_203

shipping_group015
    [Tags]    group
    # 前置条件
    &{conf}=    Create Dictionary    channel_name=润成通    client_id=CS    secret_key=123456    name=runchengtong
    kwshipping.add_shipping_merchant_with_conf_py    ${conf}
    Reload Page And Start Ajax
    Shipping Settings Page
    # 检查点
    Check P0 Point From shipping_205

shipping_group019
    [Tags]    group
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    # 检查点
    Check P0 Point From shipping_226
    Check P0 Point From shipping_227
    Check P0 Point From shipping_229

shipping_group020
    [Tags]    group
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    Wait And Click Element    ${locatorB_settingShipping_icon_addMerchant}
    Wait And Click Element    ${locatorB_merchantSettings_button_addLX}[5]
    # 检查点
    Check P0 Point From shipping_233
    Check P0 Point From shipping_234
    Check P0 Point From shipping_235
    Check P0 Point From shipping_236

#shipping_group021
#    [Tags]    group
#    # 前置条件
#    &{conf}=    Create Dictionary    channel_name=龙讯    client_id=DJ    secret_key=123456    name=longxun
#    kwshipping.add_shipping_merchant_with_conf_py    ${conf}
#    Reload Page And Start Ajax
#    Shipping Settings Page
#    # 检查点
#    Check P0 Point From shipping_238

shipping_group022
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    # 检查点
    Check P0 Point From shipping_242
    Check P0 Point From shipping_243
    Check P0 Point From shipping_245

shipping_group023
    [Tags]    group
    # 前置条件
    kwshipping.add_shipping_merchant_with_conf_py
    Reload Page And Start Ajax
    Shipping Settings Page
    Wait And Click Element    ${locatorB_settingShipping_icon_addMerchant}
    Wait And Click Element    ${locatorB_merchantSettings_button_addBuffalo}[6]
    # 检查点
    Check P0 Point From shipping_250
    Check P0 Point From shipping_251
    Check P0 Point From shipping_252

shipping_group024
    [Tags]    group
    # 前置条件
    &{conf}=    Create Dictionary    channel_name=buffalo    client_id=1131905668254061
    ...    secret_key=MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCIFg9XBp89SljRR1gbOgY7pxLHJ+r8o+GIE/ZylB2+VoFGYbwoG1ANT0wOJup7AcgbKEdVl9RnoaZRp8zumRqxBqCLbzhWC9MIqRZvFr2/IqC7G5EuSqdo/Urd7kgT0IFaUKeYVzfvkJYYcpghnc/q2rlj52edmmOBWMTjYgmLp8LbWQJ+ariMJN0vwKXkLO5BwpYV3lts66H8Etc80cwyWkmKHnJYNS01Fl2TTHnPZi92aMeFlM3CLqBrKMTLWI6Y3s6OKxFg7mrDc+3IE0TrziNd4U2jD1pwiv3YTcfKNQsgtvxmPX9NCBJEup6mqBHkgvGqKHJC1QSdpLrYeHSDAgMBAAECggEAFem/dJr7X0oufRyI4nF4eXiQvIMAAsh804WrZI3XMEQLswKf4rFrNYl0TL8VeNMznrPgsLavHDTabEGh7TW4J5NSnME/CBQFWlqn4yF9Ul7IFPj+ar7YsD5BJPVuo8oqWhmsswowVqIomS0ytA8OYNnxilXDyIwIw9ZAdgDeWp9f0nukQ6wYRkuRLuqLojSVloonLuzJWtuXv0S1vt/cIBb83KTgeBcIKfCV2yLH4/Rvby1pgC0RN5cfrWsdLH6jDnQQwUp5V02agIjJKFAO54hevOXjTskYWUSAyomoIZe/nK9QFE2hSZ6qEDhDaUuD0hVKdiV5790dlq5cRO9gUQKBgQC9EdoG2pINs+ApSURJjQMycx4jtGvqLIWTGzqVamK8lQae27zoG+4pxmFDvhef0p52Uy/kBH4JTikcLScQAbs9qxMMwdoKhBQRoX2v5nzdyV76WVlKzjmD3B11kEnrySg6Dq8Uh/1WWfAY3SqqeosqNlLUDPVWylhXnHEpgmO+yQKBgQC4Qqfv/QMMWsI6mJkqndjWJh/0HP2CdZ+DCAkQnJC1Ia2w8uSz9f0E0N0JDX630Eg8PWzVfioE5GDwvMMte60xLBzx94PuGaVlhoGjeTKrv1sXhVQqZ6mJ9m+RkkJuG2XQ8EoEENxlCCa08yl+rMHuzEQK/0c9ZmnEd7SZk7TC6wKBgHd+bNmgEmbupGHzmGET6k1cTFQsl3etI87RirkcP8MIPOLx5fackG1+n8J8xdmQ9+24ra/i1vVynLDeKK4JKhnToXqSmgfDahuqgRFHDuvtdUWsaq7In7kiyMugodePjwkCdsz3FboZpZFRVsHgKUxIgRjcB8MOp77XdP3TFs9hAoGAR3vMjSU6FoPrUDI9UbQ1GDdoNBs/GmqpfHsUkTY8SZkMOlaw9UQcac7hwY5Tt9n8/CnUXCr7ADTdiuegTLfrY+U6QYEF1MxsRyvchWASkWDGZSSbl2vp8RUDCZWVYgQNBvcBr/welK+J3K9tTLCW+B6U0zNgHujpZYgPL3mHKgsCgYBLZuuYZEJ8qKTYmHigJUF0GUamHKteD3POJtV6wYFp/YbSHdmDOoWPwR4kzDC36oFwHGlxPXM6DXZTCPnCeXvyLyDfMs4sdUCxs1zq6vgZrKO3cfRRi0lHdzEEExzlCJArqGbGOrI5y551KKBNmzqeRVpYHhBP7PLTQ/8dgVwS6Q==
    ...    name=buffalo
    kwshipping.add_shipping_merchant_with_conf_py    ${conf}
    Reload Page And Start Ajax
    Shipping Settings Page
    # 检查点
    Check P0 Point From shipping_254