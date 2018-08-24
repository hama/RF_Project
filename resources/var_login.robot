*** Settings ***
Resource          var_common.robot

*** Variables ***
# locator_login
${locatorB_login_btn_login}      class:logBtn___3pRgJ    #.登陆按钮
${locatorB_login_btn_register}    dom:document.querySelectorAll(".bottomEdit___zk0l5 a")[0]     #.注册按钮
${locatorB_login_btn_findpwd}       dom:document.querySelectorAll(".bottomEdit___zk0l5 div a")[0]     #.忘记密码按钮
${locatorB_login_btn_employeeLogin}       dom:document.querySelectorAll("div[class='bottomEdit___zk0l5'] div a")[1]     #.员工登录按钮
${locatorB_login_btn_sendVcode}       dom:document.querySelectorAll("button[class~='sendBtn___3c2NB']")[0]     #.发送验证码按钮

# content
${contentB_login_errorFormatAccount}    17@11111111     #account格式不正确
${contentB_login_unregisteredAccount}    17811111111    #account未注册
${contentB_login_errorPwd}    000000                    #password错误密码
${contentB_login_errorFormatDomain}    @@@              #domain格式不正确
${contentB_login_unregisteredDomain}    dgdfg           #domain未注册