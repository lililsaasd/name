#!/bin/bash
rm -rf /etc/yum.repos.d/*
echo "正在配置yum源..."
echo "[yum]
name=repo
baseurl=http://192.168.4.254/rhel7
enabled=1
gpgcheck=0" > /etc/yum.repos.d/abc.repo
echo "配置完成!"
yum clean all &> /dev/null
echo "软件数量包有:"
yum repolist | tail -1
