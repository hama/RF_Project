*** Settings ***
Resource          var_common.robot

*** Variables ***
#.locatorB_subtractionsMain
${locatorB_subtractionsMain_button_addActivity}    dom:document.querySelectorAll('[class*="ant-btn large_btn"]')    # 满减活动 - 新建活动

${locatorB_subtractionsMain_tab_ActivityAll}    dom:document.querySelectorAll('[role="tab"]')[0]    # 满减活动 - 全部tab
${locatorB_subtractionsMain_tab_ActivityNoStart}    dom:document.querySelectorAll('[role="tab"]')[1]    # 满减活动 - 未开始tab
${locatorB_subtractionsMain_tab_ActivityUnderWay}    dom:document.querySelectorAll('[role="tab"]')[2]    # 满减活动 - 进行中tab
${locatorB_subtractionsMain_tab_ActivityFinish}    dom:document.querySelectorAll('[role="tab"]')[3]    # 满减活动 - 已结束tab

${locatorB_subtractionsMain_input_KeywordSearch}    dom:document.querySelectorAll('[id="keywords"]')    # 满减活动 - 搜索输入框

${locatorB_subtractionsMain_select_ActivityType}    dom:document.querySelectorAll('[id="type"]')    # 满减活动 - 活动类型下拉框
${locatorB_subtractionsMain_select_AllType}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[0]    # 满减活动 - 活动类型下拉框 - 全部类型
${locatorB_subtractionsMain_select_Reduce}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[1]    # 满减活动 - 活动类型下拉框 - 满额减元
${locatorB_subtractionsMain_select_Discount}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[2]    # 满减活动 - 活动类型下拉框 - 满件打折

${locatorB_subtractionsMain_button_KeywordSearch}    dom:document.querySelectorAll('[class*="ant-btn confirm_btn"]')    # 满减活动 - 搜索按钮
${locatorB_subtractionsMain_button_ResetSearch}    dom:document.querySelectorAll('[class*="ant-btn small_btn"]')    # 满减活动 - 重置按钮

${locatorB_subtractionsMain_list_firstActivity}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr')[0]    # 满减活动 - 第一个活动第一行
#${locatorB_subtractionsMain_text_firstActivityID}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(1)')    # 满减活动 - 活动列表 - 活动编号
${locatorB_subtractionsMain_text_firstActivityName}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(1)')    # 满减活动 - 活动列表 - 活动名称
${locatorB_subtractionsMain_text_firstActivityTime}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(2)')    # 满减活动 - 活动列表 - 活动时间
${locatorB_subtractionsMain_text_firstActivityCode}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(3)')    # 满减活动 - 活动列表 - 优惠项
${locatorB_subtractionsMain_text_firstActivityRange}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(4)')    # 满减活动 - 活动列表 - 适用商品
${locatorB_subtractionsMain_text_firstActivityStatus}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(5)')    # 满减活动 - 活动列表 - 活动状态
${locatorB_subtractionsMain_icon_firstActivityPreview}    dom:document.querySelectorAll('[class*="djfont dj-preview"]')[0]    # 满减活动 - 第一个活动 - 预览 图标
${locatorB_subtractionsMain_icon_firstActivityDelete}    dom:document.querySelectorAll('[class*="djfont delete"]')[0]    # 满减活动 - 活动列表 - 第一个 删除 图标
${locatorB_subtractionsMain_icon_firstActivityStop}    dom:document.querySelectorAll('[class*="djfont stop icon"]')[0]    # 满减活动 - 活动列表 -第一个 提前结束 图标

${locatorB_subtractionsMain_text_pageinationTotal}     dom:document.querySelectorAll('[class*="ant-pagination"] li:nth-child(1)')     # 满减活动 - 活动列表 -活动总数
${locatorB_subtractionsMain_icon_pageinationNext}    dom:document.querySelectorAll('[class*="ant-pagination-next"]')[0]    # 满减活动 - 活动列表 -下一页 图标


#.locatorB_subtractionNew
${locatorB_subtractionNew_icon_ReturnActivity}    dom:document.querySelectorAll('[class="djfont dj-back"]')[0]    #返回满减活动 图标

${locatorB_subtractionNew_input_ActivityName}    dom:document.querySelectorAll('[id="title"]')   #活动名称

${locatorB_subtractionNew_icon_ActivityTimeStart}    dom:document.querySelectorAll('[class*="anticon anticon-calendar"]')[0]    #活动时间 - 开始时间选择
${locatorB_subtractionNew_input_ActivityTimeStart}    dom:document.querySelectorAll('[class="ant-calendar-input "]')    #活动时间 - 开始时间输入框
${locatorB_subtractionNew_button_ActivityTimeStart}    dom:document.querySelectorAll('[class="ant-calendar-ok-btn"]')    #活动时间 - 开始时间确定按钮

${locatorB_subtractionNew_icon_ActivityTimeEnd}    dom:document.querySelectorAll('[class*="anticon anticon-calendar"]')[1]    #活动时间 - 结束时间选择
${locatorB_subtractionNew_input_ActivityTimeEnd}    dom:document.querySelectorAll('[class="ant-calendar-input "]')    #活动时间 - 结束时间输入框
${locatorB_subtractionNew_button_ActivityTimeEnd}    dom:document.querySelectorAll('[class="ant-calendar-ok-btn"]')    #活动时间 - 结束时间确定按钮
${locatorB_subtractionNew_checkbox_ActivityTimeNoEnd}    dom:document.querySelectorAll('[class="ant-checkbox"]')[0]    #活动时间 - 长期 复选框

${locatorB_subtractionNew_select_ActivityType}     dom:document.querySelectorAll('[class*="ant-select-selection"]')[0]    #优惠类型下拉框
${locatorB_subtractionNew_select_newReduce}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[0]   #优惠类型 - 满额减元
${locatorB_subtractionNew_input_totalPrice}    dom:document.querySelectorAll('[id="prerequisite_subtotal_range[0].greater_than_or_equal_to"]')[0]    #优惠层级1 - 满多少/#优惠层级1 - 满多少件
${locatorB_subtractionNew_input_cutPrice}    dom:document.querySelectorAll('[id="prerequisite_subtotal_range[0].value"]')[0]    #优惠层级1 - 减多少/#优惠层级1 - 多少 %off
${locatorB_subtractionNew_checkbox_noPriceList}    dom:document.querySelectorAll('[class="ant-checkbox-inner"]')[1]    #上不封顶复选框
${locatorB_subtractionNew_select_newDiscount}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[1]    #优惠类型 - 满件打折
${locatorB_subtractionNew_button_addTopClass}    dom:document.querySelectorAll('[class*="ant-btn add"]')    #添加层级 按钮
${locatorB_subtractionNew_icon_deleteTopClass}    dom:document.querySelectorAll('[class*="djfont delete icon_custom"]')    #删除层级 图标
${locatorB_subtractionNew_button_selectAllProduct}    dom:document.querySelectorAll('[class*="product_range"] [class*="ant-btn"]')[0]    #适用范围 - 选择全部商品
${locatorB_subtractionNew_button_selectSomeProduct}    dom:document.querySelectorAll('[class*="product_range"] [class*="ant-btn"]')[1]    #适用范围 - 选择部分商品
${locatorB_subtractionNew_icon_addSomeProduct}    dom:document.querySelectorAll('[class*="anticon anticon-plus"]')[1]     #适用范围 - 选择部分商品 - 继续添加商品 按钮

${locatorB_subtractionNew_SelectProduct_input_KeywordSelect}    dom:document.querySelectorAll('[id="title"]')[0]    #适用范围 - 选择部分商品 - 继续添加商品 按钮 - 选择商品 - 搜索输入框
${locatorB_subtractionNew_SelectProduct_button_KeywordSelect}    dom:document.querySelectorAll('[class*="ant-btn confirm_btn"]')[0]    #适用范围 - 选择部分商品 - 继续添加商品 按钮 - 选择商品 - 搜索按钮
${locatorB_subtractionNew_SelectProduct_button_KeywordReset}    dom:document.querySelectorAll('[class*="ant-btn small_btn"]')[0]    #适用范围 - 选择部分商品 - 继续添加商品 按钮 - 选择商品 - 重置按钮
${locatorB_subtractionNew_SelectProduct_button_SelectProductSave}    dom:document.querySelectorAll('[class*="customfooter"] [class*="ant-btn middle_btn"]')[0]    #适用范围 - 选择部分商品 - 继续添加商品 按钮 - 选择商品 - 确定按钮
${locatorB_subtractionNew_SelectProduct_button_ProductMore}    dom:document.querySelectorAll('[class*="ant-btn default_btn"]')[1]    #适用范围 - 选择部分商品 - 继续添加商品 按钮 - 选择商品 - 加载更多按钮
${locatorB_subtractionNew_SelectProduct_checkbox_selectProductfist}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(1)')[0]    #适用范围 - 选择部分商品 - 继续添加商品 按钮 - 选择商品 - 第一个复选框
${locatorB_subtractionNew_SelectProduct_checkbox_selectProductAll}     dom:document.querySelectorAll('[class*="customfooter"] [class*="ant-checkbox"]')[0]    #适用范围 - 选择部分商品 - 继续添加商品 按钮 - 选择商品 - 全选复选框

${locatorB_subtractionNew_SelectProduct_list_Product}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr')[0]    # 适用范围 - 选择部分商品 - 第一个商品第一行
${locatorB_subtractionNew_SelectProduct_text_ExitProduct}    dom:document.querySelectorAll('[class="ant-table-tbody"] tr td:nth-child(6) a')[0]    # 适用范围 - 选择部分商品 - 第一个商品 - 退出活动


${locatorB_subtractionNew_button_addActivityNext}    dom:document.querySelectorAll('[class*="next_step"] [class*="ant-btn middle_btn"]')[0]    #添加满减活动 - 下一步 按钮
${locatorB_subtractionNew_button_addActivityLast}    dom:document.querySelectorAll('[class*="ant-btn default_btn"]')[0]    #添加满减活动 - 上一步 按钮
${locatorB_subtractionNew_button_addActivitySave}    ${locatorB_button_save00}    #保存 按钮
${locatorB_subtractionNew_button_addActivityCancel}    ${locatorB_button_canecl00}    #取消 按钮
