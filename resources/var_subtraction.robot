*** Variables ***
#.page content
${locator_contentB_subtraction_text}    满减活动
${locator_ContentB_first_tr_eml}    dom:document.querySelectorAll("table tbody tr")[0]    #.第一tr元素
${locator_ContentB_title_all}    dom:document.querySelectorAll(".ant-radio-group label span:nth-child(2)")[1]    #.满减活动-全部
${locator_ContentB_title_not_start}    dom:document.querySelectorAll(".ant-radio-group label span:nth-child(2)")[3]    #.满减活动-未开始
${locator_ContentB_title_processing}    dom:document.querySelectorAll(".ant-radio-group label span:nth-child(2)")[5]    #.满减活动-进行中
${locator_ContentB_title_end}    dom:document.querySelectorAll(".ant-radio-group label span:nth-child(2)")[7]    #.满减活动-已结束
${locator_ContentB_first_btn_save}    dom:document.querySelectorAll("button")[1]    #.满减活动-编辑-保存按钮
${locator_ContentB_edit_input_name}    id:name    #.满减活动-编辑-名字输入框


#.get element
${locator_ContentB_get_status_text}    dom:document.querySelectorAll("tbody tr td p")[2]    #.获取body里的第一个tr里的活动状态