---
comments: true
date: 2010-03-11 00:00:49+00:00
layout: post
slug: cara-checkout-contoh-aplikasi-martin-personal-project
title: Cara Checkout Contoh Aplikasi Martin Personal Project
wordpress_id: 295
categories:
- Java
- NetBeans
tags:
- Java
- java swing
- NetBeans
- project
- subversion
- version control
---

Mungkin teman-teman sudah tahu, sejak bulan Juli tahun 2009 kemarin saya membuat sebuah halaman di [code google](http://code.google.com/) yang bertujuan untuk menyimpan seluruh source code dari latihan-latihan yang saya tulis di blog ini. Project ini saya beri nama [martin-personal-project](http://code.google.com/p/martin-personal-project/) dan di halaman  [martin-personal-project](http://code.google.com/p/martin-personal-project/) ini teman-teman selain dapat mendownload contoh atau demo aplikasi yang sudah jadi dapat juga mendownload source code-nya melalui [subversion](http://subversion.tigris.org/). Untuk teman-teman yang sudah sering menggunakan [subversion](http://subversion.tigris.org/) mungkin hal ini tidak menjadi masalah besar, tetapi untuk teman-teman yang belum pernah menggunakan [subversion](http://subversion.tigris.org/) hal ini pasti bermasalah.

Sebelum teman-teman melakukan proses **checkout**, download dan install-lah dahulu [subversion](http://subversion.tigris.org/) client menurut kebutuhan Sistem Operasi yang teman-teman gunakan. Nah jika [subversion](http://subversion.tigris.org/) sudah terinstall, teman-teman dapat mulai melakukan proses download source code / **checkout** dari repository [martin-personal-project](http://code.google.com/p/martin-personal-project/) yang mempunyai struktur seperti gambar dibawah ini (atau teman-teman juga bisa melihatnya secara online [disini](http://code.google.com/p/martin-personal-project/source/browse/#svn)):
<!-- more -->
[![StrukturProject](http://farm3.static.flickr.com/2755/4411338703_591f1a1df1_m.jpg)  
Struktur Project martin-personal-project](http://www.flickr.com/photos/10243554@N02/4411338703/)

atau teman-teman juga bisa melihatnya melalui terminal dengan mengetikkan perintah **svn list http://martin-personal-project.googlecode.com/svn/trunk/java** seperti dibawah ini :

    
    
    martinus@martinusadyh:[~/Desktop]$ svn list http://martin-personal-project.googlecode.com/svn/trunk/java
    JDesktopPaneBackground/
    MengenalSwingWorker/
    MenuLogin/
    SwingAccordionMenu/
    group-layout/
    jtable-checkbox/
    porting-report/
    martinus@martinusadyh:[~/Desktop]$
    



Setelah mengetahui struktur direktori dari [martin-personal-project](http://code.google.com/p/martin-personal-project/), teman-teman dapat melakukan proses download atau **checkout** seluruh project atau tiap contoh aplikasi. Jika teman-teman ingin mendownload atau **checkout** tiap contoh aplikasi, teman-teman dapat menjalankan perintah **svn co http://martin-personal-project.googlecode.com/svn/trunk/java/_[nama-direktori]_** seperti dibawah ini :

    
    
    martinus@martinusadyh:[~/Desktop]$ svn co http://martin-personal-project.googlecode.com/svn/trunk/java/MenuLogin
    A    MenuLogin/sql
    A    MenuLogin/sql/MenuLoginSchema.sql
    A    MenuLogin/test
    A    MenuLogin/lib
    A    MenuLogin/lib/MartinSwingUtil-1.0.0.jar
    A    MenuLogin/nbproject
    A    MenuLogin/nbproject/project.properties
    A    MenuLogin/nbproject/project.xml
    A    MenuLogin/nbproject/genfiles.properties
    A    MenuLogin/nbproject/build-impl.xml
    A    MenuLogin/src
    A    MenuLogin/src/id
    A    MenuLogin/src/id/web
    A    MenuLogin/src/id/web/martinusadyh
    A    MenuLogin/src/id/web/martinusadyh/menulogin
    A    MenuLogin/src/id/web/martinusadyh/menulogin/service
    A    MenuLogin/src/id/web/martinusadyh/menulogin/service/LoginService.java
    A    MenuLogin/src/id/web/martinusadyh/menulogin/service/LoginServiceImpl.java
    A    MenuLogin/src/id/web/martinusadyh/menulogin/Main.java
    A    MenuLogin/src/id/web/martinusadyh/menulogin/domain
    A    MenuLogin/src/id/web/martinusadyh/menulogin/domain/UserApp.java
    A    MenuLogin/src/id/web/martinusadyh/menulogin/ui
    A    MenuLogin/src/id/web/martinusadyh/menulogin/ui/images
    A    MenuLogin/src/id/web/martinusadyh/menulogin/ui/images/dialog-password.png
    A    MenuLogin/src/id/web/martinusadyh/menulogin/ui/images/dialog-error.png
    A    MenuLogin/src/id/web/martinusadyh/menulogin/ui/LoginDialog.java
    A    MenuLogin/src/id/web/martinusadyh/menulogin/ui/MainForm.java
    A    MenuLogin/src/id/web/martinusadyh/menulogin/ui/MainForm.form
    A    MenuLogin/src/id/web/martinusadyh/menulogin/ui/LoginDialog.form
    A    MenuLogin/manifest.mf
    A    MenuLogin/build.xml
    Checked out revision 11.
    martinus@martinusadyh:[~/Desktop]$ 
    



Jika teman-teman tidak mau repot dengan mendownload satu persatu direktori, maka teman-teman bisa mendownload keseluruhan isi [martin-personal-project](http://code.google.com/p/martin-personal-project/) dengan mengetikkan perintah **svn co http://martin-personal-project.googlecode.com/svn/trunk/ martin-personal-project** seperti dibawah ini :

    
    
    martinus@martinusadyh:[~/Desktop]$ svn co http://martin-personal-project.googlecode.com/svn/trunk/ martin-personal-project
    A    martin-personal-project/java
    A    martin-personal-project/java/jtable-checkbox
    A    martin-personal-project/java/jtable-checkbox/JTableJCheckBox
    .......
    .......
    .......
    Checked out revision 11.
    martinus@martinusadyh:[~/Desktop]$
    



Selain mendownload melalui terminal seperti diatas, teman-teman juga bisa melakukan hal yang sama dengan menggunakan NetBeans IDE. Sedangkan teman-teman yang menggunakan Sistem Operasi Microsoft Windows, mungkin teman-teman bisa membaca tutorial [subversion](http://subversion.tigris.org/) yang sudah ditulis oleh [Mas Ifnu Bima](http://ifnu.artivisi.com/) dengan judul [Version Control Menggunakan Subversion dan TortoiseSVN](http://ifnubima.googlepages.com/subversion.pdf) :) 

Masih bingung bagaimana cara download source code dari [martin-personal-project](http://code.google.com/p/martin-personal-project/) ? Nah kalau sudah tidak bingung, sekarang mari kita ramaikan metode **sharing** source code ini biar teman-teman yang lain bisa belajar langsung dari source code yang kita sebarkan tersebut :) Mantap bukan ? Hitung-hitung sekalian nimbun pahala dan meramaikan komunitas OpenSource di Indonesia :D :)

**Link-link terkait :**




  1. [Code Google](http://code.google.com/)


  2. [Martin Personal Project](http://code.google.com/p/martin-personal-project/)


  3. [SubVersion](http://subversion.tigris.org/)


  4. [Version Control Menggunakan Subversion dan TortoiseSVN](http://ifnubima.googlepages.com/subversion.pdf)


  5. [SubVersion Mudah Dengan RabbitVCS](http://martinusadyh.web.id/2010/03/13/subversion-mudah-dengan-rabbitvcs/)


