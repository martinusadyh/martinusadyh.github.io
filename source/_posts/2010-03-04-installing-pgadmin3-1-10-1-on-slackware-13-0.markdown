---
comments: true
date: 2010-03-04 21:06:52+00:00
layout: post
slug: installing-pgadmin3-1-10-1-on-slackware-13-0
title: Installing PgAdmin3 1.10.1 on Slackware 13.0
wordpress_id: 268
categories:
- DataBase
- Slackware
tags:
- DataBase
- PgAdmin
- PostgreSQL
- Slackware
---

Akhir-nya berhasil juga melakukan installasi [PgAdmin3-1.10.1](http://www.pgadmin.org/) di Slackware 13.0 saya :) , tulisan kali ini merupakan jawaban untuk pertanyaan saya sendiri yang kemarin belum sempat terjawab pada milis [id-slackware@googlegroups.com](mailto:id-slackware@googlegroups.com) dengan subyek [Installing pgadmin error di proses make](http://groups.google.com/group/id-slackware/browse_thread/thread/998fbab9cedb34da) :D Nah karena kemarin belum ada yang jawab, menurut asumsi saya **pribadi** kemungkinan teman-teman di milis juga belum pernah mengalami hal yang saya alamin jadinya bingung mau menjawab apaan :D . Dan asumsi kedua saya yaitu, saya yang kurang teliti dalam hal mengatur urusan **dependencies** yang diperlukan oleh [pgadmin](http://www.pgadmin.org/)-nya :) Setelah ditelusuri lebih lanjut, masalah utama yaitu ternyata saya sendiri yang kurang teliti membaca halaman **INSTALL** yang terdapat dalam direktori source code [pgadmin](http://www.pgadmin.org/) :D , kenapa saya sempat melewatkan file **INSTALL** tersebut ? Nah kasus yang terjadi pada saya yaitu adalah, **saya terlalu percaya** oleh SlackBuild Script bawaan dari [SBo](http://slackbuild.org) :D (Maklum biasanya saya tidak pernah mengalami masalah sama sekali dengan SlackBuild Script bawaan [SBo](http://slackbuild.org) :D ) Hmm... mantap kan Slackware :) , untuk teman-teman pengguna distribusi GNU/Linux lain mungkin sudah bisa bernyaman-nyaman dengan mengetikkan 1 baris perintah untuk menginstall [pgadmin](http://www.pgadmin.org/) beserta **dependencies**-nya. Tapi di Slackware ..... hmm... mari kita lihat apa yang harus kita lakukan agar Slackware kita bisa seperti distribusi GNU/Linux yang lain :) (Ini yang membuat saya tetep **keukeuh** sama Slackware, ada aja yang perlu di ****) :)

Sekedar catatan untuk teman-teman, semua versi aplikasi maupun library pada tulisan ini merupakan versi yang terbaru ketika artikel ini mulai ditulis. Dan **mungkin** langkah-langkah pada tulisan ini sudah tidak **relevan** lagi jika versi library maupun aplikasi yang teman-teman gunakan sudah berbeda jauh, jadi **SAYA TIDAK MENJAMIN** apa yang saya tulis disini bisa berjalan dengan mulus pada sistem teman-teman. Sedangkan spesifikasi sistem yang saya gunakan pada tulisan kali ini yaitu adalah sebagai berikut :




  1. Slackware 13.0 versi stable (saya belum sanggup mengikuti perkembangan Slackware current :( )


  2. PostgreSQL 8.4.2


  3. PgAdmin3 v1.10.1


  4. wxPython 2.8.10.1



Ok konfigurasi sistem yang teman-teman gunakan sama dan mengalami masalah yang sama juga ? Kalau iya, mari kita lanjutkan :D Nah untuk mulai menginstall [pgadmin](http://www.pgadmin.org/) pada Slackware, yang kita perlukan pasti-nya installer [pgadmin](http://www.pgadmin.org/) itu sendiri kan. Karena saya lebih suka melakukan proses installasi dari source, maka pilihan yang saya pakai yaitu mendownload **SlackBuild Script** untuk [pgadmin](http://www.pgadmin.org/) yang bisa kita download pada halaman [PgAdmin SBo](http://slackbuilds.org/repository/13.0/system/pgadmin3/). Pada halaman download tersebut juga terdapat **catatan** yang kurang lebih seperti berikut :
<!-- more -->


> 
pgAdmin requires wxPython PostgreSQL (available at slackbuilds.org).

Maintained by: Iskar Enev
Approved by: dsomero




Nah untuk teman-teman yang belum menginstall **package wxPython**, downloadlah dahulu semua source code wxPython beserta SlackBuild Script-nya tapi jangan sampai melakukan **PROSES INSTALLASI wxPython** dahulu. Sedangkan untuk teman-teman yang sudah terlanjur menginstall packages wxPython yang berasal dari [SBo](http://slackbuild.org), maka hapuslah dahulu packages wxPython yang sudah terinstall dengan menggunakan perintah **removepkg wxPython-2.8.10.1-i486-1_SBo**. Jika teman-teman tidak menghapus packages wxPython yang berasal dari SBo terlebih dahulu, dan kemudian mencoba untuk langsung melakukan proses **kompilasi** pada source code [pgadmin](http://www.pgadmin.org/). Maka bisa dipastikan, teman-teman pasti akan mendapatkan pesan error seperti dibawah ini ketika proses **make** sedang berjalan:
[plain]
./pgAdmin3.cpp:27:24: error: wx/ogl/ogl.h: No such file or directory
In file included from /usr/include/libxml2/libxml/xmlreader.h:13,
                 from ../pgadmin/include/utils/favourites.h:18,
                 from ../pgadmin/include/frm/frmQuery.h:19,
                 from ./pgAdmin3.cpp:55:
/usr/include/libxml2/libxml/xmlversion.h:429:1: warning: "ATTRIBUTE_PRINTF" redefined
In file included from /usr/include/wx-2.8/wx/wx.h:15,
                 from ../pgadmin/include/pgAdmin3.h:16,
                 from ./pgAdmin3.cpp:13:
/usr/include/wx-2.8/wx/defs.h:501:1: warning: this is the location of the previous definition
./pgAdmin3.cpp: In member function 'virtual bool pgAdmin3::OnInit()':
./pgAdmin3.cpp:383: error: 'wxOGLInitialize' was not declared in this scope
make[2]: *** [pgAdmin3.o] Error 1
make[2]: Leaving directory `/tmp/SBo/pgadmin3-1.10.1/pgadmin'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/tmp/SBo/pgadmin3-1.10.1'
make: *** [all] Error 2
root@martinusadyh:[/media/data/SLACKBUILDS/pgadmin]# 
[/plain]

Setelah googling sebentar dengan menggunakan keyword [./pgAdmin3.cpp:383: error: 'wxOGLInitialize' was not declared in this scope](http://www.google.co.id/search?q=.%2FpgAdmin3.cpp%3A383%3A+error%3A+%27wxOGLInitialize%27+was+not+declared+in+this+scope+&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a), saya menemukan link yang mengarah ke milis [pgadmin-hackers](http://old.nabble.com/Can%27t-compile-pgadmin3-1.10.1-td27659249.html) dan mendapatkan **pencerahan** pada email balasan yang isinya seperti berikut :


> 
Hi,

Le 19/02/2010 20:35, Haiyan Chi a écrit :

> [...]
> I am installing  pgadmin3-1.10.1 from source.  I am at linux.
>
> The configuration passed:
>
>
> *************************
> PostgreSQL directory:
> [...]
> When I tried to compile, got the following error:
> [...]
... [show rest of quote]

You probably forgot to compile the wxWidgets contribs. Go in the contrib
directory and "make && make install".

-- 
Guillaume.
 http://www.postgresqlfr.org
 http://dalibo.com




Waaaks.... harus menginstall juga direktori **contrib** pada packages **wxWidgets** ??? Ok sekarang mari kita bongkar source code [pgadmin](http://www.pgadmin.org/) dan coba buka file **INSTALL** dan hasil-nya adalah seperti dibawah ini :

    
    
    ....
    3) Unpack the wxGTK tarball to a convenient location, and build and install it
       as follows:
       
         cd /path/to/wxGTK/source/
         ./configure --with-gtk --enable-gtk2 --enable-unicode
         make
         sudo make install
    
         # Install wxWidgets contrib modules.
         cd contrib/
         make
         sudo make install
    	
       A script is included in the pgAdmin source tarball 
       (xtra/wx-build/build-wxgtk) which will build and install wxWidgets in each 
       combination of shared/static/debug/release builds for you.
    ....
    



Karena packages **wxGTK** yang terdapat pada [SBo](http://slackbuild.org) sudah di **include** pada packages **wxPython**, maka sepertinya masalah terdapat pada packages **wxPython**-nya. Dari file **INSTALL** dan info dari milis [pgadmin-hackers](http://old.nabble.com/Can%27t-compile-pgadmin3-1.10.1-td27659249.html) diatas, kita sudah mendapatkan informasi yang jelas yaitu kita harus **MENGINSTALL JUGA MODUL contrib/** yang terdapat pada distribusi **wxWidgets** atau **wxPython** kita. Sekarang coba ekstrak file **wxPython-src-2.8.10.1.tar.bz2** dan cek apakah direktori **contrib/** ada atau tidak (seharusnya sih kita menemukan direktori **contrib/** pada distribusi **wxPython**), dan kemudian cek juga file **wxPython.SlackBuild** dan lihat pada baris yang menjalankan perintah **make** dan **make install**. Dan inilah yang saya temukan pada file **wxPython.SlackBuild** yang di download dari [SBo](http://slackbuild.org) :

    
    
    #Additional stuff needed by wxPython
    make -C contrib/src/gizmos
    make -C contrib/src/stc
    
    make install DESTDIR=$PKG
    make -C contrib/src/gizmos install DESTDIR=$PKG
    make -C contrib/src/stc install DESTDIR=$PKG
    



Nah pada script diatas bisa kita lihat, bahwa ternyata tidak semua direktori **contrib/** di install oleh SlackBuild Script **wxPython** bawaan dari [SBo](http://slackbuild.org). Agar proses **make** [pgadmin](http://www.pgadmin.org/) bisa berjalan dengan mulus, sekarang modifikasilah file **wxPython.SlackBuild** diatas menjadi seperti dibawah ini :

    
    
    #Additional stuff needed by wxPython
    # make -C contrib/src/gizmos
    # make -C contrib/src/stc
    
    make -C contrib/
    
    make install DESTDIR=$PKG
    # make -C contrib/src/gizmos install DESTDIR=$PKG
    # make -C contrib/src/stc install DESTDIR=$PKG
    make -C contrib/ install DESTDIR=$PKG
    



Setelah selesai melakukan proses modifikasi diatas, sekarang coba **build** lagi binary packages untuk **wxPython** dan install dengan menggunakan perintah **installpkg /tmp/wxPython-2.8.10.1-i486-1_SBo.tgz**. Jika packages **wxPython** hasil modifikasi kita telah terinstall, sekarang jalankan-lah SlackBuild Script [pgadmin](http://www.pgadmin.org/)-nya. Dan jika pada proses **build** packages [pgadmin](http://www.pgadmin.org/) tidak terdapat error, kita bisa mulai menginstall dengan mengetikkan perintah **installpkg /tmp/pgadmin3-1.10.1-i486-1_SBo.tgz** :) Jika proses installasi [pgadmin](http://www.pgadmin.org/) sudah selesai, sekarang coba jalankan [pgadmin](http://www.pgadmin.org/)-nya dengan mengetikkan perintah **pgadmin3** pada terminal dan hasil akhir yang akan kita dapatkan adalah seperti gambar-gambar dibawah ini :









[![TampilanPgAdmin](http://farm5.static.flickr.com/4070/4407311790_876aafde90.jpg)  
PgAdmin3 Menampilkan Daftar Tabel](http://www.flickr.com/photos/10243554@N02/4407311790/)




[![PgAdminQueryTool](http://farm5.static.flickr.com/4037/4407311788_2e4dbac623.jpg)  
Tampilan Query Designer PgAdmin3](http://www.flickr.com/photos/10243554@N02/4407311788/)






Waaaaah... mangstab kan, bagaimana menurut pendapat teman-teman keren tidak ?? :D :) Jadi lebih gampang bukan belajar [PostgreSQL](http://www.postgresql.org/) menggunakan [pgadmin](http://www.pgadmin.org/) ? Apalagi [pgadmin](http://www.pgadmin.org/) ini jalan di Slackware kita yang tercinta :D :) 

Akhir kata, happy slacking's guys :)
**Link-link terkait : **




  1. [Installing PostgreSQL 8.4.2 On Slackware 13.0](http://martinusadyh.web.id/2010/02/28/installing-postgresql-8-4-2-on-slackware-13-0/)


  2. [Beberapa Persamaan MySQL dan PostgreSQL](http://martinusadyh.web.id/2010/03/03/beberapa-persamaan-antara-mysql-dan-postgresql/)


  3. [PostgreSQL](http://www.postgresql.org/)


  4. [pgadmin](http://www.pgadmin.org/)


  5. [SlackBuild.org](http://slackbuild.org)


  6. [Tempat Diskusi Slacker's Indonesia](mailto:id-slackware@googlegroups.com)


