*** Settings ***
Resource          var_common.robot

*** Variables ***
#.locatorB_couponCodeNew

${locatorB_couponCodeNew_input_activityName}    dom:document.querySelectorAll('[id="name"]')[0]   # 活动名称input


#.locatorB_couponCode
${locatorB_couponCode_items_listCoupon}    ${locatorB_table_listItems}    # 列表中的优惠码集合
${locatorB_couponCode_button_all}    dom:document.querySelectorAll('[class*="ant-tabs-tab"]')[0]
${locatorB_couponCode_button_before}    dom:document.querySelectorAll('[class*="ant-tabs-tab"]')[1]   # 未开始
${locatorB_couponCode_button_doing}    dom:document.querySelectorAll('[class*="ant-tabs-tab"]')[2]    # 进行中
${locatorB_couponCode_button_done}    dom:document.querySelectorAll('[class*="ant-tabs-tab"]')[3]    # 已结束

${locatorB_couponCode_text_firstCoupon_activityNum}    ${locatorB_table_listItems}[0].querySelectorAll("td")[0]    #第一个优惠码的，优惠码编号
${locatorB_couponCode_text_firstCoupon_activityName}    ${locatorB_table_listItems}[0].querySelectorAll("td")[1]    #第一个优惠码的，
${locatorB_couponCode_text_firstCoupon_couponCode}    ${locatorB_table_listItems}[0].querySelectorAll("td")[2]    #第一个优惠码的，
${locatorB_couponCode_text_firstCoupon_activityTime}    ${locatorB_table_listItems}[0].querySelectorAll("td")[3]    #第一个优惠码的，
${locatorB_couponCode_text_firstCoupon_activityRules}    ${locatorB_table_listItems}[0].querySelectorAll("td")[4]    #第一个优惠码的，
${locatorB_couponCode_text_firstCoupon_activityRange}    ${locatorB_table_listItems}[0].querySelectorAll("td")[5]    #第一个优惠码的，
${locatorB_couponCode_text_firstCoupon_beenUsedAndUnUsed}    ${locatorB_table_listItems}[0].querySelectorAll("td")[6]    #第一个优惠码的，
${locatorB_couponCode_text_firstCoupon_createTime}    ${locatorB_table_listItems}[0].querySelectorAll("td")[7]    #第一个优惠码的，优惠码状态
${locatorB_couponCode_tag_firstCoupon_activityStatus}    ${locatorB_table_listItems}[0].querySelectorAll("td")[8]    #第一个优惠码的，活动状态
${locatorB_couponCode_icon_firstCoupon_preview}        #第一个优惠码的，优惠码总价
${locatorB_couponCode_icon_firstCoupon_stop}        #第一个优惠码的，优惠码总价
