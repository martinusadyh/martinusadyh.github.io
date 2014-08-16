---
comments: true
date: 2011-09-04 18:40:59+00:00
layout: post
slug: pidgin-and-gnome-3
title: Pidgin and GNOME 3
wordpress_id: 1502
categories:
- Slackware
tags:
- Git
- GNOME3
- Pidgin
- Slackware
---

Sejak menggunakan GNOME 3, saya jarang sekali menggunakan pidgin sebagai pengganti YM (yahoo messenger). Masalahnya yaitu pidgin belum dapat menampilkan notification layaknya Empathy yang sudah ter-integrasi dengan baik di GNOME 3. Nah sebagai gantinya, saya selalu menggunakan Gtalk selama ini sebagai solusi IM :)

Kemarin secara tidak sengaja, saya menemukan sebuah **Pidgin GNOME Shell Extension** yang bisa dilihat [disini](http://blog.kagesenshi.org/2011/04/pidgin-and-gnome3.html), setelah membaca panduan tersebut ternyata caranya sangat mudah yaitu buatlah dahulu direktori `pidgin@gnome-shell-extensions.gnome.org` didalam direktori `~/.local/share/gnome-shell/extensions`. Kemudian simpanlah file [metadata.json](https://github.com/kagesenshi/gnome-shell-extensions-pidgin/blob/master/metadata.json) dan [extension.js](https://github.com/kagesenshi/gnome-shell-extensions-pidgin/blob/master/extension.js) ke direktori `pidgin@gnome-shell-extensions.gnome.org`. 

Jika sudah, sekarang restartlah GNOME Shell dengan menekan tombol `ALT+F2` kemudian ketik `r+ENTER`. Setelah melakukan langkah ini, maka harusnya ketika ada seorang teman yang mengajak chatting GNOME akan menampilkan notification-nya seperti gambar dibawah ini :

[![Tampilan Notification Pidgin di GNOME 3](http://martinusadyh.web.id/wp-content/gallery/tutorial/pidgin.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=146)  
Tampilan Notification Pidgin di GNOME 3

[![Tampilan Notification Pidgin di GNOME 3](http://martinusadyh.web.id/wp-content/gallery/tutorial/pidgin_0.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=147)  
Tampilan Notification Pidgin di GNOME 3

Nah dengan begini, gtalk akan saya akses menggunakan pidgin saja :) Dikarenakan fitur utama pidgin yang tidak bisa saya tinggal yaitu adalah fasilitas **logchat**-nya :) Bagaimana dengan teman-teman yang lain, apakah ada fitur bagus di GNOME yang bisa di sharing ? :)

**Referensi terkait :**




  1. [Pidgin and GNOME 3](http://blog.kagesenshi.org/2011/04/pidgin-and-gnome3.html)


  2. [gnome-shell-extensions-pidgin](https://github.com/kagesenshi/gnome-shell-extensions-pidgin)



