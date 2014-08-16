---
comments: true
date: 2007-09-18 16:35:08+00:00
layout: post
slug: download-file-nbm
title: Download File nbm
wordpress_id: 7
categories:
- Java
- NetBeans
---

Beberapa hari yang lalu, saya secara tidak sengaja membaca tutorial tentang bagaimana cara menggunakan [ Java Web Start dengan NetBeans IDE](http://www.netbeans.org/kb/articles/matisse-jaws.html) :) Setelah baca-baca sampai habis, akhirnya timbul keinginan buat mempraktekkan nanti dirumah apalagi kalau bisa membikin tutorial yang contohnya memakai Java Web Start kayaknya lebih asyik lagi :)

Akhirnya saya simpan saja halaman tutorial tersebut dengan cara "Save Page As", setelah yakin halaman tutorial tersimpan dengan baik, sekarang gantian waktunya untuk mencari "bahan-bahan" yang diperlukan untuk menggunakan Java Web Start di Netbeans IDE salah satunya yaitu module Java Web Start.

Karena dirumah tidak mempunyai koneksi internet sama sekali sedangkan pada tutorial tersebut hanya  ditunjukkan cara Update Module secara online saja :( , maka saya coba mencari di [Netbeans Plugin Portal](http://plugins.netbeans.org/PluginPortal/) supaya bisa saya download kemudian saya instal secara offline. Setelah mencari-cari beberapa saat, ternyata di [Netbeans Plugin Portal](http://plugins.netbeans.org/PluginPortal/) tidak ada module Java Web Start nya :(    <!-- more -->

Karena sudah kepingin banget, dan kayaknya memang tidak ada cara lain selain update secara online lewat Update Center. Akhirnya jalan satu-satunya ya install Netbeans IDE + JDK di warnet :malu: , setelah Netbeans dan JDK terinstall maka proses selanjutnya yaitu download secara online module Java Web Startnya lewat Update Center kemudian ambil file *.nbmnya untuk diinstal dirumah.

Karena saya hanya ingin mengambil file *.nbm-nya saja untuk keperluan install module secara manual (offline) dirumah, langkah-langkah yang saya lakukan yaitu adalah sebagai berikut :




  1. Jalankan Netbeans IDE, kemudian pilih Tools > Update Center. Beri tanda centang pada semua Update Center yang disediakan oleh Netbeans, setelah itu tekanlah tombol Next untuk mengakses Update Center.  

[![gambar1](http://farm2.static.flickr.com/1196/1402421351_d056d13567_m.jpg)](http://farm2.static.flickr.com/1196/1402421351_5355548754_o.jpg)

  


  2. Setelah beberapa saat, maka pada Wizard Update Center akan muncul semua module-module yang terdapat pada repository Update Center, kemudian pilihlah module Java Web Start dan tekanlah tombol Add seperti gambar dibawah ini:  

[![nb2](http://farm2.static.flickr.com/1120/1402421347_2e04488c57_m.jpg)](http://farm2.static.flickr.com/1120/1402421347_c6f114ac31_o.jpg)

  


  3. Tekanlah tombol Next untuk memulai proses download modulenya dan tekan Accept pada jendela License Agrament-nya kemudian tunggu beberapa saat.
  


  4. Setelah proses download module selesai seperti gambar dibawah ini:  

[![donlod](http://farm2.static.flickr.com/1218/1402421337_f2b6e85de7_m.jpg)](http://farm2.static.flickr.com/1218/1402421337_d6ec860c07_o.jpg)  

jangan buru-buru menekan tombol Next. Tetapi masuklah ke dalam direktori konfigurasi Netbeans yang biasanya terdapat pada /home/nama_user/.netbeans/ tepatnya pada komputer saya ada di direktori **/home/operatore/.netbeans/5.5/update/download** seperti gambar dibawah ini:  

[![nbmfile](http://farm2.static.flickr.com/1223/1402421339_80de656da1_m.jpg)](http://farm2.static.flickr.com/1223/1402421339_585ded4ac0_o.jpg)  

Wow... ternyata Netbeans menyimpan hasil downloadnya pada direktori ini :) dan lihatlah, module Java Web Start yang berupa file *.nbm terdapat di direktori ini.

  


  5. Pindahkan file *.nbm yang berhasil didownload tersebut ke dalam flashdisk atau direktori tertentu untuk dibawa pulang kerumah dan diinstall secara offline :). Jika masih ingin men-download module-module yang lain, cara nya tinggal klik tombol Back untuk kembali dan memilih module yang ingin kita download kemudian ulangi lagi langkah ke 3.


Nah buat teman-teman yang kira-kira mempunyai nasib sama seperti saya :malu: , dan mungkin ada file *.nbm yang mungkin mau didownload bisa nitip ke saya :D dengan cara isi ajah comment disini dan file *.nbm yang ingin didownload :)
