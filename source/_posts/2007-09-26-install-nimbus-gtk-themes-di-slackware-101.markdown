---
comments: true
date: 2007-09-26 13:20:14+00:00
layout: post
slug: install-nimbus-gtk-themes-di-slackware-101
title: Install Nimbus GTK Themes Di Slackware 10.1
wordpress_id: 10
categories:
- Slackware
tags:
- Nimbus
---

Hmm... gara-gara ngebet banget pingin cobain Open Solaris 10 dan ndak keturutan  (iks... soalnya RAM saya kurang, cuman 256 MB doank), akhirnya iseng-iseng cobain install themes Open Solaris yang baru yaitu Nimbus :) di Slackware 10.1 saya :) Kan lumayan, misalkan bisa ngebikin tampilan GNU/Linux Slackware saya bisa jadi kek Open Solaris :) , jadi ndak usah susah-susah upgrade RAM karena cuman pingin cobain Open Solaris :malu: (Kalau linux ajah bisa, kenapa tidak ? :D **"Ga ada rotan, akar pun jadi" **)

Ini ada deskripsi apa itu Nimbus sebenarnya :


> 
Nimbus is the name of a look-and-feel designed by Sun for the Java Desktop System; it's implemented as a GTK theme in the latest Solaris 11 pre-release builds.
Note: [read more here](https://nimbus.dev.java.net/)




Oh iya, ini spesifikasi Slackware Linux yang saya pakai sehari-hari :
- OS Slackware Linux 10.1
- Kernel 2.6.10 ( ambil dari binary cd slackware)
- GNOME versi 2.12 ( GSB/Free Rock GNOME )

Downloadlah dahulu package-package dibawah ini sebelum mulai instalasi, alat-alat yang perlu dipersiapkan yaitu :
**Packages Dependencies :**
- [XML-Simple-2.18.tar.gz](http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-Simple-2.18.tar.gz )
- [icon-naming-utils-0.8.6.tar.gz ](http://tango-project.org/releases/icon-naming-utils-0.8.6.tar.gz)

**Package Utama :**
- [nimbus_0.0.6-1.diff.gz ](http://zap.tartarus.org/~ds/debian/dists/sid/main/source/nimbus_0.0.6-1.diff.gz)
- [nimbus-0.0.8.tar.bz2](http://dlc.sun.com/osol/jds/downloads/extras/nimbus-0.0.8.tar.bz2)
- [sun-gdm-themes-0.25.tar.gz ](http://dlc.sun.com/osol/jds/downloads/extras/sun-gdm-themes-0.25.tar.gz)
- [opensolaris-backgrounds-0.2.tar.bz2 ](http://dlc.sun.com/osol/jds/downloads/extras/opensolaris-backgrounds-0.2.tar.bz2)


> 
Paket-paket diatas sudah saya coba di Slackware 10.1 dan jalan dengan sukses, untuk distribusi Linux yang lain, mungkin ada sedikit perbedaan :) . Jika distro yang anda pakai adalah Debian, Ubuntu dan Gentoo, bergembira-lah soalnya sudah ada yang buat package untuk ke 2 distribusi Linux tersebut. :)

Package Untuk Debian dan Ubuntu bisa diambil dari sini :
- [Nimbus For Debian and Ubuntu](http://www.gnome-look.org/content/show.php/Nimbus+(Ubuntu+and+Debian)?content=54755)

Package Untuk Gentoo bisa diambil dari sini :
- [ Nimbus For Gentoo e-build](http://www.gnome-look.org/content/show.php/Nimbus+%28Gentoo+ebuild%29?content=54702)



<!-- more -->

Setelah proses download selesai sekarang waktunya untuk proses yang paling menyenangkan dan  menegangkan :D yaitu proses compile dan instal :D, urut-urutan langkah instalasinya yaitu sebagai berikut :

* **Installing Packages XML::Simple**
Ekstrak packages XML-Simple-2.18.tar.gz dengan cara mengetikkan **tar -zxvf XML-Simple-2.18.tar.gz** pada terminal, kemudian masuklah kedalam direktori XML-Simple-2.18 dengan cara mengetikkan **cd XML-Simple-2.18** seperti dibawah ini:

    
    
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus/dependencies/]$ tar -zxvf XML-Simple-2.18.tar.gz
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus/dependencies/]$ cd XML-Simple-2.18/
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus/dependencies/XML-Simple-2.18]$
    



Setelah masuk ke dalam direktori XML-Simple-2.18, sekarang lakukan proses configure dengan cara mengetikkan perintah **perl Makefile.PL** seperti dibawah ini:

    
    
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus/dependencies/XML-Simple-2.18]$ perl Makefile.PL
    Checking installed modules ...
    XML::Parser is installed, it will be used by the test suite
    Checking if your kit is complete...
    Looks good
    Writing Makefile for XML::Simple
    



Untuk melakukan proses instalasi, gantilah akses anda dengan root dengan mengetikkan perintah **su** kemudian masukkanlah password root yang terdapat pada sistem anda.  Setelah itu lakukanlah proses compilasi dan installasi dengan mengetikkan perintah **make** dan **make install** seperti dibawah ini:

    
    
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus/dependencies/XML-Simple-2.18]$ su
    Password:
    [root@pemula:/home/javamaniac/ProgramFiles/FromSource/Nimbus/dependencies/XML-Simple-2.18]$ make
    cp lib/XML/Simple/FAQ.pod blib/lib/XML/Simple/FAQ.pod
    cp lib/XML/Simple.pm blib/lib/XML/Simple.pm
    Manifying blib/man3/XML::Simple::FAQ.3
    Manifying blib/man3/XML::Simple.3
    [root@pemula:/home/javamaniac/ProgramFiles/FromSource/Nimbus/dependencies/XML-Simple-2.18]$ make install
    Installing /usr/lib/perl5/site_perl/5.8.6/XML/Simple.pm
    Installing /usr/lib/perl5/site_perl/5.8.6/XML/Simple/FAQ.pod
    Installing /usr/share/man/man3/XML::Simple.3
    Installing /usr/share/man/man3/XML::Simple::FAQ.3
    Writing /usr/lib/perl5/site_perl/5.8.6/i486-linux/auto/XML/Simple/.packlist
    Appending installation info to /usr/lib/perl5/5.8.6/i486-linux/perllocal.pod
    



Setelah proses instalasi selesai, jangan lupa untuk meng-update library pada sitem anda dengan mengetikkan perintah **ldconfig** seperti dibawah ini:

    
    
    [root@pemula:/home/javamaniac/ProgramFiles/FromSource/Nimbus/dependencies/XML-Simple-2.18]$ ldconfig
    





* **Installing Packages icon-names-util:**
Setelah proses instalasi packages XML::Simple selesai, lanjutkanlah dengan menginstal packages icon-names-util. Langkah pertama yang harus dilakukan adalah ekstrak packages icon-naming-utils-0.8.6.tar.gz kemudian masuklah ke direktori  icon-naming-utils-0.8.6 dengan cara sebagai berikut:

    
    
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus/dependencies/]$ tar -zxvf icon-naming-utils-0.8.6.tar.gz
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus/dependencies/]$ cd icon-naming-utils-0.8.6/
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus/dependencies/XML-Simple-2.18]$
    



Setelah selesai diekstrak, lakukan proses configure, make dan make install seperti dibawah ini:

    
    
    [root@pemula:/home/javamaniac/ProgramFiles/FromSource/Nimbus/dependencies/icon-naming-utils-0.8.6]$ ./configure
    checking for a BSD-compatible install... /usr/bin/ginstall -c
    checking whether build environment is sane... yes
    checking for a thread-safe mkdir -p... /bin/mkdir -p
    checking for gawk... gawk
    checking whether make sets $(MAKE)... yes
    checking whether to enable maintainer-specific portions of Makefiles... no
    checking for perl... /usr/bin/perl
    checking for XML::Simple... ok
    configure: creating ./config.status
    config.status: creating Makefile
    config.status: creating icon-naming-utils.pc
    config.status: creating icon-naming-utils-uninstalled.pc
    [root@pemula:/home/javamaniac/ProgramFiles/FromSource/Nimbus/dependencies/icon-naming-utils-0.8.6]$ make
    sed -e "s#\@PERL\@#/usr/bin/perl#g"             \
      	-e "s#\@DATADIR\@#/usr/local/share/icon-naming-utils#g"     \
    	< icon-name-mapping.pl.in > icon-name-mapping
    [root@pemula:/home/javamaniac/ProgramFiles/FromSource/Nimbus/dependencies/icon-naming-utils-0.8.6]$ make install
    make[1]: Entering directory `/home/javamaniac/ProgramFiles/FromSource/Nimbus/dependencies/icon-naming-utils-0.8.6'
    test -z "/usr/local/libexec" || /bin/mkdir -p "/usr/local/libexec" /usr/bin/ginstall -c 'icon-name-mapping' '/usr/local/libexec/icon-name-mapping'
    test -z "/usr/local/share/dtds" || /bin/mkdir -p "/usr/local/share/dtds" /usr/bin/ginstall -c -m 644 'legacy-icon-mapping.dtd' '/usr/local/share/dtds/legacy-icon-mapping.dtd'
    test -z "/usr/local/share/pkgconfig" || /bin/mkdir -p "/usr/local/share/pkgconfig" /usr/bin/ginstall -c -m 644 'icon-naming-utils.pc' '/usr/local/share/pkgconfig/icon-naming-utils.pc'
    test -z "/usr/local/share/icon-naming-utils" || /bin/mkdir -p "/usr/local/share/icon-naming-utils" /usr/bin/ginstall -c -m 644 'legacy-icon-mapping.xml' '/usr/local/share/icon-naming-utils/legacy-icon-mapping.xml'
    make[1]: Leaving directory `/home/javamaniac/ProgramFiles/FromSource/Nimbus/dependencies/icon-naming-utils-0.8.6'
    



Setelah proses instalasi selesai, kopikan dahulu file icon-naming-utils.pc ke direktori /usr/lib/pkgconfig/ supaya proses selanjutnya berjalan lancar :) seperti dibawah ini:

    
    
    [root@pemula:/home/javamaniac/ProgramFiles/FromSource/Nimbus/dependencies/icon-naming-utils-0.8.6]$ cp icon-naming-utils.pc /usr/lib/pkgconfig/
    




Proses instalasi packages dependencies telah selesai, sekarang waktunya untuk menginstal packages utama dari themes Nimbus yang jadi tujuan utama kita :) Langkah-langkahnya yaitu sebagai berikut :


* **Installing gtk-nimbus engine :**
Seperti pada langkah-langkah sebelumnya, yang harus dilakukan pertama kali yaitu melakukan proses ekstrak packages nimbus-0.0.8.tar.bz2 dengan perintah tar xf nimbus-0.0.8.tar.bz2 kemudian masuklah ke direktori nimbus-0.0.8 seperti berikut:

    
    
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus]$ tar xf nimbus-0.0.8.tar.bz2
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus]$ cd nimbus-0.0.8
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus/nimbus-0.0.8]$
    



Setelah masuk ke dalam direktori nimbus-0.0.8, jangan lakukan lakukan proses configure dahulu. Lakukanlah patch dahulu terhadap source code nimbus dengan cara sebagai berikut :

    
    
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus/nimbus-0.0.8]$ zcat ../nimbus_0.0.6-1.diff.gz | patch -p1
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus/nimbus-0.0.8]$ chmod +x debian/rules
    



Setelah proses pacthing selesai, lakukan proses configure dengan menyertakan path ke /usr dan lakukan proses **make && make install** seperti berikut :

    
    
    [root@pemula:/home/javamaniac/ProgramFiles/FromSource/Nimbus/nimbus-0.0.8]$ ./configure --prefix=/usr
    [root@pemula:/home/javamaniac/ProgramFiles/FromSource/Nimbus/nimbus-0.0.8]$ make && make install
    



Jika proses instalasi berhasil, lanjut ke proses instalasi sun-gdm :) yang akan	memberikan login manager bernuansa Open Solaris :)



* **Installing sun-gdm-themes :**
Seperti pada langkah-langkah sebelumnya, yang harus dilakukan pertama kali yaitu melakukan proses ekstrak packages sun-gdm-themes-0.25.tar.bz2 dengan perintah tar xf sun-gdm-themes-0.25.tar.bz2 kemudian masuklah ke direktori sun-gdm-themes-0.25 dengan cara cd sun-gdm-themes-0.25 dan lakukan proses configure yang mengarah ke /usr kemudian lakukan proses make && make install seperti berikut:

    
    
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus]$ tar xf sun-gdm-themes-0.25.tar.bz2
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus]$ cd sun-gdm-themes-0.25
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus/sun-gdm-themes-0.25]$ ./configure --prefix=/usr
    ....................
    ....................
    checking for xgettext... /usr/bin/xgettext
    configure: creating ./config.status
    config.status: creating sun-gdm-themes.spec
    config.status: creating Makefile
    config.status: creating po/Makefile.in
    config.status: WARNING:  po/Makefile.in.in seems to ignore the --datarootdir setting
    config.status: creating themes/Makefile
    config.status: creating themes/Sun-Nimbus/Makefile
    config.status: creating themes/Sun-blueprint/Makefile
    config.status: creating themes/Sun-teal/Makefile
    config.status: creating themes/Sun-glass/Makefile
    config.status: executing depfiles commands
    config.status: executing intltool commands
    config.status: executing default-1 commands
    config.status: executing po/stamp-it commands
    [javamaniac@pemula:~/ProgramFiles/FromSource/Nimbus/sun-gdm-themes-0.25]$ make && make install
    



Setelah proses instalasi sun-gdm-themes selesai, lakukan proses konfigurasi gdm dengan cara mengetikkan gdmsetup kemudian pilihlah gdm yang telah diinstal tersebut seperti gambar dibawah ini:
[![gdm](http://farm2.static.flickr.com/1309/1442319093_42be680b2b_m.jpg)](http://farm2.static.flickr.com/1309/1442319093_9c31c8ebab_o.png)



Setelah proses pemilihan gdm selesai, sekarang coba masuk ke menu **Desktop > Preferences > Themes** dan gantilah themes anda dengan Nimbus. Dan hasil dari proses instalasi tersebut adalah sebagai berikut :
[![first_time](http://farm2.static.flickr.com/1249/1443250936_c4c8ce4a5b_m.jpg)](http://farm2.static.flickr.com/1249/1443250936_d5ace4cb75_o.png)

Hmm... bagus banget :) elegant dan softly di mata :) , dan akhirnya ini adalah screenshot-screenshot dari Themes Nimbus yang sudah terinstal dengan baik di komputer saya :)

* **Tampilan GDM Open Solaris**
[![GDM_LoginManager](http://farm2.static.flickr.com/1321/1442371127_8959ade092_m.jpg)](http://farm2.static.flickr.com/1321/1442371127_514d2d3547_o.jpg)



* **Tampilan Desktop dan Gnome Terminal**
[![Desktop_and_GnomeTerminal](http://farm2.static.flickr.com/1232/1442371119_1cfc0bf3bb_m.jpg)](http://farm2.static.flickr.com/1232/1442371119_4c6430925e_o.png)



* **Tampilan Nautilus dan Panel About**
[![Nautilus_and_AboutPanel](http://farm2.static.flickr.com/1336/1443250940_5edad44551_m.jpg)](http://farm2.static.flickr.com/1336/1443250940_66ef4aef09_o.png)



* **Tampilan NetBeans dengan System LAF**
[![Netbeans_with_SystemLAF](http://farm2.static.flickr.com/1368/1443250956_000adfbbda_m.jpg)](http://farm2.static.flickr.com/1368/1443250956_4be113bcc4_o.png)



Humm.... asyik juga jadi seperti megang Open Solaris beneran :) , bakalan jadi themes default neh buat PC di rumah :) jadi betah deh seharian di depan PC. Udah tergila-gila sih ama Nimbus sejak ada di [Projectnya SwingX](http://swinglabs.org/downloads.jsp) dan Nimbus pun jadi cikal bakal untuk [themes Java Swing yang baru](http://www.curious-creature.org/2007/03/09/screenshots-of-new-swing-look-and-feel-nimbus/) selain Metal :) . Cuman sayangnya koq icon Trash klo makai themes nimbus jadi hilang yah ? :think: hasilnya jadi seperti ini:
[![111trashScreenshot](http://farm2.static.flickr.com/1220/1443376120_005ffe9a18_m.jpg)](http://www.flickr.com/photos/10243554@N02/1443376120/)

Tapi gpp deh, yang penting bisa ngerasain gimana make "Open Solaris" :malu:

Referensi-referensi :
- [ Compiling Nimbus Themes](http://www.cybertechhelp.com/forums/showthread.php?p=908149)
- [Make your ubuntu desktop more beautiful](http://www.vinodlive.com/2007/08/20/make-your-ubuntu-desktop-more-beautiful/)
- [Icon Naming Installation](http://tango.freedesktop.org/Installation#Icon_Naming_Utilities)
- [Installing XML::Simple](http://search.cpan.org/~grantm/XML-Simple-2.18/lib/XML/Simple/FAQ.pod#How_do_I_install_XML::Simple?)
