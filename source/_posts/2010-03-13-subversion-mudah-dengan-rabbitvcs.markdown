---
comments: true
date: 2010-03-13 00:00:15+00:00
layout: post
slug: subversion-mudah-dengan-rabbitvcs
title: Subversion Mudah Dengan RabbitVCS
wordpress_id: 337
categories:
- Java
- NetBeans
- Ubuntu
tags:
- subversion
- Ubuntu
- version control
---

Masih merasa susah dan bingung bagaimana menggunakan [SubVersion](http://subversion.tigris.org/) ? Atau masih belum terbiasa menggunakan [SubVersion](http://subversion.tigris.org/) melalui terminal atau konsole di GNU/Linux, karena sudah terbiasa dan merasa nyaman menggunakan [Tortoise SVN](http://tortoisesvn.tigris.org/) di Windows ? Buat teman-teman yang masih beranggapan bahwa menggunakan [SubVersion](http://subversion.tigris.org/) di GNU/Linux tidak bisa semudah di Windows mungkin bisa berpikir dahulu sebelum mengatakan hal tersebut ke teman-teman yang lain :) Pingin tahu alasan-nya ? Kalau iya, apakah teman-teman sudah pernah mendengar sebuah project bernama [RabbitVCS](http://rabbitvcs.org/) ? Apasih [RabbitVCS](http://rabbitvcs.org/) ini ??? [RabbitVCS](http://rabbitvcs.org/) adalah sebuah aplikasi berbasis GUI (Graphical User Interface) yang berfungsi untuk mempermudah kita mengakses dan menggunakan [SubVersion](http://subversion.tigris.org/), pengembangan [RabbitVCS](http://rabbitvcs.org/) ini terinspirasi oleh [Tortoise SVN](http://tortoisesvn.tigris.org/). Jadi tidak heran kan kalau [RabbitVCS](http://rabbitvcs.org/) ini fungsi dan fiturnya mirip dengan [Tortoise SVN](http://tortoisesvn.tigris.org/)  :) 

Nah setelah kita mengetahui apa itu [RabbitVCS](http://rabbitvcs.org/), sekarang kita akan coba untuk mulai menginstall [RabbitVCS](http://rabbitvcs.org/) ini pada sistem operasi GNU/Linux tercinta. Sedangkan distribusi yang digunakan pada tulisan kali ini adalah [Ubuntu 9.04](http://www.ubuntu.com/) :) Sebelum melakukan proses installasi, kita perlu menambahkan dahulu PPA [RabbitVCS](http://rabbitvcs.org/) pada file daftar repository [Ubuntu 9.04](http://www.ubuntu.com/) yang kita gunakan. Untuk menambahkan PPA [RabbitVCS](http://rabbitvcs.org/), jalankan perintah `sudo add-apt-repository ppa:rabbitvcs` pada terminal seperti dibawah ini :

    
    
    martinvirtual@martinvirtual-laptop:~$ sudo add-apt-repository ppa:rabbitvcs
    Executing: gpg --ignore-time-conflict --no-options --no-default-keyring --secret-keyring /etc/apt/secring.gpg --trustdb-name /etc/apt/trustdb.gpg --keyring /etc/apt/trusted.gpg --keyserver keyserver.ubuntu.com --recv D11D2DD360FFA0359731ECD52EE5793634EF4A35
    gpg: requesting key 34EF4A35 from hkp server keyserver.ubuntu.com
    gpg: key 34EF4A35: public key "Launchpad RabbitVCS" imported
    gpg: Total number processed: 1
    gpg:               imported: 1  (RSA: 1)
    martinvirtual@martinvirtual-laptop:~$ 
    


<!-- more -->
Setelah selesai menambahkan PPA [RabbitVCS](http://rabbitvcs.org/), update dahulu `cache apt` kita dengan menjalankan perintah `sudo apt-get update` seperti dibawah ini :

    
    
    martinvirtual@martinvirtual-laptop:~$ sudo apt-get update
    ........
    ........     
    Get:1 http://dl2.foss-id.web.id karmic-updates Release.gpg [189B]                               
    Ign http://dl2.foss-id.web.id karmic-updates/main Translation-en_US                             
    Get:2 http://ppa.launchpad.net karmic Release.gpg [307B]                    
    ........
    ........     
    Reading package lists... Done
    martinvirtual@martinvirtual-laptop:~$ 
    



Setelah proses `update` selesai, sekarang mari kita lihat dahulu apa saja yang dibawa oleh [RabbitVCS](http://rabbitvcs.org/) dengan mengetikkan perintah `sudo apt-cache search rabbit` seperti dibawah ini :

    
    
    martinvirtual@martinvirtual-laptop:~$ sudo apt-cache search rabbit
    ........
    ........     
    rabbitvcs-core - Easy version control
    rabbitvcs-thunar - Thunar extension for RabbitVCS
    rabbitvcs-gedit - Gedit extension for RabbitVCS
    rabbitvcs-cli - Command line interface for RabbitVCS
    rabbitvcs-nautilus - Nautilus extension for RabbitVCS
    martinvirtual@martinvirtual-laptop:~$ 
    



Daripada bingung, install aja semuanya dengan mengetikkan perintah `sudo apt-get install rabbitvcs-core rabbitvcs-gedit rabbitvcs-cli rabbitvcs-nautilus -y` seperti dibawah ini : 

    
    
    martinvirtual@martinvirtual-laptop:~$ sudo apt-get install rabbitvcs-core rabbitvcs-gedit rabbitvcs-cli rabbitvcs-nautilus -y
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    The following extra packages will be installed:
      global ipython libapr1 libaprutil1 libsvn1 meld python-configobj python-foolscap
      python-nautilus python-pexpect python-svn python-wxgtk2.8 python-wxversion subversion
    Suggested packages:
      doxygen apache httpd id-utils python-profiler python-numpy python-matplotlib python-qt3
      python-qt4 python-svn-dbg wx2.8-doc wx2.8-examples python-wxtools ruby tcsh csh octave3.0
      mksh pdksh subversion-tools db4.7-util patch
    The following NEW packages will be installed:
      global ipython libapr1 libaprutil1 libsvn1 meld python-configobj python-foolscap
      python-nautilus python-pexpect python-svn python-wxgtk2.8 python-wxversion rabbitvcs-cli
      rabbitvcs-core rabbitvcs-gedit rabbitvcs-nautilus subversion
    0 upgraded, 18 newly installed, 0 to remove and 267 not upgraded.
    Need to get 19.4MB of archives.
    
    ...........
    ...........
    ...........
    
    Processing triggers for python-support ...
    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place
    martinvirtual@martinvirtual-laptop:~$ 
    



Jika proses installasi sudah selesai, sekarang `logout`-lah dahulu sebelum bisa menggunakan [RabbitVCS](http://rabbitvcs.org/). Setelah proses `logout`, sekarang coba cek dengan membuka `nautilus browser` kemudian klik kanan pada area yang koosong. Dan jika tidak ada kesalahan, maka harusnya kita sudah melihat menu `Checkout` dan `RabbitVCS` seperti gambar dibawah ini :

[![MenuNautilusRabbitVCS](http://farm5.static.flickr.com/4072/4419640339_06dd5b524e.jpg)  
Integrasi RabbitVCS dengan Nautilus](http://www.flickr.com/photos/10243554@N02/4419640339/)

Untuk mencoba apakah [RabbitVCS](http://rabbitvcs.org/) ini sudah terinstall dengan benar atau belum, sekarang coba lakukan proses `checkout` seperti pada gambar dibawah ini:



    
    


        

        [![CheckoutFromNautilus](http://farm5.static.flickr.com/4033/4419635617_870742310d.jpg)  
Pilih Menu Checkout](http://www.flickr.com/photos/10243554@N02/4419635617/)
        

        

        

        [![EntriRepository](http://farm5.static.flickr.com/4061/4419635627_0032a4d4ee.jpg)  
Masukkan Alamat Repository](http://www.flickr.com/photos/10243554@N02/4419635627/)
        

    
        

        [![ProsesCheckout](http://farm3.static.flickr.com/2760/4419640361_b8a8239558.jpg)  
Proses Checkout Selesai](http://www.flickr.com/photos/10243554@N02/4419640361/)
        

        

        

        [![HasilCheckout](http://farm5.static.flickr.com/4024/4419635633_c0a6df6239.jpg)  
Hasil Akhir Proses Checkout (Sama Dengan TortoiseSVN di Windows Explorer Kan ? :) )](http://www.flickr.com/photos/10243554@N02/4419635633/)
        

    


Karena sebelum-nya kita melakukan installasi secara `full`, sekarang coba bukalah satu buah file `source code` yang sudah kita `checkout` dengan menggunakan `Gedit`. Harusnya menu [RabbitVCS](http://rabbitvcs.org/) sudah terintegrasi dengan `Gedit` seperti gambar dibawah ini :

[![GeditRabbitVCS](http://farm5.static.flickr.com/4069/4419635631_6cc0db7d36.jpg)  
Integrasi RabbitVCS dengan Gedit](http://www.flickr.com/photos/10243554@N02/4419635631/)

Dan bagaimana jika kita telah melakukan proses edit pada sebuah file ? Jangan kuatir teman-teman, kita bisa tahu dengan melihat `icon` yang berbeda pada `nautilus` yang berwarna merah seperti gambar dibawah ini :

[![Perubahan](http://farm3.static.flickr.com/2681/4419640351_82c0f7668a.jpg)  
Hasil Perubahan Terlihat Di Nautilus Dengan Warna Icon Yang Berbeda](http://www.flickr.com/photos/10243554@N02/4419640351/)

Bagaimana teman-teman, masih menganggap bahwa menggunakan [SubVersion](http://subversion.tigris.org/) di GNU/Linux itu susah ? Tertarik mencoba aplikasi ini ? :)

**Link-link terkait :**




  1. [Cara Checkout Contoh Aplikasi martin-personal-project](http://martinusadyh.web.id/2010/03/11/cara-checkout-contoh-aplikasi-martin-personal-project/)


  2. [Tutorial Version Control Menggunakan TortoiseSVN](http://ifnubima.googlepages.com/subversion.pdf)


  3. [Project SubVersion](http://subversion.tigris.org/)


  4. [Project RabbitVCS](http://rabbitvcs.org/)


  5. [Ubuntu](http://www.ubuntu.com/)


  6. [Project Tortoise SVN](http://tortoisesvn.tigris.org/)


