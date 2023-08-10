#!/bin/bash
echo "开始....."
cd /opt
echo "下载解压python"
if [ -f Python-3.8.12.tgz ]
then
     tar -xvf Python-3.8.12.tgz
     cd Python-3.8.12
else
     wget https://www.python.org/ftp/python/3.8.12/Python-3.8.12.tgz
     tar -xvf  Python-3.8.12.tgz
     cd  Python-3.8.12
fi
echo "安装所需要的协助软件"
yum install gcc make vim openssl-devel bzip2-devel libffi-devel zlib-devel wget -y
if [ $? == 0 ]
then
     echo "协助软件安装成功"
fi
echo "开始编译"
./configure --enable-optimizations
if [ $? == 0 ]
then
	echo "编译成功"

fi
echo "开始安装"
make altinstall
if [ $? == 0 ]
then 
	echo "编译安装成功"
fi

python3.9 --version
echo "安装结束"
