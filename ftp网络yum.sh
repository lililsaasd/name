真机上
1、安装httpd软件
]# yum -y install vsftpd
2、启动服务并设为开启自起
]# systemctl start vsftpd
]# systemctl enable vsftpd
3、挂载访问测试
]# mkdir /var/ftp/rhel7/
]# mount /iso/rhel-server-7.4-x86_64-dvd.iso(镜像文件) /var/ftp/rhel7/
4、真机上搭建yun格式
]# vim /etc/yum.repos.d/abc.repo
[yum]
name=repo
baseurl=ftp://192.168.4.254/rhel7
enabled=1
gpgcheck=0
5、真机上完成开机自动挂载，光盘文件默认的文件系统为iso9660
]# vim /etc/fstab
/var/lib/libvirt/images/iso/rhel-server-7.4-x86_64-dvd.iso  /var/ftp/rhel7 iso9660 defaults 0 0
6、验证
虚拟机上
#!/bin/bash
rm -rf /etc/yum.repos.d/*
echo "正在配置yum源..."
echo "[yum]
name=repo
baseurl=ftp://192.168.4.254/rhel7
enabled=1
gpgcheck=0" > /etc/yum.repos.d/abc.repo
echo "配置完成!"
yum clean all &> /dev/null
echo "软件数量包有:"
yum repolist | tail -1
