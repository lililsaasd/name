#!/bin/bash
mount /dev/cdrom /mnt &> /dev/null
echo "正在配置yum源..."
rm -rf /etc/yum.repos.d/*
echo "[rhel7]
name=yum
baseurl=file:///mnt
enabled=1
gpgcheck=0" > /etc/yum.repos.d/rhel7.repo
echo "配置完成!"
yum clean all &> /dev/null
echo "软件数量有:"
yum repolist | tail -1 


