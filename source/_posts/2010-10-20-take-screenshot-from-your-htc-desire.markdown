---
comments: true
date: 2010-10-20 15:17:18+00:00
layout: post
slug: take-screenshot-from-your-htc-desire
title: Take Screenshot From Your HTC Desire
wordpress_id: 1030
categories:
- Android
- Blogging
- Java
- Slackware
tags:
- Android
- android sdk
- Desire
- HTC
- HTC Desire
- Java
- Screenshot
- Slackware
---

Selama mengikuti perkembangan Android di milis [id-android@googlegroups.com](mailto:id-android@googlegroups.com) ada yang paling mengesankan buat saya, yaitu tentang bagaimana caranya mengambil screenshot screen yang terdapat pada handphone kita :D Nah karena saya juga pengguna awam **Android** maka posting pertama ini juga yang enteng-enteng dulu :D Yuuk mari kita mulai aja :)

Pertama yang harus dilakukan agar kita bisa mengambil screenshot yaitu meng-aktifkan fitur **USB Debugging** pada HTC Desire yang anda miliki, sedangkan untuk mengaktifkan fitur ini langkah-nya yaitu pada tampilan **Home Screen** tekanlah tombol **menu** kemudian pilihlah opsi **Settings** seperti gambar dibawah ini :

[![Settings](http://farm2.static.flickr.com/1101/5099680468_d99baedfae_m.jpg)](http://www.flickr.com/photos/10243554@N02/5099680468/)  
**Tampilan Menu Home Screen**

Pada jendela **Settings** sekarang cari dan pilihlah menu **Applications** seperti dibawah ini :

[![MenuSettings](http://farm2.static.flickr.com/1250/5099680476_657ce348a7_m.jpg)](http://www.flickr.com/photos/10243554@N02/5099680476/)  
**Tampilan Menu Settings**
<!-- more -->
Setelah memasuki menu **Applications**, sekarang pilih-lah menu **Development** seperti gambar dibawah ini :

[![Development](http://farm2.static.flickr.com/1110/5099680480_b1bb26fd5b_m.jpg)](http://www.flickr.com/photos/10243554@N02/5099680480/)  
**Tampilan Menu Development**

Didalam menu **Development** ini terdapat tiga opsi yaitu **USB Debugging, Stay Awake** dan **Allow mock locations**. Centang-lah menu pilihan **USB Debugging** hingga menjadi seperti dibawah ini :

[![EnableUSBDebugging](http://farm5.static.flickr.com/4112/5099680484_b37645e4f3_m.jpg)](http://www.flickr.com/photos/10243554@N02/5099680484/)  
**Tampilan Menu Enable USB Debugging**

Sampai disini proses konfigurasi pada HTC Desire kita telah selesai dilakukan :) Nah sekarang sebelum lanjut pada langkah selanjut-nya, install-lah dahulu [Android SDK](http://developer.android.com/sdk/installing.html) pada komputer atau laptop anda (Jika belum meng-install Android SDK, mungkin bisa baca-baca proses installasi yang sudah saya coba pada posting [Installasi Android SDK Untuk Pengembangan Aplikasi Android](http://martinusadyh.web.id/2010/08/29/installasi-android-sdk-untuk-pengembangan-aplikasi-android/)) :) . Jika sudah, sambungkan-lah HTC Desire dengan laptop atau komputer anda menggunakan kabel data bawaan HTC Desire dan pilihlah mode **Charge Only**. Setelah itu, sekarang gantilah hak akses kita menjadi **root** kemudian masuklah kedalam direktori `$ANDROID_HOME/tools/` dan jalankan-lah perintah `./ddms`. Jika tidak ada kesalahan, harusnya kita sudah bisa melihat tampilan HTC Desire kita tampil pada jendela **Dalvik Debug Monitor** seperti gambar dibawah ini :

[![DalvikDebugMonitor](http://farm5.static.flickr.com/4067/5099160025_4356f3a9c7.jpg)](http://www.flickr.com/photos/10243554@N02/5099160025/)  
**Tampilan Dalvik Debug Monitor**

Jika sudah, sekarang cobalah tekan **CTRL+S** pada **Dalvik Debug Monitor** dan tada.... kita sudah bisa mengambil screenshot pada HTC Desire kita seperti gambar dibawah ini :

[![TakeScreenshot](http://farm5.static.flickr.com/4149/5099160029_453c0b3d7c.jpg)](http://www.flickr.com/photos/10243554@N02/5099160029/)  
**Tampilan Screenshot Home Screen with Live Wallpaper**

Mudah bukan ?? Dan ternyata proses-nya tidak serumit yang saya bayangkan :) Soalnya jalan mulus di Slackware yang saya gunakan :D :)

