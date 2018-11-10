*** Variables ***
#.common variable
${locator_ContentB_comm_email}    171869092@autotest.com
${locator_ContentB_comm_service_email}    liguili5988630@autotest.com

#.input data
${input_count}    10
${input_percentage}    2
${input_add_level_price}    11
${input_add_level_cutprice}    3

#.page content
${locatorB_subtraction_header_text}    满减活动
${locatorB_subtraction_add_subtraction}    dom:document.querySelectorAll("button")[0]    #. 添加满减活动-按钮
${locatorB_subtraction_first_tr_eml}    dom:document.querySelectorAll("table tbody tr")[0]    #.第一tr元素
${locatorB_subtraction_title_all}    dom:document.querySelectorAll(".ant-radio-group label span:nth-child(2)")[1]    #.满减活动-全部
${locatorB_subtraction_title_not_start}    dom:document.querySelectorAll(".ant-radio-group label span:nth-child(2)")[3]    #.满减活动-未开始
${locatorB_subtraction_title_processing}    dom:document.querySelectorAll(".ant-radio-group label span:nth-child(2)")[5]    #.满减活动-进行中
${locatorB_subtraction_title_end}    dom:document.querySelectorAll(".ant-radio-group label span:nth-child(2)")[7]    #.满减活动-已结束
${locatorB_subtraction_first_btn_save}    dom:document.querySelectorAll("button")[1]    #.满减活动-编辑-保存按钮
${locatorB_subtraction_first_btn_cancel}    dom:document.querySelectorAll("button")[0]    #.满减活动-编辑-取消按钮

${locatorB_subtraction_confirm_cancel_btn}    dom:document.querySelectorAll("button")[6]    #.满减活动-编辑-点击取消后的 确认取消 按钮
${locatorB_subtraction_confirm_determine_btn}    dom:document.querySelectorAll("button")[7]    #.满减活动-编辑-点击取消后的 确认 按钮

${locatorB_subtraction_edit_input_name}    id:name    #.满减活动-编辑-名字输入框
${locatorB_subtraction_edit_select_first_time}    dom:document.querySelectorAll(".ant-input-lg")[0]    #. 满减活动-活动时间-选择第一个框
${locatorB_subtraction_edit_select_second_time}    dom:document.querySelectorAll(".ant-input-lg")[1]    #. 满减活动-活动时间-选择第二个框
${locatorB_subtraction_edit_select_second_next_mon}    dom:document.querySelectorAll(".ant-calendar-next-month-btn")[0]    #. 满减活动-活动时间-选择下个月按钮
${locatorB_subtraction_edit_select_second_prev_mon}    dom:document.querySelectorAll(".ant-calendar-prev-month-btn")[0]    #. 满减活动-活动时间-选择上个月按钮
${locatorB_subtraction_edit_select_second_confirm}    dom:document.querySelectorAll(".ant-calendar-ok-btn")[0]    #. 满减活动-活动时间-选择时间确定按钮
#${locator_ContentB_edit_input_email}    id:email    #.店铺信息-基本信息-店主邮箱
#${locator_ContentB_edit_input_service_email}    id:service_email    #.店铺信息-基本信息-客服邮箱
${locatorB_subtraction_edit_checkbox_capped}    dom:document.querySelectorAll(".ant-checkbox-inner")[1]    #.满减活动-编辑-上不封顶单选框
${locatorB_subtraction_select_fullDiscount}    dom:document.querySelectorAll(".ant-select-selection__rendered")[0]    #.满减活动-编辑-满件打折元素
${locatorB_subtraction_select_fullDiscountData}    dom:document.querySelectorAll(".ant-select-dropdown-menu-root li")[1]    #.满减活动-编辑-选择满件打折

${locatorB_subtraction_edit_add_level}    return document.querySelectorAll(".add___XjdBh i")[0].click()    #.满减活动-编辑-添加层级
${locatorB_subtraction_edit_del_level}    dom:document.querySelectorAll(".delete_icon___2AQqo")[0]    #.满减活动-编辑-删除层级
${locatorB_subtraction_selectPro_allAblum}    dom:document.querySelectorAll(".ant-select-selection-selected-value")[1]    #.满减活动-选择商品-全部专辑
${locatorB_subtraction_selectPro_allStatus}    dom:document.querySelectorAll(".ant-select-selection-selected-value")[2]    #.满减活动-选择商品-全部状态
${locatorB_subtraction_input_search}    dom:document.querySelectorAll('input[placeholder="请输入搜索内容"]')    #.满减活动-选择商品-搜索输入框
${locatorB_subtraction_selectPro_search_bth}    dom:document.querySelectorAll("button")[6]    #.满减活动-选择商品-搜索按钮
${locatorB_subtraction_edit_text_save}    保存    #. 编辑页面保存字体
${locatorB_subtraction_edit_input_totalPrice}    id:totalPrice0    #.编辑页面 满减打折 输入框
${locatorB_subtraction_edit_input_cutPrice}    id:cutPrice0    #.编辑页面 百分比 输入框
#${locator_ContentB_edit_input_totalPrice1}    id:totalPrice1    #.编辑页面-添加层级-条件-1
#${locator_ContentB_edit_input_cutPrice1}    id:cutPrice1    #.编辑页面-添加层级-内容-1

${locatorB_subtraction_edit_select_product_save}    class:handleSubmit___1JL8t    #.编辑页面 - 选择商品>保存按钮

${locatorB_subtraction_edit_common_error}    class:ant-form-explain    #. 编辑页面公共错误class
${locatorB_subtraction_comm_close}    class:ant-modal-close-x    #.编辑页面公共关闭class

#.get element
${locatorB_subtraction_get_status_text}    dom:document.querySelectorAll("tbody tr td p")[2]    #.获取body里的第一个tr里的活动状态