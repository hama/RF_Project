*** variable ***

#结账页设置元素class="ant-btn

#button
${locatorB_checkout_button_cancel}     dom:document.querySelectorAll('button[type="button"]')[0]  #.取消按钮
${locatorB_checkout_button_determine}    dom:document.querySelectorAll('button[type="button"]')[1]   #.保存按钮
# locator invoicinglabel
${locatorB_checkout_text_customerRights}    dom:document.querySelectorAll('p[class="title_bdd1"]')[0]              #顾客权限文字
${locatorB_checkout_label_notMembers}    dom:document.querySelectorAll('.radio_btn_cddf')[0]    #.顾客权限-不开启会员注册
${locatorB_checkout_label_loginMembers}    dom:document.querySelectorAll('.radio_btn_cddf')[1]    #.顾客权限-注册会员与非会员可以购买
${locatorB_checkout_label_buyMembers}    dom:document.querySelectorAll('.radio_btn_cddf')[2]    #.顾客权限-会员购买
#顾客联系方式
${locatorB_checkout_label_customerEmail}    dom:document.querySelectorAll('.radio_btn_cddf')[3]    #.顾客联系方式-邮箱
${locatorB_checkout_label_customerPhone}    dom:document.querySelectorAll('.radio_btn_cddf')[4]    #.顾客联系方式-手机
${locatorB_checkout_label_customerEmailAndPhone}    dom:document.querySelectorAll('.radio_btn_cddf')[5]    #.顾客联系方式-邮箱和手机

#${locatorB_checkout_checkbox_phoneMandatory}    dom:document.querySelectorAll('class="ant-checkbox-input"')[0]  #.顾客联系方式-邮箱和手机-手机必填
#${locatorB_checkout_checkbox_emailMandatory}    dom:document.querySelectorAll('class="ant-checkbox-input"')[1]  #.顾客联系方式-邮箱和手机-邮箱必填


${locatorB_checkout_checkbox_emailAndPhoneMandatory}    dom:document.querySelectorAll('[class="ant-checkbox ant-checkbox-checked"]')    #判断多选框是否被选中
${locatorB_checkout_checkbox_phoneMandatory}    dom:document.querySelectorAll('[class~="ant-checkbox"]')[0]   #判断多选框-邮箱和手机-手机必填 未选中状态
${locatorB_checkout_checkbox_emailMandatory}    dom:document.querySelectorAll('[class~="ant-checkbox"]')[1]   #判断多选框-邮箱和手机-邮箱必填 未选中状态
${locatorB_checkout_checkbox_selected}    dom:document.querySelectorAll('[class~="ant-checkbox-checked"]')   # 选中状态
# locator invoicingraido
#收集信息
#..姓名格式
${locatorB_checkout_radio_name}    dom:document.querySelectorAll('input[class="ant-radio-input"]')[0]    #.姓名
${locatorB_checkout_radio_surnameAndName}    dom:document.querySelectorAll('input[class="ant-radio-input"]')[1]    #.姓和名分开写
#..公司名
${locatorB_checkout_radio_companyNameMandatory}    dom:document.querySelectorAll('input[class="ant-radio-input"]')[2]    #.必填
${locatorB_checkout_radio_companyNameOptional}    dom:document.querySelectorAll('input[class="ant-radio-input"]')[3]    #.选填
${locatorB_checkout_radio_companyNameHidden}    dom:document.querySelectorAll('input[class="ant-radio-input"]')[4]    #.隐藏
#..邮政编码
${locatorB_checkout_radio_emailCodeMandatory}    dom:document.querySelectorAll('input[class="ant-radio-input"]')[5]    #.必填
${locatorB_checkout_radio_emailCodeOptional}    dom:document.querySelectorAll('input[class="ant-radio-input"]')[6]    #.选填
${locatorB_checkout_radio_emailCodeHidden}    dom:document.querySelectorAll('input[class="ant-radio-input"]')[7]    #.隐藏

## locator invoicingService
#服务说明
#..退款条约
${locatorB_checkout_linkBut_generateRefundTreaty}    dom:document.querySelectorAll('a[class="input-system-tpl"]')[0]       #.退款条约-生成系统默认模版
${locatorB_checkout_textarea_refundTreatyInputBox}    dom:document.querySelectorAll('textarea[class="ant-input"]')[0]       #.退款条约-文本输入框
#..隐私政策
${locatorBcheckout_linkBut_generatePolicy}    dom:document.querySelectorAll('a[class="input-system-tpl"]')[1]       #.隐私政策-生成系统默认模版
${locatorB_checkout_textarea_policyInputBox}    dom:document.querySelectorAll('textarea[class="ant-input"]')[1]      #.隐私政策-文本输入框
#..服务条约
${locatorB_checkout_linkBut_generateServiceTreaty}    dom:document.querySelectorAll('a[class="input-system-tpl"]')[2]       #.服务条约-生成系统默认模版
${locatorB_checkout_textarea_refundServiceInputBox}    dom:document.querySelectorAll('textarea[class="ant-input"]')[2]      #.服务条约-文本输入框


${locatorB_checkout_generateRefundTreaty}   退款条约
