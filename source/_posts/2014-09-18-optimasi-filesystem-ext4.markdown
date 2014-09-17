---
layout: post
title: "Optimasi Filesystem Ext4"
date: 2014-09-18 01:16:47 +0700
comments: true
categories: linux
keywords: "Java, Linux, Ext4, Filesystem, Optimization, Ext2 vs Ext4, Ext2 vs Ext3 vs Ext4, Ext4 for SSD, SSD, Filesystem for SSD"
tags: 
- Java
- Linux
- Ext4
- Filesystem
- Optimization
- Ext2 vs Ext4
- Ext2 vs Ext3 vs Ext4
- Ext4 for SSD
- SSD
---

Apakah anda seorang _programmer java_ yang menggunakan sistem operasi utama **Linux** ? Apakah anda pernah merasa ketika proses kompilasi membutuhkan waktu yang lama ? Jika iya, maka nasib anda sama dengan saya :) Tapi jangan bersedih dahulu, apakah pernah terlintas di pikiran anda untuk melakukan **optimasi filesystem** ? Tahukah anda bahwa pemilihan filesystem dan opsi _mount_ yang tepat bisa mempercepat proses kompilasi yang kita lakukan ?

Sebenarnya tulisan ini adalah hasil dari rasa kecewa saya ketika setelah melakukan penggantian _hard disk_ ke SSD _(Solid State Drive)_ dengan harapan supaya proses kompilasi menjadi cepat _(target/harapan awal saya adalah kalau bisa < 1 menit :D )_, tetapi yang terjadi adalah proses kompilasi hanya _lebih cepat ~+ 50%_ dibandingkan ketika menggunakan _hard disk_ seperti gambar dibawah ini :( _(Catatan: Ketika menggunakan hard disk, dengan proses yang sama membutuhkan waktu ~+ 6 menit)_

{% imgcap https://lh6.googleusercontent.com/-gKJHNHb0V5E/VBM8ak0MHaI/AAAAAAAACdc/NJpb9jQJJyQ/s640/DefaultConfig.png Setelah Menggunakan SSD %}

<!-- more -->

Karena peningkatan waktunya tidak se-signifikan teman saya yang sudah menggunakan _SSD_ sebelumnya, akhirnya rasa penasaran saya timbul apa yang menyebabkan proses ditempat saya membutuhkan waktu yang berbeda _(terlepas dari beda merk SSD yang digunakan)_ ? Akhirnya kita berdua-pun berdiskusi apakah kira-kira ada konfigurasi lain yang dilakukan di laptop teman saya tersebut karena kita menggunakan distro yang sama yaitu **Ubuntu 14.04** _(saya menggunakan Linux Mint 17 yang masih varian dari Ubuntu)_, dari hasil diskusi ternyata yang membedakan laptop saya dan teman adalah pemilihan filesystem yang digunakan. Teman saya menggunakan filesystem **Ext2** sedangkan saya menggunakan **Ext4** , dan dari sinilah yang membuat saya menjadi penasaran **kenapa Ext2 bisa lebih cepat dibanding Ext4** ketika digunakan untuk melakukan proses kompilasi ? 

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

Hasil pencarian di [Google dengan keyword Ext4 Optimizations](https://www.google.co.id/search?q=ext4+optimization&oq=ext4+optimization&aqs=chrome..69i57.693j0j9&sourceid=chrome&es_sm=0&ie=UTF-8) sebenarnya cukup banyak, dan setelah membaca berbagai referensi di **google** akhirnya saya menemukan sebuah artikel untuk melakukan [Optimasi Filesystem Ext4](http://blog.smartlogicsolutions.com/2009/06/04/mount-options-to-improve-ext4-file-system-performance/) dengan cara merubah/menambah `mount options` di `/etc/fstab` yang saya gunakan yang sebelum-nya seperti ini :

``` bash
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda1 during installation
UUID=39b79e2e-3dbc-474b-b6b2-c762834a83ff /               ext4    errors=remount-ro 0       1
# /home was on /dev/sda5 during installation
UUID=3004edcb-ad9e-4bdd-b6d4-a06a9112a5fd /home           ext4    defaults        0       2
# swap was on /dev/sda6 during installation
UUID=e1e465db-c3df-4209-9c5a-9c08ea3d1939 none            swap    sw              0       0
```

menjadi seperti dibawah ini :

``` bash
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda1 during installation
UUID=39b79e2e-3dbc-474b-b6b2-c762834a83ff /               ext4    noatime,discard,barrier=0,nouser_xattr,nobh,commit=100,errors=remount-ro 0       1
# /home was on /dev/sda5 during installation
UUID=3004edcb-ad9e-4bdd-b6d4-a06a9112a5fd /home           ext4    noatime,discard,barrier=0,nouser_xattr,nobh,commit=100        0       2
# swap was on /dev/sda6 during installation
UUID=e1e465db-c3df-4209-9c5a-9c08ea3d1939 none            swap    sw              0       0
```

Setelah melakukan perubahan, simpan dan _restart-lah_ laptop anda, dan inilah hasil akhir setelah merubah `mount options` di file `/etc/fstab` :)

{% imgcap https://lh4.googleusercontent.com/-mOjHLE_3Jp8/VBM8asbyVKI/AAAAAAAACdY/oBkTQvF0S5Y/s640/Optimize.png Hasil Optimasi Ext4 %}

### Referensi:
  * [Halaman Dokumentasi Ext4](https://www.kernel.org/doc/Documentation/filesystems/ext4.txt)
  * [Optimasi Filesystem Ext4](http://blog.smartlogicsolutions.com/2009/06/04/mount-options-to-improve-ext4-file-system-performance/)
  * [High performance SD card tuning using the EXT4 file system](https://developer.ridgerun.com/wiki/index.php/High_performance_SD_card_tuning_using_the_EXT4_file_system)