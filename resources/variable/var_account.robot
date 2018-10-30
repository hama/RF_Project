*** Variables ***
# locator
${locatorB_account_button_addEmployeeAccount}    dom:document.querySelectorAll('button[class*="ant-btn large_btn_3503"]')[0]    # 添加员工按钮
${locatorB_account_input_name}    dom:document.querySelectorAll('input[id="name"]')[0]    # 输入姓名input
${locatorB_account_input_email}    dom:document.querySelectorAll('input[id="account"]')[0]    # 输入邮箱input
${locatorB_account_button_sendInvite}    dom:document.querySelectorAll('button[class="ant-btn middle_btn_e01e send_e41d"]')[0]    # 邀请按钮


# context
${contextB_account_employeeManagement}    员工管理


#.新手教程

${locatorB_button_commodity}    dom:document.querySelectorAll('button[class*="middle_btn"]')[0]     #添加一个商品
${locatorB_button_decorate}    dom:document.querySelectorAll('button[class*="middle_btn"]')[1]     #装修店面
${locatorB_button_shipping}    dom:document.querySelectorAll('button[class*="middle_btn"]')[2]     #设置物流方案
${locatorB_button_collection}    dom:document.querySelectorAll('button[class*="middle_btn"]')[3]     #设置收款方式


#.装修店铺

${locatorB_theme_button_editor}    dom:document.querySelectorAll('button[class*="middle_btn"]')[0]     #装修店铺编辑按钮

#.概况
${locatorB_overview_notPay}      dom:document.querySelectorAll('[class*="overview_block"]')[0]



