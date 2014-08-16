---
comments: true
date: 2009-03-10 15:25:36+00:00
layout: post
slug: trying-opensolaris-200811
title: Trying OpenSolaris 2008.11
wordpress_id: 42
categories:
- OpenSolaris
---

Fyuh akhirnya setelah sekian lama pingin cobain themes GTK Nimbus, akhirnya kesampaian juga kemarin install OpenSolaris 2008.11 di laptop kantor (Acer Aspire 5500Z ) :) (Tepatnya laptopnya [mas Ifnu](http://ifnu.artivisi.com/) :D ).

Proses instal sebenarnya juga ga begitu mulus sih, sehabis boot via CD ternyata berhenti di proses probing device :( luaaaaaaaama banget. Setelah tanya-tanya ke paman google, akhirnya dapat link [disini](http://blogs.sun.com/danasblog/entry/configuring_solaris_acpi_at_boot). Akhirnya dengan modal tekad dan nekat, coba lagi dah dengan menambahkan opsi **acpi-user-options=0x8** akhirnya tampil deh GNOME 2.24.0 dengan themes Nimbus idaman saya :)

Proses instalasi OpenSolaris ga begitu sulit ternyata, cukup mudah dan tinggal ikutin langkah-langkah yang udah dijelasin ama om Rachmat [disini](http://w3hol.wordpress.com/2009/02/14/install-opensolaris-itu-mudah/). Seperti yang udah om Rachmat katakan, proses instalasi yang saya lakukan juga ga begitu sulit koq tinggal Next, Next dan Done :)

Tapi setelah proses instalasi selesai ternyata timbul masalah baru lagi, saya lupa backup grub Ubuntu 8.10 yang saya pakai tiap hari :(( . Yah akhirnya mau ga mau cari LiveCD Ubuntu kemudian copy file menu.lst punya Ubuntu dan paste ke grub-nya OpenSolaris yang terdapat di **/rpool/boot/grub** dan hasil akhir menu.lst saya adalah sebagai berikut :

    
    
    splashimage /boot/grub/splash.xpm.gz
    background 215ECA
    timeout 30
    default 0
    #---------- ADDED BY BOOTADM - DO NOT EDIT ----------
    title OpenSolaris 2008.11 snv_101b_rc2 X86
    findroot (pool_rpool,3,a)
    splashimage /boot/solaris.xpm
    foreground d25f00
    background 115d93
    bootfs rpool/ROOT/opensolaris
    kernel$ /platform/i86pc/kernel/$ISADIR/unix -B $ZFS-BOOTFS,console=graphics,acpi-user-options=0x8
    module$ /platform/i86pc/$ISADIR/boot_archive
    #---------------------END BOOTADM--------------------
    
    # Unknown partition of type 131 found on /dev/rdsk/c3d0p0 partition: 1
    # It maps to the GRUB device: (hd0,0) .
    
    # Unknown partition of type 5 found on /dev/rdsk/c3d0p0 partition: 2
    # It maps to the GRUB device: (hd0,1) .
    
    # Unknown partition of type 131 found on /dev/rdsk/c3d0p0 partition: 3
    # It maps to the GRUB device: (hd0,2) .
    
    title OpenSolaris 2008.11 snv_101b_rc2 X86 text boot
    findroot (pool_rpool,3,a)
    bootfs rpool/ROOT/opensolaris
    kernel$ /platform/i86pc/kernel/$ISADIR/unix -B $ZFS-BOOTFS,acpi-user-options=0x8
    module$ /platform/i86pc/$ISADIR/boot_archive
    
    #--------------- UBUNTU -------------------------------------
    title		Ubuntu 8.10, kernel 2.6.27-7-generic
    uuid		1ddb05f1-298e-4d0e-a308-fc7d31279eb0
    root            (hd0,0)
    kernel		/boot/vmlinuz-2.6.27-7-generic root=UUID=1ddb05f1-298e-4d0e-a308-fc7d31279eb0 ro quiet splash
    initrd		/boot/initrd.img-2.6.27-7-generic
    quiet
    
    title		Ubuntu 8.10, kernel 2.6.27-7-generic (recovery mode)
    uuid		1ddb05f1-298e-4d0e-a308-fc7d31279eb0
    root            (hd0,0)
    kernel		/boot/vmlinuz-2.6.27-7-generic root=UUID=1ddb05f1-298e-4d0e-a308-fc7d31279eb0 ro  single
    initrd		/boot/initrd.img-2.6.27-7-generic
    #--------------- END UBUNTU -------------------------------------
    


<!-- more -->
Setelah mengedit file **/rpool/boot/grub** akhirnya saya coba restart, dan inilah hasilnya :

[![Screenshot](http://farm4.static.flickr.com/3595/3344693484_64086d62a5.jpg)  
Tampilan Clean Desktop](http://www.flickr.com/photos/10243554@N02/3344693484/)  


[![Screenshot-3](http://farm4.static.flickr.com/3538/3344693492_2a0a8f591f.jpg)  
Tampilan Quick Help OpenSolaris](http://www.flickr.com/photos/10243554@N02/3344693492/)  


[![Screenshot-1](http://farm4.static.flickr.com/3620/3344693488_ee724e1de6.jpg)  
Icon file type java cakep yah di Nimbus :* ](http://www.flickr.com/photos/10243554@N02/3344693488/)  


[![Screenshot-4](http://farm4.static.flickr.com/3620/3344693498_439caf137f.jpg)  
Tampilan IPS-nya OpenSolaris, ga jauh beda ama punya Ubuntu ternyata :) ](http://www.flickr.com/photos/10243554@N02/3344693498/)  


Puas banget bisa pake OS **idaman** apalagi dengan Nimbus-nya :) , tapi sayangnya masih ada 1 kendala lagi nih iks... :(( Lan card ma Wifi-nya masih belum dikenali :( ketika di coba dilihat di **Device Driver Utility** hasilnya seperti ini :
[![Screenshot-2](http://farm4.static.flickr.com/3570/3344693490_2e2e61b1c0.jpg)  
Iks.. :(( Cinta emang butuh pengorbanan ](http://www.flickr.com/photos/10243554@N02/3344693490/)  


Hmm... masih perlu belajar dan menimba ilmu yang banyak nih dari para sesepuh yang ada di [OSUG-ID](http://groups.google.com/group/OSUG-Indonesia), supaya bisa naklukin hati si OpenSolaris-nya :) . Nah kalau masalah jaringan-nya udah selesai, saatnya say goodbye ama Ubuntu buat digantiin ama Slackware :) Maklum Slackware kan cinta pertama saya :malu: , sekalian mau submit2x Slackbuild lagi ke [Slackware Linux Indonesia](http://slackware.linux.or.id/)

Rencana kedepan, OS yang bakalan dipakai yaitu OpenSolaris sebagai default OS dan Slackware buat ngoprek :) , akhirnya setelah menunggu sekian lama bisa juga cobain Nimbus di rumahnya sendiri :)

**Note : **
Buat yang mau download file iso-nya, bisa download disini (IIX loch, make space kantor :D ) :
- [osol-0811.iso](http://www.artivisi.com/~martinus/downloads/osol-0811.iso)
