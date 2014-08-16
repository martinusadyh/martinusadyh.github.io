---
comments: true
date: 2009-03-19 21:00:29+00:00
layout: post
slug: installasi-driver-bcm4401-opensolaris-200811-di-acer-aspire-5500z
title: Installasi Driver BCM4401 OpenSolaris 2008.11 di Acer Aspire 5500Z
wordpress_id: 44
categories:
- OpenSolaris
---

Fyuh akhirnya berhasil juga nih konfigurasi Lan Card di OpenSolaris 2008.11 pada Laptop Acer Aspire 5500Z :) sedangkan untuk wifi-nya masih belum ketemu cara konfigurasinya :malu: (Apa wifinya ga enable gara-gara waktu boot saya pakai opsi **acpi-user-options=0x8** yach ?? Tapi gpp lah, yang penting dah bisa konek ke internet dulu :) )

Nah karena yang masalah yang sedang saya hadapi adalah LanCard di laptop yang saya pakai tidak terdeteksi, maka cara paling gampang yaitu masuk ke Linux dan kemudian kita lihat dengan perintah **lspci** yang akan dengan baik hati memberi tahu device apa saja yang tertancap pada laptop yang saya pakai ini. Dan output dari perintah **lspci** di laptop yang saya pakai adalah sebagai berikut :

    
    
    00:00.0 Host bridge: Intel Corporation Mobile 915GM/PM/GMS/910GML Express Processor to DRAM Controller (rev 04)
    00:02.0 VGA compatible controller: Intel Corporation Mobile 915GM/GMS/910GML Express Graphics Controller (rev 04)
    00:02.1 Display controller: Intel Corporation Mobile 915GM/GMS/910GML Express Graphics Controller (rev 04)
    00:1c.0 PCI bridge: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) PCI Express Port 1 (rev 04)
    00:1c.1 PCI bridge: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) PCI Express Port 2 (rev 04)
    00:1d.0 USB Controller: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) USB UHCI #1 (rev 04)
    00:1d.1 USB Controller: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) USB UHCI #2 (rev 04)
    00:1d.2 USB Controller: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) USB UHCI #3 (rev 04)
    00:1d.3 USB Controller: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) USB UHCI #4 (rev 04)
    00:1d.7 USB Controller: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) USB2 EHCI Controller (rev 04)
    00:1e.0 PCI bridge: Intel Corporation 82801 Mobile PCI Bridge (rev d4)
    00:1e.2 Multimedia audio controller: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) AC'97 Audio Controller (rev 04)
    00:1e.3 Modem: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) AC'97 Modem Controller (rev 04)
    00:1f.0 ISA bridge: Intel Corporation 82801FBM (ICH6M) LPC Interface Bridge (rev 04)
    00:1f.1 IDE interface: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) IDE Controller (rev 04)
    00:1f.3 SMBus: Intel Corporation 82801FB/FBM/FR/FW/FRW (ICH6 Family) SMBus Controller (rev 04)
    05:01.0 Ethernet controller: Broadcom Corporation BCM4401-B0 100Base-TX (rev 02)
    05:02.0 Network controller: Intel Corporation PRO/Wireless 2200BG [Calexico2] Network Connection (rev 05)
    05:04.0 CardBus bridge: ENE Technology Inc CB1410 Cardbus Controller (rev 01)
    



Nah ketahuan tuh informasi tentang Lan Card yang dipakai di laptop saya, nah akhirnya iseng-iseng cari di google dengan keyword **BCM4401-B0 100Base-TX open solaris** dan menemukan beberapa petunjuk yang dapat dilihat [disini](http://homepage2.nifty.com/mrym3/taiyodo/eng/) dan [disana](http://echelog.matzon.dk/logs/browse/opensolaris/1228258800) :) Dari hasil [chatting](http://echelog.matzon.dk/logs/browse/opensolaris/1228258800) yang saya baca diatas, kita tinggal mengikuti panduan manual yang terdapat pada driver bfe yang dapat didownload [disini](http://homepage2.nifty.com/mrym3/taiyodo/eng/).
<!-- more -->
Nah dibawah ini adalah detail langkah-langkah yang saya lakukan ketika menginstall driver bfe tersebut :

    
    
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard# ls
    bfe-1.1.1.tar.gz   bfe-2.6.1.tar.gz   thread.jspa_files  thread.jspa.html
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard# gunzip -cd bfe-2.6.1.tar.gz | tar xf -
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard# ls
    bfe-1.1.1.tar.gz   bfe-2.6.1          bfe-2.6.1.tar.gz   thread.jspa_files  thread.jspa.html
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard# cd bfe-2.6.1
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard/bfe-2.6.1# ls
    adddrv.sh               gem.c                   Makefile.amd64_gcc      Makefile.config_gld2    Makefile.sparc_gcc      README.japanese-euc
    amd64                   gem.h                   Makefile.amd64_suncc    Makefile.config_gld3    Makefile.sparc_suncc    README.txt
    bcm4400reg.h            gem_mii.h               Makefile.amd64_suncc12  Makefile.i386_gcc       Makefile.sparcv9_gcc    sparc
    bfe_gem.c               i386                    Makefile.common         Makefile.i386_suncc     Makefile.sparcv9_suncc  sparcv9
    COPYING                 Makefile                Makefile.config         Makefile.macros         obj                     version
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard/bfe-2.6.1# /usr/ccs/bin/make
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard/bfe-2.6.1# /usr/ccs/bin/make install
    /usr/sbin/install -f /kernel/drv -m 755 -u root -g sys i386/bfe
    new owner is root
    i386/bfe installed as /kernel/drv/bfe
    cp /etc/system /etc/system.nobfe
    echo "exclude: bfe" >> /etc/system.nobfe
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard/bfe-2.6.1# ./adddrv.sh
    exit status = 0
    System configuration files modified but bfe driver not loaded or attached.
    Driver (bfe) installed.
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard/bfe-2.6.1# modload obj/bfe
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard/bfe-2.6.1# devfsadm -i bfe
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard/bfe-2.6.1# ifconfig bfe0 plumb
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard/bfe-2.6.1# ifconfig -a
    lo0: flags=2001000849<up,LOOPBACK,RUNNING,MULTICAST,IPv4,VIRTUAL> mtu 8232 index 1
    	inet 127.0.0.1 netmask ff000000
    iwi0: flags=201000802<broadcast,MULTICAST,IPv4,CoS> mtu 1500 index 2
    	inet 0.0.0.0 netmask 0
    	ether 0:13:ce:ea:da:b3
    bfe0: flags=201000842<broadcast,RUNNING,MULTICAST,IPv4,CoS> mtu 1500 index 3
    	inet 0.0.0.0 netmask 0
    	ether 0:f:b0:f3:ea:d7
    lo0: flags=2002000849<up,LOOPBACK,RUNNING,MULTICAST,IPv6,VIRTUAL> mtu 8252 index 1
    	inet6 ::1/128
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard/bfe-2.6.1# ifconfig bfe0
    bfe0: flags=201000842<broadcast,RUNNING,MULTICAST,IPv4,CoS> mtu 1500 index 3
    	inet 0.0.0.0 netmask 0
    	ether 0:f:b0:f3:ea:d7
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard/bfe-2.6.1# ifconfig bfe0 up
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard/bfe-2.6.1# ping 192.168.1.1
    ICMP Host Unreachable from gateway opensolarisbox (127.0.0.1)
     for icmp from opensolarisbox (127.0.0.1) to 192.168.1.1
    ICMP Host Unreachable from gateway opensolarisbox (127.0.0.1)
     for icmp from opensolarisbox (127.0.0.1) to 192.168.1.1
    ICMP Host Unreachable from gateway opensolarisbox (127.0.0.1)
     for icmp from opensolarisbox (127.0.0.1) to 192.168.1.1
    ICMP Host Unreachable from gateway opensolarisbox (127.0.0.1)
     for icmp from opensolarisbox (127.0.0.1) to 192.168.1.1
    ICMP Host Unreachable from gateway opensolarisbox (127.0.0.1)
     for icmp from opensolarisbox (127.0.0.1) to 192.168.1.1
    ^C
    martin@opensolarisbox:~/Download/SolarisPackages/DriverLanCard/bfe-2.6.1#
    



Weeeew.. koq ngeping ke gateway-nya ga bisa yah ?? Coba baca-baca lagi di halaman README.txt yang disertakan oleh driver bfe, eh ternyata kita disuruh reboot dahulu. Setelah reboot, sekarang kita coba lagi nge-ping ke gateway dulu dan hasilnya adalah seperti dibawah ini :

    
    
    martin@opensolarisbox:~$ ping 192.168.1.1
    192.168.1.1 is alive
    



Wah coba ping ke gateway sukses :) kemudian coba ping ke DNS juga sukses dan terakhir coba ping ke [google.com](http://google.com/) dan mendapatkan hasil yang sama juga. Hmm... respon dari terminal ok, sekarang coba dari firefox dengan mengetikkan [google.com](http://google.com/) pada address bar dan tak lama kemudian akhirnya halaman google nongol juga di firefox :)

Setelah konfigurasi jaringan di laptop selesai :) ada beberapa task list lagi nih yang harus saya kerjakan supaya bisa bener-bener full migrasi ke OpenSolaris, dan beberapa task list tersebut yaitu :
- Install GCC
- Install MySQL
- Install PostgreSQL
- Install SubVersion
- Install OpenOffice

Akhirnya, 80% impian saya pakai themes Nimbus hampir menjadi kenyataan :) Nimbuuuuuus I'm Coooomming :)
