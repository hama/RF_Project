*** Variables ***
# locator
${locatorB_account_button_addEmployeeAccount}    dom:document.querySelectorAll('button[class*="ant-btn large_btn_3503"]')[0]    # 添加员工按钮
${locatorB_account_input_name}    dom:document.querySelectorAll('input[id="name"]')[0]    # 输入姓名input
${locatorB_account_input_email}    dom:document.querySelectorAll('input[id="account"]')[0]    # 输入邮箱input
${locatorB_account_button_sendInvite}    dom:document.querySelectorAll('button[class="ant-btn middle_btn_e01e send_e41d"]')[0]    # 邀请按钮


# context
${contextB_account_employeeManagement}    员工管理
