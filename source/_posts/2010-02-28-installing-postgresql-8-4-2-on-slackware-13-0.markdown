---
comments: true
date: 2010-02-28 17:38:24+00:00
layout: post
slug: installing-postgresql-8-4-2-on-slackware-13-0
title: Installing PostgreSQL 8.4.2 on Slackware 13.0
wordpress_id: 195
categories:
- DataBase
- Slackware
tags:
- DataBase
- PostgreSQL
- Slackware
---

Akhirnya kesampaian juga saat-nya bermain-main dengan [PostgreSQL]() setelah sekian lama bercengkrama dengan [MySQL](http://mysql.com)  :) Nah karena client ada yang menggunakan [PostgreSQL](http://www.postgresql.org/) sebagai database server-nya, sekarang tidak ada alasan lagi untuk mulai terjun secara penuh **menyelami** ada apa sih dibalik [PostgreSQL](http://www.postgresql.org/) :D :) (Sebenar-nya ini bukan alasan utama kenapa saya menginstall [PostgreSQL](http://www.postgresql.org/), karena di Java pun masalah perbedaan DataBase sudah sepenuh-nya diatasi oleh hadir-nya beberapa framework [ORM di Java](http://jonasbandi.net/wiki/index.php/ORM_Solutions_for_Java). Nah tapi apa dengan kehadiran [ORM di Java](http://jonasbandi.net/wiki/index.php/ORM_Solutions_for_Java) ini membuat saya harus berserah sepenuh-nya pada [ORM](http://jonasbandi.net/wiki/index.php/ORM_Solutions_for_Java) ? Saya rasa tidak :D Karena ada [beberapa hal](http://tech.groups.yahoo.com/group/netbeans-indonesia/message/8066) yang ternyata harus kita lakukan secara manual di level database-nya :) ) Sedangkan alasan utama saya tetep **keukeuh** menginstall [PostgreSQL](http://www.postgresql.org/) ini adalah **saya pingin tahu, bisa dan paham** bagaimana menggunakan [PostgreSQL](http://www.postgresql.org/) sebagai database server utama saya :D , dan sebagai seorang **junior programmer** tentunya pengetahuan tentang berbagai macam produk Database server pasti-nya jadi nilai tambah donk untuk ngasih solusi ke client kita tercinta :)
<!-- more -->
Nah untuk proses installasi kali ini, saya menggunakan **SlackBuild Script** dari [SlackBuild.org](http://slackbuild.org) yang bisa di download [disini](http://slackbuilds.org/repository/13.0/system/postgresql/). Sekarang mari kita download semua file **SlackBuild Script** tersebut beserta **source code** [PostgreSQL](http://www.postgresql.org/) kemudian simpan pada direktori **postgresql**. Setelah itu, agar proses **building script**-nya berjalan dengan sempurna, buatlah dahulu sebuah **user** dan **group** dengan nama **postgres** (user dan group ini nantinya akan digunakan untuk meng-inisialisasi dan mengakses database server yang akan kita buat) dengan menggunakan akses **root** seperti dibawah ini :

    
    
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]# groupadd -g 209 postgres
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]# useradd -u 209 -g 209 -d /var/lib/pgsql postgres
    



Setelah proses pembuatan **user** dan **group** selesai, sekarang tambahkanlah akses **execute** pada file **postgresql.SlackBuild** dengan mengetikkan **chmod +x postgresql.SlackBuild** kemudian jalankan-lah script-nya dengan perintah **./postgresql.SlackBuild** dan tunggu hingga proses pembuatan file **binary packages**-nya selesai seperti dibawah ini :

    
    
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]# chmod +x postgresql.SlackBuild
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]# ./postgresql.SlackBuild
    ............
    ............
    usr/include/postgresql/server/postgres_fe.h
    usr/include/postgresql/server/bootstrap/
    usr/include/postgresql/server/bootstrap/bootstrap.h
    usr/include/postgresql/informix/
    usr/include/postgresql/informix/esql/
    usr/include/postgresql/informix/esql/decimal.h
    usr/include/postgresql/informix/esql/sqlda.h
    usr/include/postgresql/informix/esql/datetime.h
    usr/include/postgresql/informix/esql/sqltypes.h
    usr/include/postgresql/internal/
    usr/include/postgresql/internal/c.h
    usr/include/postgresql/internal/pqexpbuffer.h
    usr/include/postgresql/internal/libpq/
    usr/include/postgresql/internal/libpq/pqcomm.h
    usr/include/postgresql/internal/libpq-int.h
    usr/include/postgresql/internal/port.h
    usr/include/postgresql/internal/postgres_fe.h
    usr/include/sql3types.h
    install/
    install/doinst.sh
    install/slack-desc
    
    Slackware package /tmp/postgresql-8.4.2-i486-1_SBo.tgz created.
    
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]#
    



Jika proses diatas tidak terjadi kesalahan sama sekali, sekarang mari kita lanjutkan dengan menginstall **binary packages** tersebut dengan menjalankan perintah **installpkg /tmp//postgresql-8.4.2-i486-1_SBo.tgz** seperti perintah dibawah ini :

    
    
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]# installpkg /tmp/postgresql-8.4.2-i486-1_SBo.tgz 
    Verifying package postgresql-8.4.2-i486-1_SBo.tgz.
    Installing package postgresql-8.4.2-i486-1_SBo.tgz:
    PACKAGE DESCRIPTION:
    # PostgreSQL (object-relational database management system)
    #
    # PostgreSQL is an advanced object-relational database management
    # system (ORDBMS) based on POSTGRES. With more than 15 years of
    # development history, it is quickly becoming the de facto
    # database for enterprise level open source solutions.
    #
    # Homepage: http://www.postgresql.org
    #
    Executing install script for postgresql-8.4.2-i486-1_SBo.tgz.
    Package postgresql-8.4.2-i486-1_SBo.tgz installed.
    
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]#
    



Jika sudah, sekarang mari kita buat dahulu database-nya pada direktori **/var/lib/pgsql/data** dengan menggunakan user **postgres** yang telah kita buat pada langkah sebelum-nya dengan cara seperti dibawah ini :

    
    
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]# su postgres -c "initdb -D /var/lib/pgsql/data"
    The files belonging to this database system will be owned by user "postgres".
    This user must also own the server process.
    
    The database cluster will be initialized with locales
      COLLATE:  C
      CTYPE:    en_US
      MESSAGES: en_US
      MONETARY: en_US
      NUMERIC:  en_US
      TIME:     en_US
    The default database encoding has accordingly been set to LATIN1.
    The default text search configuration will be set to "english".
    
    fixing permissions on existing directory /var/lib/pgsql/data ... ok
    creating subdirectories ... ok
    selecting default max_connections ... 100
    selecting default shared_buffers ... 28MB
    creating configuration files ... ok
    creating template1 database in /var/lib/pgsql/data/base/1 ... ok
    initializing pg_authid ... ok
    initializing dependencies ... ok
    creating system views ... ok
    loading system objects' descriptions ... ok
    creating conversions ... ok
    creating dictionaries ... ok
    setting privileges on built-in objects ... ok
    creating information schema ... ok
    vacuuming database template1 ... ok
    copying template1 to template0 ... ok
    copying template1 to postgres ... ok
    
    WARNING: enabling "trust" authentication for local connections
    You can change this by editing pg_hba.conf or using the -A option the
    next time you run initdb.
    
    Success. You can now start the database server using:
    
        postgres -D /var/lib/pgsql/data
    or
        pg_ctl -D /var/lib/pgsql/data -l logfile start
    
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]# 
    



Proses pembuatan database sudah selesai, sebelum menjalankan [PostgreSQL](http://www.postgresql.org/)-nya jangan lupa edit dahulu file **/etc/rc.d/rc.local_shutdown** dan tambahkan baris dibawah ini :

    
    
    # Stop postgres
    if [ -x /etc/rc.d/rc.postgresql ]; then
      /etc/rc.d/rc.postgresql stop
    fi
    



Setelah melakukan proses penyimpanan, sekarang beri akses **executable** pada file **/etc/rc.d/rc.postgresql** dengan perintah **chmod +x /etc/rc.d/rc.postgresql** kemudian jalankan [PostgreSQL](http://www.postgresql.org/)-nya dengan mengetikkan perintah **/etc/rc.d/rc.postgresql start** seperti dibawah ini :

    
    
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]# chmod +x /etc/rc.d/rc.postgresql 
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]# /etc/rc.d/rc.postgresql start
    Starting PostgreSQL
    waiting for server to start.... done
    server started
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]#
    



Ok server sudah berjalan, sekarang mari kita cek **port** berapa yang dibuka oleh [PostgreSQL](http://www.postgresql.org/) dengan mengetikkkan perintah seperti dibawah ini :

    
    
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]# netstat -planet | grep post
    tcp        0      0 127.0.0.1:5432          0.0.0.0:*               LISTEN      209        12922       3566/postgres   
    root@martinusadyh:[/media/data/SLACKBUILDS/postgresql]# 
    



Sekarang kita tahu bahwa default **port** yang dibuka oleh [PostgreSQL](http://www.postgresql.org/) adalah **5432** :D 

Setelah semua-nya selesai, sekarang mari kita coba untuk login ke [PostgreSQL](http://www.postgresql.org/) menggunakan user **postgres** dengan mengetikkan perintah **psql -U postgres** dan coba melihat database-nya dengan mengetikkan perintah **\l** pada **PostgreSQL prompt** seperti dibawah ini :

    
    
    martinus@martinusadyh:[~]$ psql -U postgres
    psql (8.4.2)
    Type "help" for help.
    
    postgres=#
    postgres=# \l
                                  List of databases
       Name    |  Owner   | Encoding | Collation | Ctype |   Access privileges   
    -----------+----------+----------+-----------+-------+-----------------------
     postgres  | postgres | LATIN1   | C         | en_US | 
     template0 | postgres | LATIN1   | C         | en_US | =c/postgres
                                                         : postgres=CTc/postgres
     template1 | postgres | LATIN1   | C         | en_US | =c/postgres
                                                         : postgres=CTc/postgres
    (3 rows)
    
    postgres=#
    



Horeeeeeeee... [PostgreSQL](http://www.postgresql.org/)-nya sekarang sudah berjalan :) Hmm... dengan sukses-nya [PostgreSQL](http://www.postgresql.org/) ini ter-install, sekarang jadi banyak **pekerjaan rumah** yang harus diselesaikan :D :) Bagaiman teman-teman ? :D Maklum saya juga masih **new** kalau di [PostgreSQL](http://www.postgresql.org/) , kalau ada info yang bagus tentang [PostgreSQL](http://www.postgresql.org/) jangan lupa di **sharing** yah :)













**Link-link terkait :**




  1. [PostgreSQL](http://www.postgresql.org/)


  2. [MySQL](http://mysql.com)


  3. [SlackBuild.org](http://slackbuild.org)


  4. [PostgreSQL SlackBuild Script](http://slackbuilds.org/repository/13.0/system/postgresql/)


  5. [Solusi ORM di Java](http://jonasbandi.net/wiki/index.php/ORM_Solutions_for_Java)


  6. [Table Index Pada Hibernate](http://tech.groups.yahoo.com/group/netbeans-indonesia/message/8066)







