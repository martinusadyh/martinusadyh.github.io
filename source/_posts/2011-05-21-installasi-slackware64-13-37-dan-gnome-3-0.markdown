---
comments: true
date: 2011-05-21 19:30:27+00:00
layout: post
slug: installasi-slackware64-13-37-dan-gnome-3-0
title: Installasi Slackware64 13.37 dan GNOME 3.0
wordpress_id: 1308
categories:
- Slackware
tags:
- Broadcom
- GNOME3
- Linux Driver
- Slackware
---

Sudah lama sekali rasanya saya tidak posting apapun tentang Slackware :D Nah untuk kali ini, berhubung [Slackware 13.37](http://martinusadyh.web.id/2011/04/28/slackware-13-37-is-released/) juga barusan dirilis akhirnya kesampaian juga untuk melakukan _"clean format"_ pada harddisk agar menggunakan Slackware saja sebagai Sistem Operasi utama saya :D Kali ini saya menginstall Slackware64 dan menggunakan kernel default yaitu 2.6.37, sedangkan untuk pilihan Desktop Manager-nya pilihan saya jatuh pada GNOME 3.0 yang diambil dari [GNOME Slackbuild](http://gnomeslackbuild.org/) sekalian mencoba suasana baru :)

Proses installasi ini berjalan seperti biasa tidak ada yang berubah, setelah selesai menginstall Slackware64 langkah selanjut-nya yaitu menginstall GNOME 3.0 dari [GNOME Slackbuild](http://gnomeslackbuild.org/) Setelah selesai menginstall GNOME 3.0, langkah selanjutnya yang saya lakukan adalah konfigurasi driver [Broadcom BCM4312 802.11b](http://martinusadyh.web.id/2009/09/27/konfigurasi-broadcom-bcm4312-80211b-di-slackware-130/) agar wifi saya bisa berjalan dengan normal :) Untuk drivernya sendiri bisa didownload di halaman [802.11 Linux STA driver](http://www.broadcom.com/support/802.11/linux_sta.php). Nah masalah mulai muncul ketika menjalankan perintah `make clean` yang hasilnya adalah seperti berikut :
[plain]
CC [M]  /home/martinus/driver_broadcom/src/wl/sys/wl_linux.o
/home/martinus/driver_broadcom/src/wl/sys/wl_linux.c: In function 'wl_attach':
/home/martinus/driver_broadcom/src/wl/sys/wl_linux.c:485:3: error: implicit declaration of function 'init_MUTEX'
make[2]: *** [/home/martinus/driver_broadcom/src/wl/sys/wl_linux.o] Error 1
make[1]: *** [_module_/home/martinus/driver_broadcom] Error 2
make[1]: Leaving directory `/usr/src/linux-2.6.37'
make: *** [all] Error 2
[/plain]
<!-- more -->
Untung-nya om Google mengarahkan saya ke thread [patching-802-11-linux-sta-driver-for-kernel-2-6-37](http://www.linuxquestions.org/questions/blog/frandalla-68463/patching-802-11-linux-sta-driver-for-kernel-2-6-37-3558/) yang menganjurkan untuk mengganti beberapa baris pada file `/home/martinus/driver_broadcom/src/wl/sys/wl_linux.c` yang asalnya seperti ini :

    
    
    #endif
    	init_MUTEX(&wl-;>sem);
    }
    



menjadi :

    
    
    #endif 
    #ifndef init_MUTEX
    	sema_init(&wl-;>sem,1);
    #else
    	init_MUTEX(&wl-;>sem);
    #endif
    



Setelah melakukan perubahan diatas, sekarang jalankan lagi perintah `make` dan harusnya sudah tidak ada error lagi seperti dibawah ini :
[plain]
root@artivisi:/home/martinus/driver_broadcom# make
KBUILD_NOPEDANTIC=1 make -C /lib/modules/`uname -r`/build M=`pwd`
make[1]: Entering directory `/usr/src/linux-2.6.37.6'
  LD      /home/martinus/driver_broadcom/hybrid_wl/built-in.o
  CC [M]  /home/martinus/driver_broadcom/hybrid_wl/src/shared/linux_osl.o
  CC [M]  /home/martinus/driver_broadcom/hybrid_wl/src/wl/sys/wl_linux.o
  CC [M]  /home/martinus/driver_broadcom/hybrid_wl/src/wl/sys/wl_iw.o
  LD [M]  /home/martinus/driver_broadcom/hybrid_wl/wl.o
  Building modules, stage 2.
  MODPOST 1 modules
WARNING: modpost: missing MODULE_LICENSE() in /home/martinus/driver_broadcom/wl.o
see include/linux/module.h for more information
  CC      /home/martinus/driver_broadcom/wl.mod.o
  LD [M]  /home/martinus/driver_broadcom/wl.ko
make[1]: Leaving directory `/usr/src/linux-2.6.37.6'
root@artivisi:/home/martinus/driver_broadcom#
[/plain]

Setelah berhasil mendapatkan file `wl_linux.o`, ikutilah petunjuk yang terdapat pada file [README.txt](http://www.broadcom.com/docs/linux_sta/README.txt) sampai selesai. Dan jika sudah, kita bisa menggunakan wireless kita seperti gambar dibawah ini :)
[![WifiON](http://farm4.static.flickr.com/3005/5743033089_33b0fef937.jpg)](http://www.flickr.com/photos/10243554@N02/5743033089/)

Ternyata GNOME 3.0 bawaan [GNOME Slackbuild](http://gnomeslackbuild.org/) tidak menyertakan GDM 3.0 dikarenakan GDM 3.0 memerlukan PAM yang tidak terdapat di Slackware, oleh sebab itu akhirnya pihak pengembang [GNOME Slackbuild](http://gnomeslackbuild.org/) tidak menyertakan GDM 3.0 pada rilis kali ini (penjelasan ini bisa dibaca di thread [GDM 3.0.0 Compiling](http://groups.google.com/group/gsb-users/browse_thread/thread/bf4a3bcae34ff6ac?pli=1)). Selain itu jika ingin tahu masalah ada apa antara PAM dengan Slackware, mungkin bisa membaca 2 tulisan om Walesa berjudul [Slackware pake PAM?](http://www.walecha.net/content/slackware-pake-pam) dan [GNOME 3.0 Sudah Datang](http://www.walecha.net/content/gnome-30-sudah-datang) :)

Karena [GNOME Slackbuild](http://gnomeslackbuild.org/) tidak menyertakan GDM 3.0, akhirnya pilihan saya jatuh ke [SLiM (Simple Login Manager)](http://slim.berlios.de/) yang Slackbuild-nya bisa di download di [sini](http://slackbuilds.org/repository/13.37/system/slim/). Setelah selesai menginstall SLiM, sekarang tambahkanlah baris dibawah ini pada file `/etc/rc.d/rc.4` :

    
    
    # Author:	Fred N. van Kempen, <waltje@uwalt.nl.mugnet.org>
    # At least 47% rewritten by:  Patrick J. Volkerding <volkerdi@slackware.com>
    #
    
    # Tell the viewers what's going to happen...
    echo "Starting up X11 session manager..."
    
    # Try to use SLIM
    if [ -x /usr/bin/slim ]; then
      exec /usr/bin/slim -d
    fi
    



Jika sudah sekarang rebootlah, maka kita akan mendapatkan tampilan login manager yang kurang lebih seperti gambar dibawah ini :
[![preview](http://farm6.static.flickr.com/5107/5743963438_d51e35da09.jpg)](http://www.flickr.com/photos/10243554@N02/5743963438/)

Setelah semuanya selesai, dibawah ini adalah beberapa tampilan Slackware64 13.37 with GNOME 3.0 in Action :)






    
[![Slackware_Clean_Desktop](http://farm6.static.flickr.com/5262/5743983168_f342c40771_m.jpg)](http://www.flickr.com/photos/10243554@N02/5743983168/)

    
[![GNOME_Shell2](http://farm4.static.flickr.com/3141/5743983164_9dcdb5374b_m.jpg)](http://www.flickr.com/photos/10243554@N02/5743983164/)





    
[![GNOME_Shell](http://farm3.static.flickr.com/2539/5743983160_52fe823219_m.jpg)](http://www.flickr.com/photos/10243554@N02/5743983160/)

    
[![Slackware_GNOME3](http://farm4.static.flickr.com/3368/5743992690_b6bde6750f_m.jpg)](http://www.flickr.com/photos/10243554@N02/5743992690/)




Hmm.. kelihatan lebih "clean" yah :)  
