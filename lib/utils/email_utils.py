# -*- coding:utf-8 -*-
import ConfigParser
import argparse
import email
import os
import smtplib
import sys
import time
from email.header import Header
from email.mime.image import MIMEImage
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import lib_utilsCopy

from selenium import webdriver


username = "zhouli@shoplazza.com"  # .发件人
password = "zeqnvyihpxcmlefy"  # .发件人密码
# . 收件邮箱
to_addr = [
    'qiansuixin@shoplazza.com',
    'zhouli@shoplazza.com'
    # 'zhiliangbu@shoplazza.com'
]
# . 抄送邮箱
cc_addr = [
    # 'yanfa@shoplazza.com'
]
email_service = "smtp.gmail.com"
default_port = 465


def send_email(msg):
    '''
    发送邮件
    :return:
    '''
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


def get_report_screenshot(file_path, save_pic_path):
    '''
    报告截屏,并保持至相应位置
    :return:
    '''
    chrome_options = sys.modules['selenium.webdriver'].ChromeOptions()
    chrome_options.add_argument('--headless')
    chrome_options.add_argument('--disable-gpu')
    chrome_options.add_argument('no-sandbox')
    driver = webdriver.Chrome(chrome_options=chrome_options)
    driver.set_window_size(1440, 1080)
    driver.get(file_path)
    time.sleep(5)
    driver.save_screenshot(save_pic_path)
    driver.quit()


def set_email_content_for_uireport(msg, timestamp, log_path):
    '''
    设置邮件格式&内容
    :return:
    '''
    hosts = os.popen('cat /etc/hosts | grep "shopla"').read()
    if hosts:
        hosts = '!!!pre_release环境报告!!!\n已配/etc/hosts:' + hosts
    else:
        hosts = '!!!美服环境报告!!!'
    # 文字
    html = """
    %s
    <p>=====================截图=====================</p>
    <img src="cid:image1"/>
    <p>=============================================</p>
    """ % (hosts)
    msgText = MIMEText(html, 'html', 'utf-8')
    # msg.attach(msgText)
    result = lib_utilsCopy.upload_file_oss_py()
    print result


    # 图片
    fp = open(log_path + '/screenshot_for_report.png', 'rb')
    msgImage = MIMEImage(fp.read())
    fp.close()
    msgImage.add_header('Content-ID', '<image1>')
    msg.attach(msgImage)

    # 打包文件夹,并添加为附件
    os.popen('cd %s; tar -zcvPf ./robot_log_%s.tar.gz ./*' % (log_path, timestamp))
    # att = MIMEText(open(log_path + '/robot_log_%s.tar.gz' % timestamp, 'rb').read(), 'base64', 'utf-8')
    # att["Content-Type"] = 'application/octet-stream'
    # att["Content-Disposition"] = 'attachment; filename="robot_log_%s.tar.gz"' % timestamp
    # msg.attach(att)



def set_email_header_for_uireport(msg):
    '''
    设置邮件头部信息
    :param msg:
    :return:
    '''
    config = ConfigParser.ConfigParser()
    path = os.path.join(os.path.dirname(__file__), '../../config/common.ini')
    config.read(path)
    env_detail = config.get("common_url", "home_page_url")
    hostname = os.popen('hostname').readline().strip('\n')

    msg['Subject'] = '%s ( tested_env : %s  execute_env : %s )' % \
                     (Header('Robot测试报告'.decode('utf-8')).encode(), env_detail, hostname)
    msg['From'] = '%s <%s>' % (Header('自动化测试'.decode('utf-8')).encode(), username)
    msg['To'] = ', '.join(to_addr)
    msg['Cc'] = ', '.join(cc_addr)
    msg['Message-id'] = email.utils.make_msgid()
    msg['Date'] = email.utils.formatdate()


def send_uireport_email_process(timestamp, log_path):
    '''
    发送ui报告邮件流程
    :param timestamp:
    :param log_path:
    :return:
    '''
    file_path = 'file:///' + log_path + '/report.html'
    save_pic_path = os.path.join(log_path, 'screenshot_for_report.png')
    get_report_screenshot(file_path, save_pic_path)
    time.sleep(5)
    msg = MIMEMultipart('alternative')
    set_email_header_for_uireport(msg)
    set_email_content_for_uireport(msg, timestamp, log_path)
    send_email(msg)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='email script')
    parser.add_argument('--timestamp', type=str, default=time.strftime("%Y%m%d%H%M%S", time.localtime()))
    parser.add_argument('--log_path', type=str)
    args = parser.parse_args()
    send_uireport_email_process(args.timestamp, args.log_path)

    # print os.path.join(os.path.dirname(__file__), '../..')
    # print os.getcwd()
    # print os.chdir('/var/log')
    # print os.getcwd()
    # print os.path
    # print os.path.join('/var/log/uitest_log/', '111111', 'screenshot_for_report.png')
    # log_timestamp_path = os.path.join('/var/log/uitest_log/', '123123')
    # file_path = 'file:///' + log_timestamp_path + '/report.html'
    # save_pic_path = os.path.join(log_timestamp_path, 'screenshot_for_report.png')
    # print 'a'
    # print log_timestamp_path
    # print file_path
    # print save_pic_path



