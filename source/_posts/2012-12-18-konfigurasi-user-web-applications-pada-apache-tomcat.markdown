---
author: admin
comments: true
date: 2012-12-18 16:27:09+00:00
layout: post
slug: konfigurasi-user-web-applications-pada-apache-tomcat
title: Konfigurasi User Web Applications Pada Apache Tomcat
wordpress_id: 2073
categories:
- Java
tags:
- Apache
- Tomcat
- Tomcat7
- UserDir Module
---

Untuk yang sering bermain dengan [Apache HTTPD](http://httpd.apache.org/) mungkin sudah tidak asing dengan [module mod_userdir](http://httpd.apache.org/docs/2.2/mod/mod_userdir.html), modul ini berfungsi supaya aplikasi web kita tidak perlu di simpan di direktori `/var/www` sesuai konfigurasi standart milik **Apache**, melainkan di direktori `~/public_html`. Keuntungan yang kita dapat adalah, kita tidak perlu merubah hak akses direktori `/var/www` ataupun menambahkan user kita kedalam group milik **Apache**. Dengan model seperti ini, proses _development_ kita menjadi lebih mudah karena semuanya dilakukan pada direktori `/home` kita sendiri :)

Nah tahukah kalian bahwa ternyata [Apache Tomcat](http://tomcat.apache.org/) juga memiliki fitur yang sama seperti saudara-nya **Apache HTTPD** ? Jika di **Apache HTTPD** nama module-nya adalah [mod_userdir](http://httpd.apache.org/docs/2.2/mod/mod_userdir.html), maka pada **Apache Tomcat** dikenal dengan nama [User Web Applications](http://tomcat.apache.org/tomcat-7.0-doc/config/host.html#User_Web_Applications).

Untuk mencoba-nya installah dahulu [Apache Tomcat](http://tomcat.apache.org/) pada komputer/laptop anda, dan konfigurasikan supaya setiap kali komputer/laptop restart **Apache Tomcat** bisa langsung berjalan. Untuk pengguna distribusi **Ubuntu** kita bisa menginstall dengan mengetikkan perintah :
[plain]
martinusadyh@artivisi:~$ sudo apt-get install tomcat7
[/plain]
<!-- more -->
Sebelum melakukan pengeditan, mari kita stop dahulu service tomcat yang secara otomatis dijalankan ketika kita melakukan proses installasi dengan perintah seperti berikut :
[plain]
martinusadyh@artivisi:~$ sudo /etc/init.d/tomcat7 stop
[/plain]

Jika sudah, sekarang bukalah file `/etc/tomcat7/server.xml` dan carilah baris kode seperti dibawah ini : 

    
    
          <host unpackwars="true" name="localhost" autodeploy="true" appbase="webapps">
    
          
          
    



Kemudian edit-lah hingga menjadi seperti dibawah ini :

    
    
          <host unpackwars="true" name="localhost" autodeploy="true" appbase="webapps">
                
          <listener classname="org.apache.catalina.startup.UserConfig" userclass="org.apache.catalina.startup.PasswdUserDatabase" directoryname="public_webapps" homebase="/home"></listener>
    
          
          
    



Sekarang buatlah direktori `public_webapps` di `home` dengan mengetikkan perintah `mkdir ~/public_webapps`, untuk mengetest-nya buatlah sebuah file dengan nama `index.jsp` dan pastekan kode dibawah ini :

    
    
    <html>
        <head>
            <title>Hello World !!</title>
        </head>
        
        <body>
            <h1>Hello World !!</h1>
            Today is : <%= new java.util.Date().toString() %>
        </body>
    </html>
    



Jika sudah, sekarang jalankan tomcat-nya dengan mengetikkan perintah :
[plain]
martinusadyh@artivisi:~$ sudo /etc/init.d/tomcat7 start
[/plain]

Dan bila tidak ada pesan kesalahan, maka coba buka browser dan arahkan pada alamat `http://localhost:8080/~namauser` kemudian tekan `ENTER`. Jika tidak ada kesalahan, maka kita akan melihat tampilan seperti gambar dibawah ini :
[caption id="attachment_2094" align="alignleft" width="300"][![Tomcat User Web Applications](http://martinusadyh.web.id/wp-content/uploads/2012/12/Tomcat-User-Web-Applications-300x246.png)](http://martinusadyh.web.id/2012/12/18/konfigurasi-user-web-applications-pada-apache-tomcat/tomcat-user-web-applications/) Tomcat User Web Applications[/caption]

