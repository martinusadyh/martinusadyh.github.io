---
comments: true
date: 2009-04-26 20:10:02+00:00
layout: post
slug: upload-dan-download-menggunakan-midnight-commander-mc
title: Upload dan Download Menggunakan Midnight Commander (mc)
wordpress_id: 56
categories:
- OpenSolaris
- Other
- Slackware
---

Mungkin teman-teman sudah tidak asing dengan tool yang namanya **mc** atau [Midnight Commander](http://www.midnight-commander.org/) di dunia Unix/Linux, yups [mc](http://www.midnight-commander.org/) adalah salah satu tool yang fungsinya menyerupai [Norton Commander](http://en.wikipedia.org/wiki/Norton_Commander). Nah tulisan kali ini saya tulis gara-gara saya mengalami beberapa kegagalan dalam proses installasi [gFtp](http://gftp.seul.org/) di OpenSolaris yang saya gunakan :malu: , nah agar dapat menggunakan mc untuk proses upload dan download yang pertama-tama adalah pastikan dahulu apakah aplikasi mc sudah terinstal atau belum pada sistem anda dengan menggunakan perintah **which mc** seperti dibawah ini :

    
    
    [martin@opensolarisbox:~]$ which mc
    /usr/bin/mc
    [martin@opensolarisbox:~]$
    



Nah jika **mc** sudah terinstall pada sistem anda, sekarang coba jalankan dengan mengetikkan **mc** pada terminal atau konsole anda hingga tampilannya menjadi seperti dibawah ini :
[![TampilanDefaultMc](http://farm4.static.flickr.com/3619/3476694521_e5b57da273.jpg)  
Tampilan Default Midnight Commander](http://www.flickr.com/photos/10243554@N02/3476694521/)
<!-- more -->
Setelah tampilan pada terminal anda seperti pada gambar diatas, sekarang coba pilih menu **Right > Shell link** (dengan cara menekan tombol **F9** kemudian pilih menu **Right > Shell link**) sehingga tampilan anda seperti pada gambar dibawah ini :
[![Screenshot-1](http://farm4.static.flickr.com/3587/3476683743_53364df247.jpg)  
Pilih Menu Shell Link](http://www.flickr.com/photos/10243554@N02/3476683743/)

sekarang masukkan **username@host_tujuan** tempat dimana kita akan mendownload atau mengupload filenya (pastikan servis sshd sudah berjalan pada mesin yang akan dituju) seperti gambar dibawah ini :
[![Screenshot-2](http://farm4.static.flickr.com/3554/3476683749_6d09af5f40.jpg)  
Input Username Pada Mesin Yang Ingin di Remote](http://www.flickr.com/photos/10243554@N02/3476683749/)

jika host tujuan anda belum terdaftar pada sistem, maka mc akan menampilkan gambar seperti dibawah ini dan jika ingin melanjutkan ketik saja dengan **yes** kemudian tekan enter.
[![Screenshot-3](http://farm4.static.flickr.com/3412/3476683755_7817587cba.jpg)  
Daftarkan Host Mesin Remote Pada File known_hosts](http://www.flickr.com/photos/10243554@N02/3476683755/)

Setelah memasukkan host_tujuan pada file **~/.sshd/known_hosts** maka sekarang kita diminta untuk memasukkan password untuk **username@host_tujuan** seperti gambar dibawah ini, masukkan passwordnya kemudian tekan enter.
[![Screenshot-4](http://farm4.static.flickr.com/3586/3476683769_e04c5dd233.jpg)  
Masukkan Password Untuk User Pada Mesin Remote](http://www.flickr.com/photos/10243554@N02/3476683769/)

Hm... ada yang aneh disini, setelah memasukkan password dan menekan enter tampilan **mc** menjadi kacau seperti gambar dibawah ini. Untuk mengembalikan tampilan **mc** ke keadaan semula cukup tekan kombinasi tombol **CTRL+C+L** dan voila tampilan **mc** anda akan kembali menjadi normal seperti gambar dibawah ini :
[![Screenshot-5](http://farm4.static.flickr.com/3606/3476683777_a673f54c0c.jpg)  
Tampilan Kacau Setelah Entry Password](http://www.flickr.com/photos/10243554@N02/3476683777/)
  

[![Screenshot-6](http://farm4.static.flickr.com/3311/3476683783_4f9d00c8eb.jpg)  
Tampilan Setelah Proses Refresh Dengan Kombinasi tombol CTRL+C+L](http://www.flickr.com/photos/10243554@N02/3476683783/)

Nah setelah tampilan **mc** anda seperti diatas, sekarang yang perlu diingat adalah pada panel sebelah kiri ini adalah panel file explorer di mesin lokal kita sedangkan pada panel sebelah kanan adalah file explorer dari mesin yang berhasil kita remote. Kita dapat berpindah antar panel dengan menggunakan tombol**TAB** dan melakukan select dan unselect file dengan menggunakan tombol **INSERT**, sekarang mari kita upload 1 buah file dari mesin lokal kita ke mesin remote dan caranya adalah pilih dahulu file yang akan kita upload dengan menekan tombol **INSERT** hingga file yang akan kita upload menjadi berwarna kuning seperti gambar dibawah ini :
[![Screenshot-7](http://farm4.static.flickr.com/3652/3476694513_f394d135a5.jpg)  
File Yang Dipilih Akan Berwarna Kuning](http://www.flickr.com/photos/10243554@N02/3476694513/)

kemudian pindahlah ke panel sebelah kanan dan pilihlah sebuah direktori tempat dimana file yang akan kita upload berada, setelah itu tekan tombol **F5** dan tekan tombol enteruntuk memulai proses pengkopian file seperti gambar dibawah ini :
[![Screenshot-8](http://farm4.static.flickr.com/3297/3476694517_2202d13870.jpg)  
Pilih Direktori Tempat File Akan Di Upload](http://www.flickr.com/photos/10243554@N02/3476694517/)

[![Screenshot-9](http://farm4.static.flickr.com/3405/3477547564_3420740496.jpg)  
Proses Upload Sedang Berlangsung](http://www.flickr.com/photos/10243554@N02/3477547564/)

Hm... mudah bukan :) Teknik ini saya dapatkan dari [Aan](http://blog.andrina.web.id/) teman seperjuangan saya waktu di warnet dan sekarang [Aan](http://blog.andrina.web.id/) sudah jadi bos warnet loh :D
