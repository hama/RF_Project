*** Variables ***
# api
#${apiB_checkout_}    ${home_page}/api/product/add    # 保存商品
${apiB_products_upload}    ${home_page}/api/file/upload    # 上传图片

# locator_checkout
${locatorB_productsCategory_button_addCategory}    ${locatorB_button_add}    #商品专辑页的新增专辑按钮
${locatorB_productsCategory_icon_del}    dom:document.querySelectorAll(".djfont.delete")[0]    #商品专辑的第一个删除icon

# content
${contentB_products_all}    全部
${contentB_products_empty}    暂无数据
${contentB_products_new}    新建商品
${contentB_products_title}    全部
${contentB_products_addTitle}    此处为商品标题

${first_name}     //*[@id="verify_form"]/div[2]/div[1]/input[1]
${last_name}      //*[@id="verify_form"]/div[2]/div[1]/input[2]
${city}           //*[@id="verify_form"]/div[2]/div[4]/input
${address}        //*[@id="verify_form"]/div[2]/div[5]/input
${post_code}      //*[@id="verify_form"]/div[2]/div[6]/input
${email}          //*[@id="verify_form"]/div[2]/div[7]/input
${phone}          //*[@id="verify_form"]/div[2]/div[8]/input
${company}        //*[@id="verify_form"]/div[2]/div[9]/input
${page}    https://chen.preview.shoplazza.com/products/title
