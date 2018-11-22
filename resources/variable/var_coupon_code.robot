*** Settings ***
Resource          var_common.robot

*** Variables ***
#.locatorB_couponCodeNew

${locatorB_couponCodeNew_input_activityName}    dom:document.querySelectorAll('[id="name"]')[0]   # 活动名称input
${locatorB_couponCodeNew_button_addActivity}    dom:document.querySelectorAll('[class*="large_btn"]')[0]     #.新建活动
${locatorB_couponCodeNew_button_allProducts}    dom:document.querySelectorAll('[class*="ant-btn li_a96d"]')[0]  # 选择全部商品
${locatorB_couponCodeNew_button_chooseSomeProducts}    dom:document.querySelectorAll('[class*="btnselproduct"]')[0]    # 选择部分商品

${locatorB_couponCodeNew_span_chooseProduct}    dom:document.querySelectorAll('tbody[class="ant-table-tbody"] tr td span')[0]    # 选择部分商品-第一个商品

${locatorB_couponCodeNew_icon_continueToAdd}    dom:document.querySelectorAll('[class="anticon anticon-plus"]')    # 添加

${locatorB_couponCodeNew_span_button_chooseProductSure}    dom:document.querySelectorAll('button[class="ant-btn middle_btn_e01e "]')[1]     # 选择部分商品-确定按钮
${locatorB_couponCodeNew_text_hadAdded}    dom:document.querySelectorAll('p[class*="product"]')[0]    #
${locatorB_couponCodeNew_input_couponCode}    id:code    #
${locatorB_couponCodeNew_select_couponStyle}    dom:document.querySelectorAll('[class="ant-select-selection__rendered"]')[0]    #折扣类型，折扣券
${locatorB_couponCodeNew_selectItem_discountCoupon}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[0]    #折扣类型，折扣券
${locatorB_couponCodeNew_selectItem_cashCoupon}    dom:document.querySelectorAll('[class*="ant-select-dropdown-menu-item"]')[1]    #折扣类型，代金券
${locatorB_couponCodeNew_selectTime_start}    dom:document.querySelectorAll('[class*="ant-calendar-picker-input ant-input"]')[0]      #.优惠券 活动开始时间选择
${locatorB_couponCodeNew_selectTime_end}    dom:document.querySelectorAll('[class*="ant-calendar-picker-input ant-input"]')[1]     #.优惠券 活动结束时间选择
${locatorB_couponCodeNew_selectTime_startInput}    dom:document.querySelectorAll('[class*="ant-calendar-input"]')[1]      #.优惠券 活动开始时间输入
${locatorB_couponCodeNew_selectTime_endInput}    dom:document.querySelectorAll('[class*="ant-calendar-input"]')[1]      #.优惠券 活动结束时间输入
${locatorB_couponCodeNew_selectTime_confirm}    dom:document.querySelectorAll('[class*="ant-calendar-ok-btn"]')[0]     #.优惠券 选择时间确认按钮
${locatorB_couponCodeNew_selectTime_notEndTime}    dom:document.querySelectorAll('[class="ant-checkbox-wrapper"] span[class*="ant-checkbox"]')[0]    #.不限制结束时间 id="state.date_end_unlimited"
${locatorB_couponCodeNew_selectTime_notEndTimeStart}    dom:document.querySelectorAll('[class="ant-form-item-children"] [class*="ant-checkbox"]')[1]     #判断按钮是否选中状态  ant-checkbox ant-checkbox-checked
${locatorB_couponCodeNew_text_input_promoCode}    dom:document.querySelectorAll('[id="code"]')[0]    #.优惠码输入框
${locatorB_couponCodeNew_text_p_promoCrandom}    dom:document.querySelectorAll('p[class="random_89fd"]')    #随机生成
${locatorB_couponCodeNew_text_input_num}    dom:document.querySelectorAll('[id="state.total_num"]')[0]       #.优惠券 数量  state.total_num
${locatorB_couponCodeNew_text_input_Mannum}    dom:document.querySelectorAll('[id="state.limit_num"]')    #每人限用
${locatorB_couponCodeNew_input_noLimit}    dom:document.querySelectorAll('[class="ant-checkbox-wrapper"] span[class*="ant-checkbox"]')[2]      #.优惠券 数量 不限按钮
${locatorB_couponCodeNew_input_noTotalNum}    dom:document.querySelectorAll('[class="ant-checkbox-wrapper"] [class*="ant-checkbox"]')[4]      #.优惠券 数量 不限多选按钮 未选中状态下
${locatorB_couponCodeNew_text_input_toLimited}    dom:document.querySelectorAll('[class="ant-checkbox-wrapper"] [class*="ant-checkbox"]')[6]      #.优惠券 每人限用    未选中状态下
${locatorB_couponCodeNew_input_limited}    dom:document.querySelectorAll('[class="ant-checkbox-wrapper"] span[class*="ant-checkbox"]')[4]       #.优惠券 每人限用 不限按钮
${locatorB_couponCodeNew_text_input_preferential}    dom:document.querySelectorAll('[class~="range_value"]')[0]      #.优惠门槛 满多少
${locatorB_couponCodeNew_text_input_notThreshold}    dom:document.querySelectorAll('[class="ant-radio"]')     #.优惠门槛 单选 无门槛 (未选中)
${locatorB_couponCodeNew_text_input_discount}    dom:document.querySelectorAll('[id="code_value"]')[0]      #.折扣比例 输入

${locatorB_couponCodeNew_items_listProduct}    ${locatorB_table_listItems}    # 商品列表

${locatorB_couponCodeNew_img_firstProduct_picture}    ${locatorB_table_listItems}[0].querySelectorAll("td")[0]
${locatorB_couponCodeNew_text_firstProduct_name}    ${locatorB_table_listItems}[0].querySelectorAll("td")[1]
${locatorB_couponCodeNew_text_firstProduct_style}    ${locatorB_table_listItems}[0].querySelectorAll("td")[2]
${locatorB_couponCodeNew_text_firstProduct_salePrice}    ${locatorB_table_listItems}[0].querySelectorAll("td")[3]
${locatorB_couponCodeNew_text_firstProduct_stock}    ${locatorB_table_listItems}[0].querySelectorAll("td")[4]
${locatorB_couponCodeNew_text_firstProduct_operation}    ${locatorB_table_listItems}[0].querySelectorAll("td")[5]


#.locatorB_couponCode
${locatorB_couponCode_items_listCoupon}    ${locatorB_table_listItems}    # 列表中的优惠码集合
${locatorB_couponCode_button_all}    dom:document.querySelectorAll('div[class*="ant-tabs-tab"]')[0]     #全部
${locatorB_couponCode_button_before}    dom:document.querySelectorAll('div[class*="ant-tabs-tab"]')[1]   # 未开始
${locatorB_couponCode_button_doing}    dom:document.querySelectorAll('div[class*="ant-tabs-tab"]')[2]    # 进行中
${locatorB_couponCode_button_finish}    dom:document.querySelectorAll('div[class*="ant-tabs-tab"]')[3]    # 已结束

#.input
${locatorB_couponCode_input_enterCouponCode}    dom:document.querySelectorAll('[id="keywords"]')[0]     #.搜索框输入优惠码、编号



${locatorB_couponCode_text_firstCoupon_activityNum}    ${locatorB_table_listItems}[0].querySelectorAll("td")[0]    #第一个优惠码的，优惠码编号
${locatorB_couponCode_text_firstCoupon_activityName}    ${locatorB_table_listItems}[0].querySelectorAll("td")[1]    #第一个优惠码的，
${locatorB_couponCode_text_firstCoupon_couponCode}    dom:document.querySelectorAll('[class="ant-table-row ant-table-row-level-0"] td:nth-child(3)')[0]   #第一个优惠码的，
${locatorB_couponCode_text_firstCoupon_activityTime}    ${locatorB_table_listItems}[0].querySelectorAll("td")[3]    #第一个优惠码的，
${locatorB_couponCode_text_firstCoupon_activityRules}    ${locatorB_table_listItems}[0].querySelectorAll("td")[4]    #第一个优惠码的，
${locatorB_couponCode_text_firstCoupon_activityRange}    ${locatorB_table_listItems}[0].querySelectorAll("td")[5]    #第一个优惠码的，
${locatorB_couponCode_text_firstCoupon_beenUsedAndUnUsed}    ${locatorB_table_listItems}[0].querySelectorAll("td")[6]    #第一个优惠码的，
${locatorB_couponCode_text_firstCoupon_createTime}    ${locatorB_table_listItems}[0].querySelectorAll("td")[7]    #第一个优惠码的，优惠码状态
${locatorB_couponCode_tag_firstCoupon_activityStatus}    ${locatorB_table_listItems}[0].querySelectorAll("td")[8]    #第一个优惠码的，活动状态
${locatorB_couponCode_icon_firstCoupon_preview}        #第一个优惠码的，优惠码总价
${locatorB_couponCode_icon_firstCoupon_stop}        #第一个优惠码的，优惠码总价
