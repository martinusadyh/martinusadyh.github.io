---
comments: true
date: 2011-06-19 16:32:06+00:00
layout: post
slug: enabling-multilib-on-slackware64-13-37
title: Enabling Multilib on Slackware64 13.37
wordpress_id: 1366
categories:
- Slackware
tags:
- Google Talk
- googletalk-plugin
- GTalk
- plugin
- Slackware
- Slackware64
---

Setelah webcam terdeteksi di Slackware melalui bantuan aplikasi Cheese, sekarang waktunya untuk mencoba menginstall googletalk-plugin dari google :) Kenapa tidak menggunakan Skype ? Karena menurut pendapat saya Skype itu lebih berat daripada Google Talk :D Nah minggu kemarin ketika menginstall googletalk-plugin di Slackware64, ternyata googletalk-plugin ini membutuhkan library untuk arsitektur 32 bit dan ini bisa kita lihat dengan perintah `file /opt/google/talkplugin/*` seperti dibawah ini :

    root@artivisi:/mnt/DATA/SLACKBUILDS/googletalk-plugin# file /opt/google/talkplugin/*
    /opt/google/talkplugin/GoogleTalkPlugin:         ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), stripped
    /opt/google/talkplugin/cron:                     directory
    /opt/google/talkplugin/lib:                      directory
    /opt/google/talkplugin/libnpgoogletalk64.so:     ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, stripped
    /opt/google/talkplugin/libnpgtpo3dautoplugin.so: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, stripped
    /opt/google/talkplugin/openssl.txt:              ASCII English text
    /opt/google/talkplugin/windowpicker.glade:       XML document text

Dari hasil perintah diatas, kita bisa melihat bahwa file `/opt/google/talkplugin/GoogleTalkPlugin` ternyata merupakan file executable untuk arsitektur 32bit, nah untung-nya di Slackware64 sudah mendukung penggunaan multilib yang maksudnya kita bisa menggunakan aplikasi berbasis 32bit di arsitektur 64bit :) Dengan mengaktifkan dukungan multilib pada Slackware64, maka kita akan dapat menggunakan aplikasi seperti Skype, Wine atau aplikasi 32bit lain-nya yang belum terdapat di arsitektur 64 bit :)

Nah tulisan ini murni merupakan langkah-langkah yang sudah dijelaskan pada halaman [Multilib Slackware for x86_64](http://alien.slackbook.org/dokuwiki/doku.php?id=slackware:multilib), dan saya posting ulang disini supaya **saya tidak lupa apa yang saya lakukan sekarang** :D
<!-- more -->
Nah daripada melakukan kompilasi satu persatu, kita dapat menggunakan cara yang lebih mudah yaitu mendownload binary package yang sudah disediakan oleh Fred Emmott dan Eric Hameleers pada repository [http://slackware.com/~alien/multilib/](http://slackware.com/~alien/multilib/). Download semua binary package pada repository diatas yang sesuai dengan versi Slackware yang kita gunakan, karena saya menggunakan Slackware64 13.37 maka jalankan perintah `lftp -c 'open http://slackware.com/~alien/multilib/ ; mirror 13.37'` seperti dibawah ini :

    martinus@artivisi:[/mnt/DATA/SLACKBUILDS/multilib/]$ lftp -c 'open http://slackware.com/~alien/multilib/ ; mirror 13.37'
    cd: received redirection to `http://connie.slackware.com/~alien/multilib/'
    martinus@artivisi:[/mnt/DATA/SLACKBUILDS/multilib/]$


Jika sudah, sekarang masuklah pada direktori yang sesuai dengan versi Slackware yang kita gunakan, dan jalankan perintah `upgradepkg --reinstall --install-new *.t?z` untuk melakukan proses upgrade package gcc dan glibc ke versi multilib seperti dibawah ini :

    root@artivisi:/mnt/DATA/SLACKBUILDS/multilib/13.37# upgradepkg --reinstall --install-new *.t?z
    
    +==============================================================================
    | Installing new package ./compat32-tools-2.1-noarch-9alien.tgz
    +==============================================================================
    
    Verifying package compat32-tools-2.1-noarch-9alien.tgz.
    Installing package compat32-tools-2.1-noarch-9alien.tgz:
    PACKAGE DESCRIPTION:
    # compat32-tools (32bit compatibility tools for 64bit Slackware)
    #
    # The compat32-tools are a series of scripts that allow
    # the user to add a 32bit compatibility layer (multilib)
    # to 64bit Slackware.
    #
    # Written by Fred Emmott and Eric Hameleers
    #
    Executing install script for compat32-tools-2.1-noarch-9alien.tgz.
    Package compat32-tools-2.1-noarch-9alien.tgz installed.
    
    
    +==============================================================================
    | Upgrading gcc-4.5.2-x86_64-2 package using ./gcc-4.5.2_multilib-x86_64-2alien.txz
    +==============================================================================
    
    Pre-installing package gcc-4.5.2_multilib-x86_64-2alien...
    
    Removing package /var/log/packages/gcc-4.5.2-x86_64-2-upgraded-2011-06-19,15:04:58...
    
    Verifying package gcc-4.5.2_multilib-x86_64-2alien.txz.
    Installing package gcc-4.5.2_multilib-x86_64-2alien.txz:
    PACKAGE DESCRIPTION:
    # gcc (Base GCC package with C support)
    #
    # GCC is the GNU Compiler Collection.
    #
    # This package contains those parts of the compiler collection needed to
    # compile C code.  Other packages add C++, Fortran, Objective-C, and
    # Java support to the compiler core.
    #
    Executing install script for gcc-4.5.2_multilib-x86_64-2alien.txz.
    Package gcc-4.5.2_multilib-x86_64-2alien.txz installed.
    
    Package gcc-4.5.2-x86_64-2 upgraded with new package ./gcc-4.5.2_multilib-x86_64-2alien.txz.
    
    ....
    ....
    ....
    Verifying package glibc-zoneinfo-2.13_multilib-noarch-4alien.txz.
    Installing package glibc-zoneinfo-2.13_multilib-noarch-4alien.txz:
    PACKAGE DESCRIPTION:
    # glibc-zoneinfo (timezone database)
    #
    # This package allows you to configure your time zone.
    #
    # This timezone database comes from the tzdata and tzcode packages by
    # Arthur David Olson et.al.  The latest version and more information
    # may be found at ftp://elsie.nci.nih.gov/pub/
    #
    # Use the timeconfig utility to set your local time zone.
    #
    Executing install script for glibc-zoneinfo-2.13_multilib-noarch-4alien.txz.
    Package glibc-zoneinfo-2.13_multilib-noarch-4alien.txz installed.
    
    Package glibc-zoneinfo-2.13-noarch-4 upgraded with new package ./glibc-zoneinfo-2.13_multilib-noarch-4alien.txz.
    
    root@artivisi:/mnt/DATA/SLACKBUILDS/multilib/13.37# 

Setelah selesai, sekarang install-lah package compatibility agar kita bisa menjalankan aplikasi berbasis 32-bit dengan cara masuk pada direktori `slackware64-compat32` dan jalankan perintah `upgradepkg --install-new *-compat32/*.t?z` seperti dibawah ini :

    root@artivisi:/mnt/DATA/SLACKBUILDS/multilib/13.37# cd slackware64-compat32/
    root@artivisi:/mnt/DATA/SLACKBUILDS/multilib/13.37/slackware64-compat32# upgradepkg --install-new *-compat32/*.t?z
    
    +==============================================================================
    | Installing new package a-compat32/aaa_elflibs-compat32-13.37-x86_64-7.txz
    +==============================================================================
    
    Verifying package aaa_elflibs-compat32-13.37-x86_64-7.txz.
    Installing package aaa_elflibs-compat32-13.37-x86_64-7.txz:
    PACKAGE DESCRIPTION:
    # aaa_elflibs-compat32 (shared libraries needed by many programs)
    #
    # This is a collection of shared libraries needed to run Linux programs.
    # ELF (Executable and Linking Format) is the standard Linux binary 
    # format.  These libraries are gathered from other Slackware packages
    # and are intended to give a fairly complete initial set of libraries.
    # This package should be not upgraded or reinstalled (it could copy
    # over newer library versions).
    #
    # This package contains 32-bit compatibility binaries.
    Executing install script for aaa_elflibs-compat32-13.37-x86_64-7.txz.
    Package aaa_elflibs-compat32-13.37-x86_64-7.txz installed.
    
    ...
    ...
    ...
    
    +==============================================================================
    | Installing new package xap-compat32/sane-compat32-1.0.22-x86_64-2.txz
    +==============================================================================
    
    Verifying package sane-compat32-1.0.22-x86_64-2.txz.
    Installing package sane-compat32-1.0.22-x86_64-2.txz:
    PACKAGE DESCRIPTION:
    # sane-compat32 (Scanner Access Now Easy)
    #
    # SANE is a universal scanner interface that provides standardized
    # access to any raster image scanner hardware, such as flatbed scanners,
    # hand-held scanners, video and still cameras, frame-grabbers, and other
    # similar devices.
    #
    # This package contains 32-bit compatibility binaries.
    Executing install script for sane-compat32-1.0.22-x86_64-2.txz.
    Package sane-compat32-1.0.22-x86_64-2.txz installed.
    
    root@artivisi:/mnt/DATA/SLACKBUILDS/multilib/13.37/slackware64-compat32# 


Nah sampai disini kita sudah dapat menggunakan / menginstall aplikasi berbasis 32-bit pada Slackware64 kita dengan aman dan nyaman :)
**Catatan:**

  1. **Menjalankan Aplikasi 32-bit,**
Setelah melakukan proses diatas, kita sudah bisa menginstall dan menggunakan aplikasi 32-bit di Slackware64 secara normal. Dan jika aplikasi yang kita jalankan membutuhkan library 32-bit, kita bisa melakukan proses konversi library dari 32-bit ke 64-bit dengan menggunakan aplikasi `convertpkg-compat32` pada package 32-bit dan menginstall hasil dari proses konversi ini ke  Slackware64.

  2. **Kompilasi Aplikasi 32-bit,**
Jika kita ingin melakukan kompilasi untuk aplikasi 32-bit pada Slackware64, sebelum melakukan kompilasi persiapkan dahulu environment kita dengan menjalankan perintah ` . /etc/profile.d/32dev.sh` (perhatikan tanda titik, titik disini merupakan bagian dari perintah yang harus kita ketikkan). Setelah menjalankan prosedur ini, kita bisa menggunakan SlackBuild standart untuk membangun aplikasi 32-bit untuk Slackware64. Ada beberapa yang perlu diperhatikan yaitu :

    1. Kita harus tetap mendefinisikan variabel `ARCH` ke `'x86_64'` meskipun kita mengkompilasi aplikasi 32-bit


    2. Gantilah nilai dari variabel `LIBDIRSUFFIX="64"` ke `LIBDIRSUFFIX=""` supaya direktori library yang digunakan dalam proses kompilasi adalah `lib/` bukannya `lib64/`

Nah hasil dari seluruh proses diatas adalah akhirnya saya bisa menggunakan webcam saya di googletalk seperti terlihat pada gambar dibawah ini :

{% img center /images/blog-images/linux/EnablingMultilibOnSlackware64_1337/Screenshot-1.png GoogleTalk Plugin Slackware64 %}


Referensi-referensi :

  1. [Halaman README Multilib Slackware64](http://connie.slackware.com/~alien/multilib/)
  2. [Google TalkPlugin SlackBuild Script](http://slackbuilds.org/repository/13.37/multimedia/google-talkplugin/)