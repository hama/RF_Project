*** Settings ***
Resource          var_common.robot

*** Variables ***
# locator_productsReviews
${locatorB_productsReviews_text_comment}    dom:document.querySelectorAll('div.header_left___3RMen > span')    # 商品评论

${locatorB_productsReviews_button_all}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[0]    # 商品评论页面，全部
${locatorB_productsReviews_button_published}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[1]    # 商品评论页面，已发布
${locatorB_productsReviews_button_unpublished}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[2]    # 商品评论页面，未发布

${locatorB_productsReviews_icon_listArrowUp}    dom:document.querySelectorAll('i[class~="anticon-arrow-up"]')    # 商品评论页面，icon向上箭头
${locatorB_productsReviews_icon_listArrowDown}    dom:document.querySelectorAll('i[class~="anticon-arrow-down"]')    # 商品评论页面，icon向下箭头
${locatorB_productsReviews_text_listThumbsUpNum}    dom:document.querySelectorAll('span[class="txt_feedback___oGQ5W"]')    # 商品评论页面，点赞数list
${locatorB_productsReviews_text_listContent}    dom:document.querySelectorAll('p[class="review_content___5DZ8l"]')    # 商品评论页面，content的list

${locatorB_productsReviews_link_listProductName}    dom:document.querySelectorAll('a[class="product_name___2YfLK"]')    # 商品评论页面，商品名列表
${locatorB_productsReviews_switch_listPublished}    dom:document.querySelectorAll('span[class="btn_switch___qcVr- ant-switch ant-switch-checked"]')    # 商品评论页面，switch已发布list
${locatorB_productsReviews_switch_listUnpublished}    dom:document.querySelectorAll('span[class="btn_switch___qcVr- ant-switch"]')    # 商品评论页面，switch未发布list

${locatorB_productsReviews_checkbox_chooseReviews}    ${locatorB_checkbox00}    #点击checkbox按钮，选中当前页面所有评论
${locatorB_productsReviews__select_publish}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[0]    #下拉框-发布
${locatorB_productsReviews__select_unpublish}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[1]    #下拉框-取消发布
${locatorB_productsReviews_select_del}    dom:document.querySelectorAll(".ant-select-dropdown-menu-item")[2]    #下拉框-删除


${locatorB_productsReviews_link_productName}    dom:document.querySelectorAll('a[class="product_name___286-c"]')[0]    #进入单个商品评论页，商品名连接
${locatorB_productsReviews_text_listProductName}    dom:document.querySelectorAll('p[class="review_content___5DZ8l"]')    # 进入单个商品评论页，商品名列表
${locatorB_productsReviews_icon_listDelete}    dom:document.querySelectorAll("i[class*='delete']")