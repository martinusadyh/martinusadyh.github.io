---
comments: true
date: 2010-02-22 14:25:38+00:00
layout: post
slug: update-blog
title: Update Blog
wordpress_id: 105
categories:
- Other
---

Hii all.. cuma ingin kasih info tentang perubahan tampilan di blog ini :) Malam minggu kemarin, saya mulai main-main lagi dengan blog. Dan hasil akhir-nya adalah yang sudah teman-teman lihat sekarang :D Alasan kenapa saya ganti yaitu karena versi [WordPress](http://wordpress.org/) yang saya gunakan sudah terlalu lama :D , yups kenapa koq saya ga pernah ngikutin versi rilis [WordPress](http://wordpress.org/) ? Karena pada themes yang kemarin sudah terlalu banyak modifikasi yang saya lakukan di source code [WordPress](http://wordpress.org/) itu sendiri :D (sekdear buat main-main sih) dan gara-gara perubahan **custom** yang saya lakukan akhirnya sukses membuat saya sendiri kesulitan untuk melakukan proses **upgrade** ke versi yang lebih baru :( . Nah selain alasan tersebut, saya juga pingin merasakan **themes** yang lain, dan hasil akhir-nya juga udah teman-teman lihat sendiri sekarang :)

Nah ada temen yang bilang bahwa themes blog saya ini **jelek** :) Emang sih, themes yang kemarin terlihat **kaku** dan saya akui hal tersebut. Kalau jelek ? Hmm... ini harus kita lihat dari kacamata mana teman-teman melihat-nya, klo dilihat dari sudut pandang **saya sendiri** saya ngelihat ya **lumayan**-lah untuk seorang pemula di bidang **web designer** (meskipun ngedit themes-nya orang kwkwkw :)) )

Ada 2 penyebab kenapa saya melakukan perombakan besar-besaran pada blog ini, 2 penyebab-nya yaitu :




  1. Ingin menjadi lebih **wiki style** , yups saya dari dulu ingin supaya tulisan-tulisan yang saya **post** ke blog dapat dibaca layak-nya membaca sebuah halaman [wikipedia](http://id.wikipedia.org/). Kalau gitu kenapa tidak pakai [wikipedia](http://id.wikipedia.org/) saja sekalian?? Alasan saya tidak menggunakan [wikipedia](http://id.wikipedia.org/) adalah karena kalau pakai [wikipedia](http://id.wikipedia.org/) saya pasti kehilangan fasilitas komentar :D  Pada tampilan baru ini, **wiki style** saya coba masukkan pada halaman **single page** dan ini bisa kita lihat kalau teman-teman menekan tulisan Read More ... pada setiap posting di blog ini. Perubahan yang saya lakukan cukup sederhana sih, cukup hilangkan saja **sidebar**-nya dan **voilla...** tampilan posting menjadi penuh 1 halaman :).
Selain alasan **wiki style** diatas, saya terkadang suka merasa susah jika membaca postingan sendiri terutama kalau ada contoh kode atau potongan hasil output pada terminal yang terlalu memanjang hingga akhirnya saya terpaksa menggeser scroll ke kanan. Nah menurut saya hal ini tidak efektif (baca-nya jadi ga bisa ngefull atau ada bagian yang masih kepotong), dengan membuat halaman menjadi full 1 halaman dan tanpa sidebar hal ini menjadi mungkin membaca keseluruhan potongan kode program atau hasil output dari terminal yang saya post :D :)



  2. 
Pingin merasakan themes yang baru :) Nah ini juga bermasalah karena saya kurang begitu senang dengan tampilan web yang terlalu **berwarna** dan **penuh corak** (secara saya ini kan orang-nya sederhana banget **wakakakaka.... #$#* LEBAY MODE ON**) :D Ternyata sangat susah sekali mencari themes dengan kategori **Simple, Clean dan Elegan** :D Menurut saya pribadi, tampilan yang paling keren dan elegan itu ditunjukkan oleh [Mbah Google](http://google.com) dan [wikipedia](http://id.wikipedia.org/) dengan background putih dan warna **hyperlink** biru, bagi saya sih kesan-nya sederhana dan sarat informasi yang berguna. Nah setelah **ngulik-ngulik** themes di [WordPress](http://wordpress.org/extend/themes/) akhirnya saya menemukan 1 themes yaitu [Nice Wee Themes](http://www.niceweesites.com/wordpress-theme/) yang menurut saya **mendekati** kriteria yang saya cari, tapi tetap harus dilakukan modifikasi juga  :) 

















Proses upgrade [WordPress](http://wordpress.org/) ternyata tidak semudah yang saya bayangkan, langkah yang akan saya tempuh sebenar-nya seperti ini :




  * Backup DB [WordPress](http://wordpress.org/) yang lama


  * Restore DB lama di laptop


  * Install [WordPress](http://wordpress.org/) baru di laptop


  * Setelah [WordPress](http://wordpress.org/) yang baru terinstall menggunakan schema DB yang baru juga, baru deh konfigurasi [WordPress](http://wordpress.org/) baru agar menggunakan schema DB lama


  * Kalau sukses, upload lagi ke hosting






Nah ternyata pada waktu melakukan proses restore DB yang lama, saya melihat ada keganjilan  antara schema DB [WordPress](http://wordpress.org/) yang lama dengan yang baru. Yups.... ternyata jumlah tabel di [WordPress](http://wordpress.org/) yang baru berkurang :(  Pada versi [WordPress](http://wordpress.org/) yang lama, jumlah tabel ada 12 buah, tapi di versi yang sekarang jumlah tabel-nya cuma 11 :(  Otomatis proses migrasi tidak bisa semudah ganti nama database :( dan akhirnya saya dengan sukses memilih cara yang lain yaitu melakukan proses migrasi data menggunakan **tool** bawaan-nya si [WordPress](http://wordpress.org/) yaitu menggunakan tool **Export dan Import**. Sukses sih, semua postingan dan komentar berhasil dipindah tangankan tanpa ada perubahan sedikitpun, tapi sayang-nya tidak semua di ter-migrasi :( Dan ini dibuktikan dengan hilang-nya link blog teman-teman yang sudah saya tambahkan :( (Maaf ya teman-teman :( iks...) Sampai saat ini, saya juga masih melakukan pembenahan terhadap tampilan dari blog ini, jadi harap maklum ya teman-teman kalau tampilan-nya masih acak adut :D 

Akhir kata, bagaimana menurut pendapat teman-teman sendiri dengan tampilan yang sekarang  ?? Selain itu, kira-kira apa lagi ya yang diperlukan biar ngebaca-nya jadi lebih **"nyaman"** dan **"enak"**?? Atau ada saran tentang bagaimana enaknya tampilan blog ini, atau penggunaan themes yang lain ?  :)  Dan yang paling terakhir, selamat menikmati tampilan baru dari blog saya ini :D
