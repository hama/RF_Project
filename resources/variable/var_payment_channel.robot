*** Variables ***
#.locatorB  收款渠道

#. icon
${locatorB_pay_icon_paypalPrompt}    dom:document.querySelectorAll('[class*="icon_more"]')[0]     #. icon paypal收款提示信息


#. button
${locatorB_pay_button_paypalActivation}    dom:document.querySelectorAll('[class*="ant-btn"]')[0]    #. paypal 收款激活/编辑按钮
${locatorB_pay_button_creditCardActivation}    dom:document.querySelectorAll('[class*="ant-btn"]')[1]    #. 信用卡 收款激活/编辑按钮
${locatorB_pay_button_deliveryActivation}    dom:document.querySelectorAll('[class*="ant-btn"]')[2]    #. 货到付款激活/编辑按钮

${locatorB_pay_button_replaceUserCard}    dom:document.querySelectorAll('[class*="form_content"] button[class*="ant-btn"]')[0]   #.更换会员卡
#. button switch
${locatorB_pay_switch_creditCardSwitch}    dom:document.querySelectorAll('div[class*="payment_wrap"]:nth-child(2) [data-robot="pay_on_off"]')[0]    #.信用卡收款 开关按钮
${locatorB_pay_switch_codSwitch}    dom:document.querySelectorAll('[id="cod"] button[data-robot="pay_on_off"]')[0]    #.货到付款  开关按钮
#. 绑定按钮

${locatorB_pay_button_bindingMembers}    dom:document.querySelectorAll('[data-robot="pay_binding"]')[0]    #. 绑定按钮
#. link
${locatorB_pay_link_replacePay}    dom:document.querySelectorAll('[class*="change_payment"]')[0]    #. 信用卡收款 更换收款方式

#. input
${locatorB_pay_input_deliveryPayName}    dom:document.querySelectorAll('input[class="ant-input"]')[0]     #.货到付款文本框输入-支付名称
${locatorB_pay_textarea_deliveryPayInstructions}    dom:document.querySelectorAll('[class*="text_area"]')[0]     #.货到付款文本框输入-支付说明
${locatorB_pay_input_deliveryPayWay}    dom:document.querySelectorAll('[class*="text_area"]')[1]      #.货到付款文本框输入-支付指示
${locatorB_pay_button_save}    dom:document.querySelectorAll('[class*="form_container"] [class*="middle_btn"]')[0]     #.货到付款  保存按钮
${locatorB_pay_button_canecl}    dom:document.querySelectorAll('[class*="form_container"] [class*="default_btn"]')[0]     #.货到付款  取消按钮

#.绑定ipaylinks会员号
${locatorB_pay_input_userCard}    dom:document.querySelectorAll('input[id="client_id"]')[0]     #.会员号
${locatorB_pay_input_pwsKey}    dom:document.querySelectorAll('input[id="secret_key"]')[0]    #.秘钥
#. 绑定钱海账号
${locatorB_pay_input_account}    dom:document.querySelectorAll('input[id="account"]')[0]     #.账号
${locatorB_pay_input_terminal}    dom:document.querySelectorAll('input[id="client_id"]')[0]    #.客户端ID
${locatorB_pay_input_secureCode}    dom:document.querySelectorAll('input[id="secret_key"]')[0]      #.秘钥
#. button 信用卡选择按钮

${locatorB_pay_button_paymenChoose}    dom:document.querySelectorAll('[class*="credit_wrap"] [class*="middle_btn"]')    #.信用卡选择

#dj > .payment_container_91a0 > div:nth-child(2) div.text_wrap_1c52 button





