---
comments: true
date: 2010-08-17 10:20:18+00:00
layout: post
slug: simulasi-slow-network-dengan-lagfactory
title: Simulasi Slow Network Dengan LagFactory
wordpress_id: 965
categories:
- Java
- NetBeans
- Slackware
tags:
- Bash
- Java
- java swing
- Network
- Shell
- Slackware
---

Pernah ingin mencoba melakukan simulasi **"jaringan lambat"** ?? Jika iya, maka teman-teman dapat mencoba menggunakan sebuah shell script dengan nama **LagFactory** yang bisa di unduh pada [http://software.inl.fr/trac/wiki/LagFactory](http://software.inl.fr/trac/wiki/LagFactory) :) Agar dapat menggunakan script **LagFactory** ini, editlah dahulu variabel `IFACE` dan `TARGET` sesuai dengan kebutuhan kita. Nah sebagai contoh, jika kita ingin melakukan simulasi pada komputer kita sendiri gantilah isi variabel `IFACE` dan `TARGET` menjadi seperti dibawah ini :

    
    
    IFACE="lo lo" # Input and output interface to simulate lag in INPUT and OUTPUT
    TARGET="0.0.0.0/0" # Host or network to apply lag on
    



Setelah selesai, sekarang jalankanlah dengan menggunakan akses root (#) dengan cara seperti dibawah ini :

    
    
    root@martinusadyh:[/home/martinus/Desktop]# ./lagfactory.sh start 10000 10
    DELAY : 10000 ms
    LOSS : 10%
    RTNETLINK answers: Invalid argument
    RTNETLINK answers: File exists
    RTNETLINK answers: File exists
    RTNETLINK answers: Invalid argument
    RTNETLINK answers: File exists
    We have an error talking to the kernel
    root@martinusadyh:[/home/martinus/Desktop]#
    



Jika sudah, sekarang coba jalankan perintah `ping` pada localhost seperti dibawah ini :

    
    
    martinus@martinusadyh:[/]$ ping localhost 
    PING martinusadyh (127.0.0.1) 56(84) bytes of data.
    64 bytes from martinusadyh (127.0.0.1): icmp_seq=11 ttl=64 time=18625 ms
    64 bytes from martinusadyh (127.0.0.1): icmp_seq=13 ttl=64 time=18476 ms
    64 bytes from martinusadyh (127.0.0.1): icmp_seq=10 ttl=64 time=21548 ms
    64 bytes from martinusadyh (127.0.0.1): icmp_seq=12 ttl=64 time=19786 ms
    64 bytes from martinusadyh (127.0.0.1): icmp_seq=14 ttl=64 time=18206 ms
    64 bytes from martinusadyh (127.0.0.1): icmp_seq=15 ttl=64 time=19416 ms
    martinus@martinusadyh:[/]$ 
    



Untuk membandingkan dengan keadan **"normal"**, sekarang matikan dahulu script **LagFactory** dengan menggunakan perintah `./lagfactory.sh stop` dan cek hasil ping yang seharusnya nilai time yang dihasilkan berkisar dibawah **0.040 ms** di seperti dibawah ini :

    
    
    root@martinusadyh:[/home/martinus/Desktop]# ./lagfactory.sh stop          
    RTNETLINK answers: No such file or directory
    root@martinusadyh:[/home/martinus/Desktop]# ping localhost
    PING martinusadyh (127.0.0.1) 56(84) bytes of data.
    64 bytes from martinusadyh (127.0.0.1): icmp_seq=1 ttl=64 time=0.035 ms
    64 bytes from martinusadyh (127.0.0.1): icmp_seq=2 ttl=64 time=0.040 ms
    64 bytes from martinusadyh (127.0.0.1): icmp_seq=3 ttl=64 time=0.038 ms
    64 bytes from martinusadyh (127.0.0.1): icmp_seq=4 ttl=64 time=0.037 ms
    ^C
    --- martinusadyh ping statistics ---
    4 packets transmitted, 4 received, 0% packet loss, time 3001ms
    rtt min/avg/max/mdev = 0.035/0.037/0.040/0.006 ms
    root@martinusadyh:[/home/martinus/Desktop]# 
    



Sebenarnya apasih tujuan dari posting ini ?? Tujuan utama-nya yaitu adalah agar kita bisa mengetahui seberapa **"cepat"**-kah aplikasi yang kita bangun jika dihadapkan pada kondisi jaringan yang **"jelek"** :) (Bayangkan jika kita mempunyai client yang outletnya ada di pelosok desa, dan koneksi yang tersedia hanyalah GPRS saja :D )

Bagaimana teman-teman, tertarik untuk mencoba ??? :)


**Referensi**




  1. [http://software.inl.fr/trac/wiki/LagFactory](http://software.inl.fr/trac/wiki/LagFactory)



