*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${user_default_name}    ${user_default_pwd}    ${user_default_domain}
Suite Teardown    #Close Test Suite Browser
Library           ${CURDIR}/../../../lib/customLibrary
Resource          ../../../resources/var_common.robot
Resource          ../../../resources/var_shipping.robot
Resource          ../../../resources/kw_browser.robot
Resource          ../../../resources/kw_common.robot
Resource          ../../../resources/kw_shipping.robot
Resource          ./common.robot

*** Test Cases ***
070_shipping
    [Documentation]    添加数量运费
    [Tags]    P0
    #.添加数量运费
    Go To Shipping Page
    Quantity All Setp
    page should contain button    id:test_shipping_edit_modal_sure_btn
    Wait And Click Element    class:ant-modal-close-x

071_shipping
    [Documentation]    添加数量运费 输入数量运费 显示 数量运费
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    数量运费
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    ${res}    execute javascript    return document.querySelectorAll("#name")[1].value
    Should Be True    '${res}'=='${data}'
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

072_shipping
    [Documentation]    输入1234 显示 数量运费
    [Tags]    P1
    #.添加数量运费    输入1234 显示 数量运费
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    1234
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    ${res}    execute javascript    return document.querySelectorAll("#name")[1].value
    Should Be True    '${res}'=='${data}'
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

073_shipping
    [Documentation]    添加数量运费 输入 数量运费 保存 列表显示 数量运费
    [Tags]    P1
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    数量运费
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${getdata}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[0].innerText
    Should Be True    '${getdata}'=='${data}'
    Quit All Shipping

074_shipping
    [Documentation]    输入 输入超过50字符的内容 保存 提示错误
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

075_shipping
    [Documentation]    添加数量运费 说明框输入 输入超过200字符的内容 提示错误
    [Tags]    P1
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#desc")[0]    ${data}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

076_shipping
    [Documentation]    添加数量运费 说明框输入 输入200个以内 保存成功
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#name")[1]    数量运费
    input text    dom:document.querySelectorAll("#desc")[0]    ${data}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    //*[@id="dj"]/div/div[5]/div[2]/div/div/div/div/div/table/tbody/tr
    Quit All Shipping

077_shipping
    [Documentation]    添加数量运费 说明框输入内容 名称输入框不输入内容 提示有内容未填写
    [Tags]    P1
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#desc")[0]    ${data}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

078_shipping
    [Documentation]    添加数量运费 最小订单数量输入超过10位以上的数字
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    454544454454545
    input text    id:range_min    ${data}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

079_shipping
    [Documentation]    添加数量运费 最大订单数量输入超过10位以上的数字
    [Tags]    P1
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    5478799641231313
    input text    id:range_max    ${data}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

080_shipping
    [Documentation]    添加数量运费 最小订单数量：10 最大订单数量：100
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${min}    set variable    10
    ${max}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    input text    id:range_min    ${min}
    input text    id:range_max    ${max}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    //*[@id="dj"]/div/div[5]/div[2]/div/div/div/div/div/table/tbody/tr
    Quit All Shipping

081_shipping
    [Documentation]    添加数量运费 最大订单数量自动变化为大于最小订单数量的数字：101
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${min}    set variable    100
    ${max}    set variable    10
    input text    id:range_min    ${min}
    input text    id:range_max    ${max}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    ${max_data}    execute javascript    return document.querySelectorAll("#range_max")[0].value
    ${count}    evaluate    ${min}+1
    sleep    1
    Should Be True    ${count}==${max_data}
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

082_shipping
    [Documentation]    添加数量运费 最小订单数量自动变化为小于最大订单数量的数字：99
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    ${max_data}    get value    id:range_min
    ${count}    evaluate    ${max}-1
    sleep    1
    Should Be True    ${count}==${max_data}
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

083_shipping
    [Documentation]    添加数量运费 取消勾选免运费
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    #Wait And Click Element    dom:document.querySelectorAll(".ant-checkbox-input")[1]
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    Execute JavaScript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    Page Should Not Contain Element    dom:document.querySelectorAll(".ant-checkbox-checked")[0]
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

084_shipping
    [Documentation]    添加数量运费 在运费输入框 输入 100 免运费的勾选会自动去掉
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    click element    dom:document.querySelectorAll(".ant-checkbox-input")[1]
    input text    id:rate_amount    100
    page should not contain    document.querySelectorAll(".ant-checkbox-checked")[0]
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

085_shipping
    [Documentation]    添加数量运费 在运费输入框 输入 991212313165656 提示错误
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    id:rate_amount    991212313165656
    page should not contain    class:ant-form-explain
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp

086_shipping
    [Documentation]    .添加数量运费 在运费输入框 输入 100 保存成功，数量运费列表中显示的运费为100
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${cc}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    input text    id:rate_amount    ${cc}
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Should Be True    ${res}==${cc}
    Quit All Shipping

087_shipping
    [Documentation]    添加数量运费 取消运费的勾选 保存成功，数量运费列表中显示的运费为0
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${cc}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    #Wait And Click Element    dom:document.querySelectorAll(".ant-checkbox-input")[0]
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Should Be True    ${res}==0
    Quit All Shipping

088_shipping
    [Documentation]    添加数量运费 勾选是否支持货到付款 保存 列表显示 支持
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${cc}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='支持'
    Quit All Shipping

089_shipping
    [Documentation]    添加数量运费 取消勾选是否支持货到付款 保存 列表显示 不支持
    [Tags]    P0
    Go To Shipping Page
    Quantity All Setp
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${cc}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    Wait And Click Element    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='不支持'
    Quit All Shipping

090_shipping
    [Documentation]    直接关闭窗口，没有添加数量运费
    [Tags]    P1
    #.直接关闭窗口，没有添加数量运费
    Go To Shipping Page
    Quantity All Setp
    #execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    Wait And Click Element    dom:document.querySelectorAll(".ant-modal-close-x")[0]
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[5]/div[2]/div/div/div/div/div/table/tbody/tr[2]
    Quit All Setp

091_shipping
    [Documentation]    添加数量运费 输入内容 直接关闭窗口，再次打开窗口 没有添加数量运费
    [Tags]    P1
    Go To Shipping Page
    Quantity All Setp
    input text    dom:document.querySelectorAll("#name")[1]    数量运费
    #execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    click element    dom:document.querySelectorAll(".ant-modal-close-x")[0]
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    page should not contain element    dom:document.querySelectorAll("#name")[1].value
    Wait And Click Element    class:ant-modal-close-x
    Quit All Setp
