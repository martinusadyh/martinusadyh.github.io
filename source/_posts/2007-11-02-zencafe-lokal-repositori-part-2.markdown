---
comments: true
date: 2007-11-02 14:11:16+00:00
layout: post
slug: zencafe-lokal-repositori-part-2
title: Zencafe Lokal Repositori Part 2
wordpress_id: 19
categories:
- Shell Script
- Slackware
---

Pada posting saya [kemarin](http://martinusadyh.web.id/2007/10/11/zencafe-lokal-repositori/) tentang Zencafe Lokal Repositori masih terdapat kekurangan yaitu dalam proses pembuatan file PACKAGES.TXT masih harus dilakukan secara manual oleh user. Bayangkan jika misalkan anda mempunyai 100 packages dan terdapat pada sebuah direktori xx, bagaimana anda mau menuliskan file PACKAGES.TXT yang dibutuhkan oleh repository lokal mirror di Zencafe tersebut ? Yang jelas pasti capek karena anda mengulang-ulang proses ekstrak packages dan mengkopi isi dari file slack-desc kemudian mem-paste-nya pada file PACKAGES.TXT :)

Pada posting kali ini, saya sudah membuatkan sebuah script yang saya beri nama **zcrepo** dan tugasnya adalah untuk meng-otomatis-kan proses pembuatan file PACKAGES.TXT dan PACKAGES.TXT.gz :) tersebut, selain meng-otomatis-kan proses pembuatan kedua file PACKAGES.TXT dan PACKAGES.TXT.gz saya juga menambahkan proses pembuatan file berbentuk iso-nya sekalian sehingga nanti user hanya tinggal mem-burning file iso tersebut :)

<!-- more -->
Sekalian untuk memudahkan para pengguna pemula distro GNU/Linux Zencafe, saya juga sudah membuatkan package binary-nya supaya lebih mudah digunakan dan lebih mudah di install :) Sedangkan untuk dapat menggunakan script **zcrepo** tersebut, langkah pertama download atau unduhlah dahulu dengan menggunakan **wget** package binary-nya [disini](http://www.martinusadyh.web.id/download/zcrepo-1.0-i486-mrt.tgz) seperti dibawah ini:

    
    
    operatore[~]$ wget -c http://www.martinusadyh.web.id/download/zcrepo-1.0-i486-mrt.tgz
    --21:19:15--  http://www.martinusadyh.web.id/download/zcrepo-1.0-i486-mrt.tgz
               => `zcrepo-1.0-i486-mrt.tgz'
    Resolving www.martinusadyh.web.id... 216.240.157.43
    Connecting to www.martinusadyh.web.id|216.240.157.43|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 3,270 (3.2K) [application/x-tar]
    
    100%[========================================================>] 3,270         --.--K/s
    
    21:19:20 (363.23 KB/s) - `zcrepo-1.0-i486-mrt.tgz' saved [3270/3270]
    
    operatore[~]$
    



Setelah tersimpan pada komputer anda, langkah selanjutnya adalah mulai-lah meng-install script tersebut pada komputer anda dengan cara mengetikkan installpkg **zcrepo-1.0-i486-mrt.tgz** dengan akses root seperti dibawah ini:

    
    
    operatore[Documents]$ su
    Password:
    root[Documents]# installpkg zcrepo-1.0-i486-mrt.tgz
    Installing package zcrepo-1.0-i486-mrt...
    PACKAGE DESCRIPTION:
    zcrepo: zcrepo-1.0-i486-mrt.tgz
    zcrepo:
    zcrepo: zcrepo is a script builder for local repository in GNU/Linux Zencafe,
    zcrepo: if you don't know how to usage this script, please feel free to read
    zcrepo: my manual howto at http://martinusadyh.web.id/
    zcrepo:
    zcrepo: This version tested run well on GNU/Linux Zencafe 1.0 and 1.2
    zcrepo: by Martinus Ady H < mrt.itnewbies@gmail.com >
    



Karena script **zcrepo** hanya berfungsi untuk membuatkan file PACKAGES.TXT, PACKAGES.TXT.gz dan file ISO maka cara penggunaannya sangat mudah sekali. Disini saya menganggap bahwa anda mempunyai beberapa kumpulan packages untuk distro Zenwalk, Slackware atau Zencafe **(Perhatian: Sesuaikan dahulu versi dari distro Zenwalk atau Slackware dengan distro Zencafe jika packages-nya ingin berjalan dengan baik di distro Zencafe. Saran saya tanyakan dahulu ke teman-teman di channel #awali@DALnet atau di [http://forum.linux.or.id/](http://forum.linux.or.id/) pada thread Slackware, atau jika anda bingung harus bertanya kemana silahkan lihat pada halaman support di [http://jatim.awali.or.id/support/](http://jatim.awali.or.id/support/))** pada sebuah direktori bernama myPackages seperti gambar dibawah ini:
[![gambar_direktori_package](http://farm3.static.flickr.com/2382/1826501397_636a7204bb_m.jpg)  
Click To Large](http://www.flickr.com/photos/10243554@N02/1826501397/)

setelah itu langkah selanjutnya adalah anda hanya perlu mengetikkan perintah **zcrepo create-meta** untuk membuat meta-file dan **zcrepo create-iso** untuk membuat file iso dari direktori kumpulan packages anda tersebut seperti dibawah ini:




  * **Untuk membuat file-meta dari direktori myPackages:**

    
    
    operatore[Documents]$ zcrepo create-meta myPackages/
    Creating Meta-file
    Finding packages in myPackages/ directory ...
    Found 4 packages in myPackages/ directory ...
    Building meta-packages ...
    creating meta in myPackages/ ...
    Processing xap/k3b-1.0rc5-i486-1kjz.tgz packages                        [ OK ]
    Processing xap/graveman-0.3.12.5-i486-44.1.tgz packages                 [ OK ]
    Processing xap/pidgin-2.0.0-i486-1zc1.tgz packages                      [ OK ]
    Processing bc-1.06-i486-46.1.tgz packages                       [ OK ]
    [4] Total Packages      [4] Packages Successfully       [0] Packages Failed
    Saving meta-file in '/home/operatore/Documents/myPackages//PACKAGES.TXT'
    operatore[Documents]$
    





  * **Untuk membuat file iso dari direktori myPackages: **

    
    
    operatore[Documents]$ zcrepo create-iso myPackages/
    Creating iso from myPackages/ directory ...
    Creating Meta-file
    Finding packages in myPackages/ directory ...
    Found 4 packages in myPackages/ directory ...
    Building meta-packages ...
    creating meta in myPackages/ ...
    Processing xap/k3b-1.0rc5-i486-1kjz.tgz packages                        [ OK ]
    Processing xap/graveman-0.3.12.5-i486-44.1.tgz packages                 [ OK ]
    Processing xap/pidgin-2.0.0-i486-1zc1.tgz packages                      [ OK ]
    Processing bc-1.06-i486-46.1.tgz packages                       [ OK ]
    [4] Total Packages      [4] Packages Successfully       [0] Packages Failed
    Begining creating iso file from myPackages/ directory
     74.07% done, estimate finish Fri Nov  2 20:33:24 2007
    Total translation table size: 0
    Total rockridge attributes bytes: 939
    Total directory bytes: 2048
    Path table size(bytes): 22
    Max brk space used 21000
    6769 extents written (13 MB)
    Done.
    Saving iso file in '/home/operatore/Documents/ZC_Lokal_Mirror.iso'
    Now, you can burn this iso file into CD Blank or DVD Blank with
    your favorite software like k3b or graveman ;-)
    operatore[Documents]$
    





Mudah bukan ? Setelah selesai melakukan proses diatas, sekarang anda dapat melanjutkan proses konfigurasi pada file **netpkg.conf** seperti pada posting saya tentang [Zencafe Lokal Repositori](http://martinusadyh.web.id/2007/10/11/zencafe-lokal-repositori/) kemarin cuma bedanya adalah sekarang anda sudah tidak perlu membuat file-meta dan file iso secara manual lagi :) karena semuanya sudah dikerjakan oleh script **zcrepo** :)

Jika anda merasa bingung atau mempunyai masalah dengan cara kerja script **zcrepo** ini, jangan malu-malu untuk memberitahu saya lewat e-mail maupun lewat comment pada posting ini :) Masukkan dari teman-teman sangat-sangat saya tunggu. Sedangkan buat yang sudah paham dengan cara kerja script **zcrepo** ini, ayo mari sama-sama di-oprek supaya Zencafe ke-depannya lebih mudah digunakan dan lebih banyak fitur-fitur-nya :)

Referensi:
- [Download zcrepo-1.0-i486-mrt.tgz](http://www.martinusadyh.web.id/download/zcrepo-1.0-i486-mrt.tgz)
