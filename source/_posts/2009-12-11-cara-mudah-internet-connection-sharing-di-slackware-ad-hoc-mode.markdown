---
comments: true
date: 2009-12-11 17:36:07+00:00
layout: post
slug: cara-mudah-internet-connection-sharing-di-slackware-ad-hoc-mode
title: Cara Mudah Internet Connection Sharing di Slackware (Ad Hoc Mode)
wordpress_id: 92
categories:
- Slackware
tags:
- jaringan ICS
---

Membuat sebuah **Internet Connection Sharing** di GNU/Linux bagi saya merupakan hal yang baru, karena sebelum-nya saya tidak pernah bermain-main terlalu dalam di dunia jaringan :D :) . Apalagi kalau harus ber-urusan dengan yang namanya **IP Tables** dan kawan-kawan-nya, sepertinya saya harus belajar lebih dalam lagi untuk bisa bersentuhan dengan makanan-makanan tersebut. Nah tulisan ini sebenarnya cuma ingin sharing tentang pengalaman saya pribadi menggunakan internet connection sharing di kontrakan yang saya tinggalin sekarang. Dan khusus untuk tulisan kali ini, kita tidak akan bermain-main dengan yang nama-nya **terminal, command prompt atau pun konsole**. Yaps, semua-nya ini selesai hanya dengan proses **klik sini** dan **klik sana** dan alat-alat yang saya gunakan pada tulisan kali ini yaitu :




  * Sistem Operasi GNU/Linux Slackware 13.0 (kernel 2.6.29.6-smp)


  * Desktop Manager menggunakan GnomeSlackBuild versi 2.6.23


  * Network Manager Applet versi 0.7.1 yang di install dari repository GnomeSlackBuild



Sedangkan kasus yang terjadi di kontrakan saya yaitu kita hanya mendapatkan 1 buah modem + 1 kabel UTP untuk bisa menggunakan internet dengan nyaman, dan penghuni di kontrakan yang haus akan internet kurang lebih ada 7 orang (termasuk saya :D ) yang kesemua-nya membawa laptop masing-masing. Nah karena cuma mendapatkan 1 kabel UTP saja, akhir-nya kita memutuskan bahwa yang online menggunakan kabel UTP harus **rela** membagi koneksi yang didapatkan-nya ke seluruh penghuni kontrakan melalui **wifi** dengan menggunakan mode **Ad Hoc** :) Dan kira-kira topologi jaringan (halah baru bisa gambar topoologi ajah dah pamer **($*&$*%&^&#)</b> ) di kontrakan saya kurang lebih seperti gambar dibawah ini :
<a href="http://www.flickr.com/photos/10243554@N02/4176251631/" title="ICS by thundherbolth, on Flickr"><img src="http://farm3.static.flickr.com/2539/4176251631_fbaa6bc176_m.jpg" width="240" height="218" alt="ICS" /><br /><small>Gambar Topologi Jaringan ICS dengan Mode Ad-Hoc</small></a>
<!--more-->

Sekarang bagaimana membuat <b>connection sharing</b> dengan model seperti diatas ? Cara-nya gampang sekali, tapi sebelum melangkah lebih lanjut pastikan dahulu Desktop Manager <b>GNOME</b> sudah ter-install dengan baik dan benar di laptop atau komputer anda dan kita sudah terhubung ke internet melalui kabel UTP :) Kalau sudah, sekarang coba klik pada <b>Network Manager Applet</b> kemudian pilihlah opsi <b>Create New Wireless Network</b> seperti gambar dibawah ini :
<a href="http://www.flickr.com/photos/10243554@N02/4176322077/" title="ics1 by thundherbolth, on Flickr"><img src="http://farm3.static.flickr.com/2611/4176322077_54d54c10e3_o.png" width="335" height="94" alt="ics1" /><br /><small>Network Manager Applet</small></a>

Setelah melakukan langkah diatas, maka jendela <b>Create New Wireless Network</b> akan tampil dan kita diminta untuk mengisikan <b>Network Name</b> yang ingin di <b>sharing</b> ke seluruh penghuni kontrakan. Isikan nama jaringan-nya sesuai dengan keinginan masing-masing, dan jangan rubah konfigurasi yang lain seperti gambar dibawah ini :
<a href="http://www.flickr.com/photos/10243554@N02/4176322081/" title="ics2 by thundherbolth, on Flickr"><img src="http://farm3.static.flickr.com/2683/4176322081_854308711d.jpg" width="459" height="267" alt="ics2" /><br /><small>Membuat Sebuah Access Point Baru</small></a>

Kemudian tekanlah tombol <b>Create</b> dan <b>Access Point</b> kita sudah siap untuk digunakan :) Sedangkan detail konfigurasi dari langkah-langkah yang sudah kita lakukan diatas terlihat seperti gambar dibawah ini :
<a href="http://www.flickr.com/photos/10243554@N02/4177093002/" title="ics3 by thundherbolth, on Flickr"><img src="http://farm5.static.flickr.com/4046/4177093002_06e1afe1e9.jpg" width="500" height="241" alt="ics3" /><br /><small>Detail Konfigurasi ICS Mode AdHoc</small></a>

Nah mudah bukan untuk membagi koneksi internet di Slackware ? :D Dan kondisi seperti inilah yang terdapat di kontrakan saya saat ini, dengan model begini kita tidak perlu beli <b>Access Point</b> baru untuk meng-akomodasi keinginan teman-teman untuk online :D dan duit untuk beli <b>Access Point</b> (jika kantor ngasih) bisa kita pakai buat makan rame-rame :D :P

<b>Note:</b> Maaf yah kalau ada salah sebut atau kekurangan di istilah-istilah jaringan yang saya pakai dalam tulisan ini, mohon koreksi-nya :D
