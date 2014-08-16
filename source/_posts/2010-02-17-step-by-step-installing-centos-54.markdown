---
comments: true
date: 2010-02-17 19:54:26+00:00
layout: post
slug: step-by-step-installing-centos-54
title: Step By Step Installing CentOS 5.4
wordpress_id: 99
categories:
- CentOS
---

Tulisan kali ini murni untuk dokumentasi pribadi saya dan diperuntukkan bagi teman-teman yang masih baru banget di dunia GNU/Linux dan ingin bermain-main dengan distro [CentOS (The Community Enterprise Operating System)](http://centos.org/). Buat teman-teman yang belum tahu apa sih distro [CentOS](http://centos.org/) ini, distro ini adalah merupakan versi **Community** dari distro komersial yaitu [Red Hat Enterprise Linux (RHEL)](http://www.redhat.com/) nah jadi buat teman-teman yang ingin merasakan versi [Red Hat Enterprise Linux (RHEL)](http://www.redhat.com/) tapi belum punya pikiran untuk beli **subscription**-nya mungkin distro ini cocok untuk anda. Sedangkan pada tulisan kali ini, versi [CentOS (The Community Enterprise Operating System)](http://centos.org/) yang digunakan yaitu versi **5.4** untuk mesin **32 bit** dan dicoba di [VirtualBox](http://www.virtualbox.org/) (harusnya sih bisa langsung di implement di **real** komputer):)

Ok sekarang mari kita mulai permainan-nya :) Langkah awal yang pasti yaitu masukkan **cd installer**  [CentOS (The Community Enterprise Operating System)](http://centos.org/) ke dalam **cd/dvd rom** kemudian aturlah [BIOS](http://en.wikipedia.org/wiki/BIOS) di komputer anda agar dapat **boot** melalui **cd/dvd rom**. Setelah semua-nya selesai, sekarang tunggu-lah beberapa saat hingga tampilan installer [CentOS (The Community Enterprise Operating System)](http://centos.org/) tampil seperti gambar dibawah ini:

[![Screenshot](http://farm5.static.flickr.com/4004/4365803644_9d48265f49.jpg)  
Tampilan Awal Installer CentOS](http://www.flickr.com/photos/10243554@N02/4365803644/)

Setelah terlihat tampilan seperti diatas, tekan saja tombol **ENTER** untuk memulai proses installasi. Setelah kita menekan tombol **ENTER** maka pada layar selanjutnya adalah proses pengecekan **cd installer**. Skip saja bagian ini dengan memilih tombol **Skip** seperti gambar dibawah ini :

[![Screenshot-5](http://farm3.static.flickr.com/2708/4365803646_f88bc45cf6.jpg)  
Tekan Tombol Skip Untuk Pengecekan CD Installer](http://www.flickr.com/photos/10243554@N02/4365803646/)
<!-- more -->
Setelah menekan tombol **Skip** maka kita akan melihat [Anaconda Installer](http://en.wikipedia.org/wiki/Anaconda_%28installer%29) yang merupakan ciri khas dari distro [Red Hat Enterprise Linux (RHEL)](http://www.redhat.com/) dan turunan-nya seperti gambar dibawah ini :
[![Screenshot-6](http://farm5.static.flickr.com/4066/4365803648_c864ff60eb.jpg)  
Tampilan Anaconda Installer CentOS](http://www.flickr.com/photos/10243554@N02/4365803648/)

Tekanlah tombol **Next** untuk melanjutkan pada pemilihan bahasa yang ingin digunakan seperti gambar dibawah ini:
[![Screenshot-7](http://farm3.static.flickr.com/2737/4365803654_2803a3a9c9.jpg)  
Jendela Pemilihan Bahasa](http://www.flickr.com/photos/10243554@N02/4365803654/)

Setelah memilih bahasa yang akan digunakan, tekanlah tombol **Next** untuk memilih **type**keyboard yang ingin digunakan. Pilihlah **U.S. English** seperti gambar dibawah ini :
[![Screenshot-8](http://farm5.static.flickr.com/4035/4365803664_dc1fe85d50.jpg)  
Pemilihan Keyboard Yang Ingin Digunakan](http://www.flickr.com/photos/10243554@N02/4365803664/)

Tekanlah tombol **Next** untuk melanjutkan pada tahap partisi **hard disk**, pada proses partisi **hard disk** ini pilihlah **Create custom layout** seperti gambar dibawah ini :
[![Screenshot-9](http://farm5.static.flickr.com/4047/4365803672_865d51a684.jpg)  
Pilihan Custom Layout Pada Partisi Hard Disk](http://www.flickr.com/photos/10243554@N02/4365803672/)

Sekarang partisi-lah sesuai dengan kebutuhan yang ingin digunakan :) Untuk keperluan server pasti-nya konfigurasi partisi-nya berbeda untuk keperluan penggunaan desktop. Nah pada tulisan ini, partisi yang dilakukan cuma 3 yaitu **partisi root (/), partisi home (/home)** dan **partisi (swap)** seperti gambar dibawah ini :
[![Screenshot-10](http://farm5.static.flickr.com/4042/4365895712_2f94d73393.jpg)  
Konfigurasi Partisi CentOS](http://www.flickr.com/photos/10243554@N02/4365895712/)

Setelah proses konfigurasi partisi selesai, sekarang tekanlah tombol **Next** untuk masuk ke menu konfigurasi **bootloader** seperti gambar dibawah ini:
[![Screenshot-11](http://farm5.static.flickr.com/4041/4365895714_5a2a5f2585.jpg)  
Konfigurasi Default BootLoader CentOS](http://www.flickr.com/photos/10243554@N02/4365895714/)

Jika tidak ada konfigurasi tambahan, tekanlah tombol **Next** untuk masuk ke menu konfigurasi jaringan. Pilih **DHCP** saja untuk default-nya, karena konfigurasi jaringan ini bisa kita edit nanti-nya setelah proses installasi selesai seperti gambar dibawah ini :
[![Screenshot-12](http://farm3.static.flickr.com/2739/4365895716_94d5aa82fc.jpg)  
Konfigurasi Jaringan](http://www.flickr.com/photos/10243554@N02/4365895716/)

Tekanlah tombol **Next** untuk masuk ke menu konfigurasi zona waktu yang ingin digunakan. Pilihlah **Java & Sumatra** seperti gambar dibawah ini :
[![Screenshot-13](http://farm3.static.flickr.com/2751/4365895718_580a06f9e2.jpg)  
Konfigurasi Zona Waktu](http://www.flickr.com/photos/10243554@N02/4365895718/)

Tekanlah tombol **Next** untuk masukkan password untuk user **root** seperti gambar dibawah ini :
[![Screenshot-14](http://farm3.static.flickr.com/2692/4365895724_15634c5d51.jpg)  
Entri Password User Root](http://www.flickr.com/photos/10243554@N02/4365895724/)

Setelah menekan tombol **Next** sekarang kita akan masuk pada menu pemilihan paket-paket apa saja yang ingin di install. Jika kita memilih opsi **KDE** atau **GNOME** saja, maka kita hanya akan mendapatkan Desktop Manager **KDE** atau **GNOME** sesuai dengan pilihan kita pada menu ini. Jika kita ingin mem-fungsikan sebagai server, maka centang opsi **Server** seperti gambar dibawah ini :
[![Screenshot-15](http://farm3.static.flickr.com/2787/4365895726_c27e25917f.jpg)  
Pemilihan Paket Yang Akan Di Install](http://www.flickr.com/photos/10243554@N02/4365895726/)

Setelah semua-nya selesai, tekanlah tombol **Next** untuk mulai tahapan installasi. Sampai tahapan ini proses installasi belum dimulai dan jika ada konfigurasi yang dirasa kurang pas kita bisa menekan tombol **Back** untuk melakukan konfigurasi ulang dan sebaliknya jika dirasa tidak ada yang perlu di konfigurasi ulang maka kita bisa menekan tombol **Next** untuk memulai proses installasi seperti gambar dibawah ini :
[![Screenshot-16](http://farm5.static.flickr.com/4065/4365931058_aa94717686.jpg)  
Jendela Keterangan Proses Installasi Akan Dilakukan Jika Menekan Tombol Next](http://www.flickr.com/photos/10243554@N02/4365931058/)

[![Screenshot-17](http://farm5.static.flickr.com/4002/4365931062_25d70dcf2d.jpg)  
Proses Format Hard Disk ](http://www.flickr.com/photos/10243554@N02/4365931062/)

[![Screenshot-18](http://farm5.static.flickr.com/4042/4365931066_703ae9984f.jpg)  
Proses Installasi CentOS](http://www.flickr.com/photos/10243554@N02/4365931066/)

Tunggulah beberapa saat hingga proses installasi yang dilakukan selesai seperti gambar dibawah ini :
[![Screenshot-19](http://farm5.static.flickr.com/4026/4365931070_2709f7c6eb.jpg)  
Keterangan Bahwa Proses Installasi Telah Berhasil](http://www.flickr.com/photos/10243554@N02/4365931070/)

Sekarang tekanlah tombol **Reboot** untuk mulai melakukan konfigurasi  pada sistem yang ingin digunakan :) Sampai tahapan ini, proses installasi sudah bisa dikatakan hampir selesai :) Gampang bukan ? :D

Setelah proses **reboot** selesai dan tidak ada **kesalahan** harusnya kita sudah bisa melihat tampilan **grub** [CentOS](http://centos.org/) yang cantik dan proses **booting** yang anggun seperti gambar dibawah ini :
[![Screenshot-20](http://farm5.static.flickr.com/4020/4365931072_dc10aa7471.jpg)  
Tampilan Grub CentOS](http://www.flickr.com/photos/10243554@N02/4365931072/)

[![Screenshot-21](http://farm5.static.flickr.com/4049/4365931074_a975422ec5.jpg)  
Proses Booting CentOS](http://www.flickr.com/photos/10243554@N02/4365931074/)

Setelah semua service dan hardware berhasil dijalankan dan di deteksi oleh [CentOS](http://centos.org/), maka kita akan melihat tampilan halaman **Selamat Datang** dari [CentOS](http://centos.org/) seperti gambar dibawah ini :

[![Screenshot-22](http://farm3.static.flickr.com/2757/4365240361_ac28771202.jpg)  
Halaman Selamat Datang CentOS](http://www.flickr.com/photos/10243554@N02/4365240361/)

Sekarang tekanlah tombol **Forward** untuk mulai mengkonfigurasi **Firewall**, pada jendela ini pilihlah **Enabled** jika kita ingin mengaktifkan firewall seperti gambar dibawah ini :
[![Screenshot-23](http://farm5.static.flickr.com/4017/4365240363_ef631b0f79.jpg)  
Mengaktifkan Konfigurasi Firewall](http://www.flickr.com/photos/10243554@N02/4365240363/)

Setelah selesai mengkonfigurasi **firewall** tekanlah tombol **Forward** untuk mengkonfigurasi **SELinux** seperti gambar dibawah ini :
[![Screenshot-24](http://farm5.static.flickr.com/4033/4365240367_02d041c952.jpg)  
Konfigurasi SELinux](http://www.flickr.com/photos/10243554@N02/4365240367/)

Langkah selanjutnya yaitu konfigurasi **Date and Time**, sesuaikan jam dan waktu saat ini seperti gambar dibawah ini :
[![Screenshot-25](http://farm5.static.flickr.com/4019/4365240373_d0682c030a.jpg)  
Konfigurasi Date And Time](http://www.flickr.com/photos/10243554@N02/4365240373/)

Setelah selesai melakuakn proses konfigurasi **Date And Time**, sekarang buatlah sebuah **user** yang akan digunakan untuk keperluan sehari-hari seperti gambar dibawah ini :
[![Screenshot-26](http://farm5.static.flickr.com/4017/4365240381_c215e7fbcb.jpg)  
Konfigurasi User](http://www.flickr.com/photos/10243554@N02/4365240381/)

Konfigurasi terakhir yang perlu kita lakukan adalah konfigurasi **Sound Card**, pilih default saja pada halaman ini dan tekanlah tombol **Forward** seperti gambar dibawah ini :
[![Screenshot-27](http://farm3.static.flickr.com/2756/4365240383_0c00651570.jpg)  
Proses Konfigurasi Sound Card](http://www.flickr.com/photos/10243554@N02/4365240383/)

Sekarang tekanlah tombol **Finish** pada jendela **Additional CDs** jika kita tidak ingin meng-install paket-paket tambahan seperti gambar dibawah ini:
[![Screenshot-28](http://farm5.static.flickr.com/4020/4366020094_88f1cb4316.jpg)  
Proses Akhir Konfigurasi CentOS](http://www.flickr.com/photos/10243554@N02/4366020094/)

Setelah menekan tombol **Finish** maka kita akan melihat tampilan **GDM** dari [CentOS](http://centos.org/) seperti gambar dibawah ini :
[![Screenshot-29](http://farm3.static.flickr.com/2788/4366020096_517dc94147.jpg)  
Tampilan GDM CentOS](http://www.flickr.com/photos/10243554@N02/4366020096/)

Sekarang login-lah dengan menggunakan user yang telah dibuat pada langkah-langkah diatas, dan dibawah ini adalah tampilan versi GNOME yang digunakan oleh distribusi [CentOS](http://centos.org/) versi **5.4** :
[![Screenshot-30](http://farm5.static.flickr.com/4005/4366020100_308dbe3930.jpg)  
Proses Intallasi CentOS berhasil Dilakukan](http://www.flickr.com/photos/10243554@N02/4366020100/)

Fyuh... akhirnya selesai juga tulisan [Step By Step Installasi CentOS 5.4]() :) Adakah teman-teman yang tertarik ama distribusi [CentOS](http://centos.org/) ini ? :) Klo saya pribadi sih, lihat-lihat dulu yah kebutuhan ke depan-nya nanti seperti apa :D Tapi yang jelas tulisan ini saya tulis karena sekarang sedang ada kebutuhan untuk meng-install beberapa aplikasi pada distribusi [Red Hat Enterprise Linux (RHEL)](http://www.redhat.com/). Karena [Red Hat Enterprise Linux (RHEL)](http://www.redhat.com/) bayar, akhirnya pilihan saya jatuh pada distribusi [CentOS](http://centos.org/) ini :)

**Link-link terkait :**




  * [CentOS (The Community Enterprise Operating System)](http://centos.org/)


  * [Red Hat Enterprise Linux (RHEL)](http://www.redhat.com/)


  * [Anaconda Installer](http://en.wikipedia.org/wiki/Anaconda_%28installer%29)


  * [VirtualBox](http://www.virtualbox.org/)


  * [BIOS**


