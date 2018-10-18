*** Settings ***
Resource          var_common.robot

*** Variables ***
# api interface
${apiB_tax_list}    ${home_page}/api/tax/list    # 税费数据列表接口
${apiB_tax_toggle}    ${home_page}/api/tax/toggle    # 税费开关接口

# locator
#   text
${locatorB_taxPrice_text_methodOfTax}     收税方式


${locatorB_taxPrice_icon_shippingVender}    dom:document.querySelectorAll('span[class="enterprise_icon___1kAvj"]')[0]         #物流商
${locatorB_taxPrice_switch_list}      dom:document.querySelectorAll('.ant-switch')    #运费设置关闭/开启
${locatorB_taxPrice_icon_set}       dom:document.querySelectorAll('.ant-table-row .djfont')[0]      #.税费设置的第一个国家，设置操作

#.税费设置 center
${locatorB_taxPrice_set_taxes}     dom:document.querySelectorAll('.ant-input')[0]     #.税费设置-国家税率设置input

${locatorB_taxPrice_popUp_button_save}      dom:document.querySelectorAll('[class*="ant-btn-primary"]')[0]     #.税费设置-确定提交按钮
#   button
${locatorB_taxPrice_button_setLogistics}     dom:document.querySelectorAll("button")[0]
${locatorB_taxPrice_setting}      dom:document.querySelectorAll(".setting")[0]
${locatorB_taxPrice_span_antSwitch}     dom:document.querySelectorAll("class~=ant-switch")
${locatorB_shipping_ul_solutionLogistics}   dom:document.querySelectorAll('ul[id="test_shipping_list_0"]')      #.物流列表-第一个列表
${locatorB_shipping_button_deleteLogisticsa}   dom:document.querySelectorAll('button[id="test_shipping_delete_btn"]')       #。物流详细信息-删除该物流方案
${locatorB_shipping_button_determine}   dom:document.querySelectorAll('button[data-robot="pop_confirm"]')       #.确定按钮

${locatorB_taxPrice_button_shippingSet}    dom:document.querySelectorAll('button[type="button"]')[0]     #物流设置

${locatorB_shipping_button_btn}    dom:document.querySelectorAll("button")[0]    #.开始设置物流按钮


#locator icon
${locatorB_taxPrice_icon_custom}    dom:document.querySelectorAll("[class*='con_custom']")[0]      #.税费提示问题


# locator popup
${locatorB_taxPrice_icon_settingList}    dom:document.querySelectorAll('[class~="setting"]')     #.操作设置税费图标
${locatorB_taxPrice_popUp_uniteInput}     dom:document.querySelectorAll('[class*="uniteInput"]')[0]     #.税费弹窗.国家税费文本输入框
${locatorB_taxPrice_popUp_cityInputList}     dom:document.querySelectorAll('[class="ant-input"]')      #.税费弹窗.城市税费文本输入框
${locatorB_taxPrice_popUp_cancelBut}       dom:document.querySelectorAll('[class~="ant-modal-close"]')[0]      #税费弹窗.取消按钮






# locator
${locatorB_tax_goto_shipping}    tag:button    # 页面只有一个 button
${locatorB_tax_help}    dom:document.querySelectorAll('.hd-line-help')[1]
${locatorB_tax_setting}    dom:document.querySelectorAll('.card-col-Setting')[0]
${locatorB_tax_close}    class:ant-modal-close-x
# page content
${contentB_tax_setting}    税费设置    # 税费菜单栏文字
${contentB_tax_tips_list}    只有在运费设置中添加过的国家，才会出现在下面列表中    # 页面提示内容
${contentB_tax_tips_count}    税=（税率 x 价格）／（1+税率）。例如：$1.00，20%的增值税是$0.17（四舍五入）    # 税费页面帮助信息内容
${contentB_tax_tips_switch}    设置成功    # 切换税费开关提示保存成功
${contentB_tax_tips_setting}    设置    # 设置按钮 tips
${contentB_tax_head_country}    国家    # 列表中的展示国家的 title
${contentB_tax_head_taxPrice}    国家税率    # 列表中展示税率的 title
${contentB_tax_head_location}    分地区    # 列表中展示地区税率的 title
${contentB_tax_head_operation}    操作    # 列表中设置按钮和切换开关所在的 title
${contentB_tax_data_all}    全部    # 不区分地区的国家，在地区栏显示全部


