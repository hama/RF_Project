*** Settings ***
Resource          var_common.robot

*** Variables ***
# api interface
${apiB_tax_list}    ${home_page}/api/tax/list    # 税费数据列表接口
${apiB_tax_toggle}    ${home_page}/api/tax/toggle    # 税费开关接口
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
