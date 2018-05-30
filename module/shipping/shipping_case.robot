*** Settings ***
Library           Selenium2Library
Library           ${CURDIR}/../../lib/customLibrary
Resource          ../../resources/shipping.robot

*** Test Cases ***
001_shipping
    #添加国家
    import variables    /Users/dianjiang/shoplaza/shoplaza_robot/config.py
    open browser    ${url}    google chrome
    Wait Until Element Is Visible    //*[@id="root"]/div/div/form/div[4]/button
    input text    id:account    ${uname}
    input password    id:password    ${pwd}
    click button    //*[@id="root"]/div/div/form/div[4]/button
    sleep    2
    click element    //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[9]/div
    sleep    1
    click element    //*[@id="9$Menu"]/li[3]/a
    sleep    1
    click element    //*[@id="dj"]/div/div/div[2]/div[1]/div/div[2]/a
    sleep    1.5
    input text    id:name    shipping1
    click button    //*[@id="dj"]/div/div[2]/div[1]/div[2]/div/button
    sleep    1.5
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox")[0].click()
    execute javascript    return document.getElementById("test_shipping_country_modal_sure_btn").click()
    close browser

012_shipping
    # tax price page should be normal atfer login
    Open Test Browser    ${home_page}
    Login With User    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div[1]/div/div
    click element    //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[9]/div
    sleep    1.5
    click element    //*[@id="9$Menu"]/li[3]/a
    Wait Until Element Is Visible    id:test_add_btn
    click element    id:test_add_btn
    sleep    1.5
    page should contain link    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    page should contain element    //*[@id="rcDialogTitle0"]/div
    close browser

013_shipping
    # tax price page should be normal atfer login
    Open Test Browser    ${home_page}
    Login With User    ${defaultUser}    ${defaultPassword}    ${defaultDomain}
    Wait Until Element Is Visible    //*[@id="root"]/div/div/div[1]/div[1]/div/div
    click element    //*[@id="root"]/div/div/div[1]/div[1]/div/ul/li[9]/div
    sleep    1.5
    click element    //*[@id="9$Menu"]/li[3]/a
    sleep    1
    page should contain link    id:test_add_btn
    click link    id:test_add_btn
    sleep    1.5
    page should contain link    id:test_save_btn
    sleep    1
    click button    id:test_shipping_country_add_btn
    wait until element is visible    id:test_shipping_country_modal_search_btn
    input text    class:ant-input    中国
    click button    id:test_shipping_country_modal_search_btn
    close browser

014_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    class:ant-input
    input text    class:ant-input    中
    click button    id:test_shipping_country_modal_search_btn
    close browser

015_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    class:ant-input
    input text    class:ant-input    @#￥
    click button    id:test_shipping_country_modal_search_btn
    close browser

016_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_search_btn
    #execute javascript    return document.getElementsByClassName("ant-tree-checkbox")[0].click()
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[1].click()
    #execute javascript    return document.getElementById("test_shipping_country_modal_sure_btn").click()
    ${count}    get text    class:country_selected___2BYCm
    ${res}    searchStr    ${count}
    Run keyword If    ${res}==1    run keyword    close browser
    ...    ELSE    RUn keyword    page should contain element    sdsdsdsd

017_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_search_btn
    sleep    1.5
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[1].click()
    ${data}    execute javascript    return document.getElementsByClassName("info_cn___N00o6")[1].innerHTML
    execute javascript    return document.getElementById("test_shipping_country_modal_sure_btn").click()
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div/table/tbody/tr/td[1]/div/div/p[2]
    Run keyword If    '${data}'=='${res}'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    dsfsfdsf

018_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_search_btn
    sleep    1.5
    execute javascript    return document.getElementsByClassName("ant-checkbox-input")[0].click()
    execute javascript    return document.getElementById("test_shipping_country_modal_sure_btn").click()
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div/table/tbody/tr/td[1]/div/div/p[2]
    Run keyword If    '${res}'=='其他国家'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sadhakjsd

019_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_search_btn
    sleep    1.5
    execute javascript    return document.getElementsByClassName("ant-checkbox-input")[0].click()
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[1].click()
    execute javascript    return document.getElementById("test_shipping_country_modal_sure_btn").click()
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div/table/tbody/tr/td[1]/div/div/p[2]
    Run keyword If    '${res}'<>'其他国家'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sdf6546

020_shipping
    ${xpath_d}    set variable    id:test_add_btn
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_country_add_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_search_btn
    sleep    1.5
    execute javascript    return document.getElementsByClassName("ant-modal-close-x")[0].click()
    ${res}    get text    //*[@id="dj"]/div/div[2]/div[2]/div/div/div/div/div/div[2]/span
    #check data
    Run keyword If    '${res}'=='暂无数据'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    dsjhh45

021_shipping
    #.add transport price >> check add transport price windows
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    page should contain button    id:test_shipping_edit_modal_sure_btn
    close browser

022_shipping
    #.add    transport price    check name input (str)
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    #.输入名称
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    #${res}    execute javascript    return document.getElementsByClassName("ant-input ant-input-lg name_input___14djA")[0].value
    close browser

023_shipping
    #.add    transport price    check name input (int)
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    #.输入名称
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    123
    #${res}    execute javascript    return document.getElementsByClassName("ant-input ant-input-lg name_input___14djA")[0].value
    close browser

024_shipping
    #.add    transport price    check
    #.保存成功，关闭弹窗，价格运费列表中显示 价格运费的信息
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    #execute javascript    return document.querySelectorAll('#name')[1].value='价格运费'
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    sleep    1.5
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr/td[1]
    close browser

025_shipping
    #.输入50个字符点击保存
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    #execute javascript    return document.querySelectorAll('#name')[1].value='价格运费'
    ${str}    set variable    sssssssssssssssssssssssssssssssssssssssssssssssss
    input text    dom:document.querySelectorAll('#name')[1]    ${str}
    sleep    1.5
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr/td[1]
    close browser

026_shipping
    #.输入超过50个字符点击保存
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    #execute javascript    return document.querySelectorAll('#name')[1].value='价格运费'
    ${str}    set variable    ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    input text    dom:document.querySelectorAll('#name')[1]    ${str}
    sleep    1.5
    page should contain element    class:ant-form-explain
    close browser

027_shipping
    #.说明框输入超过200个字符点击保存
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    page should contain element    class:ant-form-explain
    close browser

028_shipping
    #.说明框输入正常字符点击保存
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr/td[1]
    close browser

029_shipping
    #.最小订单价输入超过10位以上的数字
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    input text    id:range_min    123456789012
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain
    close browser

030_shipping
    #.最大订单价输入超过10位以上的数字
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    input text    id:range_max    123456789012
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain
    close browser

031_shipping
    #.正常输入最小价格，最大价格 保存成功
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    input text    id:range_min    10
    input text    id:range_max    100
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr/td[1]
    close browser

032_shipping
    #.最小单价输入100    最大单价输入10    最大单价变为101
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    100
    ${max}    set variable    10
    input text    id:range_min    ${min}
    input text    id:range_max    ${max}
    click element    class:ant-checkbox-input
    sleep    1.5
    ${data}    get value    id:range_max
    ${new_max}    evaluate    ${min}+1
    Run keyword If    ${data}==${new_max}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sdfsd5

033_shipping
    #.最大单价输入100    最小单价输入200    最小单价变为99
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    click element    class:ant-checkbox-input
    sleep    1.5
    ${data}    get value    id:range_min
    ${new_min}    evaluate    ${max}-1
    Run keyword If    ${data}==${new_min}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sdfsd5

034_shipping
    #.在运费价格框输入值    免运费的勾选离开框取消勾选
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    input text    id:rate_amount    ${max}
    sleep    1.5
    page should not contain checkbox    execute javascript    return document.getElementsByClassName("ant-checkbox-input")[0]
    close browser

035_shipping
    #.运费价格框输入超过长度的数字 提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    ${ship}    set variable    991212313165656
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    input text    id:rate_amount    ${ship}
    sleep    1.5
    page should contain element    class:ant-form-explain
    close browser

036_shipping
    #.运费价格框数字 保存成功 在列表显示刚添加的运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    ${ship}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    input text    id:rate_amount    ${ship}
    sleep    1.5
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait Until Element Is Visible    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Run keyword If    ${res}==${ship}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    dfs5f51s6

037_shipping
    #.运费价格框数字 保存成功 在列表显示刚添加的运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    sleep    1.5
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait Until Element Is Visible    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Run keyword If    ${res}==0    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    dfs5f51s6

038_shipping
    #.勾选是否支持货到付款    列表显示支持
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    sleep    1.5
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait Until Element Is Visible    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Run keyword If    '${data}'=='支持'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    dfs5f51s6

039_shipping
    #.不勾选是否支持货到付款    列表显示不支持
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    input text    dom:document.querySelectorAll('#desc')[0]    sssssssssssssssssssssssssssssssssssssssssssssss
    sleep    1.5
    ${min}    set variable    200
    ${max}    set variable    100
    input text    id:range_max    ${max}
    input text    id:range_min    ${min}
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    sleep    1.5
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    Wait Until Element Is Visible    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Run keyword If    '${data}'=='不支持'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    dfs5f51s6

040_shipping
    #.添加运费窗口直接关闭 列表不存在数据
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    click element    class:ant-modal-close-x
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser

041_shipping
    #.添加运费窗口输入内容后直接关闭 列表不存在数据
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    click element    class:ant-modal-close-x
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser

042_shipping
    #.添加运费窗口输入内容后直接关闭 再次点击添加按钮 后的编辑窗口里没有数据
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    sleep    1
    input text    dom:document.querySelectorAll('#name')[1]    价格运费
    click element    class:ant-modal-close-x
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[3]/div[2]/div/div/div/div/div/table/tbody/tr
    Wait Until Element Is Visible    id:test_shipping_add_price_btn
    click button    id:test_shipping_add_price_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain
    close browser

043_shipping
    #.点击添加重量运费按钮出现编辑窗口
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    page should contain element    id:test_shipping_edit_modal_sure_btn
    close browser

044_shipping
    #.添加运费 在名称输入 重量运费 后    对应框里显示 重量运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    ${data}    execute javascript    return document.querySelectorAll("input[placeholder='物流名称']")[0].value
    Run keyword If    '${data}'=='重量运费'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sjkdkj2

045_shipping
    #.添加运费 在名称输入 123 后    对应框里显示 123
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    123
    ${data}    execute javascript    return document.querySelectorAll("input[placeholder='物流名称']")[0].value
    Run keyword If    '${data}'=='123'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sjkdkj2

046_shipping
    #.添加运费 在名称输入 123 后    保存 列表里显示 123对应信息
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    123
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser

047_shipping
    #.添加运费 在名称输入超过50个字符 提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    sssssssssssssssssssssssssddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain
    close browser

048_shipping
    #.添加运费 在名称输入正常字符 保存 提示其他信息未填写错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    重量运费
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    click button    id:test_shipping_edit_modal_sure_btn
    page should contain element    class:ant-form-explain
    close browser

049_shipping
    #.添加运费 在名称输入正常字符 保存成功
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    重量运费
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser

050_shipping
    #.添加运费 在说明框里输入超过200个字符 提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    重量运费
    ${sm}    set variable    ssssssssssssssssssssssddsadasdasdasdasdasdasdasdsadasdasdcxvcbvfghfghfghfghdfsdfsdfdsfsdfdsdsfsssddddddddddssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    input text    dom:document.querySelectorAll('#desc')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    class:ant-form-explain
    close browser

051_shipping
    #.添加运费 在说明框里输入 200个以内的字符 保存成功
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${ss}    set variable    重量运费
    ${sm}    set variable    6as51d65a1d65sa65d165as1d56as165d1as56d156as1d56as156d1as65d16sa1d56as1d56as1d6d89f498dfg489fd4g89fd4g89df4gdfg1d3f2g132df1g
    input text    dom:document.querySelectorAll('#name')[1]    ${ss}
    input text    dom:document.querySelectorAll('#desc')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser

052_shipping
    #.添加重量运费 在说明框里输入字符 保存提示 其他信息未填写
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    6as51d65a1d65sa65d165as1d56as165d1as56d156as1d56as156d1as65d16sa1d56as1d56as1d6d89f498dfg489fd4g89fd4g89df4gdfg1d3f2g132df1g
    input text    dom:document.querySelectorAll('#desc')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    class:ant-form-explain
    close browser

053_shipping
    #.添加重量运费 最小单价输入 454544454454545 提示输入10位数以内的数字
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    454544454454545
    input text    dom:document.querySelectorAll('#range_min')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    class:ant-form-explain
    close browser

054_shipping
    #.添加重量运费 最大单价输入 454544454454545 提示输入10位数以内的数字
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    454544454454545
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    class:ant-form-explain
    close browser

055_shipping
    #.添加运费 输入正常最小最大运费 保存成功
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    10
    ${sx}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    ${sm}
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sm}
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sx}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1.5
    page should contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser

056_shipping
    #.添加运费    最小订单重量输入：100    最大订单重量输入： 10 提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    100
    ${sx}    set variable    10
    input text    dom:document.querySelectorAll('#range_min')[0]    ${sm}
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sx}
    click button    id:test_shipping_edit_modal_sure_btn
    ${data}    evaluate    ${sm}+1
    ${res}    get value    id:range_max
    Run keyword If    ${data}==${res}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sdfh2

057_shipping
    #.添加运费    最小订单重量输入：200    最大订单重量输入： 100 提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${sm}    set variable    200
    ${sx}    set variable    100
    input text    dom:document.querySelectorAll('#range_max')[0]    ${sx}
    input text    dom:document.querySelectorAll('#range_min')[0]    ${sm}
    click button    id:test_shipping_edit_modal_sure_btn
    ${data}    evaluate    ${sx}-1
    ${res}    get value    id:range_min
    Run keyword If    ${data}==${res}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sdfh2

058_shipping
    #.添加重量运费 默认单位是克
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${res}    execute javascript    return document.querySelectorAll(".ant-select-selection-selected-value")[0].innerHTML
    Run keyword If    '${res}'=='克'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    sd56f1s

059_shipping
    #.添加运费重量    克。千克，磅
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    #Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    execute javascript    return document.querySelectorAll(".ant-select-arrow")[0].click()
    #${res}    execute javascript    return document.querySelectorAll(“.ant-select-selection-selected-value”)[0].innerHTML
    Mouse Down    dom:document.querySelectorAll("div[role='combobox']")[0]
    Mouse Over    dom:document.querySelectorAll("div[role='combobox']")[0]
    Mouse Up    dom:document.querySelectorAll("div[role='combobox']")[0]
    #close browser

060_shipping
    #.添加重量运费 取消勾选 免运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    close browser

061_shipping
    #.添加重量运费 输入 运费    免运费的选中状态取消
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    id:rate_amount    100
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    page should not contain element    document.querySelectorAll(".ant-checkbox-checked")[0]
    close browser

062_shipping
    #.添加重量运费    运费价格输入框输入超过10位以上的数字 提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    ${re}    set variable    456789456789
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    id:rate_amount    ${re}
    page should contain element    class:ant-form-explain
    close browser

063_shipping
    #.添加重量运费    运费价格输入框输入100 保存成功 列表出现该运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    ${re}    set variable    100
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    input text    id:rate_amount    ${re}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Run keyword If    ${res}==${re}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    ds2121

064_shipping
    #.添加重量运费    运费价格输入框输入0 保存成功 列表出现该运费为0
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    ${re}    set variable    0
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    input text    id:rate_amount    ${re}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Run keyword If    ${res}==${re}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    ds2121

065_shipping
    #.添加重量运费    勾选是否支持货到付款    列表出先支持
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    ${re}    set variable    0
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    input text    id:rate_amount    ${re}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Run keyword If    '${data}'=='支持'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    ds2121

066_shipping
    #.添加重量运费    不勾选是否支持货到付款    列表出先不支持
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    sleep    1
    ${re}    set variable    0
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    input text    id:rate_amount    ${re}
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Run keyword If    '${data}'=='不支持'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain element    ds2121

067_shipping
    #.添加重量运费    直接关掉窗口 列表不存在运费信息
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    page should not contain element    //*[@id="dj"]/div/div[4]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser

068_shipping
    #.添加重量运费    直接关掉窗口 列表不存在运费信息
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    page should not contain    dom:document.querySelectorAll("#name")[1].value
    close browser

069_shipping
    #.添加重量运费    输入内容后 直接关掉窗口 列表不存在运费信息
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    #.check button
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    input text    dom:document.querySelectorAll('#name')[1]    重量运费
    input text    dom:document.querySelectorAll('#desc')[0]    重量运费
    input text    id:range_min    10
    input text    id:range_max    100
    input text    id:rate_amount    100
    execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    page should not contain    dom:document.querySelectorAll("#name")[1].value
    close browser

070_shipping
    #.添加数量运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    page should contain button    id:test_shipping_edit_modal_sure_btn
    close browser

071_shipping
    #.添加数量运费    输入数量运费 显示 数量运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    数量运费
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    ${res}    execute javascript    return document.querySelectorAll("#name")[1].value
    Run keyword If    '${res}'=='${data}'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    sd454

072_shipping
    #.添加数量运费    输入1234 显示 数量运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    1234
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    ${res}    execute javascript    return document.querySelectorAll("#name")[1].value
    Run keyword If    '${res}'=='${data}'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    sd454

073_shipping
    #.添加数量运费    输入 数量运费    保存    列表显示 数量运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    数量运费
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${getdata}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[0].innerText
    Run keyword If    '${getdata}'=='${data}'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    sd454

074_shipping
    #.添加数量运费    输入 输入超过50字符的内容    保存    提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#name")[1]    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain
    close browser

075_shipping
    #.添加数量运费    说明框输入 输入超过200字符的内容    提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#desc")[0]    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain
    close browser

076_shipping
    #.添加数量运费    说明框输入 输入200个以内    保存成功
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#name")[1]    数量运费
    input text    dom:document.querySelectorAll("#desc")[0]    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    //*[@id="dj"]/div/div[5]/div[2]/div/div/div/div/div/table/tbody/tr
    close browser

077_shipping
    #.添加数量运费    说明框输入内容    名称输入框不输入内容 提示有内容未填写
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费数量运费
    input text    dom:document.querySelectorAll("#desc")[0]    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain
    close browser

078_shipping
    #.添加数量运费    最小订单数量输入超过10位以上的数字
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    454544454454545
    input text    id:range_min    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain
    close browser

079_shipping
    #.添加数量运费    最大订单数量输入超过10位以上的数字
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${data}    set variable    5478799641231313
    input text    id:range_max    ${data}
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    page should contain element    class:ant-form-explain
    close browser

080_shipping
    #.添加数量运费    最小订单数量：10    最大订单数量：100
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
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
    close browser

081_shipping
    #.添加数量运费    最大订单数量自动变化为大于最小订单数量的数字：101
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
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
    Run keyword If    ${count}==${max_data}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    ssskk1

082_shipping
    #.添加数量运费    最小订单数量自动变化为小于最大订单数量的数字：99
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
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
    Run keyword If    ${count}==${max_data}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    ssskk1

083_shipping
    #.添加数量运费    取消勾选免运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    close browser

084_shipping
    #.添加数量运费    在运费输入框 输入 100    免运费的勾选会自动去掉
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    input text    id:rate_amount    100
    page should not contain    document.querySelectorAll(".ant-checkbox-checked")[0]
    close browser

085_shipping
    #.添加数量运费    在运费输入框 输入 991212313165656    提示错误
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    id:rate_amount    991212313165656
    page should not contain    class:ant-form-explain
    close browser

086_shipping
    #.添加数量运费    在运费输入框 输入 100    保存成功，数量运费列表中显示的运费为100
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
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
    Run keyword If    ${res}==${cc}    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    djdjjd99

087_shipping
    #.添加数量运费    取消运费的勾选    保存成功，数量运费列表中显示的运费为0
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${cc}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[0].click()
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[3].innerText
    ${res}    searchStrs    ${data}
    Run keyword If    ${res}==0    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    djdjjd99

088_shipping
    #.添加数量运费    勾选是否支持货到付款 保存 列表显示 支持
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${cc}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    #execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Run keyword If    '${data}'=='支持'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    djdjjd99

089_shipping
    #.添加数量运费    取消勾选是否支持货到付款 保存 列表显示 不支持
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${cc}    set variable    100
    input text    dom:document.querySelectorAll('#name')[1]    数量运费
    execute javascript    return document.querySelectorAll(".ant-checkbox-input")[1].click()
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    1
    ${data}    execute javascript    return document.querySelectorAll(".ant-table-tbody tr td")[2].innerText
    Run keyword If    '${data}'=='不支持'    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    djdjjd99

090_shipping
    #.直接关闭窗口，没有添加数量运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    sleep    1
    page should not contain element    //*[@id="dj"]/div/div[5]/div[2]/div/div/div/div/div/table/tbody/tr[2]
    close browser

091_shipping
    #.添加数量运费    输入内容 直接关闭窗口，再次打开窗口 没有添加数量运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    input text    dom:document.querySelectorAll("#name")[1]    数量运费
    execute javascript    return document.querySelectorAll(".ant-modal-close-x")[0].click()
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    page should not contain element    dom:document.querySelectorAll("#name")[1].value
    close browser

092_shipping
    #创建物流    没有输入 方案名 点击保存
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    Wait Until Element Is Visible    id:test_save_btn
    click link    id:test_save_btn
    page should contain element    class:ant-form-explain
    close browser

093_shipping
    #创建物流    输入 方案名 点击保存 提示 请添加国家
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    input text    id:name    方案1
    Wait Until Element Is Visible    id:test_save_btn
    click link    id:test_save_btn
    sleep    2
    page should not contain element    id:test_add_btn
    close browser

094_shipping
    #创建物流    除了价格运费不添加，其他照常添加    提示请添加价格运费
    ${xpath_d}    set variable    id:test_add_btn
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    ${name}    salt
    input text    id:name    ${name}
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[1].click()
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_weight_btn
    click button    id:test_shipping_add_weight_btn
    ${input}    set variable    重量运费
    ${desc}    set variable    重量运费说明
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    input text    dom:document.querySelectorAll("#name")[1]    ${input}
    input text    dom:document.querySelectorAll("#desc")[0]    ${desc}
    input text    id:range_min    ${range_min}
    input text    id:range_max    ${range_max}
    input text    id:rate_amount    ${rate_amount}
    sleep    1
    click button    id:test_shipping_edit_modal_sure_btn
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${input_a}    set variable    数量运费
    ${desc_a}    set variable    熟练给运费说明
    input text    dom:document.querySelectorAll("#name")[1]    ${input_a}
    input text    dom:document.querySelectorAll("#desc")[0]    ${desc_a}
    input text    id:range_min    ${range_min}
    input text    id:range_max    ${range_max}
    input text    id:rate_amount    ${rate_amount}
    sleep    1
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    click link    id:test_save_btn
    sleep    2
    page should contain element    id:test_add_btn
    close browser

095_shipping
    #创建物流    只添加数量运费，重量和价格运费不添加，其他照常添加
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    ${name}    salt
    input text    id:name    ${name}
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[0].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[1].click()
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    Wait Until Element Is Visible    id:test_shipping_add_quantity_btn
    click button    id:test_shipping_add_quantity_btn
    Wait Until Element Is Visible    id:test_shipping_edit_modal_sure_btn
    ${input_a}    set variable    数量运费
    ${desc_a}    set variable    熟练给运费说明
    input text    dom:document.querySelectorAll("#name")[1]    ${input_a}
    input text    dom:document.querySelectorAll("#desc")[0]    ${desc_a}
    input text    id:range_min    ${range_min}
    input text    id:range_max    ${range_max}
    input text    id:rate_amount    ${rate_amount}
    sleep    1
    click button    id:test_shipping_edit_modal_sure_btn
    sleep    2
    click link    id:test_save_btn
    sleep    2
    page should contain element    id:test_add_btn
    close browser

096_shipping
    #创建物流    添加中国    > 点击后显示弹窗，显示中国的所有省份并全部处于勾选状态
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    ${name}    salt
    input text    id:name    ${name}
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[2].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[10].click()
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    execute javascript    return document.querySelectorAll("#test_shipping_country_edit_icon")[0].click()
    sleep    1
    ${count}    execute javascript    return document.querySelectorAll(".ant-modal-body ul li").length
    Run keyword If    ${count}==32    Run keyword    close browser
    ...    ELSE    Run keyword    page should contain    dddss

097_shipping
    #创建物流    添加中国    弹出删除窗口
    ${xpath_d}    set variable    id:test_add_btn
    ${range_min}    set variable    10
    ${range_max}    set variable    100
    ${rate_amount}    set variable    9
    #.login
    Login With Shipping    ${xpath_a}    ${xpath_b}    ${xpath_c}    ${xpath_d}
    sleep    1
    Wait Until Element Is Visible    id:test_save_btn
    click button    id:test_shipping_country_add_btn
    Wait Until Element Is Visible    id:test_shipping_country_modal_sure_btn
    execute javascript    return document.getElementsByClassName("ant-tree-switcher ant-tree-switcher_close")[2].click()
    execute javascript    return document.getElementsByClassName("ant-tree-checkbox-inner")[10].click()
    sleep    1
    click button    id:test_shipping_country_modal_sure_btn
    sleep    1
    execute javascript    return document.querySelectorAll("#test_shipping_country_delete_icon")[0].click()
    sleep    2
    page should contain element    id:test_delete_modal_sure_btn
    close browser
