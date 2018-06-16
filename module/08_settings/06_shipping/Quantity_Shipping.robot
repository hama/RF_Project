*** Settings ***
Suite Setup       New Test Suite Browser And Login    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
Suite Teardown    Close Test Suite Browser    # close the browser opened for this test suite
Library           ../../../lib/customLibrary
Resource          ../../../resources/var_tax_price.robot
Resource          ../../../resources/kw_browser.robot

*** Test Cases ***
070_shipping
    #.添加数量运费
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    page should contain button    id:test_shipping_edit_modal_sure_btn

071_shipping
    #.添加数量运费    输入数量运费 显示 数量运费
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    数量运费
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    ${res}    execute javascript    return document.querySelectorAll("#name")[1].value
    Should Be True    '${res}'=='${data}'

072_shipping
    #.添加数量运费    输入1234 显示 数量运费
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    1234
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    ${res}    execute javascript    return document.querySelectorAll("#name")[1].value
    Should Be True    '${res}'=='${data}'

073_shipping
    #.添加数量运费    输入 数量运费    保存    列表显示 数量运费
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    数量运费
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${getdata}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[0].innerText
    Should Be True    '${getdata}'=='${data}'

074_shipping
    #.添加数量运费    输入 输入超过50字符的内容    保存    提示错误
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain

075_shipping
    #.添加数量运费    说明框输入 输入超过200字符的内容    提示错误
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#desc")[0]    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain

076_shipping
    #.添加数量运费    说明框输入 输入200个以内    保存成功
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#name")[1]    数量运费
    input text    dom:document.querySelectorAll("#desc")[0]    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    //*[@id="dj"]/div/div[5]/div[2]/div/div/div/div/div/table/tbody/tr

077_shipping
    #.添加数量运费    说明框输入内容    名称输入框不输入内容 提示有内容未填写
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#desc")[0]    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain

078_shipping
    #.添加数量运费    最小订单数量输入超过10位以上的数字
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    454544454454545
    input text    id:range_min    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain

079_shipping
    #.添加数量运费    最大订单数量输入超过10位以上的数字
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    5478799641231313
    input text    id:range_max    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain

080_shipping
    #.添加数量运费    最小订单数量：10    最大订单数量：100
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${min}    set variable    10
    ${max}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    input text    id:range_min    ${min}
    input text    id:range_max    ${max}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    //*[@id="dj"]/div/div[5]/div[2]/div/div/div/div/div/table/tbody/tr

081_shipping
    #.添加数量运费    最大订单数量自动变化为大于最小订单数量的数字：101
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${min}    set variable    100
    ${max}    set variable    10
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    input text    id:range_min    ${min}
    input text    id:range_max    ${max}
    click button    id:test_shipping_edit_modal_sure_btn
    ${max_data}    execute javascript    return document.querySelectorAll("input[placeholder='无限']")[0].value
    ${count}    evaluate    ${min}+1
    sleep    1
    Should Be True    ${count}==${max_data}

082_shipping
    #.添加数量运费    最小订单数量自动变化为小于最大订单数量的数字：99
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    click button    id:test_shipping_edit_modal_sure_btn
    ${max_data}    get value    id:range_min
    ${count}    evaluate    ${max}-1
    sleep    1
    Should Be True    ${count}==${max_data}

083_shipping
    #.添加数量运费    取消勾选免运费
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    click element    dom:document.querySelectorAll(".ant-checkbox-input")[0]

084_shipping
    #.添加数量运费    在运费输入框 输入 100    免运费的勾选会自动去掉
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    click element    dom:document.querySelectorAll(".ant-checkbox-input")[1]
    input text    id:rate_amount    100
    page should not contain    document.querySelectorAll(".ant-checkbox-checked")[0]

085_shipping
    #.添加数量运费    在运费输入框 输入 991212313165656    提示错误
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    id:rate_amount    991212313165656
    page should not contain    class:ant-form-explain

086_shipping
    #.添加数量运费    在运费输入框 输入 100    保存成功，数量运费列表中显示的运费为100
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${cc}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    input text    id:rate_amount    ${cc}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Should Be True    ${res}==${cc}

087_shipping
    #.添加数量运费    取消运费的勾选    保存成功，数量运费列表中显示的运费为0
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${cc}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    click element    dom:document.querySelectorAll(".ant-checkbox-input")[0]
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Should Be True    ${res}==0

088_shipping
    #.添加数量运费    勾选是否支持货到付款 保存 列表显示 支持
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${cc}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='支持'

089_shipping
    #.添加数量运费    取消勾选是否支持货到付款 保存 列表显示 不支持
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${cc}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    click element    dom:document.querySelectorAll(".ant-checkbox-input")[1]
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Should Be True    '${data}'=='不支持'

090_shipping
    #.直接关闭窗口，没有添加数量运费
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    #execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    click element    dom:document.querySelectorAll(".ant-modal-close-x")[0]
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[5]/div[2]/div/div/div/div/div/table/tbody/tr[2]

091_shipping
    #.添加数量运费    输入内容 直接关闭窗口，再次打开窗口 没有添加数量运费
    go to    ${home_page}
    Wait Until Element Is Visible    ${navigation_setting}
    click element    ${navigation_setting}
    Wait Until Element Is Visible    ${navigation_shipping}
    click element    ${navigation_shipping}
    Wait Until Element Is Visible    ${locator_shipping_add_shipping}
    click element    ${locator_shipping_add_shipping}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    input text    dom:document.querySelectorAll("#name")[1]    数量运费
    #execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    click element    dom:document.querySelectorAll(".ant-modal-close-x")[0]
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    page should not contain element    dom:document.querySelectorAll("#name")[1].value
