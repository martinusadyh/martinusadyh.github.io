---
comments: true
date: 2009-11-24 18:21:56+00:00
layout: post
slug: changing-editor-fonts-in-netbeans-ide
title: Changing Editor Fonts In NetBeans IDE
wordpress_id: 87
categories:
- Java
- NetBeans
- OpenSolaris
- Slackware
---

Kemarin habis baca-baca artikel tentang [Top 10 Programming Fonts](http://hivelogic.com/articles/top-10-programming-fonts), akhir-nya jadi iseng-iseng deh cobain ganti font di editor-nya [NetBeans IDE](http://netbeans.org/) supaya lebih betah lama-lama ngetik-nya :D

Nah buat teman-teman yang ingin berburu font, mungkin bisa mengunjungi situs [Top 10 Programming Fonts](http://hivelogic.com/articles/top-10-programming-fonts) untuk melihat-lihat font mana yang cocok kemudian download dan install deh :) Setelah proses download selesai, untuk menginstall font tersebut di GNU/Linux kita harus memasukkan font tersebut ke dalam direktori **/usr/share/fonts/TTF** agar font tersebut dikenali oleh user lain yang terdapat di sistem. Tapi kalau kita cuma ingin testing aja, kita bisa memasukkan font tersebut kedalam direktori **.fonts** yang terdapat di direktori home user kita masing-masing :)

Bagaimana kalau direktori **.fonts** belum ada ? Ya mari kita buat direktori tersebut dengan perintah seperti dibawah ini :

    
    
    martinus@martinusadyh:[~]$ mkdir ~/.fonts
    martinus@martinusadyh:[~]$
    



Setelah itu kopikan font yang sudah di download kedalam direktori **~/.fonts** tersebut seperti dibawah ini :

    
    
    martinus@martinusadyh:[~]$ cp Inconsolata.ttf ~/.fonts/
    martinus@martinusadyh:[~]$ cd ~/.fonts/
    martinus@martinusadyh:[~/.fonts]$ ls
    Inconsolata.ttf
    martinus@martinusadyh:[~/.fonts]$
    



Sekarang mari kita update dahulu font cache kita dengan menjalankan perintah **fc-cache -f -v** agar font yang kita tambahkan bisa dikenali oleh NetBeans seperti dibawah ini :

    
    
    martinus@martinusadyh:[~/.fonts]$ fc-cache -f -v
    /usr/share/fonts/OTF: caching, new cache contents: 23 fonts, 0 dirs
    /usr/share/fonts/TTF: caching, new cache contents: 92 fonts, 0 dirs
    /usr/share/fonts/Type1: caching, new cache contents: 64 fonts, 0 dirs
    /usr/share/fonts/Speedo: caching, new cache contents: 0 fonts, 0 dirs
    /usr/share/fonts/cyrillic: caching, new cache contents: 0 fonts, 0 dirs
    /usr/share/fonts/misc: caching, new cache contents: 59 fonts, 0 dirs
    /home/martinus/.fonts: caching, new cache contents: 1 fonts, 0 dirs
    /var/cache/fontconfig: not cleaning unwritable cache directory
    /home/martinus/.fontconfig: cleaning cache directory
    fc-cache: succeeded
    martinus@martinusadyh:[~/.fonts]$
    


<!-- more -->
Sampai disini proses installasi font sudah bisa dikatan telah selesai, sekarang mari kita ganti default font untuk editor NetBeans dengan cara masuk ke dalam menu **Tools > Options** kemudian pilih-lah tab **Fonts & Colors**. Pilih-lah **Default** pada pilihan **Category** kemudian klik tombol yang terdapat kolom isian **Font** dan kita sudah bisa melihat font yang kita tambahkan seperti gambar dibawah ini :
[![Inconsolota](http://farm3.static.flickr.com/2761/4131646000_58b36e2434_m.jpg)  
Font Incosolota di Font Properties NetBeans IDE](http://www.flickr.com/photos/10243554@N02/4131646000/)

Dan dibawah ini adalah hasil dari perubahan font yang telah kita lakukan pada proses diatas :)
[![NBInconsolota](http://farm3.static.flickr.com/2716/4131646010_c33e39b683.jpg)  
NetBeans with Incosolota Fonts](http://www.flickr.com/photos/10243554@N02/4131646010/)

Bagaimana menurut teman-teman ? Keren bukan, nah sekarang font apa yang menurut teman-teman paling bagus untuk digunakan di NetBeans IDE ? :)

**Link-link terkait :**
- [Top 10 Programming Fonts](http://hivelogic.com/articles/top-10-programming-fonts)
- [Programmer Fonts](http://keithdevens.com/wiki/ProgrammerFonts)
