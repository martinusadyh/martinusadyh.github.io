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
[plain]
root@martinusadyh:[~]# /usr/sbin/groupadd oinstall
root@martinusadyh:[~]# /usr/sbin/groupadd -g 502 dba
root@martinusadyh:[~]# /usr/sbin/groupadd -g 505 oper
[/plain]

Setelah membuat 3 **group** tersebut, sekarang buatlah user **oracle** yang mempunyai primary group **oinstall** dan secondary group-nya **dba** dan **oper** dengan mengetikkan perintah seperti dibawah ini :
<!-- more -->
[plain]
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
[/plain]
**Sebagai contoh, isikan password untuk user oracle ini dengan oracle123**

Jika sudah menambahkan user **oracle** kedalam sistem, kita bisa mengecek dengan mengetikkan perintah dibawah ini :
[plain]
root@martinusadyh:[~]# id oracle
uid=1002(oracle) gid=210(oinstall) groups=210(oinstall),502(dba),505(oper)
[/plain]

Urusan **user** dan **group** yang dibutuhkan untuk menginstall Oracle sudah selesai, sekarang mari kita lakukan konfigurasi parameter kernel yang dibutuhkan oleh Oracle. Sedangkan konfigurasi parameter kernel yang direkomendasikan oleh Oracle adalah seperti berikut :



Kernel Parameter Configuration For Oracle DB



	Parameter
	Min. Value
	Max. Value
	File
	Command to Check
	Result




	
semmsl

	
250

	
-

	
`/proc/sys/kernel/sem`

	
`cat /proc/sys/kernel/sem | awk '{print $1}'`

	
250





	
semmns

	
32000

	
-

	
`/proc/sys/kernel/sem`

	
`cat /proc/sys/kernel/sem | awk '{print $2}'`

	
32000





	
semopm

	
100

	
-

	
`/proc/sys/kernel/sem`

	
`cat /proc/sys/kernel/sem | awk '{print $3}'`

	
**32**





	
semmni

	
128

	
-

	
`/proc/sys/kernel/sem`

	
`cat /proc/sys/kernel/sem | awk '{print $4}'`

	
128





	
shmall

	
2097152

	
-

	
`/proc/sys/kernel/shmall`

	
`cat /proc/sys/kernel/shmall`

	
2097152





	
shmmax

	
536870912

	
-

	
`/proc/sys/kernel/shmmax`

	
`cat /proc/sys/kernel/shmmax`

	
**33554432**





	
shmmni

	
4096

	
-

	
`/proc/sys/kernel/shmmni`

	
`cat /proc/sys/kernel/shmmni`

	
4096





	
aio-max-nr

	
-

	
1048576

	
`/proc/sys/fs/aio-max-nr`

	
`cat /proc/sys/fs/aio-max-nr`

	
**65536**





	
ip_local_port_range

	
9000

	
65500

	
`/proc/sys/net/ipv4/ip_local_port_range`

	
`cat /proc/sys/net/ipv4/ip_local_port_range`

	
**32768	61000**





	
rmem_default

	
262144

	
-

	
`/proc/sys/net/core/rmem_default`

	
`cat /proc/sys/net/core/rmem_default`

	
**111616**





	
rmem_max

	
4194304

	
-

	
`/proc/sys/net/core/rmem_max`

	
`cat /proc/sys/net/core/rmem_max`

	
**131071**





	
wmem_default

	
262144

	
-

	
`/proc/sys/net/core/wmem_default`

	
`cat /proc/sys/net/core/wmem_default`

	
**111616**





	
wmem_max

	
1048576

	
-

	
`/proc/sys/net/core/wmem_max`

	
`cat /proc/sys/net/core/wmem_max`

	
**131071**




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
[plain]
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
[/plain]

Sedangkan untuk melakukan konfirmasi apakah nilainya sudah berubah atau belum, silahkan cek dengan menggunakan perintah dibawah ini :
[plain]
root@martinusadyh:[~]# /sbin/sysctl -a
[/plain]

Setelah selesai melakukan konfigurasi parameter kernel, sekarang mari kita siapkan beberapa direktori yang diperlukan oleh Oracle yaitu :




  * **Base Directory Oracle**
Jalankan perintah dibawah ini untuk membuat Base directory Oracle :
[plain]root@martinusadyh:[/media/disk/oracle/i386/database]# mkdir /opt/oracle11gr2[/plain]



  * **DataBase Directory**
Jalankan perintah dibawah ini untuk membuat DataBase directory Oracle :
[plain]root@martinusadyh:[/media/disk/oracle/i386/database]# mkdir /opt/oracle11gr2/oradata[/plain]



  * **Recovery Directory**
Jalankan perintah dibawah ini untuk membuat Recovery directory Oracle :
[plain]root@martinusadyh:[/media/disk/oracle/i386/database]# mkdir /opt/oracle11gr2/recovery_data[/plain]



  * **Inventory Directory**
Jalankan perintah dibawah ini untuk membuat Inventory directory Oracle :
[plain]root@martinusadyh:[/media/disk/oracle/i386/database]# mkdir /opt/oraInventory[/plain]




Sekarang rubah **permission** dari direktori-direktori yang telah kita buat diatas dengan mengetikkan perintah seperti dibawah ini :
[plain]
root@martinusadyh:[/media/disk/oracle/i386/database]# chown oracle -R /opt/oracle11gr2/
root@martinusadyh:[/media/disk/oracle/i386/database]# chgrp oinstall -R /opt/oracle11gr2/
root@martinusadyh:[/media/disk/oracle/i386/database]# chown oracle -R /opt/oraInventory/
root@martinusadyh:[/media/disk/oracle/i386/database]# chgrp oinstall -R /opt/oraInventory
[/plain]

Sekarang pindah-lah ke user **oracle** dengan mengetikkan perintah `su oracle` kemudian konfigurasilah **ENVIRONMENT VARIABLE** dengan membuat sebuah file yaitu `.bash_profile` dengan isi kurang lebih seperti dibawah ini :

    
    
    ORACLE_BASE=/opt/oracle11gr2
    ORACLE_SID=devel
    ORACLE_HOME=/opt/oracle11gr2/product/11.2.0/dbhome_1
    
    export ORACLE_BASE ORACLE_SID ORACLE_HOME
    export PATH=${PATH}:$ORACLE_HOME/bin
    


**Isi file /home/oracle/.bash_profile**

Agar proses installasi Oracle berjalan dengan sukses, kita perlu menghilangkan akses kontrol yang berjalan pada X11 dengan cara bukalah terminal atau konsole baru kemudian jalankan perintah `xhost +` seperti dibawah ini :
[plain]
martinus@martinusadyh:[~]$ xhost +
access control disabled, clients can connect from any host
martinus@martinusadyh:[~]$
[/plain]

Jika sudah, buka terminal baru kemudian jalankan perintah seperti dibawah ini dengan menggunakan user **oracle** :
[plain]
oracle@martinusadyh:[~]$ DISPLAY=:0.0
oracle@martinusadyh:[~]$ export DISPLAY
oracle@martinusadyh:[~]$ echo $DISPLAY
:0.0
[/plain]

Untuk mengetest apakah user **oracle** sudah bisa menjalankan installer Oracle, sekarang jalankan dahulu aplikasi `/usr/bin/xclock`. Jika konfigurasi yang telah dilakukan tidak terdapat kesalahan, maka harusnya aplikasi `/usr/bin/xclock` akan tampil seperti gambar dibawah ini :

[![xclock-test](http://farm6.static.flickr.com/5285/5241552477_ddb6133b16.jpg)](http://www.flickr.com/photos/10243554@N02/5241552477/)  
**Test aplikasi xclock**

Setelah berhasil menjalankan aplikasi `/usr/bin/xclock` dengan menggunakan user **oracle**, sekarang install-lah Oracle-nya dengan menjalankan perintah `/path/installer/oracle/runInstaller` seperti contoh dibawah ini :
[plain]
oracle@martinusadyh:[/media/disk/oracle]$ /media/disk/oracle/i386/database/runInstaller 
[/plain]

Tunggulah beberapa saat dan jika tidak ada masalah maka kita akan melihat splash screen Oracle seperti gambar dibawah ini :
[![ora1](http://farm6.static.flickr.com/5049/5229665264_1808d376a9.jpg)](http://www.flickr.com/photos/10243554@N02/5229665264/)  
**Splash Screen Installer Oracle**

Setelah splash screen installer Oracle, akan tampil form **Configure Security Updates** seperti dibawah ini. Biarkan kosong dan tekanlah tombol **Next** untuk melanjutkan pada proses berikut-nya :
[![ora2](http://farm6.static.flickr.com/5048/5229665268_913cd874f4.jpg)](http://www.flickr.com/photos/10243554@N02/5229665268/)  
**Tampilan Configure Security Updates**

Pada tahap **Select Installation Option** ini, pilihlah opsi pertama yaitu **Create and configure a database** seperti gambar dibawah ini :
[![ora3](http://farm6.static.flickr.com/5006/5229665270_fb9b7109d8.jpg)](http://www.flickr.com/photos/10243554@N02/5229665270/)  
**Tampilan Select Installation Option**

Pada **System Class** pilihlah opsi **Desktop Class** seperti gambar dibawah ini kemudian tekanlah tombol **Next** :
[![ora4](http://farm6.static.flickr.com/5247/5229665272_8e188300dc.jpg)](http://www.flickr.com/photos/10243554@N02/5229665272/)  
**Tampilan System Class**

Di tahap selanjutnya yaitu **Typical Install Configuration** isilah 3 kolom saja (kolom yang lain harusnya sudah otomatis ke isi oleh Oracle) yaitu **Global database name, Administrative password** dan **Confirm password** dengan konfigurasi seperti ini :




  1. **Global database name :** orcl


  2. **Administrative password :** OracleDB123


  3. **Confirm password :** OracleDB123



dan tampilan-nya kurang lebih adalah seperti gambar dibawah ini :
[![ora5](http://farm6.static.flickr.com/5121/5229665274_cc546a2669.jpg)](http://www.flickr.com/photos/10243554@N02/5229665274/)  
**Tampilan Typical Install Configuration**

Pada jendela selanjutnya yaitu **Create Inventory**, harusnya kita tinggal menekan tombol **Next** saja karena direktori **inventory** ini akan dideteksi langsung oleh Oracle seperti gambar dibawah ini :
[![ora6](http://farm6.static.flickr.com/5282/5229665278_9dbc9e8397.jpg)](http://www.flickr.com/photos/10243554@N02/5229665278/)  
**Tampilan Create Inventory**

Setelah menekan tombol **Next**, Oracle akan melakukan pengecekan apakah sistem kita sudah memenuhi kebutuhan Oracle. Pada jendela ini, centanglah checkbox **Ignore All** seperti gambar dibawah ini kemudian tekanlah tombol **Next** :
[![ora7](http://farm6.static.flickr.com/5010/5242195640_5b9d9b1031.jpg)](http://www.flickr.com/photos/10243554@N02/5242195640/)  
**Tampilan Perfom Prerequiste Checks**

Pada jendela **Summary** seperti gambar dibawah ini, tekanlah tombol **Finish** untuk mulai melakukan proses installasi.
[![ora8](http://farm6.static.flickr.com/5126/5242195644_03e32c6b78.jpg)](http://www.flickr.com/photos/10243554@N02/5242195644/)  
**Tampilan Summary**

Sekarang, tunggulah proses installasi Oracle yang sedang berjalan. Jika ada notification error bisa diabaikan saja (Pada proses installasi ini, saya juga mendapat pesan error). Dan dibawah ini adalah gambar proses installasi Oracle yang sedang berjalan :






    
[![ora9](http://farm6.static.flickr.com/5003/5242195648_4f81b3eb90.jpg)](http://www.flickr.com/photos/10243554@N02/5242195648/)
      
**Proses Installasi Oracle 1**
    

    
[![ora10](http://farm6.static.flickr.com/5283/5242195650_7ff5ee7aff.jpg)](http://www.flickr.com/photos/10243554@N02/5242195650/)
      
**Proses Installasi Oracle 2**
    




Pada jendela **Database Configuration Assistant** seperti dibawah ini, tekanlah tombol **Password Management** dan isilah password untuk **SYS** dan **SYSTEM** dengan konfigurasi seperti dibawah ini :




  1. **username : SYS** Password SYSDB123


  2. **username : SYSTEM** Password SYSTEMDB123



[![ora11](http://farm6.static.flickr.com/5247/5242195654_4c4722e103.jpg)](http://www.flickr.com/photos/10243554@N02/5242195654/)  
**Tampilan Database Configuration Assistant, konfigurasilah user dan password disini jika ingin login pada Oracle Enterprise Manager**

Jika sudah tekanlah tombol **OK** dan sekarang kita masuk pada jendela **Execute Configuration script** seperti dibawah ini :
[![ora12](http://farm6.static.flickr.com/5162/5242195658_6d44f76a62.jpg)](http://www.flickr.com/photos/10243554@N02/5242195658/)  
**Tampilan Execute Configuration script**

Jangan tekan tombol **OK** dahulu, tapi jalankan-lah perintah `/opt/oracle11gr2/product/11.2.0/dbhome_1/root.sh` dan `/opt/oraInventory/orainstRoot.sh` seperti dibawah ini dahulu dengan menggunakan akses **root** baru menekan tombol **OK** diatas :
[plain]
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
[/plain]

Jika sudah, sekarang login-lah ke Oracle Enterprise Manager yang bisa diakses pada alamat http://localhost:1158/ dengan menggunakan user **SYS** dengan password **SYSDB123** seperti gambar dibawah ini :
[![ora13](http://farm6.static.flickr.com/5168/5242196808_8db2154250.jpg)](http://www.flickr.com/photos/10243554@N02/5242196808/)  
**Tampilan Oracle Enterprise Manager**

Nah kalau sudah, sekarang cobalah login ke **SQL*Plus** dengan menggunakan user **oracle** pada terminal seperti dibawah ini :
[plain]
oracle@martinusadyh:[~]$ sqlplus / as sysdba

SQL*Plus: Release 11.2.0.1.0 Production on Sat Nov 27 17:19:54 2010

Copyright (c) 1982, 2009, Oracle.  All rights reserved.

Connected to an idle instance.

SQL> quit
oracle@martinusadyh:[~]$
[/plain]

Langkah selanjutnya yaitu modifikasilah file `/opt/oracle11gr2/product/11.2.0/dbhome_1/network/admin/listener.ora` menjadi seperti dibawah ini :

    
    
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
    
    



Modifikasilah juga file `/opt/oracle11gr2/product/11.2.0/dbhome_1/network/admin/tnsnames.ora` menjadi seperti dibawah ini :

    
    
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
    



Dan langkah terakhir, modifikasi-lah file `/etc/oratab` menjadi seperti dibawah ini :

    
    
    orcl:/opt/oracle11gr2/product/11.2.0/dbhome_1:Y
    



Sampai disini proses installasi dan konfigurasi telah selesai dilakukan, dan jika kita ingin menjalankan Oracle dikemudian hari kita dapat menjalankan listener-nya dahulu dengan mengetikkan perintah `lsnrctl start` baru kemudian menjalankan database-nya sendiri dengan mengetikkan perintah `dbstart $ORACLE_HOME` menggunakan user **oracle** seperti dibawah ini :
[plain]
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
[/plain]

Gunakan perintah `lsnrctl stop` untuk men-stop listener-nya dan `dbshut $ORACLE_HOME` untuk database seperti dibawah ini :
[plain]
oracle@martinusadyh:[~]$ lsnrctl stop 

LSNRCTL for Linux: Version 11.2.0.1.0 - Production on 08-DEC-2010 04:50:54

Copyright (c) 1991, 2009, Oracle.  All rights reserved.

Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=IPC)(KEY=EXTPROC)))
The command completed successfully
oracle@martinusadyh:[~]$ dbshut $ORACLE_HOME
Processing Database instance "orcl": log file /opt/oracle11gr2/product/11.2.0/dbhome_1/shutdown.log
oracle@martinusadyh:[~]$ 
[/plain]

Fyuh... panjang juga tulisan-nya sampai disini kita sudah bisa menggunakan Oracle untuk keperluan development :) , cuma sayangnya sampai sekarang saya masih belum dapat menjalankan Oracle melalui startup script :( Jika ada teman-teman yang sudah berhasil, silahkan sharing disini juga yah :D

**Referensi-referensi yang digunakan :**



[OracleDB 11g R2 Installation On Enterprise Linux 5](http://www.oracle-base.com/articles/11g/OracleDB11gR2InstallationOnEnterpriseLinux5.php)
[Menginstall Oracle 10g di Slackware](http://fxbudiar.blogspot.com/2009/04/menginstall-oracle-10g-di-slackware.html)
[Oracle® Universal Installer and OPatch User's Guide 11g Release 2 (11.2) for Windows and UNIX](http://download.oracle.com/docs/cd/E11882_01/em.112/e12255/toc.htm)

