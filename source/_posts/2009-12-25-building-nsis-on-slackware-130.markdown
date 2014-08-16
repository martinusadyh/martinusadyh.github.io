---
comments: true
date: 2009-12-25 12:11:29+00:00
layout: post
slug: building-nsis-on-slackware-130
title: Building NSIS On Slackware 13.0
wordpress_id: 94
categories:
- Java
- NetBeans
- OpenSolaris
- Slackware
---

Ingin membuat sebuah installer untuk aplikasi yang jalan di Windows (ber-ekstensi exe) tapi dari GNU/Linux atau *Nix ? Jika jawaban-nya adalah iya, maka aplikasi NSIS ini mungkin cocok untuk teman-teman. Nah apa sih NSIS (Nullsoft Scriptable Install System) ini sebenar-nya ? NSIS (Nullsoft Scriptable Install System)  ini adalah sebuah **_installer creator_** opensource yang ditujukan untuk aplikasi yang berjalan di Sistem Operasi Microsoft Windows. Karena NSIS (Nullsoft Scriptable Install System) ini dapat di install pada sistem yang mengikuti standart [POSIX](http://en.wikipedia.org/wiki/POSIX), maka harusnya NSIS (Nullsoft Scriptable Install System) dapat digunakan secara mulus pada Sistem Operasi GNU/Linux dan *Nix family seperti OpenSolaris dan lain-nya.

Pada tulisan kali ini, kita akan mencoba menginstall NSIS (Nullsoft Scriptable Install System) pada Sistem Operasi GNU/Linux Slackware dan seluruh langkah yang dijelaskan pada tulisan ini mengacu ke struktur direktori standart milik Slackware (Untuk distribusi GNU/Linux yang lain, harusnya bisa menerapkan langkah-langkah pada tulisan ini tanpa ada masalah asalkan kebutuhan paket yang diminta oleh NSIS sudah terinstall sebelumnya). Agar proses kompilasi NSIS (Nullsoft Scriptable Install System) ini berjalan dengan sukses, maka pastikan dahulu kebutuhan dibawah ini terdapat pada sistem anda :
- Python 2.6.2
- Scons 1.2.0
**Note: Jika versi di sistem anda lebih tinggi, harus-nya tidak akan ada masalah dan kebutuhan diatas adalah kebutuhan yang diperlukan di GNU/Linux Slackware 13.0 :) **

Pada default installasi Slackware 13.0 tidak terdapat packages [Scons](http://www.scons.org/), jadi sekarang mari kita install dulu packages [Scons](http://www.scons.org/)-nya yang dapat di download dari situs SlackBuild.org. Sekarang bukalah halaman Scons yang terdapat pada situs SlackBuild yang bisa dilihat [di sini](http://slackbuilds.org/repository/13.0/development/scons/) kemudian download seluruh file SlackBuild yang diperlukan seperti dibawah ini :

    
    
    martinus@martinusadyh:[~/SLACKBUILDS/scons]$ wget -c http://slackbuilds.org/slackbuilds/13.0/development/scons/scons.SlackBuild && wget -c http://slackbuilds.org/slackbuilds/13.0/development/scons/scons.info && wget -c http://slackbuilds.org/slackbuilds/13.0/development/scons/slack-desc && wget -c http://slackbuilds.org/slackbuilds/13.0/development/scons/README
    --2009-12-15 19:07:58--  http://slackbuilds.org/slackbuilds/13.0/development/scons/scons.SlackBuild
    Resolving slackbuilds.org... 208.67.159.181
    Connecting to slackbuilds.org|208.67.159.181|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 1046 (1.0K) [text/plain]
    Saving to: `scons.SlackBuild'
    
    100%[==============================================================================================================================>] 1,046       --.-K/s   in 0s
    
    2009-12-15 19:08:00 (46.8 MB/s) - `scons.SlackBuild' saved [1046/1046]
    
    --2009-12-15 19:08:00--  http://slackbuilds.org/slackbuilds/13.0/development/scons/scons.info
    Resolving slackbuilds.org... 208.67.159.181
    Connecting to slackbuilds.org|208.67.159.181|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 279 [text/plain]
    Saving to: `scons.info'
    
    100%[==============================================================================================================================>] 279         --.-K/s   in 0s
    
    2009-12-15 19:08:01 (16.8 MB/s) - `scons.info' saved [279/279]
    
    --2009-12-15 19:08:01--  http://slackbuilds.org/slackbuilds/13.0/development/scons/slack-desc
    Resolving slackbuilds.org... 208.67.159.181
    Connecting to slackbuilds.org|208.67.159.181|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 932 [text/plain]
    Saving to: `slack-desc'
    
    100%[==============================================================================================================================>] 932         --.-K/s   in 0s
    
    2009-12-15 19:08:03 (46.3 MB/s) - `slack-desc' saved [932/932]
    
    --2009-12-15 19:08:03--  http://slackbuilds.org/slackbuilds/13.0/development/scons/README
    Resolving slackbuilds.org... 208.67.159.181
    Connecting to slackbuilds.org|208.67.159.181|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 458 [text/plain]
    Saving to: `README'
    
    100%[==============================================================================================================================>] 458         --.-K/s   in 0s
    
    2009-12-15 19:08:04 (25.8 MB/s) - `README' saved [458/458]
    
    martinus@martinusadyh:[~/SLACKBUILDS/scons]$
    


<!-- more -->
Setelah selesai, sekarang download source code untuk [Scons](http://www.scons.org/)-nya dari situs resmi project-nya di sourceforge.net seperti dbawah ini :

    
    
    martinus@martinusadyh:[~/SLACKBUILDS/scons]$ wget -c http://downloads.sourceforge.net/scons/scons-1.2.0.tar.gz
    --2009-12-15 19:05:40--  http://downloads.sourceforge.net/scons/scons-1.2.0.tar.gz
    Resolving downloads.sourceforge.net... 216.34.181.59
    Connecting to downloads.sourceforge.net|216.34.181.59|:80... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: http://nchc.dl.sourceforge.net/project/scons/scons/1.2.0/scons-1.2.0.tar.gz [following]
    --2009-12-15 19:05:43--  http://nchc.dl.sourceforge.net/project/scons/scons/1.2.0/scons-1.2.0.tar.gz
    Resolving nchc.dl.sourceforge.net... 211.79.60.17, 2001:e10:ffff:1f02::17
    Connecting to nchc.dl.sourceforge.net|211.79.60.17|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 568974 (556K) [application/x-gzip]
    Saving to: `scons-1.2.0.tar.gz'
    
    100%[==============================================================================================================================>] 568,974     27.4K/s   in 44s
    
    2009-12-15 19:06:28 (12.7 KB/s) - `scons-1.2.0.tar.gz' saved [568974/568974]
    
    martinus@martinusadyh:[~/SLACKBUILDS/scons]$
    



Jika proses download sudah selesai, sekarang rubahlah hak akses anda menjadi **root** dengan perintah **su** kemudian beri akses **execute** pada file **scons.SlackBuild** dengan mengetikkan perintah **chmod +x scon.SlackBuild** dan buatlah binary packages untuk Slackware dengan mengetikkan perintah seperti dibawah ini :

    
    
    root@martinusadyh:[/home/martinus/SLACKBUILDS/scons]# chmod +x scons.SlackBuild
    root@martinusadyh:[/home/martinus/SLACKBUILDS/scons]# ./scons.SlackBuild
    ........
    ........
    usr/lib/scons-1.2.0/SCons/Variables/PackageVariable.pyc
    usr/lib/scons-1.2.0/SCons/Variables/BoolVariable.pyc
    usr/lib/scons-1.2.0/SCons/Variables/BoolVariable.py
    usr/lib/scons-1.2.0/SCons/Variables/PathVariable.pyc
    usr/lib/scons-1.2.0/SCons/Variables/ListVariable.pyc
    usr/lib/scons-1.2.0/SCons/Variables/EnumVariable.py
    usr/lib/scons-1.2.0/SCons/Variables/PathVariable.py
    usr/lib/scons-1.2.0/SCons/Variables/__init__.pyc
    usr/lib/scons-1.2.0/SCons/Variables/ListVariable.py
    usr/lib/scons-1.2.0/SCons/Variables/EnumVariable.pyc
    usr/lib/scons-1.2.0/SCons/Variables/__init__.py
    usr/lib/scons-1.2.0/scons-1.2.0-py2.6.egg-info
    usr/man/
    usr/man/man1/
    usr/man/man1/scons-time.1.gz
    usr/man/man1/scons.1.gz
    usr/man/man1/sconsign.1.gz
    install/
    install/doinst.sh
    install/slack-desc
    
    Slackware package /tmp/scons-1.2.0-i486-2_SBo.tgz created.
    
    root@martinusadyh:[/home/martinus/SLACKBUILDS/scons]#
    



Setelah binary packages Scons untuk Slackware telah dibuat, sekarang install-lah dengan menggunakan perintah **installpkg [nama_paket.txz]** seperti dibawah ini :

    
    
    root@martinusadyh:[/home/martinus/SLACKBUILDS/scons]# installpkg /tmp/scons-1.2.0-i486-2_SBo.tgz
    Verifying package scons-1.2.0-i486-2_SBo.tgz.
    Installing package scons-1.2.0-i486-2_SBo.tgz:
    PACKAGE DESCRIPTION:
    # SCons (Open Source software construction tool)
    #
    # SCons is an Open Source software construction tool--that is,
    # a next-generation build tool.  Think of SCons as an improved,
    # cross-platform substitute for the classic Make utility with
    # integrated functionality similar to autoconf/automake and
    # compiler caches such as ccache.  In short, SCons is an easier,
    # more reliable and faster way to build software.
    #
    Executing install script for scons-1.2.0-i486-2_SBo.tgz.
    Package scons-1.2.0-i486-2_SBo.tgz installed.
    
    root@martinusadyh:[/home/martinus/SLACKBUILDS/scons]#
    



Sampai disini kita sudah siap untuk mulai meng-install NSIS (Nullsoft Scriptable Install System) pada sistem kita, sekarang buatlah sebuah direktori untuk menampung source code NSIS (Nullsoft Scriptable Install System) dengan nama **nsis**. Jika sudah, untuk mulai menginstall NSIS (Nullsoft Scriptable Install System) kita membutuhkan 2 buah file yaitu **nsis-2.46.zip** dan **nsis-2.46-src.tar.bz2** yang dapat kita download seperti dibawah ini :

    
    
    martinus@martinusadyh:[/home/martinus/SLACKBUILDS/nsis]$ wget -c http://nchc.dl.sourceforge.net/project/nsis/NSIS%202/2.46/nsis-2.46.zip
    --2009-12-24 04:46:36--  http://nchc.dl.sourceforge.net/project/nsis/NSIS%202/2.46/nsis-2.46.zip
    Resolving nchc.dl.sourceforge.net... 211.79.60.17, 2001:e10:ffff:1f02::17
    Connecting to nchc.dl.sourceforge.net|211.79.60.17|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 2323164 (2.2M) [application/zip]
    Saving to: `nsis-2.46.zip'
    
    100%[==============================================================================================================================>] 2,323,164   38.0K/s   in 60s
    
    2009-12-24 04:47:36 (37.8 KB/s) - `nsis-2.46.zip' saved [2323164/2323164]
    martinus@martinusadyh:[/home/martinus/SLACKBUILDS/nsis]$ wget -c http://nchc.dl.sourceforge.net/project/nsis/NSIS%202/2.46/nsis-2.46-src.tar.bz2
    --2009-12-24 04:45:28--  http://nchc.dl.sourceforge.net/project/nsis/NSIS%202/2.46/nsis-2.46-src.tar.bz2
    Resolving nchc.dl.sourceforge.net... 211.79.60.17, 2001:e10:ffff:1f02::17
    Connecting to nchc.dl.sourceforge.net|211.79.60.17|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 1499014 (1.4M) [application/x-bzip2]
    Saving to: `nsis-2.46-src.tar.bz2'
    
    100%[==============================================================================================================================>] 1,499,014   45.5K/s   in 32s
    
    2009-12-24 04:46:01 (45.3 KB/s) - `nsis-2.46-src.tar.bz2' saved [1499014/1499014]
    
    martinus@martinusadyh:[~/Desktop]$
    



Setelah proses download selesai, sekarang rubahlah hak akses anda dahulu menjadi root dengan menggunakan perintah **su -** kemudian ekstrak-lah file **nsis-2.46.zip** kedalam direktori **/usr** dengan perintah seperti dibawah ini :

    
    
    martinus@martinusadyh:[/home/martinus/SLACKBUILDS/nsis]# unzip nsis-2.46.zip -d /usr/
    Archive:  nsis-2.46.zip
      inflating: /usr/nsis-2.46/COPYING
      inflating: /usr/nsis-2.46/makensis.exe
      inflating: /usr/nsis-2.46/makensisw.exe
      inflating: /usr/nsis-2.46/NSIS.chm
      inflating: /usr/nsis-2.46/NSIS.exe
      inflating: /usr/nsis-2.46/nsisconf.nsh
      inflating: /usr/nsis-2.46/Bin/GenPat.exe
      inflating: /usr/nsis-2.46/Bin/LibraryLocal.exe
      inflating: /usr/nsis-2.46/Bin/MakeLangId.exe
      inflating: /usr/nsis-2.46/Bin/RegTool.bin
      inflating: /usr/nsis-2.46/Bin/zip2exe.exe
      inflating: /usr/nsis-2.46/Contrib/Graphics/Checks/big.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Checks/classic-cross.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Checks/classic.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Checks/colorful.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Checks/grey-cross.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Checks/grey.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Checks/modern.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Checks/red-round.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Checks/red.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Checks/simple-round.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Checks/simple-round2.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Checks/simple.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Header/nsis-r.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Header/nsis.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Header/orange-nsis.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Header/orange-r-nsis.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Header/orange-r.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Header/orange-uninstall-nsis.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Header/orange-uninstall-r-nsis.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Header/orange-uninstall-r.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Header/orange-uninstall.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Header/orange.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Header/win.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/arrow-install.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/arrow-uninstall.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/arrow2-install.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/arrow2-uninstall.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/box-install.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/box-uninstall.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/classic-install.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/classic-uninstall.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/llama-blue.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/llama-grey.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/modern-install-blue-full.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/modern-install-blue.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/modern-install-colorful.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/modern-install-full.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/modern-install.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/modern-uninstall-blue-full.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/modern-uninstall-blue.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/modern-uninstall-colorful.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/modern-uninstall-full.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/modern-uninstall.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/nsis1-install.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/nsis1-uninstall.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/orange-install-nsis.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/orange-install.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/orange-uninstall-nsis.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/orange-uninstall.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/pixel-install.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/pixel-uninstall.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/win-install.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Icons/win-uninstall.ico
      inflating: /usr/nsis-2.46/Contrib/Graphics/Wizard/arrow.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Wizard/llama.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Wizard/nsis.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Wizard/nullsoft.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Wizard/orange-nsis.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Wizard/orange-uninstall-nsis.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Wizard/orange-uninstall.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Wizard/orange.bmp
      inflating: /usr/nsis-2.46/Contrib/Graphics/Wizard/win.bmp
      inflating: /usr/nsis-2.46/Contrib/Language files/Afrikaans.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Afrikaans.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Albanian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Albanian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Arabic.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Arabic.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Basque.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Basque.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Belarusian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Belarusian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Bosnian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Bosnian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Breton.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Breton.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Bulgarian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Bulgarian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Catalan.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Catalan.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Croatian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Croatian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Czech.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Czech.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Danish.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Danish.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Dutch.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Dutch.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/English.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/English.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Esperanto.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Esperanto.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Estonian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Estonian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Farsi.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Farsi.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Finnish.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Finnish.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/French.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/French.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Galician.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Galician.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/German.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/German.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Greek.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Greek.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Hebrew.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Hebrew.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Hungarian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Hungarian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Icelandic.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Icelandic.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Indonesian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Indonesian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Irish.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Irish.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Italian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Italian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Japanese.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Japanese.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Korean.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Korean.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Kurdish.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Kurdish.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Latvian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Latvian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Lithuanian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Lithuanian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Luxembourgish.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Luxembourgish.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Macedonian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Macedonian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Malay.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Malay.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Mongolian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Mongolian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Norwegian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Norwegian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/NorwegianNynorsk.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/NorwegianNynorsk.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Polish.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Polish.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Portuguese.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Portuguese.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/PortugueseBR.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/PortugueseBR.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Romanian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Romanian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Russian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Russian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Serbian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Serbian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/SerbianLatin.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/SerbianLatin.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/SimpChinese.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/SimpChinese.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Slovak.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Slovak.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Slovenian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Slovenian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Spanish.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Spanish.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/SpanishInternational.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/SpanishInternational.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Swedish.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Swedish.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Thai.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Thai.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/TradChinese.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/TradChinese.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Turkish.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Turkish.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Ukrainian.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Ukrainian.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Uzbek.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Uzbek.nsh
      inflating: /usr/nsis-2.46/Contrib/Language files/Welsh.nlf
      inflating: /usr/nsis-2.46/Contrib/Language files/Welsh.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI/ioSpecial.ini
      inflating: /usr/nsis-2.46/Contrib/Modern UI/System.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI 2/Deprecated.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI 2/Interface.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI 2/Localization.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI 2/MUI2.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI 2/Pages.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI 2/Pages/Components.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI 2/Pages/Directory.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI 2/Pages/Finish.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI 2/Pages/InstallFiles.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI 2/Pages/License.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI 2/Pages/StartMenu.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI 2/Pages/UninstallConfirm.nsh
      inflating: /usr/nsis-2.46/Contrib/Modern UI 2/Pages/Welcome.nsh
      inflating: /usr/nsis-2.46/Contrib/UIs/default.exe
      inflating: /usr/nsis-2.46/Contrib/UIs/modern.exe
      inflating: /usr/nsis-2.46/Contrib/UIs/modern_headerbmp.exe
      inflating: /usr/nsis-2.46/Contrib/UIs/modern_headerbmpr.exe
      inflating: /usr/nsis-2.46/Contrib/UIs/modern_nodesc.exe
      inflating: /usr/nsis-2.46/Contrib/UIs/modern_smalldesc.exe
      inflating: /usr/nsis-2.46/Contrib/UIs/sdbarker_tiny.exe
      inflating: /usr/nsis-2.46/Contrib/zip2exe/Base.nsh
      inflating: /usr/nsis-2.46/Contrib/zip2exe/Classic.nsh
      inflating: /usr/nsis-2.46/Contrib/zip2exe/Modern.nsh
      inflating: /usr/nsis-2.46/Docs/AdvSplash/advsplash.txt
      inflating: /usr/nsis-2.46/Docs/Banner/Readme.txt
      inflating: /usr/nsis-2.46/Docs/BgImage/BgImage.txt
      inflating: /usr/nsis-2.46/Docs/Dialer/Dialer.txt
      inflating: /usr/nsis-2.46/Docs/InstallOptions/Changelog.txt
      inflating: /usr/nsis-2.46/Docs/InstallOptions/Readme.html
      inflating: /usr/nsis-2.46/Docs/makensisw/License.txt
      inflating: /usr/nsis-2.46/Docs/makensisw/Readme.txt
      inflating: /usr/nsis-2.46/Docs/Math/Math.txt
      inflating: /usr/nsis-2.46/Docs/Modern UI/Changelog.txt
      inflating: /usr/nsis-2.46/Docs/Modern UI/License.txt
      inflating: /usr/nsis-2.46/Docs/Modern UI/Readme.html
      inflating: /usr/nsis-2.46/Docs/Modern UI/images/closed.gif
      inflating: /usr/nsis-2.46/Docs/Modern UI/images/header.gif
      inflating: /usr/nsis-2.46/Docs/Modern UI/images/open.gif
      inflating: /usr/nsis-2.46/Docs/Modern UI/images/screen1.png
      inflating: /usr/nsis-2.46/Docs/Modern UI/images/screen2.png
      inflating: /usr/nsis-2.46/Docs/Modern UI 2/License.txt
      inflating: /usr/nsis-2.46/Docs/Modern UI 2/Readme.html
      inflating: /usr/nsis-2.46/Docs/Modern UI 2/images/closed.gif
      inflating: /usr/nsis-2.46/Docs/Modern UI 2/images/header.gif
      inflating: /usr/nsis-2.46/Docs/Modern UI 2/images/open.gif
      inflating: /usr/nsis-2.46/Docs/Modern UI 2/images/screen1.png
      inflating: /usr/nsis-2.46/Docs/Modern UI 2/images/screen2.png
      inflating: /usr/nsis-2.46/Docs/MultiUser/Readme.html
      inflating: /usr/nsis-2.46/Docs/nsDialogs/Readme.html
      inflating: /usr/nsis-2.46/Docs/nsExec/nsExec.txt
      inflating: /usr/nsis-2.46/Docs/NSISdl/License.txt
      inflating: /usr/nsis-2.46/Docs/NSISdl/ReadMe.txt
      inflating: /usr/nsis-2.46/Docs/Splash/splash.txt
      inflating: /usr/nsis-2.46/Docs/StartMenu/Readme.txt
      inflating: /usr/nsis-2.46/Docs/StrFunc/StrFunc.txt
      inflating: /usr/nsis-2.46/Docs/System/System.html
      inflating: /usr/nsis-2.46/Docs/System/WhatsNew.txt
      inflating: /usr/nsis-2.46/Docs/VPatch/Readme.html
      inflating: /usr/nsis-2.46/Examples/bigtest.nsi
      inflating: /usr/nsis-2.46/Examples/example1.nsi
      inflating: /usr/nsis-2.46/Examples/example2.nsi
      inflating: /usr/nsis-2.46/Examples/FileFunc.ini
      inflating: /usr/nsis-2.46/Examples/FileFunc.nsi
      inflating: /usr/nsis-2.46/Examples/FileFuncTest.nsi
      inflating: /usr/nsis-2.46/Examples/gfx.nsi
      inflating: /usr/nsis-2.46/Examples/languages.nsi
      inflating: /usr/nsis-2.46/Examples/Library.nsi
      inflating: /usr/nsis-2.46/Examples/LogicLib.nsi
      inflating: /usr/nsis-2.46/Examples/makensis.nsi
      inflating: /usr/nsis-2.46/Examples/Memento.nsi
      inflating: /usr/nsis-2.46/Examples/one-section.nsi
      inflating: /usr/nsis-2.46/Examples/primes.nsi
      inflating: /usr/nsis-2.46/Examples/rtest.nsi
      inflating: /usr/nsis-2.46/Examples/silent.nsi
      inflating: /usr/nsis-2.46/Examples/StrFunc.nsi
      inflating: /usr/nsis-2.46/Examples/TextFunc.ini
      inflating: /usr/nsis-2.46/Examples/TextFunc.nsi
      inflating: /usr/nsis-2.46/Examples/TextFuncTest.nsi
      inflating: /usr/nsis-2.46/Examples/UserVars.nsi
      inflating: /usr/nsis-2.46/Examples/VersionInfo.nsi
      inflating: /usr/nsis-2.46/Examples/viewhtml.nsi
      inflating: /usr/nsis-2.46/Examples/waplugin.nsi
      inflating: /usr/nsis-2.46/Examples/WordFunc.ini
      inflating: /usr/nsis-2.46/Examples/WordFunc.nsi
      inflating: /usr/nsis-2.46/Examples/WordFuncTest.nsi
      inflating: /usr/nsis-2.46/Examples/AdvSplash/Example.nsi
      inflating: /usr/nsis-2.46/Examples/Banner/Example.nsi
      inflating: /usr/nsis-2.46/Examples/BgImage/Example.nsi
      inflating: /usr/nsis-2.46/Examples/InstallOptions/test.ini
      inflating: /usr/nsis-2.46/Examples/InstallOptions/test.nsi
      inflating: /usr/nsis-2.46/Examples/InstallOptions/testimgs.ini
      inflating: /usr/nsis-2.46/Examples/InstallOptions/testimgs.nsi
      inflating: /usr/nsis-2.46/Examples/InstallOptions/testlink.ini
      inflating: /usr/nsis-2.46/Examples/InstallOptions/testlink.nsi
      inflating: /usr/nsis-2.46/Examples/InstallOptions/testnotify.ini
      inflating: /usr/nsis-2.46/Examples/InstallOptions/testnotify.nsi
      inflating: /usr/nsis-2.46/Examples/Math/math.nsi
      inflating: /usr/nsis-2.46/Examples/Math/mathtest.ini
      inflating: /usr/nsis-2.46/Examples/Math/mathtest.nsi
      inflating: /usr/nsis-2.46/Examples/Math/mathtest.txt
      inflating: /usr/nsis-2.46/Examples/Modern UI/Basic.nsi
      inflating: /usr/nsis-2.46/Examples/Modern UI/HeaderBitmap.nsi
      inflating: /usr/nsis-2.46/Examples/Modern UI/MultiLanguage.nsi
      inflating: /usr/nsis-2.46/Examples/Modern UI/StartMenu.nsi
      inflating: /usr/nsis-2.46/Examples/Modern UI/WelcomeFinish.nsi
      inflating: /usr/nsis-2.46/Examples/nsDialogs/example.nsi
      inflating: /usr/nsis-2.46/Examples/nsDialogs/InstallOptions.nsi
      inflating: /usr/nsis-2.46/Examples/nsDialogs/timer.nsi
      inflating: /usr/nsis-2.46/Examples/nsDialogs/welcome.nsi
      inflating: /usr/nsis-2.46/Examples/nsExec/test.nsi
      inflating: /usr/nsis-2.46/Examples/Plugin/exdll-vs2008.sln
      inflating: /usr/nsis-2.46/Examples/Plugin/exdll-vs2008.vcproj
      inflating: /usr/nsis-2.46/Examples/Plugin/exdll.c
      inflating: /usr/nsis-2.46/Examples/Plugin/exdll.dpr
      inflating: /usr/nsis-2.46/Examples/Plugin/exdll.dsp
      inflating: /usr/nsis-2.46/Examples/Plugin/exdll.dsw
      inflating: /usr/nsis-2.46/Examples/Plugin/exdll_with_unit.dpr
      inflating: /usr/nsis-2.46/Examples/Plugin/extdll.inc
      inflating: /usr/nsis-2.46/Examples/Plugin/nsis.pas
      inflating: /usr/nsis-2.46/Examples/Plugin/nsis/api.h
      inflating: /usr/nsis-2.46/Examples/Plugin/nsis/pluginapi.h
      inflating: /usr/nsis-2.46/Examples/Plugin/nsis/pluginapi.lib
      inflating: /usr/nsis-2.46/Examples/Splash/Example.nsi
      inflating: /usr/nsis-2.46/Examples/StartMenu/Example.nsi
      inflating: /usr/nsis-2.46/Examples/System/Resource.dll
      inflating: /usr/nsis-2.46/Examples/System/SysFunc.nsh
      inflating: /usr/nsis-2.46/Examples/System/System.nsh
      inflating: /usr/nsis-2.46/Examples/System/System.nsi
      inflating: /usr/nsis-2.46/Examples/UserInfo/UserInfo.nsi
      inflating: /usr/nsis-2.46/Examples/VPatch/example.nsi
      inflating: /usr/nsis-2.46/Examples/VPatch/newfile.txt
      inflating: /usr/nsis-2.46/Examples/VPatch/oldfile.txt
      inflating: /usr/nsis-2.46/Examples/VPatch/patch.pat
      inflating: /usr/nsis-2.46/Include/Colors.nsh
      inflating: /usr/nsis-2.46/Include/FileFunc.nsh
      inflating: /usr/nsis-2.46/Include/InstallOptions.nsh
      inflating: /usr/nsis-2.46/Include/LangFile.nsh
      inflating: /usr/nsis-2.46/Include/Library.nsh
      inflating: /usr/nsis-2.46/Include/LogicLib.nsh
      inflating: /usr/nsis-2.46/Include/Memento.nsh
      inflating: /usr/nsis-2.46/Include/MUI.nsh
      inflating: /usr/nsis-2.46/Include/MUI2.nsh
      inflating: /usr/nsis-2.46/Include/MultiUser.nsh
      inflating: /usr/nsis-2.46/Include/nsDialogs.nsh
      inflating: /usr/nsis-2.46/Include/Sections.nsh
      inflating: /usr/nsis-2.46/Include/StrFunc.nsh
      inflating: /usr/nsis-2.46/Include/TextFunc.nsh
      inflating: /usr/nsis-2.46/Include/UpgradeDLL.nsh
      inflating: /usr/nsis-2.46/Include/Util.nsh
      inflating: /usr/nsis-2.46/Include/VB6RunTime.nsh
      inflating: /usr/nsis-2.46/Include/VPatchLib.nsh
      inflating: /usr/nsis-2.46/Include/WinCore.nsh
      inflating: /usr/nsis-2.46/Include/WinMessages.nsh
      inflating: /usr/nsis-2.46/Include/WinVer.nsh
      inflating: /usr/nsis-2.46/Include/WordFunc.nsh
      inflating: /usr/nsis-2.46/Include/x64.nsh
      inflating: /usr/nsis-2.46/Include/Win/WinDef.nsh
      inflating: /usr/nsis-2.46/Include/Win/WinError.nsh
      inflating: /usr/nsis-2.46/Include/Win/WinNT.nsh
      inflating: /usr/nsis-2.46/Include/Win/WinUser.nsh
      inflating: /usr/nsis-2.46/Menu/index.html
      inflating: /usr/nsis-2.46/Menu/images/header.gif
      inflating: /usr/nsis-2.46/Menu/images/line.gif
      inflating: /usr/nsis-2.46/Menu/images/site.gif
      inflating: /usr/nsis-2.46/Plugins/AdvSplash.dll
      inflating: /usr/nsis-2.46/Plugins/Banner.dll
      inflating: /usr/nsis-2.46/Plugins/BgImage.dll
      inflating: /usr/nsis-2.46/Plugins/Dialer.dll
      inflating: /usr/nsis-2.46/Plugins/InstallOptions.dll
      inflating: /usr/nsis-2.46/Plugins/LangDLL.dll
      inflating: /usr/nsis-2.46/Plugins/Math.dll
      inflating: /usr/nsis-2.46/Plugins/nsDialogs.dll
      inflating: /usr/nsis-2.46/Plugins/nsExec.dll
      inflating: /usr/nsis-2.46/Plugins/NSISdl.dll
      inflating: /usr/nsis-2.46/Plugins/Splash.dll
      inflating: /usr/nsis-2.46/Plugins/StartMenu.dll
      inflating: /usr/nsis-2.46/Plugins/System.dll
      inflating: /usr/nsis-2.46/Plugins/TypeLib.dll
      inflating: /usr/nsis-2.46/Plugins/UserInfo.dll
      inflating: /usr/nsis-2.46/Plugins/VPatch.dll
      inflating: /usr/nsis-2.46/Stubs/bzip2
      inflating: /usr/nsis-2.46/Stubs/bzip2_solid
      inflating: /usr/nsis-2.46/Stubs/lzma
      inflating: /usr/nsis-2.46/Stubs/lzma_solid
      inflating: /usr/nsis-2.46/Stubs/uninst
      inflating: /usr/nsis-2.46/Stubs/zlib
      inflating: /usr/nsis-2.46/Stubs/zlib_solid
    martinus@martinusadyh:[/home/martinus/SLACKBUILDS/nsis]#
    



Setelah selesai meng-ekstrak file **nsis-2.46.zip** ke dalam direktori **/usr**, sekarang ekstrak-lah file **nsis-2.46-src.tar.bz2** dengan perintah seperti dibawah ini :

    
    
    martinus@martinusadyh:[/home/martinus/SLACKBUILDS/nsis]# tar vxjf nsis-2.46-src.tar.bz2
    ......
    ......
    nsis-2.46-src/Source/Tests/memcpy.c
    nsis-2.46-src/Source/Tests/mmap.cpp
    nsis-2.46-src/Source/Tests/preprocessor.nsi
    nsis-2.46-src/Source/Tests/ResourceEditor.cpp
    nsis-2.46-src/Source/Tests/root.txt
    nsis-2.46-src/Source/Tests/SConscript
    nsis-2.46-src/Source/Tests/specmatch.cpp
    nsis-2.46-src/Source/Tests/textrunner.cpp
    nsis-2.46-src/Source/Tests/winchar.cpp
    nsis-2.46-src/Source/Tests/winver.nsi
    nsis-2.46-src/Source/tokens.cpp
    nsis-2.46-src/Source/tokens.h
    nsis-2.46-src/Source/uservars.h
    nsis-2.46-src/Source/util.cpp
    nsis-2.46-src/Source/util.h
    nsis-2.46-src/Source/winchar.cpp
    nsis-2.46-src/Source/winchar.h
    nsis-2.46-src/Source/writer.cpp
    nsis-2.46-src/Source/writer.h
    nsis-2.46-src/Source/zlib/
    nsis-2.46-src/Source/zlib/deflate.c
    nsis-2.46-src/Source/zlib/DEFLATE.H
    nsis-2.46-src/Source/zlib/INFBLOCK.C
    nsis-2.46-src/Source/zlib/trees.c
    nsis-2.46-src/Source/zlib/ZCONF.H
    nsis-2.46-src/Source/zlib/ZLIB.H
    nsis-2.46-src/Source/zlib/ZUTIL.H
    nsis-2.46-src/TODO.txt
    martinus@martinusadyh:[/home/martinus/SLACKBUILDS/nsis]#
    



Sekarang masuk-lah kedalam direktori **nsis-2.46-src** kemudian install-lah NSIS (Nullsoft Scriptable Install System) dengan mengarahkan opsi **PREFIX**-nya ke direktori **/usr/nsis-2.46** seperti dibawah ini :

    
    
    martinus@martinusadyh:[/home/martinus/SLACKBUILDS/nsis]# cd nsis-2.46-src
    martinus@martinusadyh:[/home/martinus/SLACKBUILDS/nsis/nsis-2.46-src]# scons SKIPSTUBS=all \
    >   SKIPPLUGINS=all \
    >   SKIPUTILS=all \
    >   SKIPMISC=all \
    >   NSIS_CONFIG_CONST_DATA_PATH=no \
    >   PREFIX=/usr/nsis-2.46 \
    >   install-compiler
    scons: Reading SConscript files ...
    Mkdir("build/release/config")
    Delete("nsis-24-Dec-2009.cvs")
    Delete(".instdist")
    Delete(".test")
    Using GNU tools configuration
    Checking for compiler flag -m32... yes
    Checking for linker flag -m32... yes
    Checking for linker flag $MAP_FLAG... yes
    Checking for linker flag -s... yes
    Checking for linker flag $MAP_FLAG... yes
    Checking for compiler flag -m32... yes
    Checking for linker flag -m32... yes
    Checking for linker flag -s... yes
    Checking for compiler flag -m32... yes
    Checking for linker flag -m32... yes
    Checking for memcpy requirement... no
    Checking for memset requirement... no
    Checking for linker flag -pthread... yes
    Checking for __BIG_ENDIAN__... no
    Checking for C library gdi32... no
    Checking for C library user32... no
    Checking for C library pthread... yes
    Checking for C library iconv... no
    Checking for C library dl... yes
    Checking for C library gdi32... no
    Checking for C library iconv... no
    Checking for C library pthread... yes
    Checking for C library user32... no
    Checking for C++ library cppunit... no
    scons: done reading SConscript files.
    scons: Building targets ...
    g++ -o build/release/makensis/build.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/build.cpp
    g++ -o build/release/makensis/clzma.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/clzma.cpp
    gcc -o build/release/makensis/crc32.o -c -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/crc32.c
    g++ -o build/release/makensis/DialogTemplate.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/DialogTemplate.cpp
    g++ -o build/release/makensis/dirreader.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/dirreader.cpp
    g++ -o build/release/makensis/fileform.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/fileform.cpp
    g++ -o build/release/makensis/growbuf.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/growbuf.cpp
    g++ -o build/release/makensis/icon.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/icon.cpp
    g++ -o build/release/makensis/lang.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/lang.cpp
    g++ -o build/release/makensis/lineparse.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/lineparse.cpp
    g++ -o build/release/makensis/makenssi.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/makenssi.cpp
    g++ -o build/release/makensis/manifest.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/manifest.cpp
    g++ -o build/release/makensis/mmap.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/mmap.cpp
    g++ -o build/release/makensis/Plugins.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/Plugins.cpp
    g++ -o build/release/makensis/ResourceEditor.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/ResourceEditor.cpp
    g++ -o build/release/makensis/ResourceVersionInfo.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/ResourceVersionInfo.cpp
    g++ -o build/release/makensis/script.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/script.cpp
    g++ -o build/release/makensis/ShConstants.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/ShConstants.cpp
    g++ -o build/release/makensis/strlist.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/strlist.cpp
    g++ -o build/release/makensis/tokens.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/tokens.cpp
    g++ -o build/release/makensis/util.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/util.cpp
    g++ -o build/release/makensis/winchar.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/winchar.cpp
    g++ -o build/release/makensis/writer.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/writer.cpp
    gcc -o build/release/makensis/bzip2/blocksort.o -c -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/bzip2/blocksort.c
    gcc -o build/release/makensis/bzip2/bzlib.o -c -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/bzip2/bzlib.c
    gcc -o build/release/makensis/bzip2/compress.o -c -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/bzip2/compress.c
    gcc -o build/release/makensis/bzip2/huffman.o -c -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/bzip2/huffman.c
    g++ -o build/release/makensis/7zip/7zGuids.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -DCOMPRESS_MF_BT -Ibuild/release/config Source/7zip/7zGuids.cpp
    g++ -o build/release/makensis/7zip/7zip/Common/OutBuffer.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -DCOMPRESS_MF_BT -Ibuild/release/config Source/7zip/7zip/Common/OutBuffer.cpp
    g++ -o build/release/makensis/7zip/7zip/Common/StreamUtils.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -DCOMPRESS_MF_BT -Ibuild/release/config Source/7zip/7zip/Common/StreamUtils.cpp
    g++ -o build/release/makensis/7zip/7zip/Compress/LZ/LZInWindow.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -DCOMPRESS_MF_BT -Ibuild/release/config Source/7zip/7zip/Compress/LZ/LZInWindow.cpp
    g++ -o build/release/makensis/7zip/7zip/Compress/LZMA/LZMAEncoder.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -DCOMPRESS_MF_BT -Ibuild/release/config Source/7zip/7zip/Compress/LZMA/LZMAEncoder.cpp
    Source/7zip/7zip/Compress/LZMA/LZMAEncoder.cpp: In member function 'LONG NCompress::NLZMA::CEncoder::GetOptimumFast(UInt32, UInt32&, UInt32&)':
    Source/7zip/7zip/Compress/LZMA/LZMAEncoder.cpp:1223: warning: suggest parentheses around && within ||
    Source/7zip/7zip/Compress/LZMA/LZMAEncoder.cpp:1224: warning: suggest parentheses around && within ||
    Source/7zip/7zip/Compress/LZMA/LZMAEncoder.cpp:1239: warning: suggest parentheses around && within ||
    Source/7zip/7zip/Compress/LZMA/LZMAEncoder.cpp:1241: warning: suggest parentheses around && within ||
    g++ -o build/release/makensis/7zip/7zip/Compress/RangeCoder/RangeCoderBit.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -DCOMPRESS_MF_BT -Ibuild/release/config Source/7zip/7zip/Compress/RangeCoder/RangeCoderBit.cpp
    g++ -o build/release/makensis/7zip/Common/Alloc.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -DCOMPRESS_MF_BT -Ibuild/release/config Source/7zip/Common/Alloc.cpp
    g++ -o build/release/makensis/7zip/Common/CRC.o -c -Wno-non-virtual-dtor -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -DCOMPRESS_MF_BT -Ibuild/release/config Source/7zip/Common/CRC.cpp
    gcc -o build/release/makensis/zlib/deflate.o -c -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/zlib/deflate.c
    gcc -o build/release/makensis/zlib/trees.o -c -Wall -O2 -m32 "-DNSISCALL= __attribute__((__stdcall__))" -D_WIN32_IE=0x0500 -Ibuild/release/config Source/zlib/trees.c
    g++ -o build/release/makensis/makensis -m32 -Wl,-Map,build/release/makensis/makensis.map -s -pthread build/release/makensis/build.o build/release/makensis/clzma.o build/release/makensis/crc32.o build/release/makensis/DialogTemplate.o build/release/makensis/dirreader.o build/release/makensis/fileform.o build/release/makensis/growbuf.o build/release/makensis/icon.o build/release/makensis/lang.o build/release/makensis/lineparse.o build/release/makensis/makenssi.o build/release/makensis/manifest.o build/release/makensis/mmap.o build/release/makensis/Plugins.o build/release/makensis/ResourceEditor.o build/release/makensis/ResourceVersionInfo.o build/release/makensis/script.o build/release/makensis/ShConstants.o build/release/makensis/strlist.o build/release/makensis/tokens.o build/release/makensis/util.o build/release/makensis/winchar.o build/release/makensis/writer.o build/release/makensis/bzip2/blocksort.o build/release/makensis/bzip2/bzlib.o build/release/makensis/bzip2/compress.o build/release/makensis/bzip2/huffman.o build/release/makensis/7zip/7zGuids.o build/release/makensis/7zip/7zip/Common/OutBuffer.o build/release/makensis/7zip/7zip/Common/StreamUtils.o build/release/makensis/7zip/7zip/Compress/LZ/LZInWindow.o build/release/makensis/7zip/7zip/Compress/LZMA/LZMAEncoder.o build/release/makensis/7zip/7zip/Compress/RangeCoder/RangeCoderBit.o build/release/makensis/7zip/Common/Alloc.o build/release/makensis/7zip/Common/CRC.o build/release/makensis/zlib/deflate.o build/release/makensis/zlib/trees.o -lpthread
    Install file: "build/release/makensis/makensis" as "/usr/nsis-2.46/makensis"
    scons: done building targets.
    martinus@martinusadyh:[/home/martinus/SLACKBUILDS/nsis/nsis-2.46-src]#
    



Proses installasi diatas akan membuat sebuah file dengan nama **makensis** yang terdapat didalam direktori **/usr/nsis-2.46/**, agar file **makensis** ini dapat dikenali di sistem sekarang buatlah sebuah **symbolic link** ke direktori **/bin** seperti perintah dibawah ini:

    
    
    martinus@martinusadyh:[/home/martinus/SLACKBUILDS/nsis/nsis-2.46-src]# ln -sf /usr/nsis-2.46/makensis /bin/makensis
    martinus@martinusadyh:[/home/martinus/SLACKBUILDS/nsis/nsis-2.46-src]#
    



Sekarang cek, apakah perintah **makensis** sudah benar mengarah ke direktori **/usr/nsis-2.46/makensis** atau belum dengan perintah seperti dibawah ini:

    
    
    martinus@martinusadyh:[~]$ ls -l `which makensis`
    lrwxrwxrwx 1 root root 23 2009-12-24 04:43 /bin/makensis -> /usr/nsis-2.46/makensis
    martinus@martinusadyh:[~]$
    



Untuk membuktikan berhasil atau tidaknya proses installasi kita, sekarang copi-lah dahulu file **example1.nsi** yang terdapat pada direktori **/usr/nsis-2.46/Examples** kedalam direktori **home** anda seperti dibawah ini :

    
    
    martinus@martinusadyh:[~]$ cp /usr/nsis-2.46/Examples/example1.nsi ~/
    martinus@martinusadyh:[~]$ ls example1.*
    example1.nsi
    martinus@martinusadyh:[~]$
    



Jika sudah sekarang mari kita coba buat sebuah installer berdasarkan file **example1.nsi** yang ber-ekstensi **exe** dengan menggunakan perintah **makensis** seperti perintah dibawah ini :

    
    
    martinus@martinusadyh:[~]$ makensis example1.nsi
    MakeNSIS v23-Dec-2009.cvs - Copyright 1995-2009 Contributors
    See the file COPYING for license details.
    Credits can be found in the Users Manual.
    
    Processing config:
    Processing plugin dlls: "/usr/nsis-2.46/Plugins/*.dll"
     - AdvSplash::show
     - Banner::destroy
     - Banner::getWindow
     - Banner::show
     - BgImage::AddImage
     - BgImage::AddText
     - BgImage::Clear
     - BgImage::Destroy
     - BgImage::Redraw
     - BgImage::SetBg
     - BgImage::SetReturn
     - BgImage::Sound
     - Dialer::AttemptConnect
     - Dialer::AutodialHangup
     - Dialer::AutodialOnline
     - Dialer::AutodialUnattended
     - Dialer::GetConnectedState
     - InstallOptions::dialog
     - InstallOptions::initDialog
     - InstallOptions::show
     - LangDLL::LangDialog
     - Math::Script
     - NSISdl::download
     - NSISdl::download_quiet
     - Splash::show
     - StartMenu::Init
     - StartMenu::Select
     - StartMenu::Show
     - System::Alloc
     - System::Call
     - System::Copy
     - System::Free
     - System::Get
     - System::Int64Op
     - System::Store
     - TypeLib::GetLibVersion
     - TypeLib::Register
     - TypeLib::UnRegister
     - UserInfo::GetAccountType
     - UserInfo::GetName
     - UserInfo::GetOriginalAccountType
     - VPatch::GetFileCRC32
     - VPatch::GetFileMD5
     - VPatch::vpatchfile
     - nsDialogs::Create
     - nsDialogs::CreateControl
     - nsDialogs::CreateItem
     - nsDialogs::CreateTimer
     - nsDialogs::GetUserData
     - nsDialogs::KillTimer
     - nsDialogs::OnBack
     - nsDialogs::OnChange
     - nsDialogs::OnClick
     - nsDialogs::OnNotify
     - nsDialogs::SelectFileDialog
     - nsDialogs::SelectFolderDialog
     - nsDialogs::SetRTL
     - nsDialogs::SetUserData
     - nsDialogs::Show
     - nsExec::Exec
     - nsExec::ExecToLog
     - nsExec::ExecToStack
    
    !define: "MUI_INSERT_NSISCONF"=""
    
    Changing directory to: "/home/martinus"
    
    Processing script file: "example1.nsi"
    Name: "Example1"
    OutFile: "example1.exe"
    InstallDir: "$DESKTOP\Example1"
    Page: directory
    Page: instfiles
    Section: ""
    SetOutPath: "$INSTDIR"
    File: "example1.nsi" [compress] 433/908 bytes
    SectionEnd
    
    Processed 1 file, writing output:
    Processing pages... Done!
    Removing unused resources... Done!
    Generating language tables... Done!
    
    Output: "example1.exe"
    Install: 3 pages (192 bytes), 1 section (1048 bytes), 3 instructions (84 bytes), 44 strings (876 bytes), 1 language table (230 bytes).
    
    Using zlib compression.
    
    EXE header size:               34304 / 35840 bytes
    Install code:                    843 / 2758 bytes
    Install data:                    437 / 912 bytes
    CRC (0x950736BB):                  4 / 4 bytes
    
    Total size:                    35588 / 39514 bytes (90.0%)
    martinus@martinusadyh:[~]$
    



Sekarang cek lagi, apakah file **exe** sudah benar-benar terbentuk atau belum dengan mengetikkan perintah seperti dibawah ini:

    
    
    martinus@martinusadyh:[~]$ ls example1.*
    example1.exe  example1.nsi
    martinus@martinusadyh:[~]$
    



Nah jika sudah selesai, sekarang coba-lah file **example1.exe** tersebut dijalankan pada Sistem Operasi Windows bisa atau tidak :) Dengan ada-nya project NSIS yang bisa dijalankan di Sistem Operasi selain Microsoft Windows, kita sekarang bisa membuat sebuah installer untuk Microsoft Windows tanpa perlu membeli ataupun membajak Microsoft Windows lagi dan kita juga tidak perlu menggunakan WINE lagi. Enak dan mudah bukan ?? Bagaimana teman-teman, masih butuh Microsoft Windows ? :D :)

**Link-link terkait : **
- [Situs Resmi Project NSIS](http://nsis.sourceforge.net/)
- [Daftar Project Yang Menggunakan NSIS Sebagai Installernya](http://nsis.sourceforge.net/Users)
- [POSIX](http://en.wikipedia.org/wiki/POSIX)
- [Tutorial Menggunakan NSIS](http://nsis.sourceforge.net/Docs/)
- [SlackBuild Script dan Binary Packages Untuk Slackware 13.0](http://artivisi.com/~martinus/downloads/Slackware/SlackBuild/13.0_32/nsis/)
