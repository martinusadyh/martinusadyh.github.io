---
comments: true
date: 2008-10-02 14:39:21+00:00
layout: post
slug: step-by-step-instalasi-ltsp-42u2-0-di-zencafe-10zenwalk44
title: Step By Step Instalasi LTSP 4.2u2-0 di Zencafe 1.0/Zenwalk4.4
wordpress_id: 38
categories:
- Slackware
---

Sebenarnya tulisan ini udah lama saya posting di blog yang [lama](pemula.blogsome.com), tetapi berhubung [Om Anjar](http://ahardiena.uni.cc/) minta agar saya reposting lagi di blog yang baru ya akhirnya saya posting lagi disini :)
<!-- more -->

Untuk menginstal LTSP di Zencafe atau Zenwalk, langkah pertama yang harus dilakukan adalah menginstal file ltsp-utils yang bisa didownload pada situs
[http://wiki.ltsp.org/twiki/bin/view/Ltsp/DownLoads](http://wiki.ltsp.org/twiki/bin/view/Ltsp/DownLoads)

Berhubung distribusi Zencafe/Zenwalk merupakan distribusi turunan dari Slackware, maka downloadlah paket khusus untuk distribusi Slackware. Setelah mendownload kemudian install paket ltsp-utils tersebut dengan perintah installpkg.

    
    
    root[LTSP]# wget -c http://www.tna.nl/ltsp/ltsp-utils-0.25.0-noarch-1TnA.tgz
    root[LTSP]# ls
    ltsp-utils-0.25.0-noarch-1TnA.tgz
    root[LTSP]# installpkg ltsp-utils-0.25.0-noarch-1TnA.tgz
    Installing package ltsp-utils-0.25.0-noarch-1TnA…
    PACKAGE DESCRIPTION:
    ltsp-utils: Linux Terminal Server Project utilities - ltsp-utils 0.25-0
    ltsp-utils: This package includes the following utilities for LTSP server:
    ltsp-utils:
    ltsp-utils:   ltspadmin   For installing and managing the packages
    ltsp-utils:               on an LTSP server.
    ltsp-utils:   ltspcfg     For configuring the services on an LTSP server.
    ltsp-utils:   ltspinfo    For querying the workstation, to learn things,
    ltsp-utils:               such as which sound daemon is being used.
    ltsp-utils:
    ltsp-utils: Homepage: http://www.ltsp.org/
    ltsp-utils: (Packaged by mdekker@tna.nl on 23-May-2006)
    root[LTSP]#
    



Untuk mengecek apakah paket tersebut sudah terinstal atau belum, berikan perintah seperti dibawah ini:

    
    
    root[LTSP]# ls /var/log/packages | grep ltsp-utils
    ltsp-utils-0.25.0-noarch-1TnA
    root[LTSP]#
    



Setelah paket ltsp-utils terinstal, ada beberapa paket lagi yang diperlukan oleh Zencafe/Zenwalk untuk bisa dijadikan sebagai LTSP server, dan ini tidak terdapat pada default instalasi maupun di repository dari Zenwalk
sendiri. Tetapi untungnya, kita masih bisa memakai paket dari distribusi Slackware (karena Zencafe/Zenwalk adalah turunan dari distribusi Slackware).
NB:
- Untuk Zencafe 1.0 dan Zenwalk 4.4 silahkan download paket dari Slackware 11 :)
(Thx buat om anjar yang udah beritahu masalah ini ^^ )

Oh iya, paket-paket yang dibutuhkan yaitu:

* DHCPD (Ini tidak terdapat di mirror zenwalk, ambil dari distro Slackware)


* perl-libwww-perl (Ini juga tidak ada, ambil dari Slackware juga) :D


Berhubung Zencafe / Zenwalk adalah turunan Slackware, ada beberapa paket lainnya yang tidak disediakan pada waktu default instalasinya. Beberapa paket tersebut adalah:




  1. Paket DHCPD


  2. Paket libwww-perl. (Untuk menjalankan ltspadmin ? )



Setelah mengetahui paket-paket apa saja yang dibutuhkan, sekarang waktu untuk download dan menginstal paket-paket tersebut dengan cara sebagai berikut:

    
    
    root[LTSP]# wget -c http://ftp.riken.jp/linux/slackware/slackware-current/slackware/n/dhcp-3.0.5-i486-1.tgz
    root[LTSP]# installpkg dhcp-3.0.5-i486-1.tgz
    Installing package dhcp-3.0.5-i486-1…
    PACKAGE DESCRIPTION:
    dhcp: dhcp (DHCP server and client utilities)
    dhcp:
    dhcp: This package provides the ISC’s DHCP utilities, including both a
    dhcp: server and client.  The DHCP protocol allows a host to contact a
    dhcp: central server which maintains a list of IP addresses which may be
    dhcp: assigned on one or more subnets.   A DHCP client may request an
    dhcp: address from this pool, and then use it temporarily for communication
    dhcp: on the network.   The DHCP protocol also provides a mechanism whereby
    dhcp: a client can learn important details about the network to which it is
    dhcp: attached, such as the location of a default router or name server.
    dhcp:
    Executing install script for dhcp-3.0.5-i486-1…
    
    root[LTSP]# wget -c http://ftp.naist.jp/pub/Linux/linuxpackages/Slackware-11.0/jay/perl-libwww-perl/perl-libwww-perl-5.805-noarch-1.tgz
    root[LTSP]# installpkg perl-libwww-perl-5.805-noarch-1.tgz
    Installing package perl-libwww-perl-5.805-noarch-1…
    PACKAGE DESCRIPTION:
    perl-libwww-perl: perl-libwww-perl 5.805 (Perl module)
    perl-libwww-perl:
    perl-libwww-perl:  Packaged by cpan2tgz
    perl-libwww-perl:  cpan2tgz by Jason Woodward
    perl-libwww-perl:  http://software.jaos.org/
    perl-libwww-perl:
    Executing install script for perl-libwww-perl-5.805-noarch-1…
    root[LTSP]#
    



Nah klo semua paket dah terinstall, untuk mengeceknya silahkan ketik perintah sebagai berikut:

    
    
    root[LTSP]# ls /var/log/packages | grep dhcp
    dhcp-3.0.5-i486-1
    dhcpcd-2.0.4-i486-2
    root[LTSP]# ls /var/log/packages | grep libwww
    perl-libwww-perl-5.805-noarch-1
    root[LTSP]#
    



Nah setelah semua persiapan selesai, sekarang waktunya download file iso dan md5sum dari [http://ltsp.mirrors.tds.net/pub/ltsp/isos/](http://ltsp.mirrors.tds.net/pub/ltsp/isos/) dengan cara sebagai berikut:

    
    
    root[LTSP]# wget -cb http://ltsp.mirrors.tds.net/pub/ltsp/isos/ltsp-4.2u2-0.iso
    root[LTSP]# wget -c http://ltsp.mirrors.tds.net/pub/ltsp/isos/ltsp-4.2u2-0.md5sum
    –07:45:02–  http://ltsp.mirrors.tds.net/pub/ltsp/isos/ltsp-4.2u2-0.md5sum
               => `ltsp-4.2u2-0.md5sum’
    Resolving ltsp.mirrors.tds.net… 216.165.129.141
    Connecting to ltsp.mirrors.tds.net|216.165.129.141|:80… connected.
    HTTP request sent, awaiting response… 200 OK
    Length: 51 [text/plain]
    
    100%[=============================================>] 51            –.–K/s
    
    07:45:03 (2.95 MB/s) - `ltsp-4.2u2-0.md5sum’ saved [51/51]
    
    root[LTSP]#
    



Nah klo sudah selesai download file ltsp isonya, cek dulu md5sumnya, buat jaga-jaga saja :D

    
    
    root[LTSP]# md5sum ltsp-4.2u2-0.iso
    e09b1fd6cc20d4632699a2a53c0fca21  ltsp-4.2u2-0.iso
    root[LTSP]# more ltsp-4.2u2-0.md5sum
    e09b1fd6cc20d4632699a2a53c0fca21  ltsp-4.2u2-0.iso
    



Setelah selesai, sekarang mount file ltsp-4.2u2-0.iso. Tapi sebelumnya bikin dulu direktori mount point di **/mnt **dulu dengan cara sebagai berikut:

    
    
    root[LTSP]# mdkir /mnt/cdrom
    root[LTSP]# mount -t iso9660 -o loop ltsp-4.2u2-0.iso /mnt/cdrom/
    



Nah klo sudah, sekarang waktu untuk konfigurasi LTSP servernya. Ketikkan perintah seperti dibawah ini untuk masuk kedalam menu konfigurasi LTSP.

    
    
    root[LTSP]# ltspadmin
    
    /usr/sbin/ltspadmin: Must be run as root
    
       If you used ’su’ to become the SuperUser, make sure
       you include the hyphen ‘-’ as an argument to su.
       that is:
    
           su -
    
       That will ensure that the proper environment is setup.
    
    root[LTSP]# su -
    root[~]# ltspadmin
    



Nah klo sudah nanti akan ada tampilan sebagai berikut:  

![](http://www.geocities.com/thundherbolth/LTSP_Zencafe/Gambar1.jpg)

Untuk pertama kali install, pada menu LTSP Administration Utility pilihlah menu Configure the installer options seperti gambar dibawah ini:  

![](http://www.geocities.com/thundherbolth/LTSP_Zencafe/Gambar2.jpg)

Setelah meng-konfigurasi installer optionnya. Sekarang pilihlah menu Install/Update LTSP Package, sehingga tampilannya seperti gambar dibawah ini:  

![](http://www.geocities.com/thundherbolth/LTSP_Zencafe/Gambar3.jpg)  

NB: Tekan A untuk memilih semua paket-paketnya dan Q untuk mulai proses intalasi.

Nah setelah semua paket LTSP nya sudah terinstal, sekarang waktunya untuk mengkonfigurasi LTSP servernya. Ketikkan perintah ltspcfg diterminal atau console, setelah itu tekan tombol enter sehingga muncul tampilan seperti berikut:

    
    
    ltspcfg v0.16            The Linux Terminal Server Project (http://www.LTSP.org)
    
      S - Show the status of all services
      C - Configure the services manually
    
      Q - Quit
    
    Make a selection: c
    



Kemudian tekan C terus enter untuk mulai mengkonfigurasi seluruh service-service yang diperlukan oleh LTSP, tampilan menu konfigurasi tersebut adalah sebagai berikut:

    
    
    ltspcfg v0.16            The Linux Terminal Server Project (http://www.LTSP.org)
    
      1 - Runlevel
      2 - Interface selection
      3 - DHCP configuration
      4 - TFTP configuration
      5 - Portmapper configuration
      6 - NFS configuration
      7 - XDMCP configuration
      8 - Create /etc/hosts entries
      9 - Create /etc/hosts.allow entries
      10 - Create /etc/exports entries
      11 - Create lts.conf file
    
      R - Return to previous menu
      Q - Quit
    
    Make a selection:
    



Setelah menemui tampilan seperti diatas, enable kan semua service-service tersebut.
Catatan untuk Run Level:
- Karena Zencafe/Zenwalk adalah turunan dari Slackware, maka run level untuk GUI adalah run level 4.

Setelah semua selesai dikonfigurasi, tekan tombol R kemudian enter untuk kembali ke menu utama LTSP Admin Utility. Tekan S untuk melihat konfigurasi-konfigurasi yang telah dilakukan pada langkah sebelumnya. Jika langkah yang dilakukan benar, maka tampilannya kurang lebih seperti dibawah ini:

    
    
    Service    Installed   Enabled   Running   Notes
    dhcpd      Yes         no        no
    tftpd      Yes         Yes       Yes       Has ‘-s’ flag
    portmapper Yes         no        Yes
    nfs        Yes         no        Yes
    xdmcp      Yes         no        Yes       xdm, gdm   Using: gdm
    
    File                                Configured  Notes
    /etc/hosts                          Yes
    /etc/hosts.allow                    Yes
    /etc/exports                        Yes
    /opt/ltsp/i386/etc/lts.conf         Yes
    
    Configured runlevel: 4         (value of initdefault in /etc/inittab)
       Current runlevel: 4         (output of the ‘runlevel’ command)
    
    Installation dir…: /opt/ltsp
    
    Press [enter] to return to the main menu…
    



Wah service DHCPD nya koq belum jalan ? Gimana cara menjalankannya ?

Untuk menjalankan service DHCPD pada Zencafe/Zenwalk, tambahkan baris berikut pada file /etc/rc.d/rc.local hingga seperti dibawah ini:

    
    
    #!/bin/sh
    #
    # /etc/rc.d/rc.local:  Local system initialization script.
    #
    # Put any local setup commands in here:
    
    # Jalankan service dhcpd di Zencafe
    /usr/sbin/dhcpd
    



Setelah menambahkan baris tersebut di file /etc/rc.d/rc.local, jangan reboot dulu. Editlah file /etc/dhcpd.conf. Cari baris seperti ini:

    
    
    if substring (option vendor-class-identifier, 0, 9) = "PXEClient" {
            filename "/lts/2.6.16.1-ltsp-1/pxelinux.0";
        }
        else{
            filename "/lts/vmlinuz-2.6.16.1-ltsp-1";
        }
    



menjadi seperti dibawah ini :

    
    
    if substring (option vendor-class-identifier, 0, 9) = "PXEClient" {
            filename "/lts/2.6.17.3-ltsp-1/pxelinux.0";
        }
        else{
            filename "/lts/vmlinuz-2.6.16.1-ltsp-1";
        }
    



NB:
- ganti filename “/lts/2.6.16.1-ltsp-1/pxelinux.0″; dengan filename “/lts/2.6.17.3-ltsp-1/pxelinux.0″;

Kalau sudah, silahkan simpan kemudian reboot untuk melihat hasilnya.

Untuk mengecek apakah service-service yang diperlukan sudah berjalan atau belum, ikuti langkah-langkah berikut:




  * 
Cek DHCPD

    
    
    root[~]# netstat -an | grep ”:67”
    udp        0      0 0.0.0.0:67              0.0.0.0:*
    root[~]# ps aux | grep dhcpd
    root     1509  0.0  0.9   1876   604 pts/0    R+   23:48   0:00 grep dhcpd
    root     3519  0.0  1.9   2516  1196 ?        Ss   23:17   0:00 /usr/sbin/dhcpd
    root[~]#
    





  * 
Cek TFTPD

    
    
    root[~]# ls /tftpboot/
    lts/
    root[~]# touch /tftpboot/tes
    root[~]# ls /tftpboot/
    lts/  tes
    root[~]# tftp localhost
    tftp> verbose
    Verbose mode on.
    tftp> get tes
    getting from localhost:tes to tes [netascii]
    tftp> quit
    root[~]#
    





  * 
Cek NFS, Portmap ama mount daemon.

    
    
    root[~]# ps -e | grep portmap
    2321 ?        00:00:00 rpc.portmap
    root[~]# netstat -an | grep â€:111 â€
    tcp        0      0 0.0.0.0:111             0.0.0.0:*               LISTEN
    udp        0      0 0.0.0.0:111             0.0.0.0:*
    root[~]# ps -e | grep nfs
     433 ?        00:00:00 nfsd
     434 ?        00:00:00 nfsd
     435 ?        00:00:00 nfsd
     436 ?        00:00:00 nfsd
     437 ?        00:00:00 nfsd
     438 ?        00:00:00 nfsd
     439 ?        00:00:00 nfsd
     440 ?        00:00:00 nfsd
    root[~]# ps -e | grep mountd
     442 ?        00:00:00 rpc.mountd
    root[~]# rpcinfo -p localhost
       program vers proto   port
        100000    2   tcp    111  portmapper
        100000    2   udp    111  portmapper
        100024    1   udp    813  status
    
        100024    1   tcp    816  status
        100021    1   udp   1024  nlockmgr
        100021    3   udp   1024  nlockmgr
        100021    4   udp   1024  nlockmgr
        100003    2   udp   2049  nfs
        100003    3   udp   2049  nfs
        100021    1   tcp   4772  nlockmgr
        100021    3   tcp   4772  nlockmgr
        100021    4   tcp   4772  nlockmgr
        100003    2   tcp   2049  nfs
        100003    3   tcp   2049  nfs
        100005    1   udp    618  mountd
        100005    1   tcp    621  mountd
        100005    2   udp    618  mountd
        100005    2   tcp    621  mountd
        100005    3   udp    618  mountd
        100005    3   tcp    621  mountd
    root[~]#
    





Wah kayaknya semua service dah berjalan normal, dan dilihat di status servicenya dah ok nih.

    
    
    The Linux Terminal Server Project (http://www.LTSP.org)
    
    Interface IP Address      Netmask         Network         Broadcast        Used
    eth0      192.168.1.7     255.255.255.0   192.168.1.0     192.168.1.255   < -----
    
    Service    Installed   Enabled   Running   Notes
    dhcpd      Yes         no        Yes       Version 3
    tftpd      Yes         Yes       Yes       Has '-s' flag
    portmapper Yes         no        Yes
    nfs        Yes         no        Yes
    xdmcp      Yes         no        Yes       xdm, gdm   Using: gdm
    
    File                                Configured  Notes
    /etc/hosts                          Yes
    /etc/hosts.allow                    Yes
    /etc/exports                        Yes
    /opt/ltsp/i386/etc/lts.conf         Yes
    
    Configured runlevel: 4         (value of initdefault in /etc/inittab)
       Current runlevel: 4         (output of the 'runlevel' command)
    
    Installation dir...: /opt/ltsp
    
    Press [enter] to return to the main menu...
    



Semua udah running, sekarang coba booting dari client.

Weeeeekkkkzz…..
koq ga keluar guinya ??? Koq keluarnya cuman cursor silang doank di client ? Gimana supaya clientya bisa masuk ke XWindow ??

Caranya sebagai berikut:

Zencafe/Zenwalk memakai gdm untuk login managernya. Mungkin ada sedikit kesalahan di “gdm/login managernya” :D

Sekarang login coba login di PC yang ingin dijadikan sebagai LTSP server dengan akses root. Kemdian buka terminal dan jalankan perintah gdmsetup seperti berikut:

    
    
    root[~]# gdmsetup
    



Setelah menjalankan perintah diatas, akan tampil window seperti gambar dibawah ini:
[![Gambar7](http://farm2.static.flickr.com/1331/852659826_d80ab612de_m.jpg)](http://pemula.blogsome.com/go.php?http://www.flickr.com/photos/10243554@N02/852659826/)  

[  
View Large](http://farm2.static.flickr.com/1331/852659826_d80ab612de_m.jpg)

Pada kolom isian Style, ganti isinya dengan Same As Local, klo sudah silahkan di close terus reboot servernya.

Coba akses dari client, gimana hasilnya ??? :)

Oh iya untuk percobaan ini di pc client memakai PXE. Untuk teman-teman yang ingin cobain LTSP dengan Zencafe sebagai distronya, mungkin bisa saling sharing di **#awali[at]DALnet**. :)

**Referensi-referensi :**
[http://ltsp.mirrors.tds.net/pub/ltsp/docs/ltsp-4.1-en.html](http://ltsp.mirrors.tds.net/pub/ltsp/docs/ltsp-4.1-en.html)
[http://www.ltsp.or.id/dokument6_ver3.htm](http://www.ltsp.or.id/dokument6_ver3.htm)

Maap klo bahasa-nya masih acak-adut, soalnya baru bisa install LTSP :D
Thx buat aa[N] buat tahu gorengnya :)
