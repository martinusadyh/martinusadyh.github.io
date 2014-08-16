---
comments: true
date: 2009-03-28 12:20:40+00:00
layout: post
slug: installing-flash-player-10-di-opensolaris-200811
title: Installing Flash Player 10 di OpenSolaris 2008.11
wordpress_id: 47
categories:
- OpenSolaris
---

Pertama-tama download dulu Flash Player 10 nya dari situs [Adobe](http://get.adobe.com/flashplayer/) seperti gambar dibawah ini :
[![Screenshot](http://farm4.static.flickr.com/3433/3391388667_a4cb6d8ff5.jpg)  
Download Flash Player](http://www.flickr.com/photos/10243554@N02/3391388667/)

Setelah proses download selesai, ekstrak dengan perintah seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/Desktop/Solaris/flashplayer]$ tar xvf flash_player_10_solaris_x86.tar.bz2
    flash_player_10_solaris_r22_87_x86/
    flash_player_10_solaris_r22_87_x86/libflashplayer.so
    [martin@opensolarisbox:~/Desktop/Solaris/flashplayer]$
    



Ganti akses user anda ke root dengan perintah **su** kemudian copykan file **libflashplayer.so** ke direktori **/usr/lib/firefox/plugins/** seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/Desktop/Solaris/flashplayer]$ ls
    flash_player_10_solaris_r22_87_x86  flash_player_10_solaris_x86.tar.bz2
    [martin@opensolarisbox:~/Desktop/Solaris/flashplayer]$ su
    Password:
    [martin@opensolarisbox:~/Desktop/Solaris/flashplayer]# cp flash_player_10_solaris_r22_87_x86/libflashplayer.so /usr/lib/firefox/plugins/
    



Jalankan firefox dan cek apakah plugin sudah terinstall atau belum dengan mengetikkan **about:plugins** pada firefox seperti gambar dibawah ini :
[![Screenshot-1](http://farm4.static.flickr.com/3544/3391388669_486c226ebf.jpg)  
Plugin Flash Player Sudah Terinstall](http://www.flickr.com/photos/10243554@N02/3391388669/)

Sekarang kita sudah bisa bermain-main dengan file flash di OpenSolaris :)
