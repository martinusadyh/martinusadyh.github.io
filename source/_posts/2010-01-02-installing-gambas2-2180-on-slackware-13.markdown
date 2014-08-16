---
comments: true
date: 2010-01-02 00:06:06+00:00
layout: post
slug: installing-gambas2-2180-on-slackware-13
title: Installing Gambas2-2.18.0 On Slackware 13
wordpress_id: 95
categories:
- Slackware
---

Tulisan ini hanya untuk teman-teman yang bingung bagaimana menginstall gambas2-2.18.0 di mesin Slackware 13.0, soalnya saya sendiri cari-cari belum ketemu :D Nah langkah pertama yang harus dilakukan yaitu download dulu **binary packages** yang sudah dibuat oleh temen-temen slackers dari [slacky.eu](http://www.slacky.eu/aadm/pkgs/index.php?ver=13&pkg=134) yang bisa di download [disini](http://repository.slacky.eu/slackware-13.0/development/gambas2/2.18.0/gambas2-2.18.0-i486-1sl.txz) dan simpanlah pada direktori **~/gambas** seperti dibawah ini :

    
    
    martinus@martinusadyh:[~]$ mkdir ~/gambas
    martinus@martinusadyh:[~]$ cd gambas
    martinus@martinusadyh:[~/gambas]$ wget -c http://repository.slacky.eu/slackware-13.0/development/gambas2/2.18.0/gambas2-2.18.0-i486-1sl.txz
    --2010-01-02 06:53:57--  http://repository.slacky.eu/slackware-13.0/development/gambas2/2.18.0/gambas2-2.18.0-i486-1sl.txz
    Resolving repository.slacky.eu... 151.1.182.109
    Connecting to repository.slacky.eu|151.1.182.109|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 11079204 (11M) [text/plain]
    Saving to: `gambas2-2.18.0-i486-1sl.txz'
    
    100%[==============================================================================================================================>] 11,079,204  11.1K/s   in 11m 11s
    
    2010-01-02 07:05:10 (16.1 KB/s) - `gambas2-2.18.0-i486-1sl.txz' saved [11079204/11079204]
    
    martinus@martinusadyh:[~/gambas]$
    



Karena Slackware 13.0 sudah menggunakan KDE4 yang notabene pakai Qt4, maka kita harus meng-install library **qt3** agar aplikasi gambas2 dapat berjalan dengan semestinya. Sekarang download dahulu packages **qt3** yang bisa kita download [disini](http://ftp.pnfi.depdiknas.go.id/slackware/slackware-13.0/extra/kde3-compat/qt3-3.3.8b-i486-opt1.txz) dan simpanlah pada direktori **~/gambas** yang sudah dibuat pada langkah sebelum-nya seperti dibawah ini :

    
    
    martinus@martinusadyh:[~/gambas]$ wget -c http://ftp.pnfi.depdiknas.go.id/slackware/slackware-13.0/extra/kde3-compat/qt3-3.3.8b-i486-opt1.txz
    --2010-01-02 06:54:09--  http://ftp.pnfi.depdiknas.go.id/slackware/slackware-13.0/extra/kde3-compat/qt3-3.3.8b-i486-opt1.txz
    Resolving ftp.pnfi.depdiknas.go.id... 118.98.232.229
    Connecting to ftp.pnfi.depdiknas.go.id|118.98.232.229|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 6174072 (5.9M) [application/octet-stream]
    Saving to: `qt3-3.3.8b-i486-opt1.txz'
    
    100%[==============================================================================================================================>] 6,174,072   26.0K/s   in 3m 49s
    
    2010-01-02 06:57:58 (26.4 KB/s) - `qt3-3.3.8b-i486-opt1.txz' saved [6174072/6174072]
    
    martinus@martinusadyh:[~/gambas]$
    


<!-- more -->
Setelah semua-nya selesai, sekarang ganti hak akses anda menjadi **root** kemudian mari kita install dengan menjalankan perintah **installpkg *.txz** seperti dibawah ini :

    
    
    martinus@martinusadyh:[~/gambas]$ su
    Password:
    root@martinusadyh:[/home/martinus/gambas]# installpkg *.txz
    Verifying package gambas2-2.18.0-i486-1sl.txz.
    Installing package gambas2-2.18.0-i486-1sl.txz:
    PACKAGE DESCRIPTION:
    # Gambas 2 (BASIC IDE for Linux)
    #
    # Gambas is a free development environment based on a Basic interpreter
    # with object extensions, like Visual Basic(TM) (but it is NOT a clone )
    #
    Executing install script for gambas2-2.18.0-i486-1sl.txz.
    Package gambas2-2.18.0-i486-1sl.txz installed.
    
    Verifying package qt3-3.3.8b-i486-opt1.txz.
    Installing package qt3-3.3.8b-i486-opt1.txz:
    PACKAGE DESCRIPTION:
    # Qt3 (a multi-platform C++ graphical user interface toolkit, version 3)
    #
    # Qt is a complete and well-developed object-oriented framework for
    # developing graphical user interface (GUI) applications using C++.
    #
    # This release is free only for development of free software for the X
    # Window System.  If you use Qt for developing commercial or other
    # non-free software, you must have a professional license.  Please see
    # http://www.trolltech.com/purchase.html for information on how to
    # obtain a professional license.
    #
    Executing install script for qt3-3.3.8b-i486-opt1.txz.
    Package qt3-3.3.8b-i486-opt1.txz installed.
    
    root@martinusadyh:[/home/martinus/gambas]#
    



Sekarang coba jalankan perintah **gambas2** dari terminal atau konsole maka harus-nya IDE gambas akan tampil :) Hm.. tapi seperti-nya ada yang aneh, yups tampilan **font** di gambas koq besar-besar yah seperti gambar dibawah ini :









[![gambas1](http://farm3.static.flickr.com/2679/4235430156_c97f78a36c.jpg)  
Tampilan Awal IDE Gambas](http://www.flickr.com/photos/10243554@N02/4235430156/)




[![gambas2](http://farm5.static.flickr.com/4025/4235430160_b1145edc05.jpg)  
Tampilan Preferences IDE Gambas](http://www.flickr.com/photos/10243554@N02/4235430160/)






Nah agar tampilan **font**-nya tidak besar-besar seperti gambar diatas, sekarang buatlah sebuah file dengan nama **qtrc** kemudian simpan-lah pada direktori **~/.qt/**. Sedangkan isi dari file **qtrc** adalah sebagai berikut :

    
    
    [General]
    font=Sans,10,-1,5,0,0,0,0,0,0
    



Sekarang coba jalankan lagi gambas-nya, dan jika konfigurasi yang sudah dilakukan benar maka tampilan-nya akan tampak seperti gambar dibawah ini :









[![gambas3](http://farm5.static.flickr.com/4005/4235430162_2ec48c68a5.jpg)  
Tampilan Awal IDE Gambas Dengan Font Tidak Terlalu Besar](http://www.flickr.com/photos/10243554@N02/4235430162/)




[![gambas4](http://farm5.static.flickr.com/4001/4235430166_25377f0dc4.jpg)  
Tampilan Preferences IDE Gambas Dengan Font Tidak Terlalu Besar](http://www.flickr.com/photos/10243554@N02/4235430166/)






**Note:**
- Dari seluruh proses diatas, ketika kita menjalankan gambas akan keluar error kurang lebih seperti berikut :

    
    
    martinus@martinusadyh:[~]$ gambas2
    ERROR: ld.so: object 'libqt-mt.so.3' from LD_PRELOAD cannot be preloaded: ignored.
    


:D Saya belum tahu bagaimana menyelesaikan masalah ini, tapi IDE Gambas2 tetap bisa digunakan :D

Nah bagaimana teman-teman ? :D Tertarik mencoba gambas ? Saya sendiri belum pernah bermain-main dengan **Visual Basic** soalnya, tulisan ini cuma rasa ingin tahu saya bagaimana sih tampilan aplikasi yang dibuat dari Gambas itu :D :)
