---
comments: true
date: 2007-10-06 13:28:23+00:00
layout: post
slug: java-se-6-update-n
title: Java SE 6 Update N
wordpress_id: 12
categories:
- Java
---

Wah abis baca-baca di blognya [Chet Haase'](http://weblogs.java.net/blog/chet/archive/2007/10/early_access_gr.html) dan ngelihat kalau Look And Feel Nimbus dah include secara default di [Java SE 6 Update N](https://jdk6.dev.java.net/6uNea.html), akhirnya download deh java versi N ini :D dan ini overview tentang [Java SE 6 Update N](https://jdk6.dev.java.net/6uNea.html) :

Java SE 6 Update N (formerly know as the "Consumer JRE" project) is an update release that introduces new features and enhancements aimed at providing an optimized consumer end user experience. Java SE 6 Update N focuses on the following areas:
<!-- more -->




  1. **Enhanced JRE installation experience**



    * The Deployment Toolkit  takes the guess work out of determining what versions of the JRE end users have installed on their PC. It supplies Java based web applet/application deployers with a simple interface to accomplish Java detection and installation.



    * The Kernel installation mode (not available yet in this build) lets first time Java users run applets and Web Start applications without waiting for the whole JRE download. While the default Kernel installation will work with existing Java applets, application developers have the ability to select libraries that should be installed with the kernel, before the rest of the JRE is installed on the end user's system.



    * For current users of Java SE, the JRE update mechanism has also been improved, using a patch-in-place mechanism that translates in a faster and more reliable update process (the patch in place mechanism will take effect for end users who upgrade from this update release or later to a new update release). As an added benefit, follow-on update releases will no longer be listed as separate items in the Windows "Add or Remove Programs" dialog.




  2. **Improved performance and look & feel**



    * The Quick Starter feature will prefetch portions of the JRE into memory, substantially decreasing the average JRE cold start-up time (the time that it takes to launch a Java application for the first time after a fresh reboot of a PC).


    * Hardware acceleration support: Java SE 6 Update N introduces a fully hardware accelerated graphics pipeline based on the Microsoft Direct3D 9 API, translating into improved rendering of Swing applications which rely on translucency, gradients, arbitrary transformations, and other more advanced 2D operations.


    * A new cross-platform Swing look & feel, code name Nimbus, provides a nice update over 'Metal' and 'Ocean'.




Setelah [Java SE 6 Update N](https://jdk6.dev.java.net/6uNea.html) ini selesai ke download, yang akan saya cobain pertama adalah LAF Nimbus, dan ngelihat gimana kalau NetBeans jalan dengan menggunakan LAF Nimbus ini :) Maklum LAF Nimbus yang saya download dari [ https://nimbus.dev.java.net/](https://nimbus.dev.java.net/) ga bisa dijalankan di NetBeans dengan mengeluarkan NullPointerException seperti gambar dibawah ini:
[![NB_Err_Nimbus](http://farm3.static.flickr.com/2164/1497061192_5009cbf831_m.jpg)](http://farm3.static.flickr.com/2164/1497061192_39e27ff2e4_o.png)  
Click for large

Setelah muncul gambar seperti diatas NetBeans saya jadi ***hang*** dan ga mau tampil :( , semoga saja dengan adanya LAF Nimbus secara default di [Java SE 6 Update N](https://jdk6.dev.java.net/6uNea.html) ini NetBeans saya bisa jalan dengan menggunakan LAF Nimbus dengan mulus :)
