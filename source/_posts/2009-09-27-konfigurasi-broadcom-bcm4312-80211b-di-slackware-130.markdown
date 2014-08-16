---
comments: true
date: 2009-09-27 21:34:53+00:00
layout: post
slug: konfigurasi-broadcom-bcm4312-80211b-di-slackware-130
title: Konfigurasi Broadcom BCM4312 802.11b Di Slackware 13.0
wordpress_id: 71
categories:
- Slackware
---

Fyuh... akhirnya berhasil juga meng-enable-kan wireles dengan chipset Broadcom BCM4312 di [Slackware 13.0](http://slackware.com/) berkat **hint** dari [Om Arya Sabda](http://aryasabda.dagdigdug.com/) di [milis id-slackware](http://groups.google.com/group/id-slackware/browse_thread/thread/3d83aff7866747b0) :)

Sedangkan pada tulisan kali ini hardware yang dicoba yaitu Laptop DELL Inspiron 1320 dengan spesifikasi seperti dibawah ini :

    
    
    root@martinusadyh:~# lspci
    ...
    ...
    0e:00.0 Network controller: Broadcom Corporation BCM4312 802.11b/g (rev 01)
    ...
    ...
    



Dan [Slackware](http://slackware.com/) yang saya pakai yaitu [Slackware 13.0](http://slackware.com/) dengan kernel (default kernel bawaan [Slackware 13.0](http://slackware.com/)) sebagai berikut :

    
    
    root@martinusadyh:~# uname -a
    Linux martinusadyh 2.6.29.6-smp #1 SMP Mon Aug 17 00:18:05 CDT 2009 i686 Intel(R) Core(TM)2 Duo CPU     T6500  @ 2.10GHz GenuineIntel GNU/Linux
    root@martinusadyh:~#
    



Setelah mendapatkan **hint** dari [Om Arya Sabda](http://aryasabda.dagdigdug.com/), secara otomatis tujuan utama saya yaitu melihat ke blog [om Somat](http://somat.web.id/) yang juga mengalami kejadian yang sama di [sini](http://somat.web.id/2009/sep/08/wifi-broadcom-compaq-cq40-slackware-130/). Solusi Om Somat menggunakan ndiswrapper ternyata, awalnya sih saya juga ingin menggunakan ndiswrapper ngikut ke blog Om Somat :D :) . Tapi gara-gara di google nemu tulisan om Denic [disini](http://makassar-slackers.org/node/193) akhirnya penasaran juga cobain untuk pake driver resmi dari Broadcom-nya :)
<!-- more -->
Ok sekarang sudah jelas, jadi kita mesti download dahulu driver dari Broadcom-nya dan driver tersebut bisa didownload [disini.](http://www.broadcom.com/support/802.11/linux_sta.php) Nah sebelum mulai proses download, buatlah sebuah direktori dahulu untuk menyimpan source code driver dari Broadcom BCM4312 kemudian masuklah kedalam direktori yang telah dibuat tersebut seperti dibawah ini :

    
    
    martinus@martinusadyh:~/Downloads$ mkdir driver_broadcom
    martinus@martinusadyh:~/Downloads$ cd driver_broadcom/
    martinus@martinusadyh:~/Downloads/driver_broadcom$
    



Setelah membuat sebuah direktori khusus untuk menampung hasil download, sekarang mari kita download source code driver Broadcom-nya dan file README.txt seperti dibawah ini:

    
    
    martinus@martinusadyh:~/Downloads/driver_broadcom$ wget -c http://www.broadcom.com/docs/linux_sta/hybrid-portsrc-x86_32-v5.10.91.9.3.tar.gz
    --2009-09-27 23:42:53--  http://www.broadcom.com/docs/linux_sta/hybrid-portsrc-x86_32-v5.10.91.9.3.tar.gz
    Resolving www.broadcom.com... 208.70.88.55
    Connecting to www.broadcom.com|208.70.88.55|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 604412 (590K) [application/x-gzip]
    Saving to: `hybrid-portsrc-x86_32-v5.10.91.9.3.tar.gz'
    
    100%[===========================================================================================================>] 604,412     98.3K/s   in 6.6s
    
    2009-09-27 23:43:00 (89.8 KB/s) - `hybrid-portsrc-x86_32-v5.10.91.9.3.tar.gz' saved [604412/604412]
    
    martinus@martinusadyh:~/Downloads/driver_broadcom$ wget -c http://www.broadcom.com/docs/linux_sta/README.txt
    --2009-09-27 23:45:32--  http://www.broadcom.com/docs/linux_sta/README.txt
    Resolving www.broadcom.com... 208.70.88.55
    Connecting to www.broadcom.com|208.70.88.55|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 3603 (3.5K) [text/plain]
    Saving to: `README.txt'
    
    100%[===========================================================================================================>] 3,603       15.5K/s   in 0.2s
    
    2009-09-27 23:45:33 (15.5 KB/s) - `README.txt' saved [3603/3603]
    


**Note: Sesuaikan driver yang didownload dengan tipe processor anda, untuk 32 bit bisa didownload [disini](http://www.broadcom.com/docs/linux_sta/hybrid-portsrc-x86_32-v5.10.91.9.3.tar.gz) dan untuk 64 bit bisa didownload [disini.](http://www.broadcom.com/docs/linux_sta/hybrid-portsrc-x86_64-v5.10.91.9.3.tar.gz)**




**Jangan Download File Patch Untuk Kernel 2.6.29**
Yups untuk file 2.6.29 kernel patch jangan didownload :D Karena ketika saya coba untuk melakukan patching pada source code driver broadcom-nya sesuai anjuran [disini](http://www.linuxquestions.org/questions/slackware-14/configure-wireless-driver-for-dell-wireless-1397bcm-4312-752389/#post3681099) hasil akhirnya adalah seperti ini :

    
    
    martinus@martinusadyh:~/Downloads/driver_broadcom/hybrid_wl$ patch -p1 < patch_2.6.29_kernels
    patching file src/wl/sys/wl_iw.c
    Hunk #1 FAILED at 9.
    Hunk #2 succeeded at 60 with fuzz 2 (offset 6 lines).
    Hunk #3 FAILED at 609.
    Hunk #4 FAILED at 634.
    Hunk #5 FAILED at 1109.
    Hunk #6 FAILED at 1132.
    Hunk #7 FAILED at 1787.
    Hunk #8 FAILED at 1918.
    7 out of 8 hunks FAILED -- saving rejects to file src/wl/sys/wl_iw.c.rej
    patching file src/wl/sys/wl_linux.c
    Hunk #1 FAILED at 10.
    Hunk #2 FAILED at 41.
    Hunk #3 FAILED at 121.
    Hunk #4 succeeded at 322 with fuzz 2 (offset 44 lines).
    Hunk #5 FAILED at 402.
    Hunk #6 FAILED at 717.
    Hunk #7 succeeded at 903 with fuzz 2 (offset 58 lines).
    Hunk #8 FAILED at 919.
    6 out of 8 hunks FAILED -- saving rejects to file src/wl/sys/wl_linux.c.rej
    patching file src/wl/sys/wl_linux.h
    Hunk #1 FAILED at 9.
    Hunk #2 FAILED at 72.
    2 out of 2 hunks FAILED -- saving rejects to file src/wl/sys/wl_linux.h.rej
    martinus@martinusadyh:~/Downloads/driver_broadcom/hybrid_wl$
    




Berdasarkan file [README.txt](http://www.broadcom.com/docs/linux_sta/README.txt
), kita harus membuat sebuah direktori yaitu **hybrid_wl** lalu meng-ekstrak driver tersebut ke dalam direktori **hybrid_wl** seperti dibawah ini:

    
    
    martinus@martinusadyh:~/Downloads/driver_broadcom$ mkdir hybrid_wl
    martinus@martinusadyh:~/Downloads/driver_broadcom$ cd hybrid_wl/
    martinus@martinusadyh:~/Downloads/driver_broadcom/hybrid_wl$ tar xzf ~/Downloads/driver_broadcom/hybrid-portsrc-x86_32-v5.10.91.9.3.tar.gz
    martinus@martinusadyh:~/Downloads/driver_broadcom/hybrid_wl$ ls
    Makefile  lib  src
    martinus@martinusadyh:~/Downloads/driver_broadcom/hybrid_wl$
    



Setelah melakukan proses ektrasi sekarang pindah dulu ke user **root** dengan menggunakan perintah **su -** kemudian jalankan perintah seperti dibawah ini :

    
    
    root@martinusadyh:/home/martinus/Downloads/driver_broadcom/hybrid_wl# make -C /lib/modules/2.6.29.6-smp/build M=`pwd` clean
    make: Entering directory `/usr/src/linux-2.6.29.6'
    make: Leaving directory `/usr/src/linux-2.6.29.6'
    root@martinusadyh:/home/martinus/Downloads/driver_broadcom/hybrid_wl# make -C /lib/modules/2.6.29.6-smp/build M=`pwd`
    make: Entering directory `/usr/src/linux-2.6.29.6'
      LD      /home/martinus/Downloads/driver_broadcom/hybrid_wl/built-in.o
      CC [M]  /home/martinus/Downloads/driver_broadcom/hybrid_wl/src/wl/sys/wl_linux.o
      CC [M]  /home/martinus/Downloads/driver_broadcom/hybrid_wl/src/wl/sys/wl_iw.o
      CC [M]  /home/martinus/Downloads/driver_broadcom/hybrid_wl/src/shared/linux_osl.o
      LD [M]  /home/martinus/Downloads/driver_broadcom/hybrid_wl/wl.o
      Building modules, stage 2.
      MODPOST 1 modules
    WARNING: modpost: missing MODULE_LICENSE() in /home/martinus/Downloads/driver_broadcom/hybrid_wl/wl.o
    see include/linux/module.h for more information
      CC      /home/martinus/Downloads/driver_broadcom/hybrid_wl/wl.mod.o
      LD [M]  /home/martinus/Downloads/driver_broadcom/hybrid_wl/wl.ko
    make: Leaving directory `/usr/src/linux-2.6.29.6'
    root@martinusadyh:/home/martinus/Downloads/driver_broadcom/hybrid_wl#
    



Ok proses compilasi telah berjalan dengan sukses, dan kita juga sudah mendapatkan file **wl.ko** sesuai anjuran yang terdapat dalam file [README.txt](http://www.broadcom.com/docs/linux_sta/README.txt
) dan dapat kita cek hasilnya adalah seperti dibawah ini :

    
    
    root@martinusadyh:/home/martinus/Downloads/driver_broadcom/hybrid_wl# ls
    Makefile  Module.markers  Module.symvers  built-in.o  lib/  modules.order  src/  wl.ko  wl.mod.c  wl.mod.o  wl.o
    root@martinusadyh:/home/martinus/Downloads/driver_broadcom/hybrid_wl#
    



Setelah mendapatkan file **wl.ko** sekarang kopikan file tersebut ke dalam direktori **/lib/modules/2.6.29.6-smp/kernel/net/wireless/** seperti dibawah ini :

    
    
    root@martinusadyh:/home/martinus/Downloads/driver_broadcom/hybrid_wl# cp wl.ko /lib/modules/2.6.29.6-smp/kernel/net/wireless/
    root@martinusadyh:/home/martinus/Downloads/driver_broadcom/hybrid_wl#
    



Ok sampai tahap ini driver sebenarnya sudah dapat digunakan :) sekarang mari kita test apakah wifi kita sudah dikenali atau belum dengan mengetikkan perintah dibawah ini :

    
    
    root@martinusadyh:/home/martinus/Downloads/driver_broadcom/hybrid_wl# /sbin/modprobe lib80211
    root@martinusadyh:/home/martinus/Downloads/driver_broadcom/hybrid_wl# /sbin/insmod /lib/modules/2.6.29.6-smp/kernel/net/wireless/wl.ko
    



Sekarang coba jalankan perintah **iwconfig** dan eng...ing...eng.. interface **wifi**-nya akhirnya nongol seperti dibawah ini :

    
    
    root@martinusadyh:~# iwconfig
    lo        no wireless extensions.
    
    eth0      no wireless extensions.
    
    eth1      IEEE 802.11bg  ESSID:""  Nickname:""
              Mode:Managed  Frequency:2.412 GHz  Access Point: Not-Associated
              Bit Rate:54 Mb/s   Tx-Power:32 dBm
              Retry min limit:7   RTS thr:off   Fragment thr:off
              Power Managementmode:All packets received
              Link Quality=5/5  Signal level=-57 dBm  Noise level=0 dBm
              Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
              Tx excessive retries:0  Invalid misc:0   Missed beacon:0
    
    root@martinusadyh:~#
    



Ups... jangan senang dahulu :) karena masih ada beberapa konfigurasi yang perlu kita setting. Agar module bisa di load otomatis ketika kita melakukan proses restart, sekarang editlah file **/etc/rc.d/rc.modules** dan tambahkan 2 baris seperti dibawah ini :

    
    
    # Tambahan untuk konfigurasi wireles
    /sbin/modprobe lib80211
    /sbin/insmod /lib/modules/2.6.29.6-smp/kernel/net/wireless/wl.ko
    



Setelah melakukan proses penyimpanan, coba restart laptop anda dan **rasakan beda-nya** :D :) Dan berhubung saya menggunakan [GNOMESlackBuild](http://gnomeslackbuild.org/), akhirnya saya bisa menggunakan [Network Manager](http://projects.gnome.org/NetworkManager/) bawaan [GNOME](http://gnome.org/) untuk konek ke Access Point-2x gratis :D seperti gambar dibawah ini :
[![broadcom_result](http://farm3.static.flickr.com/2658/3960414122_4ce5823029.jpg)](http://www.flickr.com/photos/10243554@N02/3960414122/)

Ada teman yang ngomong, **Slackware koq gampang yah konfigurasi jaringan-nya, kayak Ubuntu** :) (Ga tau-nya begadang semaleman biar bisa kek gini :malu: )

**Link-link terkait :**
- [802.11 Linux STA driver](http://www.broadcom.com/support/802.11/linux_sta.php)
- [Masalah BCM4312b/g terpecahkan tanpa Ndiswrapper](http://makassar-slackers.org/node/193)
- [Wifi Broadcom Compaq CQ40 Slackware 13.0](http://somat.web.id/2009/sep/08/wifi-broadcom-compaq-cq40-slackware-130/)
- [Slackware 13.0 RC2 X86_64 Broadcom bcm4312 problems](http://www.linuxquestions.org/questions/slackware-14/slackware-13.0-rc2-x8664-broadcom-bcm4312-problems-749958/?highlight=BCM4312)
- [Configure wireless driver for Dell Wireless 1397(bcm 4312)](http://www.linuxquestions.org/questions/slackware-14/configure-wireless-driver-for-dell-wireless-1397bcm-4312-752389/#post3681099)
- [Compaq CQ40](http://groups.google.com/group/id-slackware/browse_thread/thread/d17a9d54415d7cb2)


**Tulisan ini dibuat untuk menyukseskan [Lomba Blog Open Source](http://www.informatika.lipi.go.id/seminar/lombablog/) P2I-LIPI dan [Seminar Open Source](http://www.informatika.lipi.go.id/seminar/) P2I-LIPI 2009. **
