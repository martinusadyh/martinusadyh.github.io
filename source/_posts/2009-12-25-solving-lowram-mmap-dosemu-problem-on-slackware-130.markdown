---
comments: true
date: 2009-12-25 08:34:33+00:00
layout: post
slug: solving-lowram-mmap-dosemu-problem-on-slackware-130
title: Solving LOWRAM mmap dosemu Problem on Slackware 13.0
wordpress_id: 93
categories:
- Slackware
---

Hari ini ada sedikit masalah di aplikasi yang berjalan menggunakan dosemu, yups masalah ini terjadi ketika saya meng-upgrade Sistem Operasi GNU/Linux Slackware dari versi 12.1 ke versi 13.0. Sedangkan source dosemu yang digunakan adalah milik om Alien yang bisa di download [disini](http://connie.slackware.com/~alien/slackbuilds/dosemu/). Permasalahan timbul ketika saya menjalankan dosemu dari user, dan secara otomatis saya mendapatkan pesan error seperti ini :

    
    
    muhib@gafa:~$ dosemu
    LOWRAM mmap: Invalid argument
    Segmentation fault
    muhib@gafa:~$
    



Hmm.. proses upgrade Sistem Operasi ternyata tidak semudah yang dibayangkan, akhir-nya setelah googling baru deh menemukan pemecahan-nya. Pemecahan-nya yaitu rubah nilai **4096** pada file **/proc/sys/vm/mmap_min_addr** menjadi **0** dengan menjalankan perintah seperti dibawah ini :

    
    
    root@gafa:~# echo 0 > /proc/sys/vm/mmap_min_addr
    root@gafa:~# more /proc/sys/vm/mmap_min_addr
    0
    root@gafa:~#
    



Setelah melakukan perubahan diatas, sekarang coba jalankan lagi perintah **dosemu** dari user. Dan jika konfigurasi yang dilakukan sudah benar. Maka harusnya jendela **dosemu** akan tampil seperti gambar dibawah ini :
[![dosemu](http://farm5.static.flickr.com/4056/4212134737_4e806c2a23.jpg)  
Dosemu sudah bisa jalan lagi di Slackware 13.0 :) ](http://www.flickr.com/photos/10243554@N02/4212134737/)

Bagaiman teman-teman?? Asyik bukan ? :)

**Referensi-referensi terkait :**
- [http://lastchancestudio.com/slackware](http://lastchancestudio.com/slackware)
