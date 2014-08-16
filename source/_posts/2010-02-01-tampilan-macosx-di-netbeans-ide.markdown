---
comments: true
date: 2010-02-01 04:35:12+00:00
layout: post
slug: tampilan-macosx-di-netbeans-ide
title: Tampilan MacOSX di NetBeans IDE
wordpress_id: 97
categories:
- Java
- NetBeans
---

Kemarin habis baca-baca tulisan dari Pak Kaiser tentang [Mengubah Tampilan IDE Netbeans](http://medan.nug.or.id/mengubah-tampilan-ide-netbeans.html) dengan menggunakan [Quaqua Look and Feel](http://www.randelshofer.ch/quaqua/). Ga nyangka, ternyata [Quaqua Look and Feel](http://www.randelshofer.ch/quaqua/) bisa jalan dengan mulus juga di Sistem Operasi GNU/Linux :) dan disini cara yang saya gunakan berbeda dengan cara yang digunakan oleh Pak Kaiser yang mengkopikan library [Quaqua Look and Feel](http://www.randelshofer.ch/quaqua/) kedalam direktori **JAVA_HOME**. Nah cara yang paling sederhana yaitu gunakan opsi **--cp:p [tempat_file_jar_diletakkan]**, jika ada 2 file jar yang ingin masuk kedalam **CLASSPATH**  gunakan pemisah **: (titik dua)** untuk GNU/Linux dan **; (titik koma)** untuk Microsoft Windows. Jika digabungkan, kira-kira perintah-nya kurang lebih seperti dibawah ini :


    
    
    martinus@martinusadyh:[~/Desktop/Quaqua]$ /bin/sh "/opt/netbeans-6.8/bin/netbeans" --cp:p /home/martinus/Desktop/Quaqua/dist/quaqua.jar:/home/martinus/Desktop/Quaqua/dist/swing-layout.jar --laf ch.randelshofer.quaqua.QuaquaLookAndFeel -J-DQuaqua.selectionStyle=bright -J-DQuaqua.opaque=true -J-DQuaqua.tabLayoutPolicy=wrap
    



Agar benar-benar kelihatan seperti di Mac beneran, sekarang download dulu font Monaco (Monaco adalah Monospace font untuk Mac OS) dari [sini](http://www.gringod.com/2006/02/24/return-of-monacottf/) kemudian pasangkan pada NetBeans IDE anda :) dan jika sudah kurang lebih tampilan-nya menjadi seperti gambar dibawah ini :









[![source](http://farm5.static.flickr.com/4057/4321389874_7546dceb6a.jpg)  
Tampilann NetBeans Menggunakan Font Monaco](http://www.flickr.com/photos/10243554@N02/4321389874/)



[![SwingQuaqua](http://farm5.static.flickr.com/4070/4321389854_e028db5bc0.jpg)  
Tampilan Java Swing Dengan LAF Quaqua](http://www.flickr.com/photos/10243554@N02/4321389854/)






Hm... mantap juga ternyata yah tampilan-nya :) Cuma sayang-nya koq perasaan ga jauh beda ama Look And Feel GTK yakz ? :D Tapi gapapa lah, yang penting bisa cobain :)

**Link-link terkait :**
- [Mengubah Tampilan IDE Netbeans](http://medan.nug.or.id/mengubah-tampilan-ide-netbeans.html)
- [Quaqua Look and Feel](http://www.randelshofer.ch/quaqua/)
