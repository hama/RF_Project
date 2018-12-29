*** Settings ***
Documentation     product comment keyword

Resource          kw_common.robot

*** keyword ***
Product Comment Suite Setup
    [Documentation]
    Login With Default User

Product Comment Suite Teardown
    [Documentation]
#    kwcomment.del_all_comments_py
    kwproduct.del_all_products_py
    Close Test Suite Browser

Product Comment Case Setup
    [Documentation]
#    kwcomment.del_all_comments_py
    kwproduct.del_all_products_py
    Go To Product Review Page

Focus On Current Window
    Sleep    2
    ${titles}=    Get Window Titles
    ${title1}=    Get From List    ${titles}    0
    ${title2}=    Get From List    ${titles}    1
    Sleep    2
    Select Window    title=${title1}

Write C Comment Review
    [Documentation]    C端商品评论
    Focus On New Window
    Sleep    2
#    Execute Javascript     document.querySelectorAll('[id="shoplazza-reviews-write-btn"]')[0].scrollIntoView()
#    Sleep    1
    Wait And Click Element    ${locatorC_customerReviews_button_writeReview}
    Wait And Input Text    ${locatorC_customerReviews_textarea_bodyReview}    Body of Review Test
    Wait And Input Text    ${locatorC_customerReviews_input_reviewEmail}    12345@autotest.com
    Sleep And Click Element    ${locatorC_customerReviews_button_reviewPost}
    Wait Until Page Not Contains Locator    ${locatorC_customerReviews_button_reviewPost}
    Focus On Current Window


reviews001
    [Documentation]    评论界面，查看左上角标题
    Text Of Element Should Contain With Wait    ${locatorB_product_review}    商品评论
    Text Of Element Should Contain With Wait    ${locatorB_productsReviews_text_ReviewsTitle}    商品评论

reviews002
    [Documentation]    全部商品界面
    Sleep    2
    Wait And Click Element    ${locatorB_productsReviews_tab_allReviews}
    Wait Until Page Contains Text    操作
    Wait Until Page Contains Text    商品图片
    Wait Until Page Contains Text    商品名称
    Wait Until Page Contains Text    评论分数

reviews003
    [Documentation]    全部商品列表显示
    Sleep    2
    Wait Until Page Contains Text    已发布/未发布: 0/1
    Wait Until Page Contains Text    已发布/未发布: 0/0