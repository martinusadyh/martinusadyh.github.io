---
comments: true
date: 2010-03-15 00:00:49+00:00
layout: post
slug: fixing-midnight-commander-mc-failed-to-display-zip-content
title: Fixing Midnight Commander (mc) Failed To Display Zip Content
wordpress_id: 351
categories:
- Ubuntu
tags:
- mc
- Midnight Commander
- Slackware
- Ubuntu
---

Pernah mengalami kejadian kalau ternyata tiba-tiba [Midnight Commander (MC)](http://www.midnight-commander.org/) tidak bisa membuka sebuah file zip atau file jar ? Kalau belum pernah, mungkin tulisan ini bisa dijadikan referensi jika dikemudian hari teman-teman mengalami masalah yang serupa :D Pengalaman ini sempat dialami oleh [Adi](http://adi.artivisi.com/) ketika ingin membuka sebuah file jar pada Ubuntu 9.04 :) Awal-nya sempat bingung dan heran juga, karena [Midnight Commander (MC)](http://www.midnight-commander.org/) tidak mengeluarkan pesan error sama sekali, tetapi hanya menampilkan layar biru yang tidak ada isinya seperti gambar dibawah ini :

[![MCCantOpenJarZipFile](http://farm5.static.flickr.com/4066/4419635613_a2f218c9c1.jpg)  
Tampilan MC Gagal Membuka File jar / zip](http://www.flickr.com/photos/10243554@N02/4419635613/)
<!-- more -->
Setelah bertanya pada [mbah Google](http://google.com) dan di arahkan pada forum [ini](http://maunal.sidux.com/PNphpBB2-viewtopic-p-128796.html) dan [ini](http://osdir.com/ml/debian-bugs-dist/2009-05/msg03381.html), baru deh paham. Solusi yang diberikan dari dua link yang diberi oleh [mbah Google](http://google.com) adalah, editlah file `/usr/share/mc/extfs/uzip` kemudian cari baris seperti dibawah ini :

    
    
    ...
    ...
    my $op_has_zipinfo = 0;
    



kemudian edit menjadi seperti dibawah ini :

    
    
    ...
    ...
    my $op_has_zipinfo = 1;
    



Setelah melakukan pengeditan file `/usr/share/mc/extfs/uzip` seperti diatas, sekarang cobalah lagi untuk membuka sebuah file `jar` atau `zip` untuk mengetes-nya. Dan jika perubahan yang dilakukan sudah benar, harusnya sekarang [Midnight Commander (MC)](http://www.midnight-commander.org/) sudah dapat menampilkan isi didalam file tersebut seperti gambar dibawah ini :

[![NormalAgain](http://farm3.static.flickr.com/2721/4419635615_333aac503b.jpg)  
Tampilan MC Sudah Normal Kembali](http://www.flickr.com/photos/10243554@N02/4419635615/)

Semoga informasi ini berguna buat teman-teman yang mengalami masalah serupa :)


**Link-link terkait :**




  1. [MC doesnt open jar file](http://maunal.sidux.com/PNphpBB2-viewtopic-p-128796.html)


  2. [Bug List MC di Debian](http://osdir.com/ml/debian-bugs-dist/2009-05/msg03381.html)


  3. [Blog Adi Artivisi](http://adi.artivisi.com/)


  4. [Midnight Commander](http://www.midnight-commander.org/)


  5. [Upload dan Download Menggunakan MC](http://martinusadyh.web.id/2009/04/26/upload-dan-download-menggunakan-midnight-commander-mc/)



