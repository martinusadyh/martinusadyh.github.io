---
comments: true
date: 2011-05-24 15:27:16+00:00
layout: post
slug: step-by-step-building-openjdk-on-slackware
title: Step By Step Building OpenJDK on Slackware
wordpress_id: 1332
categories:
- Java
- Slackware
tags:
- android sdk
- Java
- java swing
- OpenJDK
- Slackware
---

{% img center /images/blog-images/linux/StepByStepBuildingOpenJDK/openjdk.png OpenJDK %}

Tidak seperti pada distro GNU/Linux yang lain, pada distro Slackware ternyata sangat susah mencari binary package untuk [OpenJDK](http://openjdk.java.net/) yang tinggal install menggunakan perintah `installpkg` ataupun tutorial bagaimana membuat sebuah binary packages untuk Slackware. Nah pada posting kali ini, kita akan mencoba untuk melakukan proses kompilasi source code [OpenJDK](http://openjdk.java.net/) langsung dari repository-nya. Dan sekedar catatan, proses yang akan dijelaskan disini hanya sampai mendapatkan **JDK** maupun **JRE** yang siap digunakan dalam bentuk direktori saja bukan dalam bentuk binary Slackware yang ber-ekstensi ***.tgz** atau ***.txz** :) 

Sebelum mulai, persiapkan dahulu beberapa alat yang dibutuhkan yaitu :

  * **Apache ANT,** versi [Apache ANT](http://ant.apache.org/) yang dibutuhkan untuk melakukan proses kompilasi pada OpenJDK adalah versi 7, jadi pastikan versi Apache ANT yang terinstall di sistem kita mempunyai versi yang sama atau lebih tinggi. Untuk melakukan installasi Apache ANT di Slackware, downloadlah SlackBuild Script Apache ANT [disini](http://slackbuilds.org/slackbuilds/13.37/development/apache-ant.tar.gz) dan source Apache ANT-nya bisa didownload [disini](http://www.carfab.com/apachesoftware/ant/binaries/apache-ant-1.8.2-bin.tar.bz2).

  * **JDK 1.6.0_25**, untuk menginstall JDK kita bisa menggunakan package binary JDK bawaan Slackware yang terdapat di direktori `/extra/jdk-6/`. Installah dengan menggunakan perintah `installpkg jdk-6u25-x86_64-1.txz` agar segera dapat digunakan :)

Setelah 2 kebutuhan dasar tersebut terinstall, sekarang mari kita persiapkan konfigurasi **"environment variable"** yang dibutuhkan oleh [OpenJDK](http://openjdk.java.net/). Beberapa konfigurasi **"environment variable"** yang dibutuhkan adalah (lakukan konfigurasi dibawah ini menggunakan akses super user / root) :

  * **JAVA_HOME**, 
  lakukan pengecekan apakah variabel **JAVA_HOME** sudah terkonfigurasi pada sistem anda atau belum dengan mengetikkan `echo $JAVA_HOME` dan jika benar, maka hasil perintah tersebut akan menampilkan dimana letak direktori **jdk** berada seperti dibawah ini : 

    root@artivisi:~# echo $JAVA_HOME
    /usr/lib64/java
    root@artivisi:~#

  Jika perintah `echo $JAVA_HOME` tidak mengeluarkan apa-apa, sekarang jalankan perintah `export JAVA_HOME=/usr/lib64/java` dan kemudian lagi cek dengan perintah `echo $JAVA_HOME`. 

  * **LANG**, ketikkan `export LANG="C"` untuk mengkonfigurasi dan cek dengan mengetikkan perintah `echo $LANG` seperti dibawah ini :

    root@artivisi:~# export LANG="C"
    root@artivisi:~# echo $LANG
    C
    root@artivisi:~# 

  * **ALT_BOOTDIR**, untuk konfigurasi **ALT_BOOTDIR** ini isinya samakan dengan isi variabel **$JAVA_HOME** yang terdapat pada komputer / laptop kita masing-masing. Sebagai contoh di laptop yang digunakan pada tulisan kali ini, isi variabel **$JAVA_HOME** mengarah ke `/usr/lib64/java/` maka jalankan perintah `export ALT_BOOTDIR="/usr/lib64/java/"` dan cek menggunakan perintah `echo $ALT_BOOTDIR` seperti dibawah ini :

    root@artivisi:~# export ALT_BOOTDIR="/usr/lib64/java/"
    root@artivisi:~# echo $ALT_BOOTDIR
    /usr/lib64/java/
    root@artivisi:~#

  * **ANT_HOME**, dan langkah terakhir yaitu mengkonfigurasi variabel **$ANT_HOME**. Jalankan perintah `export ANT_HOME=/usr/share/ant` dan cek menggunakan perintah `echo $ANT_HOME` seperti dibawah ini :

    root@artivisi:~# export ANT_HOME=/usr/share/ant
    root@artivisi:~# echo $ANT_HOME
    /usr/share/ant
    root@artivisi:~# 

<!-- more -->
Jika sudah, sekarang mari kita download source code [OpenJDK 7](http://openjdk.java.net/) dari repository mercurial dengan mengetikkan perintah `hg clone http://hg.openjdk.java.net/jdk7/jdk7 open-jdk7` dan jika sudah harusnya akan tampak seperti dibawah ini :

    root@artivisi:[/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk]$ hg clone http://hg.openjdk.java.net/jdk7/jdk7 open-jdk7
    requesting all changes
    adding changesets
    adding manifests
    adding file changes
    added 340 changesets with 340 changes to 33 files
    updating to branch default
    32 files updated, 0 files merged, 0 files removed, 0 files unresolved
    root@artivisi:[/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk]$


Setelah menjalankan perintah diatas, kita akan mendapatkan sebuah direktori baru dengan nama **open-jdk7**. Masuklah kedalam direktori tersebut dan tambahkanlah akses **execute** pada file `get_source.sh` dan ambil source code [OpenJDK](http://openjdk.java.net/) dengan menjalankan perintah `./get_source.sh` seperti dibawah ini :

    root@artivisi:[/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk]$ cd open-jdk7/
    root@artivisi:[/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7]$ ls
    ASSEMBLY_EXCEPTION  LICENSE  Makefile  README  README-builds.html  THIRD_PARTY_README  get_source.sh  make  test
    root@artivisi:[/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7]$ chmod +x get_source.sh 
    root@artivisi:[/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7]$ ./get_source.sh 
    No repositories to process.
    # Repos:  . ./corba ./hotspot ./jaxp ./jaxws ./jdk ./langtools
    Starting on .
    Starting on ./corba
    Starting on ./hotspot
    Starting on ./jaxp
    Starting on ./jaxws
    Starting on ./jdk
    Starting on ./langtools
    # cd ./jaxp && hg pull -u
    pulling from http://hg.openjdk.java.net/jdk7/jdk7/jaxp
    searching for changes
    no changes found
    # exit code 0
    # cd ./jaxws && hg pull -u
    pulling from http://hg.openjdk.java.net/jdk7/jdk7/jaxws
    searching for changes
    no changes found
    # exit code 0
    # cd ./langtools && hg pull -u
    pulling from http://hg.openjdk.java.net/jdk7/jdk7/langtools
    searching for changes
    no changes found
    # exit code 0
    # cd ./jdk && hg pull -u
    pulling from http://hg.openjdk.java.net/jdk7/jdk7/jdk
    searching for changes
    no changes found
    # exit code 0
    # cd ./hotspot && hg pull -u
    pulling from http://hg.openjdk.java.net/jdk7/jdk7/hotspot
    searching for changes
    no changes found
    # exit code 0
    # cd ./corba && hg pull -u
    pulling from http://hg.openjdk.java.net/jdk7/jdk7/corba
    searching for changes
    no changes found
    # exit code 0
    # cd . && hg pull -u
    pulling from http://hg.openjdk.java.net/jdk7/jdk7
    searching for changes
    no changes found
    # exit code 0


Ketika kita sudah mendapatkan semua source code yang diperlukan, **unset** dahulu variabel **JAVA_HOME** dengan mengetikkan perintah `unset JAVA_HOME` setelah itu jalankan proses pengecekan sekali lagi dengan mengetikkan perintah `gmake sanity` seperti dibawah ini :

    root@artivisi:/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7# unset JAVA_HOME
    root@artivisi:/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7# gmake sanity
    ( cd  ./jdk/make && \
      gmake sanity HOTSPOT_IMPORT_CHECK=false JDK_TOPDIR=/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/jdk JDK_MAKE_SHARED_DIR=/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/jdk/make/common/shared EXTERNALSANITYCONTROL=true SOURCE_LANGUAGE_VERSION=7 TARGET_CLASS_VERSION=7 MILESTONE=internal BUILD_NUMBER=b00 JDK_BUILD_NUMBER=b00 FULL_VERSION=1.7.0-internal-root_2011_05_22_11_02-b00 PREVIOUS_JDK_VERSION=1.6.0 JDK_VERSION=1.7.0 JDK_MKTG_VERSION=7 JDK_MAJOR_VERSION=1 JDK_MINOR_VERSION=7 JDK_MICRO_VERSION=0 PREVIOUS_MAJOR_VERSION=1 PREVIOUS_MINOR_VERSION=6 PREVIOUS_MICRO_VERSION=0 ARCH_DATA_MODEL=64 COOKED_BUILD_NUMBER=0 ANT_HOME="/usr/share/ant" ALT_OUTPUTDIR=/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64 ALT_LANGTOOLS_DIST=/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/langtools/dist ALT_CORBA_DIST=/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/corba/dist ALT_JAXP_DIST=/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/jaxp/dist ALT_JAXWS_DIST=/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/jaxws/dist ALT_HOTSPOT_IMPORT_PATH=/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/hotspot/import BUILD_HOTSPOT=true ; )
    gmake[1]: Entering directory `/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/jdk/make'
    gmake[1]: Leaving directory `/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/jdk/make'
    
    Build Machine Information:
       build machine = artivisi.artivisi.com
    
    Build Directory Structure:
       CWD = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7
       TOPDIR = .
       LANGTOOLS_TOPDIR = ./langtools
       JAXP_TOPDIR = ./jaxp
       JAXWS_TOPDIR = ./jaxws
       CORBA_TOPDIR = ./corba
       HOTSPOT_TOPDIR = ./hotspot
       JDK_TOPDIR = ./jdk
    
    Build Directives:
       BUILD_LANGTOOLS = true 
       BUILD_JAXP = true 
       BUILD_JAXWS = true 
       BUILD_CORBA = true 
       BUILD_HOTSPOT = true 
       BUILD_JDK    = true 
       DEBUG_CLASSFILES =  
       DEBUG_BINARIES =  
    
    Hotspot Settings: 
          HOTSPOT_BUILD_JOBS  =  
          HOTSPOT_OUTPUTDIR   = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/hotspot/outputdir 
          HOTSPOT_EXPORT_PATH = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/hotspot/import 
     
    
    Bootstrap Settings:
      BOOTDIR = /usr/lib64/java/
        ALT_BOOTDIR = /usr/lib64/java/
      BOOT_VER = 1.6.0 [requires at least 1.6]
      OUTPUTDIR = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64
        ALT_OUTPUTDIR = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64
      ABS_OUTPUTDIR = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64
     
    Build Tool Settings:
      SLASH_JAVA = /NOT-SET
        ALT_SLASH_JAVA = 
      VARIANT = OPT
      JDK_DEVTOOLS_DIR = /NOT-SET/devtools
        ALT_JDK_DEVTOOLS_DIR = 
      ANT_HOME = /usr/share/ant
      UNIXCOMMAND_PATH = /bin/
        ALT_UNIXCOMMAND_PATH = 
      COMPILER_PATH = /usr/bin/
        ALT_COMPILER_PATH = 
      DEVTOOLS_PATH = /usr/bin/
        ALT_DEVTOOLS_PATH = 
      UNIXCCS_PATH = /usr/ccs/bin/
        ALT_UNIXCCS_PATH = 
      USRBIN_PATH = /usr/bin/
        ALT_USRBIN_PATH = 
      COMPILER_NAME = GCC4
      COMPILER_VERSION = GCC4
      CC_VER = 4.5.2 [requires at least 4.3.0]
      ZIP_VER = 3.0 [requires at least 2.2]
      UNZIP_VER = 6.00 [requires at least 5.12]
      ANT_VER = 1.8.2 [requires at least 1.7.1]
      TEMPDIR = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/tmp
     
    Build Directives:
      OPENJDK = true
      USE_HOTSPOT_INTERPRETER_MODE = 
      PEDANTIC = 
      DEV_ONLY = 
      NO_DOCS = 
      NO_IMAGES = 
      TOOLS_ONLY = 
      INSANE = 
      COMPILE_APPROACH = parallel
      PARALLEL_COMPILE_JOBS = 2
        ALT_PARALLEL_COMPILE_JOBS = 
      FASTDEBUG = 
      COMPILER_WARNINGS_FATAL = false
      COMPILER_WARNING_LEVEL = 
      SHOW_ALL_WARNINGS = 
      INCREMENTAL_BUILD = false
      CC_HIGHEST_OPT = 
      CC_HIGHER_OPT = 
      CC_LOWER_OPT = 
      CXXFLAGS =  -O2 -fPIC -DCC_NOEX -W -Wall  -Wno-unused -Wno-parentheses -fno-omit-frame-pointer -D_LITTLE_ENDIAN  
      CFLAGS =  -O2   -fno-strict-aliasing -fPIC -W -Wall  -Wno-unused -Wno-parentheses -pipe -fno-omit-frame-pointer -D_LITTLE_ENDIAN  
      BOOT_JAVA_CMD = /usr/lib64/java//bin/java -XX:-PrintVMOptions -XX:+UnlockDiagnosticVMOptions -XX:-LogVMOutput -Xmx512m -Xms512m -XX:PermSize=32m -XX:MaxPermSize=160m
      BOOT_JAVAC_CMD = /usr/lib64/java//bin/javac  -J-XX:ThreadStackSize=1536 -J-XX:-PrintVMOptions -J-XX:+UnlockDiagnosticVMOptions -J-XX:-LogVMOutput -J-Xmx512m -J-Xms512m -J-XX:PermSize=32m -J-XX:MaxPermSize=160m -encoding ascii -source 6 -target 6 -XDignore.symbol.file=true
      BOOT_JAR_CMD = /usr/lib64/java//bin/jar
      BOOT_JARSIGNER_CMD = /usr/lib64/java//bin/jarsigner
      JAVAC_CMD = /NOT-SET/re/jdk/1.7.0/promoted/latest/binaries/linux-amd64/bin/javac  -J-XX:ThreadStackSize=1536 -J-XX:-PrintVMOptions -J-XX:+UnlockDiagnosticVMOptions -J-XX:-LogVMOutput -J-Xmx512m -J-Xms512m -J-XX:PermSize=32m -J-XX:MaxPermSize=160m  -source 7 -target 7 -encoding ascii -Xbootclasspath:/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/classes 
      JAVAH_CMD = /NOT-SET/re/jdk/1.7.0/promoted/latest/binaries/linux-amd64/bin/javah -bootclasspath /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/classes
      JAVADOC_CMD = /NOT-SET/re/jdk/1.7.0/promoted/latest/binaries/linux-amd64/bin/javadoc -J-XX:-PrintVMOptions -J-XX:+UnlockDiagnosticVMOptions -J-XX:-LogVMOutput -J-Xmx512m -J-Xms512m -J-XX:PermSize=32m -J-XX:MaxPermSize=160m -bootclasspath /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/classes
     
    Build Platform Settings:
      USER = root
      PLATFORM = linux
      ARCH = amd64
      LIBARCH = amd64
      ARCH_FAMILY = amd64
      ARCH_DATA_MODEL = 64
      ARCHPROP = amd64
      ALSA_VERSION = 1.0.24.1
      OS_VERSION = 2.6.37.6 [requires at least 2.6]
      OS_VARIANT_NAME = Unknown
      OS_VARIANT_VERSION = 
      MB_OF_MEMORY = 1961
     
    GNU Make Settings:
      MAKE = gmake
      MAKE_VER = 3.82 [requires at least 3.81]
      MAKECMDGOALS = sanity
      MAKEFLAGS = w
      SHELL = /bin/sh
     
    Target Build Versions:
      JDK_VERSION = 1.7.0
      MILESTONE = internal
      RELEASE = 1.7.0-internal
      FULL_VERSION = 1.7.0-internal-root_2011_05_22_11_02-b00
      BUILD_NUMBER = b00
     
    External File/Binary Locations:
      USRJDKINSTANCES_PATH = /opt/java
      BUILD_JDK_IMPORT_PATH = /NOT-SET/re/jdk/1.7.0/promoted/latest/binaries
        ALT_BUILD_JDK_IMPORT_PATH = 
      JDK_IMPORT_PATH = /NOT-SET/re/jdk/1.7.0/promoted/latest/binaries/linux-amd64
        ALT_JDK_IMPORT_PATH = 
      LANGTOOLS_DIST = 
        ALT_LANGTOOLS_DIST = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/langtools/dist
      CORBA_DIST = 
        ALT_CORBA_DIST = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/corba/dist
      JAXP_DIST = 
        ALT_JAXP_DIST = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/jaxp/dist
      JAXWS_DIST = 
        ALT_JAXWS_DIST = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/jaxws/dist
      HOTSPOT_DOCS_IMPORT_PATH = /NO_DOCS_DIR
        ALT_HOTSPOT_DOCS_IMPORT_PATH = 
      HOTSPOT_IMPORT_PATH = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/hotspot/import
        ALT_HOTSPOT_IMPORT_PATH = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/hotspot/import
      HOTSPOT_SERVER_PATH = /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/hotspot/import/jre/lib/amd64/server
        ALT_HOTSPOT_SERVER_PATH = 
      CACERTS_FILE = ./../src/share/lib/security/cacerts
        ALT_CACERTS_FILE = 
      CUPS_HEADERS_PATH = /usr/include
        ALT_CUPS_HEADERS_PATH = 
     
    OpenJDK-specific settings:
      FREETYPE_HEADERS_PATH = /usr/include
        ALT_FREETYPE_HEADERS_PATH = 
      FREETYPE_LIB_PATH = /usr/lib
        ALT_FREETYPE_LIB_PATH = 
     
    Previous JDK Settings:
      PREVIOUS_RELEASE_PATH = USING-PREVIOUS_RELEASE_IMAGE
        ALT_PREVIOUS_RELEASE_PATH = 
      PREVIOUS_JDK_VERSION = 1.6.0
        ALT_PREVIOUS_JDK_VERSION = 
      PREVIOUS_JDK_FILE = 
        ALT_PREVIOUS_JDK_FILE = 
      PREVIOUS_JRE_FILE = 
        ALT_PREVIOUS_JRE_FILE = 
      PREVIOUS_RELEASE_IMAGE = /usr/lib64/java/
        ALT_PREVIOUS_RELEASE_IMAGE = 
    
    
    Sanity check passed.
    root@artivisi:/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7# 


Jika perintah diatas sukses, maka kita bisa langsung melakukan proses kompilasi dengan mengetikkan perintah `gmake ALLOW_DOWNLOADS=true` seperti dibawah ini :


> 

> 
> 

>   1. Opsi `ALLOW_DOWNLOADS=true` ini akan menginstruksikan agar Apache ANT otomatis mendownload source code `JAXP` dan `JAX-WS` secara otomatis.
> 

>   2. Proses kompilasi ini memakan waktu sangat lama (di laptop core2duo dengan koneksi internet menggunakan Speedy memakan waktu ~+ 3 jam), jadi siapkan cemilan, kopi dan rokok. Atau kalau bisa ditinggal main-main dulu :)
> 

>   3. Proses ini juga memakan **CPU Usage** yang lumayan, jadi sebaiknya tinggalkan aktifitas berkomputer ria ketika melakukan proses kompilasi ini :) 
> 





    root@artivisi:/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7# gmake ALLOW_DOWNLOADS=true
    ....
    ....
    ....
    >>>Making sec-files @ Sun May 22 14:33:37 WIT 2011 ...
    /bin/mkdir -p .
    rm -f sec-files
    rm -f /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/tmp/sec-bin.zip
    cd  /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64 && \
    	/usr/bin/zip -rq9 /mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/build/linux-amd64/tmp/sec-bin.zip classes/javax/net classes/javax/security/cert classes/com/sun/net/ssl classes/com/sun/security/cert classes/sun/net/www/protocol/https classes/sun/security/pkcs12 classes/sun/security/ssl classes/sun/security/krb5/*.class classes/sun/security/krb5/internal/*.class classes/sun/security/krb5/internal/ccache classes/sun/security/krb5/internal/crypto classes/sun/security/krb5/internal/ktab classes/sun/security/krb5/internal/rcache classes/sun/security/krb5/internal/util classes/sun/security/jgss/spi/GSSContextSpi.class
    >>>Making sec-files-win @ Sun May 22 14:33:37 WIT 2011 ...
    >>>Making jgss-files @ Sun May 22 14:33:37 WIT 2011 ...
    >>>Finished making images @ Sun May 22 14:33:37 WIT 2011 ...
    gmake[2]: Leaving directory `/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7/jdk/make'
    ########################################################################
    ##### Leaving jdk for target(s) sanity all docs images             #####
    ########################################################################
    ##### Build time 02:52:56 jdk for target(s) sanity all docs images #####
    ########################################################################
    
    -- Build times ----------
    Target all_product_build
    Start 2011-05-22 11:22:21
    End   2011-05-22 14:33:37
    00:00:06 corba
    00:10:55 hotspot
    00:02:18 jaxp
    00:04:55 jaxws
    02:52:56 jdk
    00:00:06 langtools
    03:11:16 TOTAL
    -------------------------
    gmake[1]: Leaving directory `/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7'
    root@artivisi:/mnt/DATA1/data/SLACKBUILDS/SLACKWARE-JAVA/openjdk/open-jdk7#


Sampai disini proses kompilasi sudah selesai dilakukan dan **"image"** untuk **JDK** dapat diambil pada direktori `open-jdk7/build/linux-amd64/j2sdk-image` sedangkan untuk **JRE**-nya dapat diambil pada direktori `open-jdk7/build/linux-amd64/j2re-image`  :)

Nah bagaimana mudah bukan ? Kenapa saya tidak membuatkan sekalian binary packages untuk Slackware-nya ? alasan-nya yaitu saya menginginkan aplikasi seperti [Gentoo Java Config](http://overlays.gentoo.org/proj/java/wiki/java-config) atau [update-alternatives --config java](https://help.ubuntu.com/community/Java) milik ubuntu terdapat di Slackware supaya kita gampang berpindah versi java dari Oracle JDK ke OpenJDK maupun sebaliknya :)

Adakah teman-teman slacker's lain yang tertarik masalah Java di Slackware ? Bagaimana kalau kita sama-sama membawa Java ke sistem native Slackware ? Maksud saya native disini yaitu seperti yang teman-teman pengguna Gentoo, Ubuntu dan Fedora lakukan dengan project [Gentoo Java](http://www.gentoo.org/proj/en/java/), [Ubuntu Java](https://help.ubuntu.com/community/Java) dan [Fedora Java](http://fedoraproject.org/wiki/Java) :)

Jika ada yang tertarik, saya sangat-sangat tertarik untuk mendiskusikan dan merealisasikan bersama-sama :)

**Referensi :**

  1. [Readme Building OpenJDK Linux](http://hg.openjdk.java.net/jdk7/build/raw-file/tip/README-builds.html#linux)
  2. [Gentoo Java](http://www.gentoo.org/proj/en/java/)
  3. [Ubuntu Java](https://help.ubuntu.com/community/Java)
  4. [Fedora Java](http://fedoraproject.org/wiki/Java)