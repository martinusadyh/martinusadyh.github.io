---
author: admin
comments: true
date: 2012-08-17 18:12:28+00:00
layout: post
slug: ubuntu-global-menu-support-in-netbeans
title: Ubuntu Global Menu Support In NetBeans
wordpress_id: 1841
categories:
- Java
- NetBeans
- Ubuntu
tags:
- Global Menu
- java swing
- Java Swing Ayatana
- NetBeans
- Swing Global Menu
- Ubuntu
---

Untuk pengguna distribusi GNU/Linux Ubuntu pastinya sudah tidak asing lagi bukan dengan yang namanya **Global Menu**, nah yang jadi masalah disini adalah dengan adanya **Global Menu** semua aplikasi yang berbasis pada Java Swing terutama NetBeans jadi kelihatan _"aneh"_ seperti terlihat pada screenshot dibawah ini :(

[caption id="attachment_1844" align="alignnone" width="300"][![NetBeans Default](http://martinusadyh.web.id/wp-content/uploads/2012/08/NetBeans-Default-300x168.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=182) NetBeans Default[/caption]
<!-- more -->
Nah untungnya ada proyek [Java Swing Ayatana](http://code.google.com/p/java-swing-ayatana/) yang dapat mengintegrasikan aplikasi berbasis Java Swing agar dapat menggunakan fasilitas **Global Menu** di Ubuntu :) Yang menggembirakan lagi adalah, proyek ini juga menyertakan sebuah plugin untuk NetBeans. Jika ingin mencoba, silahkan download dulu [plugin Java Swing Ayatana](http://code.google.com/p/java-swing-ayatana/downloads/list) versi terbaru (Downloadlah file dengan ekstensi ***.nbm**, versi plugin pada saat tulisan ini dibuat adalah **1.2.3.1**) dan simpan pada laptop atau komputer anda.

Jika sudah, bukalah NetBeans dan masuk pada menu **Tools > Plugin**. Pada jendela **Plugins**, bukalah tab **Downloaded** kemudian klik pada tombol **Add Plugins** dan arahkan ke file ***.nbm** yang baru kita download hingga tampak seperti gambar dibawah ini :
[caption id="attachment_1854" align="alignnone" width="300"][![Install Plugin Java Swing Ayatana](http://martinusadyh.web.id/wp-content/uploads/2012/08/Install-Plugin-Java-Swing-Ayatana-300x168.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=183) Install Plugin Java Swing Ayatana[/caption]

Klik tombol **Install** untuk mulai proses installasi, jika proses installasi sudah selesai dan NetBeans sudah di reboot. Maka NetBeans yang kita gunakan sekarang sudah mendukung Global Menu seperti yang bisa kita lihat seperti gambar dibawah ini :
[caption id="attachment_1857" align="alignnone" width="300"][![NetBeans with Java Swing Ayatana](http://martinusadyh.web.id/wp-content/uploads/2012/08/NetBeans-with-Java-Swing-Ayatana-300x168.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=184) NetBeans with Java Swing Ayatana[/caption]

Menyenangkan bukan ? Tertarik untuk mencoba ? :)

**Referensi** :




  1. [Java Swing Ayatana](http://code.google.com/p/java-swing-ayatana/)


