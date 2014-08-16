---
comments: true
date: 2009-12-01 07:01:08+00:00
layout: post
slug: getting-your-bios-vendor-information-in-gnulinux
title: Getting Your BIOS Vendor Information in GNU/Linux
wordpress_id: 88
categories:
- Java
- NetBeans
- Slackware
---

Bingung bagaimana cara mendapatkan informasi dari [BIOS]() (Basic Input/Ouput System) di Sistem Operasi GNU/Linux ? Jika iya, mungkin teman-teman perlu melihat lagi isi dari direktori **/sys/class/dmi/id/** yang didalam-nya terdapat beberapa file yang isinya kurang lebih seperti ini :

    
    
    root@martinusadyh:[~]# ls /sys/class/dmi/id/
    bios_date     board_asset_tag  board_vendor       chassis_serial  chassis_version  product_name    product_version  uevent
    bios_vendor   board_name       board_version      chassis_type    modalias         product_serial  subsystem@
    bios_version  board_serial     chassis_asset_tag  chassis_vendor  power/           product_uuid    sys_vendor
    root@martinusadyh:[~]#
    



Nah sedangkan isi dari file-file tersebut kurang lebih isi-ya seperti dibawah ini :

    
    
    root@martinusadyh:[~]# cat /sys/class/dmi/id/product_uuid
    44454C4C-4800-104B-804D-B1C04F4C4B31
    root@martinusadyh:[~]# cat /sys/class/dmi/id/chassis_serial
    1HKMLK1
    root@martinusadyh:[~]# cat /sys/class/dmi/id/board_serial
    .1HKMLK1.CN1296197P0164.
    root@martinusadyh:[~]# cat /sys/class/dmi/id/board_name
    0186NX
    root@martinusadyh:[~]# cat /sys/class/dmi/id/sys_vendor
    Dell Inc.
    root@martinusadyh:[~]# cat /sys/class/dmi/id/bios_version
    A01
    root@martinusadyh:[~]#
    


**Note: Beda hardware harus-nya informasi yang ditampilkan juga berbeda. Jadi informasi diatas tergantung dari hardware yang teman-teman gunakan**

Semoga sedikit informasi ini bisa berguna buat teman-teman :) Maklum saya juga baru tahu koq :D

**Link-link terkait :**
- [Basic Input/Output System](http://en.wikipedia.org/wiki/BIOS)
- [No More dmidecode](http://0pointer.de/blog)
