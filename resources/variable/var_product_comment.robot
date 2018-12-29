*** Settings ***
Resource          var_common.robot

*** Variables ***
# locator_productsReviews
${locatorB_productsReviews_input_productSelect}    dom:document.querySelectorAll('[id="name"]')[0]    # 商品评论 - 搜素 输入框
${locatorB_productsReviews_button_productSelect}    dom:document.querySelectorAll('[class*="ant-btn confirm_btn"]')[0]    # 商品评论 - 搜素 按钮
${locatorB_productsReviews_button_selectReset}    dom:document.querySelectorAll('[class*="ant-btn small_btn"]')[0]    # 商品评论 - 重置 按钮
${locatorB_productsReviews_button_leadingReviews}    dom:document.querySelectorAll('[class*="ant-btn large_btn"]')[0]    # 商品评论 - 批量导入评论 按钮
${locatorB_productsReviews_icon_ReviewsSetting}    dom:document.querySelectorAll('[class*="icon_custom_lef"]')[0]    # 商品评论 - 设置 图标
${locatorB_productsReviews_text_ReviewsTitle}    dom:document.querySelectorAll('[class*="head_left"] [class*="title"]')[0]    # 商品评论 - 左上角标题
${locatorB_productsReviews_tab_allReviews}    dom:document.querySelectorAll('[role="tab"]')    # 商品评论 - 全部商品tab


${locatorB_productsReviews_list_fisrtReviews}    dom:document.querySelectorAll('[class*="ant-table-row ant-table-row"]')[0]    # 商品评论 - 第一个商品评论
${locatorB_productsReviews_icon_fisrtPreview}    dom:document.querySelectorAll('[class*="djfont dj-preview icon_custom"]')[0]    # 商品评论 - 第一个商品评论 - 预览


# locatorC_customerReviews
${locatorC_customerReviews_button_writeReview}     dom:document.querySelectorAll('[id="shoplazza-reviews-write-btn"]')[0]    # C端 - 商品详情页 - write a review 按钮
${locatorC_customerReviews_textarea_bodyReview}    dom:document.querySelectorAll('[id="shoplazza-reviews__write-review__content"]')[0]    # C端 - 商品详情页 - body of review 文本框
${locatorC_customerReviews_input_reviewEmail}     dom:document.querySelectorAll('[id="shoplazza-reviews__write-review__email"]')[0]    # C端 - 商品详情页 - contact email 输入框

${locatorC_customerReviews_button_reviewPost}    dom:document.querySelectorAll('[class*="shoplazza-reviews__write-review__post"]')[0]    # C端 - 商品详情页 - post 按钮

