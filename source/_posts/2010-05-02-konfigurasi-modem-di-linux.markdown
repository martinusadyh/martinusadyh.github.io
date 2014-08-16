---
comments: true
date: 2010-05-02 21:13:32+00:00
layout: post
slug: konfigurasi-modem-di-linux
title: Konfigurasi Modem di Linux
wordpress_id: 784
categories:
- CentOS
- Slackware
- Ubuntu
tags:
- CentOS
- Slackware
- Ubuntu
---

Buat teman-teman yang mungkin sedang kesulitan mencari bagaimana **konfigurasi modem di linux menggunakan wvdial** mungkin bisa melihat konfigurasi yang saya gunakan, kemarin sempat bermain-main dengan modem **Wavecom SuperTrac** menggunakan konektor **serial to usb** dan **Huawei Vodafone USB Modem E220** di Slackware 13.0. Percobaan menggunakan modem **Wavecom SuperTrac** menggunakan konektor **serial to usb** tidak berjalan dengan sukses :( dan dari hasil beberapa sumber yang saya baca sangat-sangat tidak direkomendasikan menggunakan modem **Wavecom SuperTrac** menggunakan konektor **serial to usb** :( (Maaf lupa artikel aslinya dimana), sedangkan yang berhasil berjalan dengan sukses adalah untuk modem **Huawei Vodafone USB Modem E220**. Sedangkan untuk teman-teman yang belum tahu bentuk dan wujud dari kedua modem diatas, mungkin bisa melihat gambar dibawah ini agar lebih jelas :






    
[![huawei-vodafone-usb-modem-e220](http://farm5.static.flickr.com/4050/4569198814_970e6c39b3.jpg)](http://www.flickr.com/photos/10243554@N02/4569198814/)  
**Modem Huawei Vodafone USB Modem**

    
[![modem-wavecom](http://farm4.static.flickr.com/3012/4569198818_5563ca9e1f.jpg)](http://www.flickr.com/photos/10243554@N02/4569198818/)  
**Modem WaveCom SuperTrac 10**




Karena kemarin saya menggunakan aplikasi wvdial, maka pastikan teman-teman sudah menginstall wvdial pada sistem teman-teman. Untuk pengguna Slackware sebelum menginstall packages wvdial, pastikan dahulu packages wvstream sudah terinstall terlebih dahulu (untuk packages wvdial dan wvstream bisa teman-teman dapatkan pada http://slackbuild.org) Setelah packages wvdial terinstall, sekarang editlah file `/etc/wvdial.conf` menjadi seperti dibawah ini (tentukan dengan operator yang teman-teman gunakan) :
<!-- more -->
**Konfigurasi Untuk Operator Telkomsel**

    
    
    [Dialer Defaults]
    Init1 = ATZ
    Init2 = ATQ0 V1 E1 S0=0 &C1; &D2; +FCLASS=0
    Init3 = AT+CGDCONT=1,"ip","internet"
    Modem = /dev/ttyUSB0
    Phone = *99#
    Idle Seconds = 300
    Password = ''
    Modem Type = Analog Modem
    Stupid Mode = 1
    Compuserve = 0
    Baud = 9600
    Auto DNS = 1
    Dial Command = ATDT
    Ask Password = 0
    ISDN = 0
    Username = ''
    



**Konfigurasi Untuk Operator 3 (three)**

    
    
    [Dialer Defaults]
    Init1 = ATZ
    Init2 = AT+CGDCONT=1,"IP","3gprs"
    Modem Type = Analog Modem
    ISDN = 0
    Phone = *99***1#
    Modem = /dev/ttyUSB0
    Username = 3gprs
    Password = 3gprs
    Baud = 9600
    



**Konfigurasi Untuk Operator M3**

    
    
    [Dialer Defaults]
    Init1 = ATZ
    Init2 = AT+cgdcont=1,"IP","indosatgprs"
    Modem Type = Analog Modem
    ISDN = 0
    New PPPD = yes
    Phone = *99***1#
    Modem = /dev/ttyUSB0
    Username = gprs
    Password = im3
    Baud = 9600
    



**Konfigurasi Untuk Operator XL**

    
    
    [Dialer Defaults]
    Init1 = ATZ
    Modem Type = Analog Modem
    ISDN = 0
    Phone = *99***1#
    Modem = /dev/ttyUSB0
    Username = xlgprs
    Password = proxl
    Baud = 9600
    



**Konfigurasi Untuk Operator Axis**

    
    
    [Dialer Defaults]
    Init1 = ATZ
    Init2 = at+cgdcont=1,"IP","axis"
    Modem Type = Analog Modem
    ISDN = 0
    Phone = *99***1#
    Modem = /dev/ttyUSB0
    Username = wap
    Password = 1234
    Baud = 9600
    



**Konfigurasi Untuk Operator Flexi**

    
    
    [Dialer Defaults]
    Init1 = ATZ
    Init2 = ATQ0 V1 E1 S0=0 &C1; &D2; +FCLASS=0
    Modem Type = Analog Modem
    ISDN = 0
    Phone = #777
    Modem = /dev/ttyUSB0
    Username = Telkomnet@flexi
    Password = telkom
    Baud = 9600
    



**Konfigurasi Untuk Operator TNI (Telkomnet Instant)**

    
    
    [Dialer Defaults]
    Init1 = ATZ
    Modem Type = Analog Modem
    ISDN = 0
    Phone = 080989999
    Modem = /dev/ttyUSB0
    Username = telkomnet@instan
    Password = telkom
    Baud = 9600
    



Untuk konfigurasi `Modem = /dev/ttyUSB0` bisa teman-teman sesuaikan dengan modem yang teman-teman gunakan, kalau menggunakan port USB biasanya device akan otomatis dimapping ke `/dev/ttyUSBx` dimana `x` adalah nomor device teman-teman. Sedangkan untuk mengetahui letak device dari modem yang teman-teman gunakan, teman-teman bisa mengetikkan perintah `dmesg` untuk mengetahui apakah modem sudah dikenali oleh sistem atau belum. Dan untuk konfigurasi `Baud = 9600` bisa teman-teman dapatkan secara otomatis dengan mengetikkan perintah `wvdialconf` pada terminal agar file `/etc/wvdial.conf` mendapatkan konfigurasi yang tepat.

Setelah selesai melakukan konfigurasi pada file `/etc/wvdial.conf` sekarang coba jalankan perintah `wvdial` pada terminal untuk memulai proses dial dan tunggulah sampai mendapatkan DNS, jika sudah mendapatkan DNS dari operator yang digunakan maka sekarang teman-teman sudah dapat melakukan aktifitas internet seperti biasanya :)

Jika ada teman-teman yang mempunyai konfigurasi untuk operator yang lain, boleh dibagi donk disini agar bisa saya tambahkan ke list :) Supaya bisa dijadikan referensi bersama gitu :malu:

Dibawah ini ada beberapa referensi penggunaan modem dan hyper terminal di Windows yang saya gunakan sebagai acuan, mungkin bisa berguna juga buat teman-teman yang masih kesulitan :




  1. [Wavecom DialUp Connections](http://www.ziddu.com/download/9687737/Wavecom_Dial_up_Connections-080625.pdf.html)


  2. [Wavecom HyperTerminal Connection](http://www.ziddu.com/download/9687738/Wavecom_Hyper_Terminal_Connection-080702.pdf.html)



_**Update 25/06/2010 : Update konfigurasi telkomsel, resource didapat dari http://ardhitechno.blogspot.com/2009/06/setting-modem-huawei-e220-wvdial.html**_
