---
comments: true
date: 2009-10-09 21:02:42+00:00
layout: post
slug: konfigurasi-user-home-direktori-apache-di-slackware-130
title: Konfigurasi User Home Direktori Apache di Slackware 13.0
wordpress_id: 76
categories:
- Slackware
---

Karena pingin ngoprek WordPress, akhirnya timbul deh kebutuhan untuk mengkonfigurasi Apache dan PHP di Slackware 13.0 (karena paket Apache dan PHP sudah ter-install secara default pada Slackware 13.0) Tulisan ini banyak yang saya ambil dari tulisan om Somat yang [Slackware dan apache](http://somat.web.id/2009/sep/08/slackware-dan-apache/) dan [Slackware dan php](http://somat.web.id/2009/sep/08/slackware-dan-php/) dengan beberapa perubahan yang saya sesuaikan dengan kondisi di Slackware saya :D

**Konfigurasi Apache**
Langkah yang saya lakukan yaitu sama persis seperti tulisan om Somat di [Slackware dan apache](http://somat.web.id/2009/sep/08/slackware-dan-apache/) yaitu beri akses **execute** pada file **/etc/rc.d/rc.httpd** dan jalankan apache-nya dengan perintah **/usr/sbin/apachectl -k start
** seperti dibawah ini :

    
    
    root@martinusadyh:/etc/rc.d# chmod +x rc.httpd
    root@martinusadyh:/etc/rc.d# /usr/sbin/apachectl -k start
    



**Konfigurasi Apache dan PHP**
Nah pada langkah ini, yang saya lakukan sedikit berbeda dengan yang om Somat lakukan :D. Karena packages PHP sudah terinstall, maka saya tinggal menambahkan 2 baris dibawah ini pada file **/etc/httpd/httpd.conf** :

    
    
    AddType application/x-httpd-php .php
    DirectoryIndex index.html index.php index.shtml
    



**Konfigurasi Apache dan User Home Directories**
Agar kita bisa tidak perlu repot-repot melakukan copy paste ke direktori **/var/www/htdocs**, nyalakan konfigurasi **User home directories** dengan meng-enable baris **Include /etc/httpd/extra/httpd-userdir.conf** pada file **/etc/httpd/httpd.conf** seperti dibawah ini:

    
    
    Include /etc/httpd/extra/httpd-userdir.conf
    



Setelah selesai, buat sebuah direktori dengan nama **public_html** di **home** kemudian buatlah sebuah script php seperti dibawah ini :

    
    
    
    



Restart apache-nya dengan menjalankan perintah berikut :

    
    
    /usr/sbin/apachectl -k restart
    



Sekarang coba browsing ke **localhost/~namauser/php-info.php** harusnya di browser muncul informasi tentang php :)

**Link-link terkait :**
- [Slackware dan apache](http://somat.web.id/2009/sep/08/slackware-dan-apache/)
- [Slackware dan php](http://somat.web.id/2009/sep/08/slackware-dan-php/)
