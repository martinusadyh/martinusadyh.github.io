---
comments: true
date: 2008-05-13 17:17:58+00:00
layout: post
slug: binary-packages-and-slackbuild-script-nimbus-gtk-themes-for-slackware-120
title: Binary Packages and SlackBuild Script Nimbus GTK Themes for Slackware 12.0
wordpress_id: 30
categories:
- Slackware
---

Wah gara-gara om [Walecha](http://wallinux.blogspot.com/) kemarin dulu kasih komentar tentang themes nimbus [disini](http://martinusadyh.web.id/2007/09/26/install-nimbus-gtk-themes-di-slackware-101/), akhirnya saya jadi penasaran. Apaan sih yang baru dari themes nimbus ? Koq sampai-sampai master GNOME-nya Slackware ngasih tahu saya :D , akhirnya tadi malam saya coba cek ke link download themes nimbus-nya [disini](http://dlc.sun.com/osol/jds/downloads/extras/). Wah ada versi baru rupa-nya, dulu waktu pertama kali install di Slackware 10.1 masih versi 0.0.8 dan sekarang ternyata versi-nya sekarang udah 0.0.12 :)

<!-- more -->
Sebenarnya yang membuat rasa penasaran saya bukan masalah versi-nya yang naik, tapi om [Walecha](http://wallinux.blogspot.com/) udah bikin patch untuk proses **configure**-nya. Wah jadi tambah penasaran nih, berhubung saya sedikit "sungkan" ama om [Walecha](http://wallinux.blogspot.com/) untuk minta patch-nya langsung. Akhirnya saya cobain dulu deh, nanti kalau udah mentok-tok, baru minta patch-nya ke beliau :D untuk proses **configure**-nya (Masak belum apa-apa udah minta patch, enak banget ** halah ngomong apaan sih ^^ **).

Ok sekarang langsung ajah ke proses intinya, soalnya langkah-langkah yang ada disini tidak jauh beda dengan posting saya [dulu](http://martinusadyh.web.id/2007/09/26/install-nimbus-gtk-themes-di-slackware-101/). Kembali ke masalah patch yang diberitahukan oleh om [Walecha](http://wallinux.blogspot.com/) kemarin, memang iya pada proses instalasi themes Nimbus kemarin saya menggunakan patch yang sudah dibikin oleh orang lain dan memang hasilnya bisa berjalan dengan baik. Nah sekarang bagaimana jika tidak menggunakan patch, maksudnya jika kita langsung main hajar dengan perintah **configure** pada source code nimbus-nya ? Hasilnya adalah seperti dibawah ini :

    
    
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus/nimbus-0.0.12]$ ./configure
    checking for a BSD-compatible install... /usr/bin/ginstall -c
    checking whether build environment is sane... yes
    checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
    checking for gawk... gawk
    checking whether make sets $(MAKE)... yes
    checking whether to enable maintainer-specific portions of Makefiles... no
    checking for style of include used by make... GNU
    checking for gcc... gcc
    checking for C compiler default output file name... a.out
    checking whether the C compiler works... yes
    checking whether we are cross compiling... no
    checking for suffix of executables...
    checking for suffix of object files... o
    checking whether we are using the GNU C compiler... yes
    checking whether gcc accepts -g... yes
    checking for gcc option to accept ISO C89... none needed
    checking dependency style of gcc... gcc3
    checking for intltool >= 0.23... awk: cmd. line:1: fatal: cannot open file `./intltool-update.in' for reading (No such file or directory)
    awk: cmd. line:1: fatal: cannot open file `./intltool-update.in' for reading (No such file or directory)
     found
    ./configure: line 3597: test: : integer expression expected
    configure: error: Your intltool is too old.  You need intltool 0.23 or later.
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus/nimbus-0.0.12]$
    



Wataw koq error ? Hmm.. pada pesan error terakhir, script **configure** memberitahukan bahwa **intltool** yang terdapat di sistem saya versi-nya terlalu lama. Akhirnya coba cek apa bener **intltool** saya udah ketinggalan jaman ? Dan ini hasil pengecekan-nya:

    
    
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus/nimbus-0.0.12]$ ls /var/log/packages | grep intltool
    intltool-0.36.3-noarch-9as
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus/nimbus-0.0.12]$
    



Nah baru ketahuan, ternyata **intltool** saya versi-nya udah cukup tinggi. Cuman koq masih gagal yah ? Pada pesan error **configure** diatas juga memberitahukan kalau **intltool-update.in** tidak ada, nah akhirnya jadi penasaran sebenarnya intltool ini buat apaan sih. Berhubung saya masih punya **patch** themes nimbus versi 0.0.8(sayangnya patch nimbus versi 0.0.8 tidak bisa dipakai pada versi 0.0.12 :( ), akhirnya saya coba cari kata-kata **intltool** pada patch tersebut. Akhirnya saya menemukan beberapa **keyword** yang menyangkut **intltool** yaitu **intltool-prepare**, **intltool-merge**, **intltool-update**. Nah akhirnya iseng-iseng deh baca manual **intltool** satu persatu dan hasil-nya untuk membuat file **intltool.in** harus menjalankan perintah **intltoolize** pada direktori utama dari source code. Dan voillla, akhirnya setelah menjalankan perintah **intltoolize**, hasilnya adalah seperti berikut :

    
    
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus/nimbus-0.0.12]$ ls
    AUTHORS    INSTALL      NEWS        autogen.sh    config.sub    depcomp     index.theme     ltmain.sh  mkinstalldirs
    COPYING    Makefile.am  README      config.guess  configure     gtk-engine  index.theme.in  metacity   po
    ChangeLog  Makefile.in  aclocal.m4  config.h.in   configure.in  icons       install-sh      missing
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus/nimbus-0.0.12]$ intltoolize --force
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus/nimbus-0.0.12]$ ls
    AUTHORS    INSTALL      NEWS        autogen.sh    config.sub    depcomp     index.theme     intltool-extract.in  ltmain.sh  mkinstalldirs
    COPYING    Makefile.am  README      config.guess  configure     gtk-engine  index.theme.in  intltool-merge.in    metacity   po
    ChangeLog  Makefile.in  aclocal.m4  config.h.in   configure.in  icons       install-sh      intltool-update.in   missing
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus/nimbus-0.0.12]$
    



Nah sekarang coba jalankan perintah **configure**, maka script **configure** akan berjalan dengan mulus tanpa cacat :). Sedangkan untuk teman-teman yang ingin melihat proses kompilasi dan instalasi yang saya lakukan secara lebih detail, silahkan cek file nimbus.SlackBuild yang sudah saya commit ke repository Slackware Linux Indonesia [disini.](http://slackware.linux.or.id/cgi-bin/viewcvs.cgi/slackbuild/12.0/nimbus-gtk-engine/)

Nah buat teman-teman yang belum tahu cara menggunakan file SlackBuild, ayo sekarang kita coba bermain-main dengan script SlackBuild. Sekarang coba download-lah semua file yang dibutuhkan yang sudah ditulis pada file [README](http://slackware.linux.or.id/cgi-bin/viewcvs.cgi/slackbuild/12.0/nimbus-gtk-engine/readme?rev=1.1&content-type=text/vnd.viewcvs-markup) beserta file [nimbus.SlackBuild](http://slackware.linux.or.id/cgi-bin/viewcvs.cgi/slackbuild/12.0/nimbus-gtk-engine/) dan semua file [slack-desc](http://slackware.linux.or.id/cgi-bin/viewcvs.cgi/slackbuild/12.0/nimbus-gtk-engine/) yang diperlukan hingga menjadi seperti dibawah ini:

    
    
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus]$ ls
    README                             slack-desc-sun-gdm-themes          nimbus-0.0.12.tar.bz2              slack-desc-nimbus                  solaris-branding-0.0.3.tar.bz2     nimbus.SlackBuild                  slack-desc-opensolaris-gdm-themes  sun-gdm-themes-0.25.tar.gz         opensolaris-gdm-themes-0.2.tar.gz  slack-desc-solaris-branding
    



Sebelum mulai menjalankan file nimbus.SlackBuild, coba cek-lah dahulu paket-paket dependencies yang diperlukan, jika ketiga library ini sudah terdapat di sistem maka proses menjalankan script nimbus.SlackBuild bisa diteruskan.
Note: Untuk GNOME, pastikan sudah ter-install pada sistem anda. :)

    
    
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus/nimbus-0.0.12]$ ls /var/log/packages | grep xml-simple
    xml-simple-2.18-i486-1sl
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus/nimbus-0.0.12]$ ls /var/log/packages | grep intltool
    intltool-0.36.3-noarch-9as
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus/nimbus-0.0.12]$ ls /var/log/packages | grep icon-naming-utils
    icon-naming-utils-0.8.6-noarch-6as
    



Nah jika seluruh dependencies sudah terinstal dengan baik sekarang jalankan-lah file nimbus.SlackBuild seperti dibawah ini:

    
    
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus]$ ./nimbus.SlackBuild
    
    +=======================================================================+
    | Step 1. Preparing Compilation process for Nimbus GTK Engine           |
    +=======================================================================+"
    ............
    ............
    +=======================================================================+
    | Creating Solaris Branding Package for Slackware Distribution          |
    +=======================================================================+
    ............
    ............
    Gzipping solaris-branding-0.0.3-i686-1_mrt.tar...
    
    Renaming solaris-branding-0.0.3-i686-1_mrt.tar.gz to solaris-branding-0.0.3-i686-1_mrt.tgz...
    
    Moving solaris-branding-0.0.3-i686-1_mrt.tgz to /tmp...
    
    Package creation complete.
    
    Package log creation at ->  /tmp/id-slack/package-nimbus-log (Please removed it later)
    Package result at ->  /tmp/nimbus-0.0.12-i686-1_mrt.tgz
    Package result at ->  /tmp/opensolaris-gdm-themes-0.2-i686-1_mrt.tgz
    Package result at ->  /tmp/sun-gdm-themes-0.25-i686-1_mrt.tgz
    Package result at ->  /tmp/solaris-branding-0.0.3-i686-1_mrt.tgz
    Package creation done.
    
    Indonesian Slackware Community
    http://slackware.linux.or.id/
    
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus]$
    



Nah setelah tampilan terminal teman-teman seperti diatas, kita bisa melanjutkan dengan proses installasi dengan menggunakan perintah **installpkg**, dan jika teman-teman ingin meng-analisa pesan pada waktu proses **configure**, **make** dan **make install** teman-teman bisa membaca-baca file log yang disertakan. Tapi jika teman-teman ingin langsung meng-install-nya ke sistem, pastikan teman-teman merubah dahulu hak akses menjadi root dengan menjalankan perintah **su** kemudian baru mengetikkan perintah **installpkg** terhadap paket-paket yang ingin kita install seperti dibawah ini:

    
    
    [javamaniac@pemula:~/ProgramFiles/Slack-ID/nimbus]$ su
    Password:
    [root@pemula:/home/javamaniac/ProgramFiles/Slack-ID/nimbus]# installpkg /tmp/nimbus-0.0.12-i686-1_mrt.tgz
    Installing package nimbus-0.0.12-i686-1_mrt...
    PACKAGE DESCRIPTION:
    nimbus: Nimbus - Nimbus is new GTK Themes for Solaris
    nimbus:
    nimbus: Nimbus is the name of a look-and-feel designed by Sun for the
    nimbus: Java Desktop System; it is implemented as a GTK theme in the latest
    nimbus: Solaris 11 pre-release builds.
    nimbus:
    nimbus: Packaged by: Martinus Ady H <mrt.itnewbies@gmail.com>
    Executing install script for nimbus-0.0.12-i686-1_mrt...
    
    [root@pemula:/home/javamaniac/ProgramFiles/Slack-ID/nimbus]# installpkg /tmp/opensolaris-gdm-themes-0.2-i686-1_mrt.tgz
    Installing package opensolaris-gdm-themes-0.2-i686-1_mrt...
    PACKAGE DESCRIPTION:
    opensolaris-gdm-themes: OpenSolaris GDM - The GDM Themes for OpenSolaris
    opensolaris-gdm-themes:
    opensolaris-gdm-themes: OpenSolaris GDM Themes is New GDM Themes in OpenSolaris
    opensolaris-gdm-themes: and this themes designed by Sun for the Java Desktop
    opensolaris-gdm-themes: System.
    opensolaris-gdm-themes:
    opensolaris-gdm-themes: Packaged by: Martinus Ady H <mrt.itnewbies@gmail.com>
    
    [root@pemula:/home/javamaniac/ProgramFiles/Slack-ID/nimbus]# installpkg /tmp/sun-gdm-themes-0.25-i686-1_mrt.tgz
    Installing package sun-gdm-themes-0.25-i686-1_mrt...
    PACKAGE DESCRIPTION:
    sun-gdm-themes: SUN GDM Themes - The GDM Themes for Solaris Operating System
    sun-gdm-themes:
    sun-gdm-themes: SUN GDM Themes is GDM Themes in Solaris and this themes
    sun-gdm-themes: designed by Sun for the Java Desktop System.
    sun-gdm-themes:
    sun-gdm-themes: Packaged by: Martinus Ady H <mrt.itnewbies@gmail.com>
    
    [root@pemula:/home/javamaniac/ProgramFiles/Slack-ID/nimbus]# installpkg /tmp/solaris-branding-0.0.3-i686-1_mrt.tgz
    Installing package solaris-branding-0.0.3-i686-1_mrt...
    PACKAGE DESCRIPTION:
    solaris-branding: Solaris Branding - All stuff and image about Solaris OS
    solaris-branding:
    solaris-branding: This packages contains all stuff used in Solaris Operating
    solaris-branding: System. Like SplashScreen, Wallpaper, etc.
    solaris-branding:
    solaris-branding: Packaged by: Martinus Ady H <mrt.itnewbies@gmail.com>
    
    [root@pemula:/home/javamaniac/ProgramFiles/Slack-ID/nimbus]#
    



Nah mudah bukan :) , oh iya sampai lupa. Untuk teman-teman yang tidak mau pusing dengan script SlackBuild, teman-teman bisa download file binary-nya yang sudah saya tulis di akhir posting ini. :)

Btw ada yang baru di versi ini, yaitu GDM Themes-nya baru dan tampilan-nya seperti gambar dibawah ini :
[![GDMThemesIndiana](http://farm3.static.flickr.com/2082/2489624972_6f9c804c30.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2489624972/)

Dan selain GDM Themes yang baru tersebut, yang membuat saya senang yaitu icon trash-nya udah mau nongol :) dan dibawah ini adalah tampilan desktop saya menggunakan themes nimbus yang baru :
[![OpenSolarisCleanDesktop](http://farm4.static.flickr.com/3089/2489624978_85c0989d5e.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2489624978/)

So.. Happy Slacking Guy's ;)

**Resource :**
- [Binary Packages For Slackware 12.0](ftp://slackware.linux.or.id/pub/people/javamaniac/slackware12.0/)
- [SlackBuild script For Slackware 12.0](http://slackware.linux.or.id/cgi-bin/viewcvs.cgi/slackbuild/12.0/nimbus-gtk-engine/)
