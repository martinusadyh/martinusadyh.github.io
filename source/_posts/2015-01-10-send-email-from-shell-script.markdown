---
layout: post
title: "Send Email from Shell Script"
date: 2015-01-10 16:19:36 +0700
comments: true
sharing: true
description: "Tertarik untuk mencoba mengirim e-mail lewat shell script ? Jika iya, yuk mari kita bahas beberapa langkah sederhana dibawah ini agar kita bisa mengirimkan email"
keywords: "email,shell,script,ssmtp,ubuntu,linux,mint, send email from shell, google, gmail, smtp"
categories:
- linux
tags:
- mint
- linux
- ubuntu
- ssmtp
- script
- shell
- email 
- google
- gmail
- smtp
---

Tertarik untuk mencoba mengirim e-mail lewat shell script ? Jika iya, yuk mari kita bahas beberapa langkah sederhana dibawah ini agar kita bisa mengirimkan e-mail lewat shell script :) Semua langkah-langkah dibawah ini dilakukan di sistem operasi turunan Debian _(Linux Mint 17.1)_ dan seharusnya bisa jalan secara normal di sistem operasi berbasis Debian lain-nya, untuk yang menggunakan distribusi Linux lain mungkin bisa mencari cara installasi atau konfigurasi yang sesuai dengan distribusi yang digunakan.

Untuk mengirim e-mail lewat shell script, kita akan menggunakan aplikasi kecil bernama `ssmtp` yang konfigurasi-nya cukup sederhana. Dan supaya e-mail yang kita kirim tidak masuk ke kotak _spam_ , maka kita akan menggunakan **SMTP** _(Simple Mail Transport Protocol)_ milik [Google](http://google.com) yaitu **GMail**. 

## Installasi ssmtp

Karena kita akan menggunakan `ssmtp` maka ya tentu saja kita harus menginstall-nya dulu :) Untuk pembaca yang menggunakan distribusi linux berbasis **Debian** bisa melakukan proses installasi dengan cara menjalankan perintah `sudo apt-get install ssmtp` seperti dibawah ini :
```
martinusadyh@martinusadyh:[~]$ sudo apt-get install ssmtp
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  liblua5.1-0 libmysqlcppconn7 libodbc1 libvsqlitepp3 mysql-workbench-data
  python-mysql.connector python-pyodbc python-pysqlite2
Use 'apt-get autoremove' to remove them.
The following NEW packages will be installed:
  ssmtp
0 upgraded, 1 newly installed, 0 to remove and 38 not upgraded.
Need to get 46,2 kB of archives.
After this operation, 8.192 B of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu/ trusty/universe ssmtp amd64 2.64-7 [46,2 kB]
Fetched 46,2 kB in 1s (24,5 kB/s)
Preconfiguring packages ...
Selecting previously unselected package ssmtp.
(Reading database ... 168794 files and directories currently installed.)
Preparing to unpack .../ssmtp_2.64-7_amd64.deb ...
Unpacking ssmtp (2.64-7) ...
Processing triggers for man-db (2.6.7.1-1ubuntu1) ...
Setting up ssmtp (2.64-7) ...
martinusadyh@martinusadyh:[~]$ 
```
<small>Catatan: Untuk distribusi linux yang lain, mungkin bisa mencoba cara installasi <b>ssmtp</b> pada distribusi yang digunakan. </small>

Jika sudah sekarang mari kita masuk ke tahapan yang paling menyenangkan yaitu konfigurasi :)
<!-- more -->

<div>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 300x250, created 12/13/09 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:300px;height:250px"
     data-ad-client="ca-pub-8822787298726866"
     data-ad-slot="0323780848"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
</div>

## Konfigurasi ssmtp Menggunakan SMTP Gmail

Supaya `ssmtp` bisa menggunakan **SMTP** milik [Gmail](https://mail.google.com), sekarang buka dan editlah file `/etc/ssmtp/ssmtp.conf` menjadi seperti dibawah ini :
``` bash
# masukkan alamat email yang digunakan sebagai sender disini
root=xxx@gmail.com

mailhub=smtp.gmail.com:465
rewriteDomain=gmail.com

# masukkan username email disini, klo emailnya xxx@gmail.com maka isi kolom
# dibawah ini dengan 
AuthUser=xxx

# masukkan password email disini
AuthPass=

FromLineOverride=YES
UseTLS=YES
```

Sekarang tiba saat-nya untuk mencoba mengirim e-mail dari _command line/shell/terimanl_ kita :), jalankan perintah seperti dibawah ini:
```
martinusadyh@martinusadyh:[~/MyArticle/STATIC_BLOG/octopress]$ ssmtp alamattujuan@gmail.com
To: alamattujuan@gmail.com
From: alamatsender@gmail.com
Subject: Isi Subject-nya
Isi email yang ingin dikirim
```

Untuk mengirim e-mail, tekan kombinasi tombol **CTRL+D** _(^d)_ dan jika tidak ada kesalahan kita seharusnya melihat tampilan seperti gambar dibawah ini:

{% imgcap https://lh3.googleusercontent.com/-iM7Nmx6YJPw/VLEBgL-RJDI/AAAAAAAADC0/XLeSkwwRJzk/s800/SendEmailFromShell.png Send Email From Shell %}

Dan sekarang mari kita cek di email tujuan, dan berikut ini adalah hasil-nya :)

{% imgcap https://lh3.googleusercontent.com/-RFoyIcxRdaw/VLEDLGoBNSI/AAAAAAAADDA/Yu66JkRiRP4/s400/HasilSendEmailFromShell.png Hasil Send Email From Shell %}

Mudah bukan ? :)

## Referensi:
  * [Howto Send Email from The Command Line](http://askubuntu.com/questions/12917/how-to-send-mail-from-the-command-line)