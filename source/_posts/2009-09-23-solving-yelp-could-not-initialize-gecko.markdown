---
comments: true
date: 2009-09-23 22:06:06+00:00
layout: post
slug: solving-yelp-could-not-initialize-gecko
title: Solving Yelp Could not Initialize Gecko!
wordpress_id: 69
categories:
- Slackware
---

Pada posting yang [kemarin](http://martinusadyh.web.id/2009/09/22/installing-gnome-2263-gsb-distribution-in-slackware-130/) (sehabis installasi [GSB](http://gnomeslackbuild.org/)) ternyata saya tidak bisa mengakses **GNOME Help Browser** dengan pesan error seperti berikut :

    
    
    martinus@martinusadyh:~$ yelp
    Could not initialize gecko!
    martinus@martinusadyh:~$
    



Setelah lumayan berpusing-pusing ria dengan mbah google dan belum menemukan ***hint*** akhirnya coba-coba tanya di milis [gsb-user](http://groups.google.com/group/gsb-users) (bermodalkan inggris yang pas-pas'an :D **Hajar bleh, yang penting error ane bisa solved** ) dan untungnya om Steve mau menjawab pertanyaan saya dan dibawah ini adalah petuah yang sangat manjur dari om Steve :


> 
Likely a problem with mozilla-xulrunner, or a conflict with seamonkey.
Make sure that the mozilla-xulrunner-1.9.0.13-i486-2gsb package is
installed:

slapt-get --install --reinstall mozilla-xulrunner-1.9.0.13-i486-2gsb

Also, make sure to remove any 'seamonkey' directories from
/etc/ld.so.conf.  Re-run `ldconfig` after.  Hopefully this should fix the
problem.

Good luck!

-= Steve =-



<!-- more -->
Nah bermodalkan petuah dari om Steve tersebut, akhirnya saya coba-coba cek packages **mozilla-xulrunner-1.9.0.13-i486-2gsb** sudah ada atau belum di sistem dengan cara sebagai berikut :

    
    
    martinus@martinusadyh:~$ ls /var/log/packages/ | grep xul
    mozilla-xulrunner-1.9.0.13-i486-2gsb
    martinus@martinusadyh:~$
    



Hm.. sudah ada dan dengan versi yang terbaru, ok sekarang mari kita lanjutkan dengan petuah yang kedua yaitu **hilangkan direktori seamonkey dari file /etc/ld.so.conf**. Ok sekarang mari diperiksa :

    
    
    martinus@martinusadyh:~$ more /etc/ld.so.conf
    /usr/local/lib
    /usr/i486-slackware-linux/lib
    /usr/lib/seamonkey
    /usr/lib/xulrunner
    martinus@martinusadyh:~$
    



Hmm.. sekarang mari kita hapus direktori **/usr/lib/seamonkey** dari file **/etc/ld.so.conf** menjadi seperti ini :

    
    
    martinus@martinusadyh:~$ more /etc/ld.so.conf
    /usr/local/lib
    /usr/i486-slackware-linux/lib
    /usr/lib/xulrunner
    martinus@martinusadyh:~$
    



Dan sekarang jalankan-lah perintah **ldconfig** untuk memperbarui **PATH** library (CMIIW) , dan langkah terakhir jalankanlah **yelp** dan kita akan mendapatkan hasil seperti dibawah ini :
[![YELP](http://farm3.static.flickr.com/2494/3949037490_445ac57087.jpg)  
And voilla.... i can see GNOME Help Browser Again](http://www.flickr.com/photos/10243554@N02/3949037490/)

Nah mudah-mudahan reportase singkat ini bisa membantu teman-teman yang mengalami nasib yang sama :)

**Tulisan ini dibuat untuk menyukseskan [Lomba Blog Open Source](http://www.informatika.lipi.go.id/seminar/lombablog/) P2I-LIPI dan [Seminar Open Source](http://www.informatika.lipi.go.id/seminar/) P2I-LIPI 2009. **
