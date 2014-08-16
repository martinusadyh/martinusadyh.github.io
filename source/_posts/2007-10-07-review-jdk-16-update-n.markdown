---
comments: true
date: 2007-10-07 16:24:12+00:00
layout: post
slug: review-jdk-16-update-n
title: Review JDK 1.6 Update N
wordpress_id: 14
categories:
- Java
---

Humm... setelah selesai download Java SE 6 Update N tadi malam, sampai rumah akhirnya langsung cobain gimana dukungan Java pada aplikasi Desktop (maklum saya main-main Java cuman pada aplikasi swing, belum merambah ke aplikasi web :D ) . Setelah proses instalasi selesai, file pertama yang jadi tujuan saya adalah file **netbeans.conf** untuk mengedit default JDK yang akan digunakan oleh NetBeans dan kemudian mengkonfigurasi agar NetBeans dijalankan dengan menggunakan LAF Nimbus dan dibawah ini adalah konfigurasi file **netbeans.conf** saya:
<!-- more -->

    
    
    netbeans_default_options="--laf sun.swing.plaf.nimbus.NimbusLookAndFeel -J-Dawt.useSystemAAFontSettings=on -J-Xms32m -J-Xmx128m -J-XX:PermSize=32m -J-XX:MaxPermSize=160m -J-Xverify:none -J-Dapple.laf.useScreenMenuBar=true -J-XX:+UseConcMarkSweepGC -J-XX:+CMSClassUnloadingEnabled -J-XX:+CMSPermGenSweepingEnabled"
    
    # default location of J2SE JDK, can be overridden by using --jdkhome <dir> switch
    netbeans_jdkhome="/home/javamaniac/ProgramFiles/jdk1.6.0_05"
    



Dan inilah hasil review yang telah saya lakukan pada Java SE 1.6 Update N:
**Perbaikan-perbaikan:**




  1. NetBeans 5.5 saya bisa dijalankan dengan sukses tanpa mengeluarkan NullPointerException lagi dan tampilan NetBeans 5.5 sangat mulus dengan LAF Nimbus dan bisa dilihat seperti gambar dibawah ini:
[![NPE_NBJDK16N_GTK_LAF](http://farm3.static.flickr.com/2336/1505773515_47babb3912_m.jpg)](http://farm3.static.flickr.com/2336/1505773515_2826492ba9_o.png)  
Click for large





  2. Dukungan terhadap LAF GTK sedikit lebih baik dari versi sebelumnya (disini saya membandingkan dengan JDK 1.6.0_01), dan tampilan aplikasi yang menggunakan themes Tish sudah bisa dibilang baik, pewarnaannya juga sudah lebih sempurna dibanding versi sebelumnya terutama pada komponen JTextField mendapatkan requestFocus. Dan ini screenshot perbandingan NetBeans menggunakan LAF GTK pada JDK 1.6.0_01 dengan JDK 1.6 Update N **(lihat pada JTextField, di JDK1.6_01 warna focus tidak begitu jelas, sedangkan pada JDK1.6_05 warna di JTextField mulus ditampilkan)**.
[![JTextField_Focus_GTKLAF_16_01](http://farm3.static.flickr.com/2102/1505773477_00b9b3c5d6_m.jpg)](http://farm3.static.flickr.com/2102/1505773477_37bf3caf9e_o.png) [![JTextField_Focus_GTKLAF_16_N](http://farm3.static.flickr.com/2203/1505773483_db54bbde63_m.jpg)](http://farm3.static.flickr.com/2203/1505773483_fd74db03f4_o.png)  
Click for large






**Bugs pada JDK 1.6 Update N: (?) **




  1. **Bugs di LAF Nimbus: (?) **
	
	
    * Setelah NetBeans berjalan mulus menggunakan LAF Nimbus, bukan berarti tidak ada masalah :( . Masalahnya yaitu NetBeans tetap mengeluarkan NullPointerException ketika membuka sebuah project seperti pada gambar dibawah ini:
[![NB_JDK6N_Nimbus_NPE](http://farm3.static.flickr.com/2245/1506621154_cd26dfb8af_m.jpg)](http://farm3.static.flickr.com/2245/1506621154_e0ad956511_o.png)  
Click for large
	

	
    * Pewarnaan JTree di LAF Nimbus kurang maximal, semuanya berwarna biru tua :( seperti gambar dibawah ini:
[![NB_JDK6N_Nimbus_JTree](http://farm3.static.flickr.com/2141/1506621128_e1c5e32993_m.jpg)](http://farm3.static.flickr.com/2141/1506621128_9c4117fd9b_o.png)  
Click for large
	

	




  2. **Bugs di LAF GTK: (?) **
	
    * Permasalahan pada LAF Nimbus ternyata juga menjangkiti pada LAF GTK :( tampilan pada pallete properties tidak muncul sama sekali ketika kita ingin melihat properties sebuah komponen dan setelah itu akan mengeluarkan pesan NullPointerException seperti gambar dibawah ini:
[![Properties_NotShow_GTKLAF_NBJDK16N](http://farm3.static.flickr.com/2221/1506621176_40e8ef3859_m.jpg)](http://farm3.static.flickr.com/2221/1506621176_9e6bfe73de_o.png) [![NPE_NBJDK16N_GTK_LAF](http://farm3.static.flickr.com/2114/1506621158_7a5b8ef5ce_m.jpg)](http://farm3.static.flickr.com/2114/1506621158_7b934c1542_o.png)  
Click for large


	




Untuk sementara masih ini dulu review-nya, masih seputar LAF saja. Dan harapan kedepan-nya semoga dukungan themes GTK dan Nimbus lebih baik lagi terutama untuk dukungan Font supaya lebih kelihatan **"native"** :) maklum ini kan masih versi **"testing"** :D
