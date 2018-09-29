*** Settings ***
Resource          var_common.robot

*** Variables ***
# locator_productsReviews
${locatorB_productsReviews_text_comment}    dom:document.querySelectorAll('div.header_left___3RMen > span')    # 商品评论

${locatorB_productsReviews_button_all}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[0]    # 商品评论页面，全部
${locatorB_productsReviews_button_published}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[1]    # 商品评论页面，已发布
${locatorB_productsReviews_button_unpublished}    dom:document.querySelectorAll(".ant-radio-button-wrapper")[2]    # 商品评论页面，未发布