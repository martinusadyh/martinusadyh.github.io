---
comments: true
date: 2010-12-07 22:07:55+00:00
layout: post
slug: step-by-step-installing-oracle-11g-release-2-on-slackware-13-0
title: Step By Step Installing Oracle 11g Release 2 On Slackware 13.0
wordpress_id: 1173
categories:
- DataBase
- Slackware
tags:
- DataBase
- Oracle
- Slackware
---

Akhirnya kesampaian juga bermain-main dengan Database [Oracle](http://www.oracle.com/index.html) di Slackware 13.0 :) dan ternyata proses installasi Oracle tidak semudah yang dibayangkan meskipun saya sudah mengikuti tulisan [Menginstall Oracle 10g di Slackware](http://fxbudiar.blogspot.com/2009/04/menginstall-oracle-10g-di-slackware.html) dari mas Budi Ariyanto :( Ok sekarang mari kita mulai saja tahapan-tahapan proses instalasi Oracle pada Slackware 13.0 :) 

Sebelum melakukan proses installasi, buatlah 3 **group** dahulu untuk Oracle yaitu **oinstall,dba** dan **oper** dengan cara seperti dibawah ini :
```
root@martinusadyh:[~]# /usr/sbin/groupadd oinstall
root@martinusadyh:[~]# /usr/sbin/groupadd -g 502 dba
root@martinusadyh:[~]# /usr/sbin/groupadd -g 505 oper
```

Setelah membuat 3 **group** tersebut, sekarang buatlah user **oracle** yang mempunyai primary group **oinstall** dan secondary group-nya **dba** dan **oper** dengan mengetikkan perintah seperti dibawah ini :
<!-- more -->
```
root@martinusadyh:[~]# adduser oracle

Login name for new user: oracle

User ID ('UID') [ defaults to next available ]: 

Initial group [ users ]: oinstall
Additional UNIX groups:
......
......
Press ENTER to continue without adding any additional groups
Or press the UP arrow to add/select/edit additional groups
:  dba oper                                     
......
......
Account setup complete.
root@martinusadyh:[~]# 
```
**Sebagai contoh, isikan password untuk user oracle ini dengan oracle123**

Jika sudah menambahkan user **oracle** kedalam sistem, kita bisa mengecek dengan mengetikkan perintah dibawah ini :
```
root@martinusadyh:[~]# id oracle
uid=1002(oracle) gid=210(oinstall) groups=210(oinstall),502(dba),505(oper)
```

Urusan **user** dan **group** yang dibutuhkan untuk menginstall Oracle sudah selesai, sekarang mari kita lakukan konfigurasi parameter kernel yang dibutuhkan oleh Oracle. Sedangkan konfigurasi parameter kernel yang direkomendasikan oleh Oracle adalah seperti berikut :

{% imgcap https://lh5.googleusercontent.com/-pf65m3pBubw/VMKBpJ3agyI/AAAAAAAADHE/3X9jDX9qtsQ/s800/Screenshot%2520from%25202015-01-24%252000%253A13%253A57.png Konfigurasi Parameter Kernel %}

Seperti kita lihat diatas, ternyata nilai parameter kernel yang terdapat di Slackware masih ada beberapa yang dibawah nilai minimal (ditandai dengan nilai yang di **bold**). Untuk mengkonfigurasi parameter kernel di Slackware agar sesuai dengan kebutuhan Oracle, sekarang edit dan modifikasi-lah file `/etc/sysctl.conf` menjadi seperti dibawah ini :
    
    kernel.sem = 250 32000 100 128
    kernel.shmmax = 536870912
    fs.aio-max-nr = 1048576
    net.ipv4.ip_local_port_range = 9000 65500
    net.core.rmem_default = 262144
    net.core.rmem_max = 4194304
    net.core.wmem_default = 262144
    net.core.wmem_max = 1048586
    
Setelah melakukan modifikasi pada file `/etc/sysctl.conf`, jalankan perintah dibawah ini untuk mengganti nilai parameter kernel secara langsung :
```
root@martinusadyh:[~]# /sbin/sysctl -p
kernel.sem = 250 32000 100 128
kernel.shmmax = 536870912
fs.aio-max-nr = 1048576
net.ipv4.ip_local_port_range = 9000 65500
net.core.rmem_default = 262144
net.core.rmem_max = 4194304
net.core.wmem_default = 262144
net.core.wmem_max = 1048586
root@martinusadyh:[~]#
```

Sedangkan untuk melakukan konfirmasi apakah nilainya sudah berubah atau belum, silahkan cek dengan menggunakan perintah dibawah ini :
```
root@martinusadyh:[~]# /sbin/sysctl -a
```

Setelah selesai melakukan konfigurasi parameter kernel, sekarang mari kita siapkan beberapa direktori yang diperlukan oleh Oracle yaitu :




  * **Base Directory Oracle**

Jalankan perintah `mkdir /opt/oracle11gr2` seperti dibawah ini untuk membuat Base directory Oracle :
```
root@martinusadyh:[/media/disk/oracle/i386/database]# mkdir /opt/oracle11gr2
```



  * **DataBase Directory**

Jalankan perintah `mkdir /opt/oracle11gr2/oradata` seperti dibawah ini untuk membuat DataBase directory Oracle :
```
root@martinusadyh:[/media/disk/oracle/i386/database]# mkdir /opt/oracle11gr2/oradata
```



  * **Recovery Directory**

Jalankan perintah `mkdir /opt/oracle11gr2/recovery_data` seperti dibawah ini untuk membuat Recovery directory Oracle :
```
root@martinusadyh:[/media/disk/oracle/i386/database]# mkdir /opt/oracle11gr2/recovery_data
```



  * **Inventory Directory**

Jalankan perintah `mkdir /opt/oraInventory` seperti dibawah ini untuk membuat Inventory directory Oracle :
```
root@martinusadyh:[/media/disk/oracle/i386/database]# mkdir /opt/oraInventory
```




Sekarang rubah **permission** dari direktori-direktori yang telah kita buat diatas dengan mengetikkan perintah seperti dibawah ini :
```
root@martinusadyh:[/media/disk/oracle/i386/database]# chown oracle -R /opt/oracle11gr2/
root@martinusadyh:[/media/disk/oracle/i386/database]# chgrp oinstall -R /opt/oracle11gr2/
root@martinusadyh:[/media/disk/oracle/i386/database]# chown oracle -R /opt/oraInventory/
root@martinusadyh:[/media/disk/oracle/i386/database]# chgrp oinstall -R /opt/oraInventory
```

Sekarang pindah-lah ke user **oracle** dengan mengetikkan perintah `su oracle` kemudian konfigurasilah **ENVIRONMENT VARIABLE** dengan membuat sebuah file yaitu `.bash_profile` dengan isi kurang lebih seperti dibawah ini :
```bash
    ORACLE_BASE=/opt/oracle11gr2
    ORACLE_SID=devel
    ORACLE_HOME=/opt/oracle11gr2/product/11.2.0/dbhome_1
    
    export ORACLE_BASE ORACLE_SID ORACLE_HOME
    export PATH=${PATH}:$ORACLE_HOME/bin
```
**Isi file /home/oracle/.bash_profile**

Agar proses installasi Oracle berjalan dengan sukses, kita perlu menghilangkan akses kontrol yang berjalan pada X11 dengan cara bukalah terminal atau konsole baru kemudian jalankan perintah `xhost +` seperti dibawah ini :
```
martinus@martinusadyh:[~]$ xhost +
access control disabled, clients can connect from any host
martinus@martinusadyh:[~]$
```

Jika sudah, buka terminal baru kemudian jalankan perintah seperti dibawah ini dengan menggunakan user **oracle** :
```
oracle@martinusadyh:[~]$ DISPLAY=:0.0
oracle@martinusadyh:[~]$ export DISPLAY
oracle@martinusadyh:[~]$ echo $DISPLAY
:0.0
```

Untuk mengetest apakah user **oracle** sudah bisa menjalankan installer Oracle, sekarang jalankan dahulu aplikasi `/usr/bin/xclock`. Jika konfigurasi yang telah dilakukan tidak terdapat kesalahan, maka harusnya aplikasi `/usr/bin/xclock` akan tampil seperti gambar dibawah ini :

{% imgcap https://lh5.googleusercontent.com/-srDJ4s7ILsY/VMKKGaHptEI/AAAAAAAADH0/q5oKuRWj_3M/s400/TampilanXClock.jpg Test aplikasi xclock %}

Setelah berhasil menjalankan aplikasi `/usr/bin/xclock` dengan menggunakan user **oracle**, sekarang install-lah Oracle-nya dengan menjalankan perintah `/path/installer/oracle/runInstaller` seperti contoh dibawah ini :
```
oracle@martinusadyh:[/media/disk/oracle]$ /media/disk/oracle/i386/database/runInstaller 
```

Tunggulah beberapa saat dan jika tidak ada masalah maka kita akan melihat splash screen Oracle seperti gambar dibawah ini :

{% imgcap https://lh6.googleusercontent.com/-6ToAypF972Q/VMKKEuKZj2I/AAAAAAAADHg/EGeOw7kziRQ/s400/Splash%2520Screen%2520Installer%2520Oracle.jpg Splash Screen Installer Oracle %}

Setelah splash screen installer Oracle, akan tampil form **Configure Security Updates** seperti dibawah ini. Biarkan kosong dan tekanlah tombol **Next** untuk melanjutkan pada proses berikut-nya :

{% imgcap https://lh6.googleusercontent.com/-gC5Ej28f8XU/VMKKEt9pRxI/AAAAAAAADHc/GzZ4XxuOe48/s400/Tampilan%2520Configure%2520Security%2520Updates.jpg Tampilan Configure Security Updates %}

Pada tahap **Select Installation Option** ini, pilihlah opsi pertama yaitu **Create and configure a database** seperti gambar dibawah ini :

{% imgcap https://lh5.googleusercontent.com/-O2M_V9DTl5U/VMKKEU6J2QI/AAAAAAAADHk/y9_Mj63w4p0/s400/Tampilan%2520Select%2520Installation%2520Option.jpg Tampilan Select Installation Option %}

Pada **System Class** pilihlah opsi **Desktop Class** seperti gambar dibawah ini kemudian tekanlah tombol **Next** :

{% imgcap https://lh3.googleusercontent.com/-7j1RtIR70yI/VMKKGeyLf2I/AAAAAAAADHw/TRnd3ZFN17U/s400/Tampilan%2520System%2520Class.jpg Tampilan System Class %}

Di tahap selanjutnya yaitu **Typical Install Configuration** isilah 3 kolom saja (kolom yang lain harusnya sudah otomatis ke isi oleh Oracle) yaitu **Global database name, Administrative password** dan **Confirm password** dengan konfigurasi seperti ini :




  1. **Global database name :** orcl


  2. **Administrative password :** OracleDB123


  3. **Confirm password :** OracleDB123



dan tampilan-nya kurang lebih adalah seperti gambar dibawah ini :

{% imgcap https://lh6.googleusercontent.com/-9T5FSbdMgVc/VMKOSsF1QFI/AAAAAAAADIk/KQoEZNmp29g/s400/Tampilan%2520Typical%2520Install%2520Configuration.jpg Tampilan Typical Install Configuration %}

Pada jendela selanjutnya yaitu **Create Inventory**, harusnya kita tinggal menekan tombol **Next** saja karena direktori **inventory** ini akan dideteksi langsung oleh Oracle seperti gambar dibawah ini :

{% imgcap https://lh3.googleusercontent.com/-ostwQKUYJzY/VMKOPEF8a4I/AAAAAAAADII/LaANA8BmB24/s400/Tampilan%2520Create%2520Inventory.jpg Tampilan Create Inventory %}

Setelah menekan tombol **Next**, Oracle akan melakukan pengecekan apakah sistem kita sudah memenuhi kebutuhan Oracle. Pada jendela ini, centanglah checkbox **Ignore All** seperti gambar dibawah ini kemudian tekanlah tombol **Next** :

{% imgcap https://lh4.googleusercontent.com/-AJuiP19hqJs/VMKORRwEKGI/AAAAAAAADIs/nDhXmYWdEZc/s400/Tampilan%2520Perfom%2520Prerequiste%2520Checks.jpg Tampilan Perform Prerequiste Checks %}

Pada jendela **Summary** seperti gambar dibawah ini, tekanlah tombol **Finish** untuk mulai melakukan proses installasi.

{% imgcap https://lh4.googleusercontent.com/-wQfp4hss3X0/VMKOSCJZc5I/AAAAAAAADI0/84QuKcru4ds/s400/Tampilan%2520Summary.jpg Tampilan Summary %}

Sekarang, tunggulah proses installasi Oracle yang sedang berjalan. Jika ada notification error bisa diabaikan saja (Pada proses installasi ini, saya juga mendapat pesan error). Dan dibawah ini adalah gambar proses installasi Oracle yang sedang berjalan :


{% imgcap https://lh5.googleusercontent.com/-lau2yIcZYXY/VMKOPcDlOrI/AAAAAAAADIM/6evcMUT2V88/s288/Proses%2520Installasi%2520Oracle%25201.jpg Proses Installasi Oracle 1 %} {% imgcap https://lh3.googleusercontent.com/-ID_lqGR1LoU/VMKOPXzHokI/AAAAAAAADIE/nW-RWzzhkGM/s288/Proses%2520Installasi%2520Oracle%25202.jpg Proses Installasi Oracle 2 %}

Pada jendela **Database Configuration Assistant** seperti dibawah ini, tekanlah tombol **Password Management** dan isilah password untuk **SYS** dan **SYSTEM** dengan konfigurasi seperti dibawah ini :




  1. **username : SYS** Password SYSDB123


  2. **username : SYSTEM** Password SYSTEMDB123

{% imgcap https://lh5.googleusercontent.com/-Lalu_lVUif0/VMKOTfwpkZI/AAAAAAAADIo/gCdOMR8QNBw/s800/TampilanDatabaseConfigurationAssistant%252C%2520konfigurasilah%2520user%2520dan%2520password%2520disini%2520jika%2520ingin%2520login%2520pada%2520Oracle%2520Enterprise%2520Manager.jpg Tampilan Database Configuration Assistant, konfigurasilah user dan password disini jika ingin login pada Oracle Enterprise Manager %}

Jika sudah tekanlah tombol **OK** dan sekarang kita masuk pada jendela **Execute Configuration script** seperti dibawah ini :

{% imgcap https://lh3.googleusercontent.com/-h4f23dOOSHs/VMKORVdn01I/AAAAAAAADIY/Vh9MyrWqtS8/s400/Tampilan%2520Execute%2520Configuration%2520script.jpg Tampilan Execute Configuration script %} 

Jangan tekan tombol **OK** dahulu, tapi jalankan-lah perintah `/opt/oracle11gr2/product/11.2.0/dbhome_1/root.sh` dan `/opt/oraInventory/orainstRoot.sh` seperti dibawah ini dahulu dengan menggunakan akses **root** baru menekan tombol **OK** diatas :
```
root@martinusadyh:[~]# /opt/oracle11gr2/product/11.2.0/dbhome_1/root.sh
Running Oracle 11g root.sh script...

The following environment variables are set as:
    ORACLE_OWNER= oracle
    ORACLE_HOME=  /opt/oracle11gr2/product/11.2.0/dbhome_1

Enter the full pathname of the local bin directory: [/usr/local/bin]: 
   Copying dbhome to /usr/local/bin ...
   Copying oraenv to /usr/local/bin ...
   Copying coraenv to /usr/local/bin ...


Creating /etc/oratab file...
Entries will be added to the /etc/oratab file as needed by
Database Configuration Assistant when a database is created
Finished running generic part of root.sh script.
Now product-specific root actions will be performed.
Finished product-specific root actions.

root@martinusadyh:[~]# /opt/oraInventory/orainstRoot.sh
Changing permissions of /opt/oraInventory.
Adding read,write permissions for group.
Removing read,write,execute permissions for world.

Changing groupname of /opt/oraInventory to oinstall.
The execution of the script is complete.
root@martinusadyh:[~]#
```

Jika sudah, sekarang login-lah ke Oracle Enterprise Manager yang bisa diakses pada alamat http://localhost:1158/ dengan menggunakan user **SYS** dengan password **SYSDB123** seperti gambar dibawah ini :

{% imgcap https://lh5.googleusercontent.com/-Wtpi0Cq315o/VMKRsPKaTGI/AAAAAAAADI8/QDdb8Jbf3yM/s400/Tampilan%2520Oracle%2520Enterprise%2520Manager.jpg Tampilan Oracle Enterprise Manager %} 

Nah kalau sudah, sekarang cobalah login ke **SQL*Plus** dengan menggunakan user **oracle** pada terminal seperti dibawah ini :
```
oracle@martinusadyh:[~]$ sqlplus / as sysdba

SQL*Plus: Release 11.2.0.1.0 Production on Sat Nov 27 17:19:54 2010

Copyright (c) 1982, 2009, Oracle.  All rights reserved.

Connected to an idle instance.

SQL> quit
oracle@martinusadyh:[~]$
```

Langkah selanjutnya yaitu modifikasilah file `/opt/oracle11gr2/product/11.2.0/dbhome_1/network/admin/listener.ora` menjadi seperti dibawah ini :

```bash
    # listener.ora Network Configuration File: /opt/oracle11gr2/product/11.2.0/dbhome_1/network/admin/listener.ora
    # Generated by Oracle configuration tools.
    
    LISTENER =
      (DESCRIPTION_LIST =
        (DESCRIPTION =
          (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC))
          (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
        )
      )
    
    SID_LIST_LISTENER = 
      (SID_LIST =
         (SID_DESC =
           (SID_NAME = PLSExtProc)
           (ORACLE_HOME = /opt/oracle11gr2/product/11.2.0/dbhome_1)
           (PROGRAM = extproc)
         )
         (SID_DESC =
           (SID_NAME = orcl)
           (ORACLE_HOME = /opt/oracle11gr2/product/11.2.0/dbhome_1)
           (ENVS = "LD_LIBRARY_PATH=/opt/oracle11gr2/product/11.2.0/dbhome_1/jdk/jre/lib/i386:/opt/oracle11gr2/product/11.2.0/dbhome_1/jdk/jre/lib/i386/server:/opt/oracle11gr
    2/product/11.2.0/dbhome_1/lib")
           (PROGRAM = extproc)
         )
         (SID_DESC =
           (SID_NAME = mgwextproc)
           (ENVS = "LD_LIBRARY_PATH=/opt/oracle11gr2/product/11.2.0/dbhome_1/jdk/jre/lib/i386:/opt/oracle11gr2/product/11.2.0/dbhome_1/jdk/jre/lib/i386/server:/opt/oracle11gr
    2/product/11.2.0/dbhome_1/lib")
           (ORACLE_HOME = /opt/oracle11gr2/product/11.2.0/dbhome_1)
           (PROGRAM = extproc)
         )
      )
    
    ADR_BASE_LISTENER = /opt/oracle11gr2
```

Modifikasilah juga file `/opt/oracle11gr2/product/11.2.0/dbhome_1/network/admin/tnsnames.ora` menjadi seperti dibawah ini :

```bash
    # tnsnames.ora Network Configuration File: /opt/oracle11gr2/product/11.2.0/dbhome_1/network/admin/tnsnames.ora
    # Generated by Oracle configuration tools.
    
    ORCL =
      (DESCRIPTION =
        (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
        (CONNECT_DATA =
          (SID=orcl)
          (SERVER = DEDICATED)
          (SERVICE_NAME = orcl)
        )
      )
    
    MGW_AGENT =
      (DESCRIPTION = 
         (ADDRESS_LIST= (ADDRESS= (PROTOCOL=IPC) (KEY=EXTPROC)))
         (CONNECT_DATA= (SID=mgwextproc))
      )
```

Dan langkah terakhir, modifikasi-lah file `/etc/oratab` menjadi seperti dibawah ini :

```bash
    orcl:/opt/oracle11gr2/product/11.2.0/dbhome_1:Y
```

Sampai disini proses installasi dan konfigurasi telah selesai dilakukan, dan jika kita ingin menjalankan Oracle dikemudian hari kita dapat menjalankan listener-nya dahulu dengan mengetikkan perintah `lsnrctl start` baru kemudian menjalankan database-nya sendiri dengan mengetikkan perintah `dbstart $ORACLE_HOME` menggunakan user **oracle** seperti dibawah ini :

```
oracle@martinusadyh:[~]$ lsnrctl start

LSNRCTL for Linux: Version 11.2.0.1.0 - Production on 08-DEC-2010 04:45:56

Copyright (c) 1991, 2009, Oracle.  All rights reserved.

Starting /opt/oracle11gr2/product/11.2.0/dbhome_1/bin/tnslsnr: please wait...

TNSLSNR for Linux: Version 11.2.0.1.0 - Production
System parameter file is /opt/oracle11gr2/product/11.2.0/dbhome_1/network/admin/listener.ora
Log messages written to /opt/oracle11gr2/diag/tnslsnr/martinusadyh/listener/alert/log.xml
Listening on: (DESCRIPTION=(ADDRESS=(PROTOCOL=ipc)(KEY=EXTPROC)))
Listening on: (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=martinusadyh)(PORT=1521)))

Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=EXTPROC)))
STATUS of the LISTENER
------------------------
Alias                     LISTENER
Version                   TNSLSNR for Linux: Version 11.2.0.1.0 - Production
Start Date                08-DEC-2010 04:45:56
Uptime                    0 days 0 hr. 0 min. 1 sec
Trace Level               off
Security                  ON: Local OS Authentication
SNMP                      OFF
Listener Parameter File   /opt/oracle11gr2/product/11.2.0/dbhome_1/network/admin/listener.ora
Listener Log File         /opt/oracle11gr2/diag/tnslsnr/martinusadyh/listener/alert/log.xml
Listening Endpoints Summary...
  (DESCRIPTION=(ADDRESS=(PROTOCOL=ipc)(KEY=EXTPROC)))
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=martinusadyh)(PORT=1521)))
Services Summary...
Service "PLSExtProc" has 1 instance(s).
  Instance "PLSExtProc", status UNKNOWN, has 1 handler(s) for this service...
Service "mgwextproc" has 1 instance(s).
  Instance "mgwextproc", status UNKNOWN, has 1 handler(s) for this service...
Service "orcl" has 1 instance(s).
  Instance "orcl", status UNKNOWN, has 1 handler(s) for this service...
The command completed successfully
oracle@martinusadyh:[~]$ dbstart $ORACLE_HOME
Processing Database instance "orcl": log file /opt/oracle11gr2/product/11.2.0/dbhome_1/startup.log
oracle@martinusadyh:[~]$ 
```

Gunakan perintah `lsnrctl stop` untuk men-stop listener-nya dan `dbshut $ORACLE_HOME` untuk database seperti dibawah ini :
```
oracle@martinusadyh:[~]$ lsnrctl stop 

LSNRCTL for Linux: Version 11.2.0.1.0 - Production on 08-DEC-2010 04:50:54

Copyright (c) 1991, 2009, Oracle.  All rights reserved.

Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=EXTPROC)))
The command completed successfully
oracle@martinusadyh:[~]$ dbshut $ORACLE_HOME
Processing Database instance "orcl": log file /opt/oracle11gr2/product/11.2.0/dbhome_1/shutdown.log
oracle@martinusadyh:[~]$ 
```

Fyuh... panjang juga tulisan-nya sampai disini kita sudah bisa menggunakan Oracle untuk keperluan development :) , cuma sayangnya sampai sekarang saya masih belum dapat menjalankan Oracle melalui startup script :( Jika ada teman-teman yang sudah berhasil, silahkan sharing disini juga yah :D

**Referensi-referensi yang digunakan :**



[OracleDB 11g R2 Installation On Enterprise Linux 5](http://www.oracle-base.com/articles/11g/OracleDB11gR2InstallationOnEnterpriseLinux5.php)
[Menginstall Oracle 10g di Slackware](http://fxbudiar.blogspot.com/2009/04/menginstall-oracle-10g-di-slackware.html)
[Oracle® Universal Installer and OPatch User's Guide 11g Release 2 (11.2) for Windows and UNIX](http://download.oracle.com/docs/cd/E11882_01/em.112/e12255/toc.htm)

