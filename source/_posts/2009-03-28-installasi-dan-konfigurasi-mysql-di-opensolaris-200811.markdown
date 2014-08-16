---
comments: true
date: 2009-03-28 20:30:40+00:00
layout: post
slug: installasi-dan-konfigurasi-mysql-di-opensolaris-200811
title: Installasi dan Konfigurasi MySQL di OpenSolaris 2008.11
wordpress_id: 50
categories:
- OpenSolaris
---

Wuah akhirnya, setelah berjam-jam melelahkan menginstall MySQL via IPS (lamanya karena belum ada mirror lokal dan waktu proses download sempat mati lampu :( ) akhirnya selesai juga proses installasi MySQL-nya :) Proses installasi MySQL nya sendiri sangat mudah, tinggal cari saja packages **SUNWmysql5** di IPS yang terdapat di OpenSolaris 2008.11 kemudian kasih centang dan tekan tombol **Install/Update** maka IPS akan dengan senang hati mendownload dan melakukan proses installasinya untuk anda :)

Setelah proses installasi selesai, sekarang berilah akses read dan execute untuk group pada direktori /var/mysql dengan mengetikkan perintah **pfexec chmod 750 /var/mysql** seperti dibawah ini :

    
    
    martin@opensolarisbox:~$ pfexec chmod 750 /var/mysql/
    martin@opensolarisbox:~$ pfexec ls -l /var/
    total 60
    drwxrwxr-x   9 root   sys      17 2009-03-22 03:10 adm
    drwxr-xr-x   2 root   sys       2 2008-11-20 07:13 audit
    drwxr-xr-x   3 root   root      3 2008-11-20 07:38 cache
    drwxr-xr-x   2 root   sys       2 2008-11-20 07:13 cores
    drwxr-xr-x   2 root   sys       3 2009-03-02 04:04 cron
    drwxr-xr-x   3 root   sys       3 2008-11-20 07:29 db
    drwxr-xr-x   3 root   sys       3 2008-11-20 07:29 fm
    drwxr-xr-x   2 root   bin       2 2008-11-20 07:13 games
    drwxr-xr-x   2 daemon daemon    2 2008-11-20 07:13 idmap
    drwxr-xr-x   2 root   sys       2 2008-11-20 07:13 inet
    drwxr-xr-x   3 root   sys       3 2008-11-20 07:29 krb5
    drwxr-xr-x   3 root   bin       5 2009-03-02 03:57 ld
    drwxr-xr-x   2 root   sys       2 2008-11-20 07:29 ldap
    drwxr-xr-x   6 root   other     6 2008-11-20 07:29 lib
    drwxr-xr-x   4 root   sys      11 2009-03-27 18:18 log
    drwxrwxr-x   5 lp     lp        5 2008-11-20 07:29 lp
    drwxrwxrwt   3 root   mail      4 2009-03-27 15:28 mail
    drwxr-x---   3 mysql  mysql     4 2009-03-22 15:58 mysql
    drwxr-xr-x   2 root   bin       2 2008-11-20 07:13 news
    drwxr-xr-x   4 root   bin       4 2008-11-20 07:29 nfs
    drwxr-xr-x   2 root   sys       3 2008-11-20 07:35 nis
    drwxr-xr-x   3 root   sys       3 2008-11-20 07:29 ntp
    drwxr-xr-x   2 root   sys       2 2008-11-20 07:13 opt
    drwxr-xr-x   9 root   root     10 2009-03-22 03:56 pkg
    drwxrwxrwt   2 root   bin       2 2008-11-20 07:13 preserve
    drwxr-xr-x  10 root   sys    1323 2009-03-27 18:24 run
    drwxr-xr-x   9 root   sys      10 2009-03-02 03:57 sadm
    drwxr-xr-x   3 root   bin       4 2008-11-20 07:13 saf
    drwx------   2 root   root      3 2009-03-28 00:49 sma_snmp
    drwxr-xr-x  11 root   bin      11 2009-03-02 04:10 spool
    drwxr-xr-x   5 root   sys       5 2008-11-20 07:13 svc
    drwxrwxrwt 253 root   sys     260 2009-03-27 18:45 tmp
    drwxr-xr-x   3 root   bin       5 2008-11-20 07:35 yp
    


<!-- more -->
Pindahlah ke user mysql dengan mengetikkan perintah **pfexec su - mysql** kemudian lakukanlah proses installasi database dengan mengetikkan perintah **pfexec /usr/mysql/5.0/bin/mysql_install_db --user=mysql ** seperti dibawah ini :

    
    
    martin@opensolarisbox:~$ pfexec su - mysql
    $ pfexec /usr/mysql/5.0/bin/mysql_install_db --user=mysql
    WARNING: The host 'opensolarisbox' could not be looked up with resolveip.
    This probably means that your libc libraries are not 100 % compatible
    with this binary MySQL version. The MySQL daemon, mysqld, should work
    normally with the exception that host name resolving will not work.
    This means that you should use IP addresses instead of hostnames
    when specifying MySQL privileges !
    Installing MySQL system tables...
    090327 18:56:49 [Warning] option 'thread_stack': unsigned value 65536 adjusted to 131072
    OK
    Filling help tables...
    090327 18:56:50 [Warning] option 'thread_stack': unsigned value 65536 adjusted to 131072
    OK
    
    To start mysqld at boot time you have to copy
    support-files/mysql.server to the right place for your system
    
    PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
    To do so, start the server, then issue the following commands:
    /usr/mysql/5.0/bin/mysqladmin -u root password 'new-password'
    /usr/mysql/5.0/bin/mysqladmin -u root -h opensolarisbox password 'new-password'
    
    Alternatively you can run:
    /usr/mysql/5.0/bin/mysql_secure_installation
    
    which will also give you the option of removing the test
    databases and anonymous user created by default.  This is
    strongly recommended for production servers.
    
    See the manual for more instructions.
    
    You can start the MySQL daemon with:
    cd /usr/mysql/5.0 ; /usr/mysql/5.0/bin/mysqld_safe &
    
    You can test the MySQL daemon with mysql-test-run.pl
    cd mysql-test ; perl mysql-test-run.pl
    
    Please report any problems with the /usr/mysql/5.0/bin/mysqlbug script!
    
    The latest information about MySQL is available on the web at
    http://www.mysql.com
    Support MySQL by buying support/licenses at http://shop.mysql.com
    



Nah setelah selesai melakukan proses diatas, sekarang jalankanlah daemon MySQL dengan mengetikkan perintah **pfexec /usr/mysql/5.0/bin/mysqld_safe &** kemudian beri password pada user root dengan mengetikkan perintah **pfexec /usr/mysql/5.0/bin/mysqladmin -u root password '_isi password untuk user root mysql_'** seperti dibawah ini:

    
    
    $ pfexec /usr/mysql/5.0/bin/mysqld_safe &
    [1]	966
    $ Starting mysqld daemon with databases from /var/mysql/5.0/data
    $
    $ pfexec /usr/mysql/5.0/bin/mysqladmin -u root password 'admin'
    



Sampai disini konfigurasi MySQL sudah sampai 60% :) ada beberapa konfigurasi lagi ternyata yang harus dilakukan di OpenSolaris yaitu adalah meng-enable service mysql-nya :D . Nah untuk mengetahui service-service apa saja yang berjalan di OpenSolaris, kita dapat menggunakan perintah **svcs** dan untuk melihat apakah service MySQL kita sudah berjalan atau belum kita dapat mengetikkan perintah **svcs -a | grep mysql** seperti dibawah ini:

    
    
    [martin@opensolarisbox:~]# svcs -a | grep mysql
    disabled       19:41:47 svc:/application/database/mysql:version_50
    



Nah sekarang mari kita konfigurasi MySQL-nya, kalau kita ingin menjalankan MySQL di mode 64 bit kita bisa menggunakan perintah **svccfg -s mysql:version_50 setprop mysql/enable_64bit=true** sedangkan klo ingin menjalankan di mode 32 bit hanya tinggal menngganti dari true ke false dan jika selesai mengganti konfigurasi jalankan perintah **svcadm refresh mysql:version_50** seperti perintah dibawah ini :

    
    
    [martin@opensolarisbox:~]# svccfg -s mysql:version_50 setprop mysql/enable_64bit=false
    [martin@opensolarisbox:~]# svcadm refresh mysql:version_50
    



Sekarang aktifkan service MySQL dengan cara meng-enable service MySQL-nya dengan perintah **svcadm enable mysql:version_50** kemudian cek dengan perintah **svcs -a | grep mysql** kemudian import konfigurasinya seperti dibawah ini :

    
    
    [martin@opensolarisbox:~]# svcadm enable mysql:version_50
    [martin@opensolarisbox:~]# svcs -a | grep mysql
    online         19:53:46 svc:/application/database/mysql:version_50
    [martin@opensolarisbox:~]# svccfg import /var/svc/manifest/application/database/mysql.xml
    



Sampai disini MySQL sudah bisa dikatakan berjalan :) (silahkan dicoba dengan melakukan telnet ke localhost port 3306) cuma sayangnya perintah mysql masih belum masuk ke dalam PATH (perintah mysql terdapat di direktori /usr/mysql/bin). Untuk memasukkan perintah mysql ke dalam PATH, sekarang bukalah file **.profile** yang terdapat di **/export/home/nama_user/.profile** kemudian editlah hingga menjadi seperti dibawah ini :

    
    
    export PATH=/usr/gnu/bin:/usr/bin:/usr/X11/bin:/usr/sbin:/sbin:/usr/mysql/bin
    



Dan dibawah ini adalah konfigurasi .profile di OpenSolaris saya :

    
    
    #
    # Simple profile places /usr/gnu/bin at front,
    # adds /usr/X11/bin, /usr/sbin and /sbin to the end.
    #
    # Use less(1) as the default pager for the man(1) command.
    #
    PATH=${PATH}:/usr/sfw/bin
    export PATH=/usr/gnu/bin:/usr/bin:/usr/X11/bin:/usr/sbin:/sbin:/usr/mysql/bin
    export MANPATH=/usr/gnu/share/man:/usr/share/man:/usr/X11/share/man
    export PAGER="/usr/bin/less -ins"
    
    #
    # Define default prompt to <username>@<hostname>:<path><"($|#) ">
    # and print '#' for user "root" and '$' for normal users.
    #
    PS1='${LOGNAME}@$(/usr/bin/hostname):$(
        [[ "${LOGNAME}" == "root" ]] && printf "%s" "${PWD/${HOME}/~}# " ||
        printf "%s" "${PWD/${HOME}/~}\$ ")'
    



Setelah melakukan pengeditan pada file **.profile** simpan perubahannya dan sekarang cobalah untuk login ke MySQL server-nya, harusnya sudah bisa login seperti dibawah ini :

    
    
    [martin@opensolarisbox:~]$ mysql -u root -p
    Enter password:
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 2
    Server version: 5.0.67 Source distribution
    
    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
    
    mysql> show databases;
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | test               |
    +--------------------+
    3 rows in set (0.46 sec)
    
    mysql>
    



Akhirnya siap juga nih OpenSolaris buat kegiatan sehari-hari :)

**Link-link terkait:**
- [http://blogs.sun.com/jkshah/entry/opensolaris_2008_11_and_postgresql](http://blogs.sun.com/jkshah/entry/opensolaris_2008_11_and_postgresql)
- [http://wikis.sun.com/display/WebStack/Web+Stack+Getting+Started+Guide#WebStackGettingStartedGuide-SettingUpMySQLDB](http://wikis.sun.com/display/WebStack/Web+Stack+Getting+Started+Guide#WebStackGettingStartedGuide-SettingUpMySQLDB)
