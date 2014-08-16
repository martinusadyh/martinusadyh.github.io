---
comments: true
date: 2010-02-23 20:14:22+00:00
layout: post
slug: installing-mysql-in-centos-5-4
title: Installing MySQL in CentOS 5.4
wordpress_id: 148
categories:
- CentOS
- DataBase
tags:
- install mysql centos
- install mysql di centos
---

Kalau dulu kita sudah pernah install dan konfigurasi [MySQL](http://www.mysql.com/downloads/) pada [Slackware](http://martinusadyh.web.id/2009/09/27/konfigurasi-mysql-di-slackware-130/) dan [OpenSolaris](http://martinusadyh.web.id/2009/03/28/installasi-dan-konfigurasi-mysql-di-opensolaris-200811/), sekarang bagaimana jika kita install di distro [CentOS](http://centos.org/) ??? Cara install-nya sih **berbeda** tapi untuk konfigurasi-nya sama saja. Karena [kemarin](http://martinusadyh.web.id/2010/02/17/step-by-step-installing-centos-54/) kita sudah belajar untuk meng-install distro [CentOS](http://centos.org/), sekarang mari kita install dan konfigurasi [MySQL](http://www.mysql.com/downloads/)-nya :) 

Langkah pertama yang harus dilakukan yaitu bukalah sebuah terminal kemudian ganti akses user anda menjadi **super user** atau **root** dengan mengetikkan perintah **su -** kemudian isikan password **user root** yang terdapat pada sistem anda. Jika sudah, sekarang mari kita install [MySQL](http://www.mysql.com/downloads/) dengan menggunakan **yum** dengan cara seperti dibawah ini :
[plain]
[root@localhost ~]# yum install mysql-server
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * addons: ftp.oss.eznetsols.org
 * base: ftp.oss.eznetsols.org
 * extras: ftp.oss.eznetsols.org
 * updates: ftp.oss.eznetsols.org
Setting up Install Process
Resolving Dependencies
--> Running transaction check
---> Package mysql-server.i386 0:5.0.77-4.el5_4.1 set to be updated
--> Processing Dependency: mysql = 5.0.77-4.el5_4.1 for package: mysql-server
--> Processing Dependency: libmysqlclient.so.15(libmysqlclient_15) for package: mysql-server
--> Processing Dependency: libmysqlclient_r.so.15(libmysqlclient_15) for package: mysql-server
--> Processing Dependency: libmysqlclient.so.15 for package: mysql-server
--> Processing Dependency: libmysqlclient_r.so.15 for package: mysql-server
--> Processing Dependency: perl-DBD-MySQL for package: mysql-server
--> Running transaction check
---> Package mysql.i386 0:5.0.77-4.el5_4.1 set to be updated
---> Package perl-DBD-MySQL.i386 0:3.0007-2.el5 set to be updated
--> Finished Dependency Resolution

Dependencies Resolved

=================================================================================================
 Package                   Arch            Version                      Repository          Size
=================================================================================================
Installing:
 mysql-server              i386            5.0.77-4.el5_4.1             updates            9.8 M
Installing for dependencies:
 mysql                     i386            5.0.77-4.el5_4.1             updates            4.8 M
 perl-DBD-MySQL            i386            3.0007-2.el5                 base               148 k

Transaction Summary
=================================================================================================
Install      3 Package(s)         
Update       0 Package(s)         
Remove       0 Package(s)         

Total download size: 15 M
Is this ok [y/N]: y
Downloading Packages:
(1/3): perl-DBD-MySQL-3.0007-2.el5.i386.rpm                               | 148 kB     00:11     
(2/3): mysql-5.0.77-4.el5_4.1.i386.rpm                                    | 4.8 MB     06:33     
(3/3): mysql-server-5.0.77-4.el5_4.1.i386.rpm                             | 9.8 MB     06:21     
-------------------------------------------------------------------------------------------------
Total                                                             19 kB/s |  15 MB     13:17     
Running rpm_check_debug
Running Transaction Test
Finished Transaction Test
Transaction Test Succeeded
Running Transaction
  Installing     : mysql                                                                     1/3 
  Installing     : perl-DBD-MySQL                                                            2/3 
  Installing     : mysql-server                                                              3/3 

Installed:
  mysql-server.i386 0:5.0.77-4.el5_4.1                                                           

Dependency Installed:
  mysql.i386 0:5.0.77-4.el5_4.1                perl-DBD-MySQL.i386 0:3.0007-2.el5               

Complete!
[root@localhost ~]# 
[/plain]
<!-- more -->
Setelah proses installasi selesai, sekarang mari kita install tabel-tabel yang berhubungan dengan [MySQL](http://www.mysql.com/downloads/) dengan menjalankan perintah **/etc/init.d/mysqld start** seperti dibawah ini :
[plain]
[root@localhost ~]# /etc/init.d/mysqld start
Initializing MySQL database:  Installing MySQL system tables...
100209  9:21:00 [Warning] option 'max_join_size': unsigned value 18446744073709551615 adjusted to 4294967295
100209  9:21:00 [Warning] option 'max_join_size': unsigned value 18446744073709551615 adjusted to 4294967295
OK
Filling help tables...
100209  9:21:01 [Warning] option 'max_join_size': unsigned value 18446744073709551615 adjusted to 4294967295
100209  9:21:01 [Warning] option 'max_join_size': unsigned value 18446744073709551615 adjusted to 4294967295
OK

To start mysqld at boot time you have to copy
support-files/mysql.server to the right place for your system

PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
To do so, start the server, then issue the following commands:
/usr/bin/mysqladmin -u root password 'new-password'
/usr/bin/mysqladmin -u root -h localhost.localdomain password 'new-password'

Alternatively you can run:
/usr/bin/mysql_secure_installation

which will also give you the option of removing the test
databases and anonymous user created by default.  This is
strongly recommended for production servers.

See the manual for more instructions.

You can start the MySQL daemon with:
cd /usr ; /usr/bin/mysqld_safe &

You can test the MySQL daemon with mysql-test-run.pl
cd[root@localhost martin]# /sbin/chkconfig mysqld --level 2345 on mysql-test ; perl mysql-test-run.pl

Please report any problems with the /usr/bin/mysqlbug script!

The latest information about MySQL is available on the web at
http://www.mysql.com
Support MySQL by buying support/licenses at http://shop.mysql.com
                                                           [  OK  ]
Starting MySQL:                                            [  OK  ]
[root@localhost ~]#
[/plain]

Proses inisialisasi tabel untuk [MySQL](http://www.mysql.com/downloads/) sudah selesai, sekarang mari kita setting password untuk user **root** [MySQL](http://www.mysql.com/downloads/) dan sekaligus menkonfigurasi agara setiap kali **boot** service [MySQL](http://www.mysql.com/downloads/) ini dijalankan dengan menggunakan perintah seperti dibawah ini:
[plain]
[root@localhost ~]# /usr/bin/mysqladmin -u root password 'admin'
[root@localhost ~]# /sbin/chkconfig mysqld --level 2345 on
[/plain]

Dan untuk mengetes apakah installasi dan konfigurasi [MySQL](http://www.mysql.com/downloads/) kita sukses atau tidak, sekarang coba-lah untuk login dengan mengetikkan perintah seperti dibawah ini :
[plain]
[root@localhost ~]# mysql -u root -padmin
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.0.77 Source distribution

Type 'help;' or '\h' for help. Type '\c' to clear the buffer.

mysql> 
[/plain]

Tingtong .... service [MySQL](http://www.mysql.com/downloads/) kita sudah berjalan sesuai dengan apa yang diharapkan, nah sekarang mari kita lanjutkan pekerjaan masing-masing yang berhubungan dengan DataBase [MySQL](http://www.mysql.com/downloads/)


Akhir kata, happy coding all  :) :D
