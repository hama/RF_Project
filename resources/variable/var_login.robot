*** Settings ***
Resource          var_common.robot

*** Variables ***
# locator_login
${locatorB_login_btn_login}      class:logBtn___3pRgJ    #.登陆按钮
${locatorB_login_btn_register}    dom:document.querySelectorAll("div[class='bottomEdit___zk0l5'] > a")[0]     #.注册按钮
${locatorB_login_btn_findpwd}       dom:document.querySelectorAll(".bottomEdit___zk0l5 div a")[0]     #.忘记密码按钮
${locatorB_login_btn_employeeLogin}       dom:document.querySelectorAll("div[class='bottomEdit___zk0l5'] div a")[1]     #.员工登录按钮
${locatorB_login_btn_sendVcode}       dom:document.querySelectorAll("button[class~='sendBtn___3c2NB']")[0]     #.发送验证码按钮
#${locatorB_login_input_account}       dom:document.querySelectorAll("input[data-robot='account']")[0]     #.账号输入框
${locatorB_login_input_account}       id:account    #.账号输入框
${locatorB_login_input_password}       id:password     #.密码输入框
${locatorB_login_input_domain}       id:username     #.域名输入框
${locatorB_login_input_confirmPwd}       id:confirmpass     #.确认密码输入框
${locatorB_login_input_vcode}    id:code    #.验证码输入框
${locatorB_login_input_inviteCode}    id:invite_code    #.邀请码输入框

# content
${contentB_login_errorFormatAccount}    17@11111111     #account格式不正确
${contentB_login_unregisteredAccount}    17811111111    #account未注册
${contentB_login_errorPwd}    000000                    #password错误密码
${contentB_login_errorFormatDomain}    @@@              #domain格式不正确
${contentB_login_unregisteredDomain}    dgdfg           #domain未注册
${contentB_login_errorFormatVCode}    12@456            #vcode格式不正确
${contentB_login_invalidVCode}    940545                #vcode无效
