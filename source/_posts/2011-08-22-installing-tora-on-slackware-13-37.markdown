---
comments: true
date: 2011-08-22 16:37:45+00:00
layout: post
slug: installing-tora-on-slackware-13-37
title: Installing Tora On Slackware 13.37
wordpress_id: 1494
categories:
- DataBase
- Slackware
tags:
- MySQL
- Oracle
- PL/pgSQL
- PL/SQL
- PostgreSQL
- Slackware
- Toad
- TOra
---

Ingin mencari database tool yang mempunyai fitur yang mirip dengan [Toad](http://www.questsoftware.com.sg/toad/) di GNU/Linux ? Jika iya, silahkan mencoba [TOra](http://torasql.com/about) :) Nah yang lebih bagus lagi yaitu, **TOra** mendukung database **MySQL**, **PostgreSQL** dan **Oracle** sekaligus. (Tapi kalau untuk **PostgreSQL** saya lebih senang menggunakan [PgAdmin](http://martinusadyh.web.id/2010/03/04/installing-pgadmin3-1-10-1-on-slackware-13-0/) :) )

Beberapa fitur yang terdapat pada **TOra** kurang lebih yaitu :




  1. Handles multiple connections.


  2. SQL syntax highlighting


  3. Chart visualization of result.


  4. Schema browser.


  5. References & dependencies.


  6. Tab & tree based browsing.


Untuk daftar lebih lengkap silahkan melihat langsung pada halaman [Daftar Fitur TOra](http://torasql.com/about)
<!-- more -->
Nah untuk pengguna GNU/Linux Slackware yang tertarik untuk mencoba **TOra**, installah dahulu [QScintilla2](http://www.riverbankcomputing.co.uk/software/qscintilla/download) jika belum terinstall dan gunakan SlackBuild dari **Robby Workman** yang bisa didownload [disini](http://repo.ukdw.ac.id/alien-kde/4.6.5/source/deps/QScintilla/). Jika **QScintilla** telah terinstall, sekarang download-lah source code **TOra** pada alamat [ini](http://sourceforge.net/projects/tora/files/tora/2.1.3/tora-2.1.3.tar.bz2/download) dan sekalian jangan lupa file SlackBuild untuk **TOra**-nya yang bisa di download [disini](https://github.com/aclemons/slackbuilds/tree/master/tora).

Sebelum menjalankan **TOra**, buatlah **symbolic link** untuk library `libqscintilla2.so.6.1.0` dengan menjalankan perintah `ln -s /usr/lib64/qt/lib/libqscintilla2.so.6.1.0 /usr/lib64/libqscintilla2.so.6` pada terminal dengan akses **root**. Jika sudah, ketikkan perintah `tora` pada terminal dengan akses user dan jika sukses kita akan melihat tampilan **Connection Manager** pada **TOra** :)

Dan dibawah ini adalah beberapa screenshot **TOra** yang sudah berhasil kita install pada Slackware 13.37 :)







    

    [![TOra Connection Manager](http://martinusadyh.web.id/wp-content/gallery/tutorial/tora-connection-manager.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=139)  
TOra Connection Manager
    

    

    [![TOra Schema Browser](http://martinusadyh.web.id/wp-content/gallery/tutorial/tora-schema-browser.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=141)  
TOra Schema Browser
    





    

    [![TOra In Action](http://martinusadyh.web.id/wp-content/gallery/tutorial/tora-in-action.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=140)  
TOra In Action
    

    

    [![TOra Error Window](http://martinusadyh.web.id/wp-content/gallery/tutorial/error.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=138)  
TOra Error Window
    




Untuk gambar terakhir, saya tidak tahu kenapa bisa error  :swt:  :swt:  apa karena ini dicoba pada **MySQL** ?? Meskipun masih terdapat error, **TOra** masih layak koq untuk dicoba  :silau: Terlebih lagi, SQL Editor-nya bisa dikonfigurasi :)

Bagaimana tertarik untuk mencoba **TOra** ?

