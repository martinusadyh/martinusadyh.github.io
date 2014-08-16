---
comments: true
date: 2012-08-04 07:47:56+00:00
layout: post
slug: how-to-embedding-your-binary-files-into-shell-script
title: How To Embedding Your Binary Files into Shell Script
wordpress_id: 1803
categories:
- CentOS
- OpenSolaris
- Shell Script
- Slackware
- Ubuntu
tags:
- Bash
- Shell
- Shell Script
---

Pada tulisan kali ini, kita akan membahas bagaimana membuat sebuah shell script yang berisi sebuah **_binary file_**. Apa sih sebenarnya yang bisa kita lakukan dengan sebuah shell script yang berisi file binary ? Hm.. sebenarnya banyak sih, dan salah satunya adalah membuat installer untuk sistem operasi GNU/Linux seperti installer milik **NetBeans IDE** yang mempunyai ekstensi ***.sh** :)

Nah untuk membantu tujuan kita diatas, kita membutuhkan bantuan sebuah shell script yaitu [makeself](http://megastep.org/makeself/). Untuk yang belum tahu apa itu script makeself, dibawah ini adalah deskripsi singkat tentang  script makeself :


> 
[makeself.sh](http://megastep.org/makeself/) is a small shell script that generates a self-extractable tar.gz archive from a directory. The resulting file appears as a shell script (many of those have a .run suffix), and can be launched as is. The archive will then uncompress itself to a temporary directory and an optional arbitrary command will be executed (for example an installation script). This is pretty similar to archives generated with WinZip Self-Extractor in the Windows world. Makeself archives also include checksums for integrity self-validation (CRC and/or MD5 checksums).




Dan yang menggembirakan lagi adalah, script makeself ini sudah di test dan dapat digunakan pada beberapa sistem operasi yang kurang lebih seperti berikut :




  1. Linux (all distributions)


  2. Sun Solaris (8 and above)


  3. HP-UX (tested on 11.0 and 11i on HPPA RISC)


  4. SCO OpenUnix and OpenServer


  5. IBM AIX 5.1L


  6. MacOS X (Darwin)


  7. SGI IRIX 6.5


  8. FreeBSD


  9. UnicOS / Cray


  10. Cygwin (Windows)



Sedangkan yang sudah menggunakan script ini sebagai installer mereka adalah :


  1. Game patches and installers for [Id Software games](http://www.idsoftware.com/) like Quake 3 for Linux or Return To Castle Wolfenstien ;


  2. All game patches released by [Loki Software](http://www.lokigames.com/products/myth2/updates.php3) for the Linux version of popular games


  3. The [nVidia drivers](http://www.nvidia.com/) for Linux


  4. The installer for the Linux version of [Google Earth](http://earth.google.com/)


  5. The [VirtualBox](http://www.virtualbox.org/) installers for Linux


  6. The Makeself distribution itself ;-)



Menarik bukan ? Masih tertarik bagaimana caranya menggunakan script ini untuk membuat sebuah installer sendiri ? 
<!-- more -->
Jika iya, maka sekarang downloadlah dahulu script makeself [disini](http://megastep.org/makeself/makeself-2.1.5.run) yang pada saat tulisan ini dibuat mempunyai versi 2.1.5, atau kalau mau versi yang lebih baru bisa mengikuti timeline project ini di [halaman github makeself](https://github.com/megastep/makeself). Jika proses download sudah selesai, simpanlah file `makeself-2.1.5.run` pada sebuah direktori dengan nama **test-makeself**. Sebelum mulai menggunakan, beri hak **_execute_** dahulu pada file `makeself-2.1.5.run` dengan perintah `chmod +x makeself-2.1.5.run` dan ekstrak dengan menjalankan perintah `./makeself-2.1.5.run`. Hasil dari perintah tadi akan membuat sebuah direktori **makeself-2.1.5** yang berisi script makeself seluruh-nya seperti terlihat dari perintah `tree` dibawah ini :

    
    
    martinus@artivisi:[~/tmp/test-makeself]$ tree
    .
    ├── makeself-2.1.5
    │   ├── COPYING
    │   ├── makeself.1
    │   ├── makeself-header.sh
    │   ├── makeself.lsm
    │   ├── makeself.sh
    │   ├── README
    │   └── TODO
    └── makeself-2.1.5.run
    
    1 directory, 8 files
    martinus@artivisi:[~/tmp/test-makeself]$ 
    



Untuk percobaan, sekarang buatlah 2 direktori `binary` dan `result` didalam direktori `makeself-2.1.5` seperti terlihat dibawah ini :
 

    
    
    martinus@artivisi:[~/tmp/test-makeself]$ tree
    .
    ├── makeself-2.1.5
    │   ├── binary
    │   ├── COPYING
    │   ├── makeself.1
    │   ├── makeself-header.sh
    │   ├── makeself.lsm
    │   ├── makeself.sh
    │   ├── README
    │   ├── result
    │   └── TODO
    └── makeself-2.1.5.run
    martinus@artivisi:[~/tmp/test-makeself]$ 
    


Fungsi direktori `binary` diatas adalah untuk menempatkan aplikasi yang akan kita distribusikan, sedangkan direktori `result` adalah untuk menyimpan file installer yang akan dibuat oleh script `makeself` :) 

Jika sudah, masukkanlah direktori aplikasi yang ingin kita distribusikan kedalam direktori `binary` dan sebuah shell script dengan nama `pre-install.sh` (nama file `pre-install.sh` ini hanya sebagai contoh saja) sebagai launcher didalam direktori `binary` seperti dibawah ini:

    
    
    martinus@artivisi:[/tmp/test-makeself/makeself-2.1.5/binary]$ tree
    .
    ├── app
    │   ├── lib
    │   │   ├── MartinSwingUtil-1.0.0.jar
    │   │   ├── mysql-connector-java-5.1.6-bin.jar
    │   │   └── swing-layout-1.0.4.jar
    │   ├── MenuLogin.jar
    │   └── README.TXT
    └── pre-install.sh
    
    2 directories, 6 files
    martinus@artivisi:[/tmp/test-makeself/makeself-2.1.5/binary]$ 
    




> 
Direktori `app/` beserta isinya adalah contoh aplikasi yang ingin di distribusikan, untuk penggunaan sebenar-nya kita bisa memasukkan apa saja didalam direktori `binary`.




File `pre-install.sh` ini dapat digunakan untuk melakukan proses-proses yang dibutuhkan sebelum mulai menginstall aplikasi yang sebenar-nya, seperti contohnya :




  1. Melakukan pengecekan apakah user **root** atau bukan yang menjalankan installer.


  2. Melakukan pengecekan apakah library yang dibutuhkan oleh aplikasi sudah tersedia atau belum.


  3. Melakukan restore database (dibutuhkan opsi untuk memasukkan username dan password mysql yang digunakan oleh user)


  4. Menempatkan file konfigurasi aplikasi pada direktori-direktori yang telah ditentukan.


  5. dan lain-lain ... :)



Sebelum bermain lebih lanjut dengan script `pre-install.sh`, mari kita buat dahulu skenario yang akan dijalankan oleh script `pre-install.sh` kita. Sebagai contoh, kita membuat skenario seperti dibawah ini :




  1. Installer hanya dapat dijalankan oleh user yang mempunyai hak akses **root**.


  2. Copy direktori `app` ke direktori `opt/`


  3. Beri hak akses 755 pada direktori `/opt/app` beserta isinya supaya dapat dijalankan oleh user.



Setelah kita mempunyai skenario seperti diatas, sekarang saatnya untuk bermain-main dengan script `pre-install.sh`, dan kode untuk skenario diatas adalah seperti berikut :

```bash   
#!/bin/sh
# 
# Contoh file pre-install.sh

# Langkah pertama, pengecekan apakah user root yang menjalankan installer
# ini. Jika bukan user root, tampilkan pesan bagaimana menjalankan installer
# dan exit.
if [ "$(id -u)" != "0" ]; then
    echo "Usage : sudo ./installerku.sh"
    exit 1
else
    # Langkah kedua, copy direktori app/ beserta isinya kedalam direktori
    # /opt
    echo "Sedang menginstall aplikasi ...."
    cp -R app /opt/app
    
    echo "Memberi hak akses ..."
    chmod 755 -R /opt/app
    
    echo "Proses installasi selesai !!!"
fi
```

Sampai disini proses yang kita lakukan sudah bisa dibilang hampir selesai, hanya tinggal 1 proses lagi yaitu membuat installer-nya. Sekarang mari kita buat sebuah installer menggunakan script `makeself` dan pastikan bahwa kita berada didalam direktori `makeself-2.1.5` :) Jika sudah, kita bisa menjalankan script `makeself` dengan perintah `./makeself.sh [parameter1] [parameter2] [parameter3] [parameter4]` dimana :




  1. **[parameter1]**, adalah tempat dimana kita meletakkan aplikasi yang ingin di distribusikan. (Dalam contoh kita, adalah direktori `binary`).



  2. **[parameter2]**, adalah nama file installer yang ingin kita buat. (Sebagai contoh pada tulisan ini, nama file installer yang akan kita buat bernama `installerku.sh` dan akan ditempatkan pada direktori `result`).



  3. **[parameter3]**, adalah label untuk installer aplikasi yang ingin kita distribusikan.



  4. **[parameter4]**, script yang ingin kita jalankan ketika proses installasi. (Dalam contoh kita adalah script `pre-install.sh`)




Setelah mengetahui parameter-parameter yang akan digunakan, sekarang jalankan perintah `./makeself.sh binary/ result/installerku.sh "Aplikasi Login v1.0" ./pre-install.sh` seperti dibawah ini :

    
    
    martinus@artivisi:[/tmp/test-makeself/makeself-2.1.5]$ ./makeself.sh binary/ result/installerku.sh "Aplikasi Login v1.0" ./pre-install.sh
    Header is 401 lines long
    
    About to compress 889 KB of data...
    Adding files to archive named "result/installerku.sh"...
    ./
    ./app/
    ./app/lib/
    ./app/lib/mysql-connector-java-5.1.6-bin.jar
    ./app/lib/MartinSwingUtil-1.0.0.jar
    ./app/lib/swing-layout-1.0.4.jar
    ./app/README.TXT
    ./app/MenuLogin.jar
    ./pre-install.sh
    CRC: 677728827
    MD5: 3b84ed4eb87351a2eac8b0f235490fca
    
    Self-extractible archive "result/installerku.sh" successfully created.
    martinus@artivisi:[/tmp/test-makeself/makeself-2.1.5]$ 
    



Sekarang cek pada direktori `result/`, harusnya kita sudah mempunyai file dengan nama `installerku.sh` seperti dibawah ini :

    
    
    martinus@artivisi:[/tmp/test-makeself/makeself-2.1.5]$ ls result/
    installerku.sh
    martinus@artivisi:[/tmp/test-makeself/makeself-2.1.5]$
    



Sekarang mari kita test script `installerku.sh` dengan mencoba menjalankan-nya tanpa menggunakan akses root, apakah yang akan terjadi ? 

    
    
    martinus@artivisi:[/tmp/test-makeself/makeself-2.1.5/result]$ ./installerku.sh 
    Verifying archive integrity... All good.
    Uncompressing Aplikasi Login v1.0.........
    Usage : sudo ./installerku.sh
    martinus@artivisi:[/tmp/test-makeself/makeself-2.1.5/result]$ 
    



Yuuhu... proses installasi gagal dilakukan, sekarang mari kita coba menjalankan script `installerku.sh` menggunakan `sudo` seperti dibawah ini :

    
    
    martinus@artivisi:[/tmp/test-makeself/makeself-2.1.5/result]$ sudo ./installerku.sh 
    Verifying archive integrity... All good.
    Uncompressing Aplikasi Login v1.0.........
    Sedang menginstall aplikasi ....
    Memberi hak akses ...
    Proses installasi selesai !!!
    martinus@artivisi:[/tmp/test-makeself/makeself-2.1.5/result]$ 
    



Hore.. berhasil, sekarang mari kita check apakah direktori `app/` beserta isinya sudah masuk kedalam direktori `opt/` ? 

    
    
    martinus@artivisi:[/tmp/test-makeself/makeself-2.1.5/result]$ ls -l /opt/app/
    total 52
    drwxr-xr-x 3 root root  4096 Jul 29 06:12 app
    drwxr-xr-x 2 root root  4096 Jul 29 05:41 lib
    -rwxr-xr-x 1 root root 38591 Jul 29 05:41 MenuLogin.jar
    -rwxr-xr-x 1 root root  1447 Jul 29 05:41 README.TXT
    martinus@artivisi:[/tmp/test-makeself/makeself-2.1.5/result]$ 
    



Mantap... akhirnya kita bisa membuat sendiri installer di GNU/Linux seperti installer-installer dari project-project besar opensource yang lain :) Nah untuk teman-teman sesama programmer ada yang tertarik untuk mencoba-nya ??
