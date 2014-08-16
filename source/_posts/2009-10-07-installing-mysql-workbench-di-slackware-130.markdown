---
comments: true
date: 2009-10-07 18:38:32+00:00
layout: post
slug: installing-mysql-workbench-di-slackware-130
title: Installing MySQL WorkBench di Slackware 13.0
wordpress_id: 75
categories:
- DataBase
- Slackware
---

Hari ini saya ada kebutuhan untuk membuat sebuah database diagram ([ER](http://en.wikipedia.org/wiki/Entity-relationship_model)) untuk tujuan dokumentasi pribadi (maklum klo cuma ditulis dikertas, lama-lama kertas-nya sobek-sobek :( ) Karena database yang biasa saya gunakan adalah [MySQL](http://www.mysql.com/?bydis_dis_index=1) maka pilihan saya jatuh pada [MySQL WorkBench](http://dev.mysql.com/downloads/workbench/5.1.html) :) Mungkin untuk pengguna distro yang mempunyai package manajemen seperti DEB dan RPM tidak begitu kesulitan, karena MySQL sudah menyediakan package binary yang sudah siap untuk di install :) Sedangkan untuk pengguna distro lain seperti Slackware, mari kita bikin sendiri binary package-nya via kompilasi dari source again :D :)

Nah untung-nya lagi saya menemukan link [ini.](http://www.mail-archive.com/slackbuilds-users@slackbuilds.org/msg02040.html) yang menjelaskan bagaimana cara meng-install [MySQL WorkBench](http://dev.mysql.com/downloads/workbench/5.1.html). Dan dibawah ini cuplikan bagaimana cara installasi-nya di [Slackware 13.0](http://slackware.com/) :


> 
> has anyone, or could someone made a build script for mysql-workbench?
>

I did one, you can find it here:
http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/

But as Niels Horn has mentioned, "it has too many dependencies... "
from gnome, so i installed first gnome from http://gnomeslackbuild.org
in slackware-13.0, then lua from SBo's repository and finally i
builded mysql-workbench using my SlackBuild. But seriously... gnome
still sucks for me. I'm gonna reinstall slackware and then try to get
mysql-workbench but without all the gnome thing.

-hba



**Posting asli ini bisa dibaca [disini](http://www.mail-archive.com/slackbuilds-users@slackbuilds.org/msg02100.html)**
<!-- more -->
Sebelum mencoba, pastikan dahulu kalau GNOME sudah ter-install pada mesin [Slackware 13.0](http://slackware.com) (kita bisa menggunakan versi GNOME dari GNOME SlackBuild, untuk distribusi GNOME yang lain saya belum pernah mencoba :D ) Setelah GNOME ter-install, sekarang mari kita download dahulu SlackBuild script untuk library lua yang bisa di download dari situs [SlackBuild.org](http://slackbuild.org/) seperti dibawah ini :

    
    
    martinus@martinusadyh:~/SLACKBUILDS/lua$ wget -c http://slackbuilds.org/slackbuilds/13.0/development/lua.tar.gz
    --2009-10-07 22:51:17--  http://slackbuilds.org/slackbuilds/13.0/development/lua.tar.gz
    Resolving slackbuilds.org... 208.67.159.181
    Connecting to slackbuilds.org|208.67.159.181|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 2149 (2.1K) [application/x-tar]
    Saving to: `lua.tar.gz'
    
    100%[===========================================================================================================>] 2,149       --.-K/s   in 0s
    
    2009-10-07 22:51:18 (92.9 MB/s) - `lua.tar.gz' saved [2149/2149]
    
    martinus@martinusadyh:~/SLACKBUILDS/lua$
    



Setelah selesai mendownload file SlackBuild scrpit untuk **lua**, sekarang ekstrak kemudian masuk kedalam direktori **lua** dengan perintah **cd** dan download source code library **lua** sebenarnya seperti dibawah ini:

    
    
    martinus@martinusadyh:~/SLACKBUILDS/lua$ tar zxf lua.tar.gz; cd lua; wget -c http://www.lua.org/ftp/lua-5.1.4.tar.gz
    --2009-10-07 22:53:13--  http://www.lua.org/ftp/lua-5.1.4.tar.gz
    Resolving www.lua.org... 87.237.62.181
    Connecting to www.lua.org|87.237.62.181|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 216679 (212K) [application/octet-stream]
    Saving to: `lua-5.1.4.tar.gz'
    
    100%[===========================================================================================================>] 216,679     28.7K/s   in 7.4s
    
    2009-10-07 22:53:21 (28.7 KB/s) - `lua-5.1.4.tar.gz' saved [216679/216679]
    
    martinus@martinusadyh:~/SLACKBUILDS/lua/lua$ ls
    README  lua-5.1.4.tar.gz  lua.SlackBuild*  lua.info  slack-desc
    martinus@martinusadyh:~/SLACKBUILDS/lua/lua$
    



Sebelum menjalankan file **lua.SlackBuild**, ganti akses user dengan akses root kemudian jalankanlah file **lua.SlackBuild** seperti dibawah ini :

    
    
    martinus@martinusadyh:~/SLACKBUILDS/lua/lua$ su
    Password:
    root@martinusadyh:/home/martinus/SLACKBUILDS/lua/lua# ./lua.SlackBuild
    lua-5.1.4/
    lua-5.1.4/doc/
    lua-5.1.4/doc/lua.1
    lua-5.1.4/doc/luac.1
    lua-5.1.4/doc/lua.html
    lua-5.1.4/doc/readme.html
    lua-5.1.4/doc/logo.gif
    ....
    ....
    ....
    install/
    install/doinst.sh
    install/slack-desc
    
    Slackware package /tmp/lua-5.1.4-i486-3_SBo.tgz created.
    
    root@martinusadyh:/home/martinus/SLACKBUILDS/lua/lua#
    



Hurray.... packages binary **lua** sudah terbentuk dan sekarang kita bisa meng-install dengan perintah **installpkg [nama-paket]** seperti dibawah ini :

    
    
    root@martinusadyh:/home/martinus/SLACKBUILDS/lua/lua# installpkg /tmp/lua-5.1.4-i486-3_SBo.tgz
    Verifying package lua-5.1.4-i486-3_SBo.tgz.
    Installing package lua-5.1.4-i486-3_SBo.tgz:
    PACKAGE DESCRIPTION:
    # Lua (a powerful, fast, light-weight, embeddable scripting language)
    #
    # Lua combines simple procedural syntax with powerful data description
    # constructs based on associative arrays and extensible semantics.
    # Lua is dynamically typed, runs by interpreting bytecode for a
    # register-based virtual machine, and has automatic memory management
    # with incremental garbage collection, making it ideal for
    # configuration, scripting, and rapid prototyping.
    #
    Executing install script for lua-5.1.4-i486-3_SBo.tgz.
    Package lua-5.1.4-i486-3_SBo.tgz installed.
    
    root@martinusadyh:/home/martinus/SLACKBUILDS/lua/lua#
    



Proses instalasi library telah selesai dilakukan, sekarang mari kita download source code dari [MySQL WorkBench](http://dev.mysql.com/downloads/workbench/5.1.html) seperti dibawah ini :

    
    
    martinus@martinusadyh:~/SLACKBUILDS/mysql-tool$ wget -c http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-oss-5.1.18.tar.gz/from/http://ftp.iij.ad.jp/pub/db/mysql/
    --2009-10-07 22:35:46--  http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-oss-5.1.18.tar.gz/from/http://ftp.iij.ad.jp/pub/db/mysql/
    Resolving dev.mysql.com... 213.136.52.29
    Connecting to dev.mysql.com|213.136.52.29|:80... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: http://ftp.iij.ad.jp/pub/db/mysql/Downloads/MySQLGUITools/mysql-workbench-oss-5.1.18.tar.gz [following]
    --2009-10-07 22:35:48--  http://ftp.iij.ad.jp/pub/db/mysql/Downloads/MySQLGUITools/mysql-workbench-oss-5.1.18.tar.gz
    Resolving ftp.iij.ad.jp... 202.232.140.139, 202.232.140.135, 202.232.140.136, ...
    Connecting to ftp.iij.ad.jp|202.232.140.139|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 13368427 (13M) [application/x-gzip]
    Saving to: `mysql-workbench-oss-5.1.18.tar.gz'
    
    100%[===========================================================================================================>] 13,368,427  23.2K/s   in 11m 8s
    
    2009-10-07 22:46:57 (19.5 KB/s) - `mysql-workbench-oss-5.1.18.tar.gz' saved [13368427/13368427]
    
    martinus@martinusadyh:~/SLACKBUILDS/mysql-tool$
    



Sekarang mari kita download seluruh file SlackBuild yang diperlukan untuk membuat binary packages dari [MySQL WorkBench](http://dev.mysql.com/downloads/workbench/5.1.html) dari situs [hba](http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/) seperti dibawah ini :

    
    
    martinus@martinusadyh:~/SLACKBUILDS/mysql-tool$ wget -c http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/doinst.sh
    --2009-10-07 22:48:12--  http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/doinst.sh
    Resolving hba.ath.cx... 148.208.237.253
    Connecting to hba.ath.cx|148.208.237.253|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 436 [application/x-sh]
    Saving to: `doinst.sh'
    
    100%[===========================================================================================================>] 436         --.-K/s   in 0s
    
    2009-10-07 22:48:13 (23.1 MB/s) - `doinst.sh' saved [436/436]
    
    martinus@martinusadyh:~/SLACKBUILDS/mysql-tool$ wget -c http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/mysql-workbench-oss.info
    --2009-10-07 22:48:22--  http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/mysql-workbench-oss.info
    Resolving hba.ath.cx... 148.208.237.253
    Connecting to hba.ath.cx|148.208.237.253|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 393 [text/plain]
    Saving to: `mysql-workbench-oss.info'
    
    100%[===========================================================================================================>] 393         --.-K/s   in 0s
    
    2009-10-07 22:48:23 (21.6 MB/s) - `mysql-workbench-oss.info' saved [393/393]
    
    martinus@martinusadyh:~/SLACKBUILDS/mysql-tool$ wget -c http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/mysql-workbench-oss.SlackBuild
    --2009-10-07 22:48:32--  http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/mysql-workbench-oss.SlackBuild
    Resolving hba.ath.cx... 148.208.237.253
    Connecting to hba.ath.cx|148.208.237.253|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 3362 (3.3K) [text/plain]
    Saving to: `mysql-workbench-oss.SlackBuild'
    
    100%[===========================================================================================================>] 3,362       --.-K/s   in 0s
    
    2009-10-07 22:48:33 (125 MB/s) - `mysql-workbench-oss.SlackBuild' saved [3362/3362]
    
    martinus@martinusadyh:~/SLACKBUILDS/mysql-tool$ wget -c http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/README
    --2009-10-07 22:48:42--  http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/README
    Resolving hba.ath.cx... 148.208.237.253
    Connecting to hba.ath.cx|148.208.237.253|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 277 [text/plain]
    Saving to: `README'
    
    100%[===========================================================================================================>] 277         --.-K/s   in 0s
    
    2009-10-07 22:48:43 (16.6 MB/s) - `README' saved [277/277]
    
    martinus@martinusadyh:~/SLACKBUILDS/mysql-tool$ wget -c http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/slack-desc
    --2009-10-07 22:48:52--  http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/slack-desc
    Resolving hba.ath.cx... 148.208.237.253
    Connecting to hba.ath.cx|148.208.237.253|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 1014 [text/plain]
    Saving to: `slack-desc'
    
    100%[===========================================================================================================>] 1,014       --.-K/s   in 0s
    
    2009-10-07 22:48:55 (58.9 MB/s) - `slack-desc' saved [1014/1014]
    
    martinus@martinusadyh:~/SLACKBUILDS/mysql-tool$
    



Sebelum memulai proses installasi [MySQL WorkBench](http://dev.mysql.com/downloads/workbench/5.1.html), ada baiknya kita membuat secangkir kopi dahulu untuk menemani. Karena proses installasi [MySQL WorkBench](http://dev.mysql.com/downloads/workbench/5.1.html) ini tergolong **lumayan lama** di laptop yang saya gunakan :D Jika sudah siap, sekarang mari kita ganti akses ke user **root** dahulu dengan menggunakan perintah **su** kemudian berikan hak eksekusi pada file **mysql-workbench-oss.SlackBuild** kemudian jalankan file **mysql-workbench-oss.SlackBuild** tersebut seperti dibawah ini :

    
    
    root@martinusadyh:/home/martinus/SLACKBUILDS/mysql-tool# chmod +x mysql-workbench-oss.SlackBuild
    root@martinusadyh:/home/martinus/SLACKBUILDS/mysql-tool# ./mysql-workbench-oss.SlackBuild
    ....
    ....
    usr/share/applications/MySQLWorkbench.desktop
    install/
    install/doinst.sh
    install/slack-desc
    WARNING:  zero length file usr/doc/mysql-workbench-oss-5.1.18/NEWS
    WARNING:  zero length file usr/doc/mysql-workbench-oss-5.1.18/AUTHORS
    WARNING:  zero length file usr/doc/mysql-workbench-oss-5.1.18/INSTALL
    
    Slackware package /tmp/mysql-workbench-oss-5.1.18-i486-1_SBo.tgz created.
    
    root@martinusadyh:/home/martinus/SLACKBUILDS/mysql-tool#
    



Akhirnya penantian lama kita tidak sia-sia juga, binary packages untuk [MySQL WorkBench](http://dev.mysql.com/downloads/workbench/5.1.html) sudah siap di install. Ok tanpa banyak kata, mari kita install dengan perintah **installpkg /tmp/mysql-workbench-oss-5.1.18-i486-1_SBo.tgz** seperti dibawah ini :

    
    
    root@martinusadyh:/home/martinus/SLACKBUILDS/mysql-tool# installpkg /tmp/mysql-workbench-oss-5.1.18-i486-1_SBo.tgz
    Verifying package mysql-workbench-oss-5.1.18-i486-1_SBo.tgz.
    Installing package mysql-workbench-oss-5.1.18-i486-1_SBo.tgz:
    PACKAGE DESCRIPTION:
    # MySQL Workbench (A visual database design tool developed by MySQL)
    #
    # MySQL Workbench is a cross-platform, visual database design tool
    # developed by MySQL. It is the highly anticipated successor
    # application of the DBDesigner4 project.
    #
    # This package is the Community OSS Edition.
    #
    # Homepage: http://dev.mysql.com/workbench/
    #
    Executing install script for mysql-workbench-oss-5.1.18-i486-1_SBo.tgz.
    Package mysql-workbench-oss-5.1.18-i486-1_SBo.tgz installed.
    
    root@martinusadyh:/home/martinus/SLACKBUILDS/mysql-tool#
    



Nah mudah kan ? Dan dibawah ini adalah beberapa screenshot [MySQL WorkBench](http://dev.mysql.com/downloads/workbench/5.1.html) In Action di Slackware 13.0 saya :









[![startup_mysql_workbench](http://farm3.static.flickr.com/2519/3990907388_a20c6ce774.jpg)  
Tampilan Splash Screen MySQL WorkBench](http://www.flickr.com/photos/10243554@N02/3990907388/)


[![mysql-workbench2](http://farm4.static.flickr.com/3455/3990907532_dfe9b25b95.jpg)  
Menampilkan Schema Sakila](http://www.flickr.com/photos/10243554@N02/3990907532/)






[![mysql-workbench-in-action](http://farm3.static.flickr.com/2555/3990907542_743ab0b20d.jpg)  
Tampilan ER Diagram](http://www.flickr.com/photos/10243554@N02/3990907542/)




Happy Slacking All :)

**Link-link terkait : **
- [MySQL WorkBench Download](http://dev.mysql.com/downloads/workbench/5.1.html)
- [SlackBuild Script Untuk Lua](http://slackbuilds.org/repository/13.0/development/lua/)
- [SlackBuild Script Untuk MySQL WorkBench](http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/)
- [Archive Milis SlackBuild User Tentang MySQL WorkBench](http://www.mail-archive.com/slackbuilds-users@slackbuilds.org/msg02040.html)
