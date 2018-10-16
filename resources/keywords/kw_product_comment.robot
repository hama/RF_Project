*** Settings ***
Documentation     product comment keyword

Resource          ../variable/var_common.robot
Resource          ../variable/var_product_comment.robot
Resource          kw_browser.robot
Resource          kw_common.robot

*** keyword ***
Product Comment Suite Setup
    [Documentation]
    Login With Default User

Product Comment Suite Teardown
    [Documentation]
    kwcomment.del_all_comments_py
    kwproduct.del_all_products_py
    Close Test Suite Browser

Product Comment Case Setup
    [Documentation]
    kwcomment.del_all_comments_py
    Go To Product Review Page

Select All Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_button_all}
    Sleep    2

Select Published Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_button_published}
    Sleep    2

Select Unpublished Comment Tag
    Wait And Click Element    ${locatorB_productsReviews_button_unpublished}
    Sleep    2