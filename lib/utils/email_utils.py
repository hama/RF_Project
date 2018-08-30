# -*- coding:utf-8 -*-
import ConfigParser
import email
import os
import smtplib
import sys
import time
from email.header import Header
from email.mime.image import MIMEImage
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from selenium import webdriver

username = "autotest@shoplazza.com"  # .发件人
password = "Robot@123"  # .发件人密码
relative_path = os.path.join(os.path.dirname(__file__), '../..')
# . 收件邮箱
to_addr = [
    'wanglinyun@shoplazza.com',
    'xiabing@shoplazza.com',
    'qiansuixin@shoplazza.com',
    'lijunchen@shoplazza.com'
]
# . 抄送邮箱
cc_addr = [
    'zhangliqiong@shoplazza.com',
    'yupeng@shoplazza.com',
    'linyingjun@shoplazza.com',
    'fangbaiyuan@shoplazza.com'
]
email_service = "smtp.mxhichina.com"
default_port = 465


def send_email():
    '''
    发送邮件
    :return:
    '''
    msg = email_fomat_content()
    try:
        smtp = smtplib.SMTP_SSL()
        smtp.connect(email_service, default_port)
        smtp.set_debuglevel(0)
        smtp.login(username, password)
        smtp.sendmail(username, to_addr + cc_addr, msg.as_string())
        smtp.quit()
        print '发送成功'
    except smtplib.SMTPConnectError, e:
        print '邮件发送失败，连接失败:', e.smtp_code, e.smtp_error
    except smtplib.SMTPAuthenticationError, e:
        print '邮件发送失败，认证错误:', e.smtp_code, e.smtp_error
    except smtplib.SMTPSenderRefused, e:
        print '邮件发送失败，发件人被拒绝:', e.smtp_code, e.smtp_error
    except smtplib.SMTPRecipientsRefused, e:
        print '邮件发送失败，收件人被拒绝:', e.smtp_code, e.smtp_error
    except smtplib.SMTPDataError, e:
        print '邮件发送失败，数据接收拒绝:', e.smtp_code, e.smtp_error
    except smtplib.SMTPException, e:
        print '邮件发送失败, ', e.message
    except Exception, e:
        print '邮件发送异常, ', str(e)


def get_screenshot():
    '''
    报告截屏
    :return:
    '''
    chrome_options = sys.modules['selenium.webdriver'].ChromeOptions()
    chrome_options.add_argument('--headless')
    chrome_options.add_argument('--disable-gpu')
    chrome_options.add_argument('no-sandbox')
    driver = webdriver.Chrome(chrome_options=chrome_options)
    driver.set_window_size(1200, 900)
    file_path = 'file:///' + os.getcwd() + '/logs/report.html'
    driver.get(file_path)
    time.sleep(5)
    driver.save_screenshot(relative_path + '/screenshot_for_report.png')
    driver.quit()


def email_fomat_content():
    '''
    邮件格式&内容
    :return:
    '''
    # 获取测试环境信息
    config = ConfigParser.ConfigParser()
    path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
    config.read(path)
    env_detail = config.get("common_url", "home_page_url")
    hostname = os.popen('hostname').readline().strip('\n')
    pwd = os.path.abspath(os.path.curdir)
    date_stamp = time.strftime("%Y%m%d%H%M%S", time.localtime())
    if pwd.endswith('/shoplaza_robot'):
        os.popen('tar -zcvf ./logs/robot_log_%s.tar.gz ./logs --remove-files' % date_stamp)

    msg = MIMEMultipart('alternative')
    msg['Subject'] = '%s (被测环境：%s  执行环境：%s )' % \
                     (Header('Robot测试报告'.decode('utf-8')).encode(), env_detail, hostname)
    msg['From'] = '%s <%s>' % (Header('自动化测试'.decode('utf-8')).encode(), username)
    msg['To'] = ', '.join(to_addr)
    msg['Cc'] = ', '.join(cc_addr)
    msg['Message-id'] = email.utils.make_msgid()
    msg['Date'] = email.utils.formatdate()
    # 文字
    html = """
    <p>================截图=====================</p>
    <img src="cid:image1"/>
    <p>=========================================</p>
    """
    msgText = MIMEText(html, 'html', 'utf-8')
    msg.attach(msgText)
    # 图片

    fp = open(relative_path + '/screenshot_for_report.png', 'rb')
    msgImage = MIMEImage(fp.read())
    fp.close()
    msgImage.add_header('Content-ID', '<image1>')
    msg.attach(msgImage)

    # 附件
    att = MIMEText(open(relative_path + '/logs/robot_log_%s.tar.gz' % date_stamp, 'rb').read(), 'base64', 'utf-8')
    att["Content-Type"] = 'application/octet-stream'
    att["Content-Disposition"] = 'attachment; filename="robot_log"'
    msg.attach(att)

    return msg


if __name__ == "__main__":
    get_screenshot()
    time.sleep(5)
    send_email()
