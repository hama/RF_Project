*** Settings ***
Resource          var_common.robot

*** Variables ***
# locator_login
${locatorB_login_btn_login}      dom:document.querySelectorAll('button[data-robot="login"]')[0]    #.登陆按钮
${locatorB_login_btn_register}    dom:document.querySelectorAll('a[data-robot="register"]')[0]     #.注册按钮
${locatorB_login_btn_findpwd}       dom:document.querySelectorAll('a[data-robot="forgotten_pwd"]')[0]     #.忘记密码按钮
${locatorB_login_btn_employeeLogin}       dom:document.querySelectorAll('a[data-robot="employee_login"]')[0]     #.员工登录按钮
${locatorB_login_btn_sendVcode}       dom:document.querySelectorAll('button[data-robot="send_vcode"]')[0]     #.发送验证码按钮
#${locatorB_login_input_account}       dom:document.querySelectorAll("input[data-robot='account']")[0]     #.账号输入框
${locatorB_login_input_account}       id:account    #.账号输入框
${locatorB_login_input_password}       dom:document.querySelectorAll('input[data-robot="ph_password"]')[0]     #.密码输入框
${locatorB_login_input_domain}       dom:document.querySelectorAll('input[data-robot="ph_domain"]')[0]     #.域名输入框
${locatorB_login_input_confirmPwd}       dom:document.querySelectorAll('input[data-robot="ph_confirmpwd"]')[0]     #.确认密码输入框
${locatorB_login_input_vcode}    dom:document.querySelectorAll('input[data-robot="ph_invite_code"]')[0]    #.验证码输入框
${locatorB_login_input_inviteCode}    id:invite_code    #.邀请码输入框

# content
${contentB_login_errorFormatAccount}    17@11111111     #account格式不正确
${contentB_login_unregisteredAccount}    17811111111    #account未注册
${contentB_login_errorPwd}    000000                    #password错误密码
${contentB_login_errorFormatDomain}    @@@              #domain格式不正确
${contentB_login_unregisteredDomain}    dgdfg           #domain未注册
${contentB_login_errorFormatVCode}    12@456            #vcode格式不正确
${contentB_login_invalidVCode}    940545                #vcode无效
