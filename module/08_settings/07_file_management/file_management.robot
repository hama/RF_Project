*** Settings ***
Suite Setup       UploadFile Suite Setup
Suite Teardown    UploadFile Suite Teardown
Test Setup        UploadFile Case Setup
Test Teardown     UploadFile Case Teardown
Force Tags        uploadFile
Resource          ../../../resources/keywords/kw_common.robot


*** Test Cases ***

uploadFile001
    [Documentation]    测试素材库界面可正常进入
    [Tags]    P0    threshold
    Wait Until Page Contains Text    商品图

uploadFile003
    [Documentation]    测试素材库界面产品和上传tab > "1.点击商品图,查看结果" > 页面显示商品中所上传的所有图片或文件
    [Tags]    P1    threshold
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg}
    Wait Until Page Contains Text    上传成功
    Wait And Click Element    ${locatorB_uploadFile_nav_productImg}
    Wait Until Page Contains Text    商品图
    Wait Until Page Contains Locator     ${locatorB_uploadFile_img_shippingImg}
    Wait Until Page Contains Text     image01.jpg

uploadFile004
    [Documentation]    测试素材库界面产品和上传tab > "1.点击上传文件,2.查看结果" > 页面显示所有在素材库上传的图片或文件
    [Tags]    P1    threshold
    Wait And Click Element     ${locatorB_uploadFile_nav_upfile}
    Wait Enabled And Choose File       ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg2}
    Wait Until Page Contains Text    上传成功
    Wait Until Page Contains Locator     ${locatorB_uploadFile_img_shippingImg}
    Wait Until Page Contains Text     image02.jpg

uploadFile005
    [Documentation]    "1.在商品编辑界面添加商品并上传图片1.jpg,2.在素材库产品页面查看" > 产品页面显示图片1.jpg
    [Tags]    P0
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg2}
    Wait Until Page Contains Text    上传成功
    Wait And Click Element     ${locatorB_uploadFile_nav_upfile}
    Wait Until Page Contains Locator    ${locatorB_uploadFile_list_firstTr}
    Wait Until Page Contains Locator     ${locatorB_uploadFile_img_shippingImg}
    Wait Until Page Contains Text     image02.jpg

uploadFile006
    [Documentation]    "1.在产品界面点击添加按钮,2.查看结果" > 打开本地文件选择窗口
    [Tags]    P0    threshold
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg}
    Wait Until Page Contains Text    上传成功
    Wait Until Page Contains Locator    ${locatorB_uploadFile_list_firstTr}
    Wait Until Page Contains Locator     ${locatorB_uploadFile_img_shippingImg}
    Wait Until Page Contains Text     image01.jpg

uploadFile007
    [Documentation]       测试产品栏  >  1.在产品界面点击添加按钮 2.查看结果
    [Tags]    P0    threshold
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg2}
    Wait Until Page Contains Text    上传成功
    Wait Until Page Contains Locator    ${locatorB_uploadFile_list_firstTr}
    Wait Until Page Contains Locator     ${locatorB_uploadFile_img_shippingImg}
    Wait Until Page Contains Text     image02.jpg

uploadFile009
    [Documentation]    测试上传栏 > "1.在上传界面点击添加按钮,2.在本地文件中选择图片3.jpg,3.点击确认" > 显示上传成功，上传栏中显示图片3.jpg
    [Tags]    P0    threshold
    #.切换到 上传文件 栏目
    Wait And Click Element    ${locatorB_uploadFile_nav_upfile}
    Wait Until Page Contains Locator    ${locatorB_uploadFile_upLoad_addFileBtn}
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg}
    Wait Until Page Contains Text    上传成功
    Wait And Click Element     ${locatorB_uploadFile_nav_productImg}
    Wait Until Page Contains Locator    ${locatorB_uploadFile_list_firstTr}
    Wait Until Page Contains Locator     ${locatorB_uploadFile_img_shippingImg}
    Wait Until Page Contains Text     image01.jpg

uploadFile011
    [Documentation]    测试素材链接及复制按钮 >  1.上传一个图片到素材库 2.点击复制按钮  3.新开窗口粘贴  4.进入网页
    [Tags]    P0    threshold
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg2}
    Wait Until Page Contains Text    上传成功
    Wait Until Page Contains Locator    ${locatorB_uploadFile_list_firstTr}
    ${xurl}    Execute JavaScript    return document.querySelectorAll('tbody tr td div input')[0].value
    Execute Javascript    window.open("${xurl}")
    Select Window    New
    Sleep    2
    ${data}    Execute Javascript    return document.querySelectorAll('img')[0].src
    Should Be True    '${data}'<>''
    
uploadFile012
    [Documentation]    测试素材栏删除按钮 > "1.点击删除按钮,2.查看结果" > 点击删除按钮时弹出二次确认弹窗提示是否删除
    [Tags]    P0    threshold
    Wait And Click Element     ${locatorB_uploadFile_nav_upfile}
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg2}
    Wait Until Page Contains Text    上传成功
    Wait Until Page Contains Locator    ${locatorB_uploadFile_list_firstTr}
    Wait Until Page Contains Text     image02.jpg
    #.点击删除
    Sleep  4
    Wait And Click Element    ${locatorB_uploadFile_icon_delImg}[0]
    Wait Until Page Contains Text    确定删除吗？

uploadFile013
    [Documentation]    测试素材栏删除按钮 > "1.点击删除按钮,2.查看结果" > 点击确认
    [Tags]    P0    threshold
    Wait And Click Element     ${locatorB_uploadFile_nav_upfile}
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg2}
    Wait Until Page Contains Text    上传成功
    Wait Until Page Contains Locator    ${locatorB_uploadFile_list_firstTr}
    Wait Until Page Contains Text     image02.jpg
    #.点击删除
    Sleep  4
    Wait And Click Element Then Confirm    ${locatorB_uploadFile_icon_delImg}[0]
    Wait Until Page Not Contains Text     image02.jpg

uploadFile014
    [Documentation]    "1.已在素材库界面,2.素材库已有内容,3.网络正常" > 测试素材栏删除按钮 点击取消 > 本次不会删除
    [Tags]    P0    threshold
    Wait And Click Element     ${locatorB_uploadFile_nav_upfile}
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg2}
    Wait Until Page Contains Text    上传成功
    Wait Until Page Contains Locator    ${locatorB_uploadFile_list_firstTr}
    Wait Until Page Contains Text     image02.jpg
    Sleep   2
    Wait And Click Element Then Cancel    ${locatorB_uploadFile_icon_delImg}[0]
    Wait Until Page Contains Locator    ${locatorB_uploadFile_list_firstTr}
    Wait Until Page Contains Text     image02.jpg

uploadFile015
    [Documentation]    测试批量删除 > 1.勾选多个素材 2.查看结果
    [Tags]    P1
    Wait And Click Element     ${locatorB_uploadFile_nav_productImg}
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg}
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg2}
    #.点击批量选中
    Sleep And Click Element    ${locatorB_uploadFile_checkbox_selectAllFiles}
    Wait Until Page Contains Locator    ${locatorB_uploadFile_icon_delImg}
    Wait Until Page Contains Locator    ${locatorB_uploadFile_checkbox_delTheBut}[1]
    #删除所有
    kwfilemanagement.del_all_file_py

uploadFile016
    [Documentation]    测试批量删除 > 1.勾选多个素材  2.点击删除   3.点击确认
    [Tags]    P1    threshold
    Wait And Click Element     ${locatorB_uploadFile_nav_productImg}
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg}
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg2}
    Sleep And Click Element    ${locatorB_uploadFile_checkbox_selectAllFiles}
    Wait And Click Element Then Confirm    ${locatorB_uploadFile_button_delData}
    #.显示删除 元素
    Wait Until Page Not Contains Locator    ${locatorB_uploadFile_list_firstTr}
    kwfilemanagement.del_all_file_py

uploadFile017
    [Documentation]    测试批量删除 > 1.勾选多个素材  2.点击删除  3.点击取消
    [Tags]    P1    threshold
    Wait And Click Element     ${locatorB_uploadFile_nav_productImg}
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg}
    Wait Enabled And Choose File    ${locatorB_uploadFile_upLoad_addFileBtn}    ${file_products_addImg2}
    #.点击批量选中
    Sleep And Click Element    ${locatorB_uploadFile_checkbox_selectAllFiles}
    Wait And Click Element Then Cancel    ${locatorB_uploadFile_button_delData}
    Wait Until Page Contains Locator    ${locatorB_uploadFile_list_firstTr}
    #.显示素材还是在被选中状态
    Element Attribute Should Be Equal With Wait    ${locatorB_uploadFile_checkbox_state}    class    ant-checkbox ant-checkbox-checked
    kwfilemanagement.del_all_file_py


# 现有方法耗时太长，先不执行，待优化用例
#uploadFile018
#    [Documentation]    测试下一页上一页按钮 > 素材列表切换到下一页
#    [Tags]    P1    threshold
#    #.添加30个
#    Wait Add Upfile
#    Reload Page And Start Ajax
#    Wait Until Page Contains Locator    ${locatorB_uploadFile_upLoad_addFileBtn}
#    #.点击下一页
#    Wait And Click Element    ${locatorB_uploadFile_page_nexPageBut}
#    #删除所有
#    Wait Del Upfile
#
#uploadFile019
#    [Documentation]    测试下一页上一页按钮 > 素材列表切换到上一页
#    [Tags]    P1    threshold
#    #.添加30个
#    Wait Add Upfile
#    Reload Page And Start Ajax
#    Wait Until Page Contains Locator    ${locatorB_uploadFile_upLoad_addFileBtn}
#    #.点击下一页
#    Wait And Click Element    ${locatorB_uploadFile_page_nexPageBut}
#    #.点击上一页
#    Wait And Click Element    ${locatorB_uploadFile_page_prePageBut}
#    #删除所有
#    Wait Del Upfile

