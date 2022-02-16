#!/bin/bash


print_system_info()
{
    echo "显示系统信息"
    echo "=================================="
    echo "系统版本：`cat /etc/issue |head -c -8`"
    echo "系统时间：`date`"
    echo "计算机名称：`hostname`"
    echo "架构：`uname -m`"
    echo "CPU：`cat /proc/cpuinfo |grep 'cpu cores' |awk '{print $4}' |head -n 1` 核"
    echo "总内存：`free -h |grep 'Mem' |awk '{print $2}'`"
    echo "已用内存：`free -h |grep 'Mem' |awk '{print $3}'`"
}

findfile()
{
    echo "输入查找范围："
    read findarea
    echo "输入查找关键词："
    read findsearch
    find $findarea -name "*$findsearch*"
}

netport(){
    netstat -lntp
}

check_process(){
    echo "输入你要查看的进程名称:"
    read process
    ps -ef | grep "$process"
}

help(){
    echo "--------------------------------"
    echo "1.查找文件        2.查看网络接口      3.查看进程"
    echo "5.常用工具安装    6.安装java          7.安装docker"
    echo "8.卸载java       9.卸载docker"
    echo "200.帮助         300.退出"
    echo "--------------------------------"
    echo "请输入你想执行的命令："
}

install_base(){
    echo "常用工具安装"
}

main()
{
    print_system_info
    help
    funcs="findfile netport check_process help exit"
    select func in $funcs:
    do
        case ${REPLY} in
        1) findfile
        ;;
        2) netport
        ;;
        3) check_process
        ;;
        200) help
        ;;
        300) exit
        ;;
        *) echo "重新输入"
        ;;
        esac
    done
}
main