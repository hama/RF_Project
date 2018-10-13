#!/bin/bash

export PATH=$PATH:/usr/local/bin/
#定义选项， -o 表示短选项 -a 表示支持长选项的简单模式(以 - 开头) -l 表示长选项
# a 后没有冒号，表示没有参数
# b 后跟一个冒号，表示有一个必要参数
# c 后跟两个冒号，表示有一个可选参数(可选参数必须紧贴选项)
# -n 出错时的信息
# -- 也是一个选项，比如 要创建一个名字为 -f 的目录，会使用 mkdir -- -f ,
#    在这里用做表示最后一个选项(用以判定 while 的结束)
# $@ 从命令行取出参数列表(不能用用 $* 代替，因为 $* 将所有的参数解释成一个字符串
#                         而 $@ 是一个参数数组)

TEMP=`getopt -o eam:u: -l email,account,module:,url: -- "$@"`

# 判定 getopt 的执行时候有错，错误信息输出到 STDERR
if [ $? != 0 ]
then
	echo "Terminating....." >&2
	exit 1
fi

# 重新排列参数的顺序
# 使用eval 的目的是为了防止参数中有shell命令，被错误的扩展。
eval set -- "$TEMP"

# 处理具体的选项
while true
do
	case "$1" in
		-e | --email)
			send_email='yes'
			shift
			;;
		-a | --account)
			test_account='new'
			shift
			;;
		-m | --module)
			test_module="$2"
			shift 2
			;;
		-u | --url)
			test_url="$2"
			shift 2
			;;
		--)
			shift
			break
			;;
		*)
			echo "Internal error!"
			exit 1
			;;
	esac
done

# 执行customKeyWord.py
if [ "$test_url" -a "$test_account" ]
then
	echo 'test_url and test_account'
    python2.7 lib/customlib/initevn.py --url="$test_url" --user="$test_account"
elif [ "$test_url" ]
then
	echo 'test_url'
	echo "$test_url"
    python2.7 lib/customlib/initevn.py --url="$test_url"
elif [ "$test_account" ]
then
	echo 'test_account'
    python2.7 lib/customlib/initevn.py --user="$test_account"
else
	echo 'not test_url and test_account'
    python2.7 lib/customlib/initevn.py
fi

# 执行用例
if [ "$test_module" ]
then
	echo "$test_module"
    robot -v is_headless:True -d logs/ $test_module
else
	echo 'test_module_default'
    robot -v is_headless:True -d logs/ \
        module/00_login/login.robot \
        module/00_login/logout.robot \
        module/02_order/* \
        module/03_product/* \
        module/07_decoration/02_checkout_process/setings_checkout.robot \
		module/08_settings/01_basic_info/store_info.robot \
		module/08_settings/03_shipping/shipping.robot \
		module/08_settings/04_tax/tax_rate.robot \
		module/08_settings/07_file_management/file_management.robot
fi


# 执行email_utils.py
if [ "$send_email" ]
then
	echo 'send_email_default'
    python2.7 lib/utils/email_utils.py
fi


#显示除选项外的参数(不包含选项的参数都会排到最后)
# arg 是 getopt 内置的变量 , 里面的值，就是处理过之后的 $@(命令行传入的参数)
#for arg do
#   echo '--> '"$arg" ;
#done
