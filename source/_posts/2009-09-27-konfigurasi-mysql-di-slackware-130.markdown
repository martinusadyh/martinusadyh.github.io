---
comments: true
date: 2009-09-27 22:45:01+00:00
layout: post
slug: konfigurasi-mysql-di-slackware-130
title: Konfigurasi MySQL Di Slackware 13.0
wordpress_id: 72
categories:
- Slackware
---

Tulisan kali ini sebenarnya untuk menambah archive blog saya saja :D . Setelah Wifi udah jalan dan GNOME pun udah terinstall, sekarang mari konfigurasi MySQL di Slackware 13.0 :) Pada default installasi Slackware, sebenarnya MySQL sudah ter-install dan kita tinggal melakukan proses konfigurasi saja. Sedangkan caranya yaitu, masuk ke terminal dengan menggunakan akses **root** kemudian jalankan perintah **mysql_install_db** untuk menginstall database-nya dan beri akses ke direktori **/var/lib/mysql** dengan perintah **chown -R mysql.mysql /var/lib/mysql** seperti dibawah ini :
<!-- more -->

    
    
    root@martinusadyh:~# mysql_install_db
    Installing MySQL system tables...
    090928  4:57:04 [Warning] option 'max_join_size': unsigned value 18446744073709551615 adjusted to 4294967295
    090928  4:57:04 [Warning] option 'max_join_size': unsigned value 18446744073709551615 adjusted to 4294967295
    OK
    Filling help tables...
    090928  4:57:04 [Warning] option 'max_join_size': unsigned value 18446744073709551615 adjusted to 4294967295
    090928  4:57:04 [Warning] option 'max_join_size': unsigned value 18446744073709551615 adjusted to 4294967295
    OK
    
    To start mysqld at boot time you have to copy
    support-files/mysql.server to the right place for your system
    
    PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
    To do so, start the server, then issue the following commands:
    /usr/bin/mysqladmin -u root password 'new-password'
    /usr/bin/mysqladmin -u root -h martinusadyh password 'new-password'
    
    Alternatively you can run:
    /usr/bin/mysql_secure_installation
    
    which will also give you the option of removing the test
    databases and anonymous user created by default.  This is
    strongly recommended for production servers.
    
    See the manual for more instructions.
    
    You can start the MySQL daemon with:
    cd /usr ; /usr/bin/mysqld_safe &
    
    You can test the MySQL daemon with mysql-test-run.pl
    cd mysql-test ; perl mysql-test-run.pl
    
    Please report any problems with the /usr/bin/mysqlbug script!
    
    The latest information about MySQL is available on the web at
    http://www.mysql.com
    Support MySQL by buying support/licenses at http://shop.mysql.com
    root@martinusadyh:~# chown -R mysql.mysql /var/lib/mysql
    



Setelah selesai, sekarang jalankan MySQL Daemon-nya dengan cara sebagai berikut :

    
    
    root@martinusadyh:~# /usr/bin/mysqld_safe &
    [1] 6831
    root@martinusadyh:~# nohup: ignoring input and redirecting stderr to stdout
    Starting mysqld daemon with databases from /var/lib/mysql
    
    root@martinusadyh:~#
    



Kemudian setting password untuk user **root** dengan mengetikkan perintah seperti dibawah ini:

    
    
    root@martinusadyh:~# /usr/bin/mysqladmin -u root password 'admin'
    



Sekarang coba login bisa atau tidak seperti dibawah ini :

    
    
    root@martinusadyh:/etc/rc.d# mysql -u root -padmin
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 4
    Server version: 5.0.84 Source distribution
    
    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
    
    mysql> show databases;
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | test               |
    +--------------------+
    3 rows in set (0.00 sec)
    
    mysql> quit
    Bye
    root@martinusadyh:/etc/rc.d#
    



Sekarang edit konfigurasi **/etc/rc.d/rc.mysqld** dan beri komentar pada baris **SKIP="--skip-networking"** untuk mengijinkan koneksi dari luar seperti dibawah ini :

    
    
    # SKIP="--skip-networking"
    



Simpan kemudian beri akses execute ke file **/etc/rc.d/rc.mysqld** kemudian reboot seperti dibawah ini:

    
    
    root@martinusadyh:/etc/rc.d# chmod +x rc.mysqld
    root@martinusadyh:/etc/rc.d# reboot
    



Sekarang MySQL sudah siap untuk digunakan :)
