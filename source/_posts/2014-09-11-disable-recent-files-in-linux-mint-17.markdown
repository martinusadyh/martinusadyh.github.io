---
layout: post
title: "Disable Recent Files in Linux Mint 17"
date: 2014-09-11 09:04:54 +0700
comments: true
sharing: true
keywords: "Disable Recent File, Disable, Permanently, Permanently disable recent files, Cinnamon, Nemo, Nemo File Browser, Linux Mint 17, recently used, recent, Qiana, Mint 17, Linux Mint tips and trick, Tips, Trick, Cinnamon 2.2, Nemo 2.2.4, Disable Recent File on Cinnamon, Disable Recent Tab on Nemo"
description: "This tutorial will show you howto disable recent files in Linux Mint 17 Qiana"
categories:
- Linux
tags:
- Linux Mint 17
- Cinnamon
- Nemo
- Qiana
- Mint
---

Sejak menggunakan [Mint 17](http://blog.linuxmint.com/?p=2626) yang mengusung [Cinnamon 2.2](http://cinnamon.linuxmint.com/) sebagai Desktop Managernya dan [Nemo 2.2.4](https://github.com/linuxmint/nemo) sebagai file browser-nya, saya belum menemukan bagaimana cara untuk men-_disable_ menu **Recent Files** baik di **Cinnamon** dan di **Nemo** :'( Karena sudah terbiasa tidak menggunakan menu **Recent Files** dan hasil pencarian di [Google](https://www.google.com) yang saya lakukan hanya berhasil di jalankan di **Nemo** saja[^1] _(dengan penempatan dan nama file yang berbeda :( )_ , akhirnya mau tidak mau untuk men-_disable_ **recent files** di Cinnamon harus dicari sendiri :( .

Setelah melakukan _trial and error_ beberapa kali, akhirnya saya bisa juga men-_disable_ menu **Recent files** baik di **Cinnamon** dan **Nemo** :) . Ada 2 langkah dan 2 file yang harus di _edit_ yang saya lakukan yaitu :

  * **Disable Recent Files in Cinnamon 2.2**

    Menu _Recent Files_ di **Cinnamon** yang saya maksud disini adalah menu yang akan tampil ketika kita menekan tombol `Menu` seperti terlihat pada _screenshot_ dibawah ini :

    {% imgcap https://lh5.googleusercontent.com/-9c7tZyR2-Xs/VBECdbYqQyI/AAAAAAAACYs/nHT0tY4GG8o/s288/Sebelum_Modifikasi_File%2520_menu%2540cinnamon.org.json.png Menu Recent Files di Cinnamon %}

<!-- more -->

Nah untuk men-_disable recent files_ di **Cinnamon 2.2** seperti terlihat pada _screenshot_ diatas, maka sekarang edit-lah file `menu@cinnamon.org.json` yang terdapat pada direktori `/home/<nama-user>/.cinnamon/configs/menu@cinnamon.org/` dan cari baris yang isinya seperti dibawah ini :

``` json
...
"show-recent": {
    "type": "checkbox",
    "default": true,
    "description": "Show recent files",
    "tooltip": "Choose whether or not to show a recent file list in the menu.",
    "value": true
},
...
```
kemudian edit menjadi seperti dibawah ini :

``` json
...
"show-recent": {
    "type": "checkbox",
    "default": false,
    "description": "Show recent files",
    "tooltip": "Choose whether or not to show a recent file list in the menu.",
    "value": false
},
...
```

Kalau sudah sekarang simpan perubahan diatas dan sekarang coba klik tombol `Menu` , jika semua konfigurasi telah sesuai seharusnya kita sudah tidak melihat menu _Recent Files_ lagi seperti gambar dibawah ini :

{% imgcap https://lh5.googleusercontent.com/-rAuXCV5GLuw/VBECekitnQI/AAAAAAAACY8/39glRev1E88/s288/Setelah_Modifikasi_File%2520_menu%2540cinnamon.org.json.png Menu Recent Files Hilang %}
    

  * **Disable Recent Tab in Nemo 2.2.4**

    Sedangkan untuk *Nemo* , buat-lah _(atau edit bila sudah ada)_ file yang terdapat di dalam direktori `/home/<nama-user>/.config/gtk-3.0` dengan nama `settings.ini` dan kemudian tambahkan baris dibawah ini ke dalam file `settings.ini` 

``` properties
[Settings]
gtk-recent-files-max-age=0
gtk-recent-files-limit=0
```
Jika sudah, simpan-lah perubahan yang sudah dilakukan. Sekarang seharus-nya **Nemo** sudah tidak akan menampilkan apa-pun di tab `Recent` seperti terlihat pada _screenshot_ dibawah ini ;)

{% imgcap https://lh6.googleusercontent.com/-Uy9xof7d0u8/VBECdZ2X2LI/AAAAAAAACYw/1o5yrom-S_E/s288/Setelah_Menambah_File_Settings_ini.png Tab Recent Bersih %}

Bagaimana mudah bukan ? ;)

[^1]: Tutorial membersihkan recent files di Nautilus versi 3.6 yang ternyata masih bisa digunakan untuk Nemo :) [Nautilus 3.6: How To Clear The Recent Files List (Or Disable It)](http://www.webupd8.org/2012/12/nautilus-36-how-to-clear-recent-files.html)