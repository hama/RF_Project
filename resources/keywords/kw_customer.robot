*** Settings ***
Resource         kw_common.robot

*** Keyword ***
Customer Suite Setup
    Login With Default User

Customer Sutie Teardown
    Close Test Suite Browser

Customer Case Setup
    kwcustomer.del_all_customers_py
    Go To Customer Page
    :FOR    ${ONE}    IN RANGE    3
    \    kwcustomer.add_customer_with_conf_py
    Reload Page And Start Ajax

Customer Case Teardown
    Teardown Test Case

Customer Register C Interface
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${password}
    Sleep    2
    Wait And Input Text    ${locatorC_customerRegister_input_userFirstname}    ${firstname}
    Sleep    1
    Wait And Input Text    ${locatorC_customerRegister_input_userLastname}    ${lastname}
    Sleep    1
    Wait And Input Text    ${locatorC_customerRegister_input_userEmail}    ${email}
    Sleep    1
    Wait And Input Text    ${locatorC_customerRegister_input_userPassword}    ${password}
    Sleep    2

Add Customer B Interface
    Wait And Input Text    ${locatorB_customerNews_input_firstname}    ceshi001
    Wait And Input Text    ${locatorB_customerNews_input_lastname}    test
    Wait And Input Text    ${locatorB_customerNews_input_email}    ceshi001test@qq.com
    Wait And Click Element    ${locatorB_customerNews_input_phoneAreaCode}
    Wait And Click Element    ${locatorB_customerNews_input_chinaAreaCode}
    Wait And Input Text    ${locatorB_customerNews_input_phone}    13098765432