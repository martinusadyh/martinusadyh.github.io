---
author: admin
comments: true
date: 2012-12-18 17:52:39+00:00
layout: post
slug: how-to-fixing-problem-jetpack-2-0-4-breaks-nextgen-galleries-plugins
title: How To Fixing Problem Jetpack 2.0.4 Breaks NextGen Galleries Plugins
wordpress_id: 2102
categories:
- WordPress
tags:
- Gallery
- Jetpacks
- NextGen
- Plugins
- WordPress
---

Setelah kemarin melakukan upgrade ke [WordPress](http://wordpress.org/), baru malam ini mengalami masalah yaitu ada 1 fitur dari plugin [NextGen Gallery](http://wordpress.org/extend/plugins/nextgen-gallery/) yaitu tampilan album tidak bisa masuk ke dalam gallery. Hasilnya adalah ketika kita masuk pada halaman gallery, maka tampilan dari gallery tersebut akan kosonng  :nangis: Hasil pencarian di [google](http://google.com/) mengarahkan saya pada thread [Jetpack 2.0.4 Breaks NextGen Galleries](http://wordpress.org/support/topic/jetpack-204-breaks-nextgen-galleries) yang ternyata plugin [NextGen Gallery](http://wordpress.org/extend/plugins/nextgen-gallery/) hanya bermasalah jika module **Publicize** dan **Sharing** diaktifkan.

Supaya [NextGen Gallery](http://wordpress.org/extend/plugins/nextgen-gallery/) berfungsi dengan normal kembali, yang kita perlukan adalah men-disable kedua module tersebut dengan cara masuk ke menu `Jetpack > Jetpack` pada halaman **dashboard jetpack**, klik tombol `Learn More` pada module **Publicize** dan **Sharing** kemudian klik tombol `Deactivate` seperti gambar dibawah ini :
[caption id="attachment_2108" align="alignnone" width="300"][![Disable Module Publicize](http://martinusadyh.web.id/wp-content/uploads/2012/12/Disable-Module-Publicize-300x177.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=218) Disable Module Publicize[/caption]

Setelah melakukan langkah diatas, sekarang plugin [NextGen Gallery](http://wordpress.org/extend/plugins/nextgen-gallery/) dapat berjalan dengan normal kembali  :peace: 

