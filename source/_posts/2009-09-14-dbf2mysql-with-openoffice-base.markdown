---
comments: true
date: 2009-09-14 05:35:50+00:00
layout: post
slug: dbf2mysql-with-openoffice-base
title: DBF2MySQL with OpenOffice Base
wordpress_id: 67
categories:
- DataBase
- Java
- NetBeans
- OpenSolaris
- Slackware
---

Pernah merasa pusing bagaimana memindahkan database dari tabel yang bertipe **DBF** (biasanya sih ini dari aplikasi yang berbasis Foxpro 2.6 dan Clipper yang jalan di DOS) ke **MySQL** ? Kalau pernah, berarti sama dengan saya ketika dulu melakukan proses **porting** aplikasi dari Foxpro 2.6 + Clipper + DBF + Windows ke Java Swing + MySQL + GNU/Linux :)

Mungkin banyak aplikasi lain yang mampu melakukan proses porting dari DBF ke MySQL selain menggunakan OpenOffice, tapi setahu saya hanya OpenOffice-lah aplikasi yang dapat melakukan proses porting dari DBF ke MySQL yang sifatnya OpenSource dan jalan di Sistem Operasi GNU/Linux (Maklum dirumah saya ga punya Sistem Operasi Windows, jadi memilih aplikasi yang jalan di GNU/Linux adalah pilihan nomor satu saya).

Sebelum mulai melakukan proses migrasi dari DBF ke MySQL menggunakan OpenOffice, tambahkanlah dahulu **MySQL JDBC Driver** pada classpath OpenOffice yang akan digunakan. Sedangkan langkah-langkah untuk menambahkan **MySQL JDBC Driver** ke dalam OpenOffice bisa dibaca pada tulisan saya di [sini](http://martinusadyh.web.id/2009/06/20/view-your-database-schema-with-openoffice-301/#Memasang%20MySQL%20JDBC%20Driver%20di%20OpenOffice). Fungsi dari penambahan **MySQL JDBC Driver** ini adalah agar kita dapat mengakses database yang terdapat pada MySQL dari OpenOffice, nah jika kita sudah menambahkan **MySQL JDBC Driver** pada OpenOffice sekarang mari kita mulai proses migrasi data dari DBF ke MySQL.

Langkah pertama yang harus kita lakukan yaitu **copy** lah seluruh file yang ber-ekstensi **DBF** ke sebuah direktori khusus seperti pada gambar dibawah ini :
[![DBF2MYSQL_1](http://farm3.static.flickr.com/2552/3917613913_25b4453342.jpg)](http://www.flickr.com/photos/10243554@N02/3917613913/)

Sekarang jalankan-lah OpenOffice Base kemudian pada jendela **Database Wizard** pilihlah opsi **Connect to an existing database** dan pilihlah **dBase** seperti gambar dibawah ini kemudian tekanlah tombol **Next** :
[![DBF2MYSQL_2](http://farm3.static.flickr.com/2458/3917613917_87e3953f10.jpg)](http://www.flickr.com/photos/10243554@N02/3917613917/)
<!-- more -->
Pada jendela berikutnya, isikanlah lokasi direktori tempat menyimpan file yang ber-ekstensi **DBF** (pada tulisan ini, lokasi file DBF terdapat di /home/martinus/DATABASE/RAW_DBF) pada kolom isian **Path to the dBase files** seperti gambar dibawah ini kemudian tekanlah tombol **Next** :
[![DBF2MYSQL_3](http://farm3.static.flickr.com/2533/3917613919_eebbb9d711.jpg)](http://www.flickr.com/photos/10243554@N02/3917613919/)

Kemudian pada jendela selanjutnya pilihlah opsi **No, do not register the database** pada pertanyaan **Do you want the wizard to register the database in OpenOffice.org ?** dan pilihlah opsi **Open the database for editing** pada pertanyaan **After the database file has been saved, what do you want to do ? ** seperti gambar dibawah ini :
[![DBF2MYSQL_4](http://farm4.static.flickr.com/3523/3917613923_77299a413d.jpg)](http://www.flickr.com/photos/10243554@N02/3917613923/)

Setelah menekan tombol **Finish** kemudian melakukan proses penyimpanan, maka tabel yang mempunyai ekstensi **DBF** akan tampil pada OpenOffice dan kita juga bisa melihat isi tabelnya seperti gambar dibawah ini :
[![DBF2MYSQL_5](http://farm3.static.flickr.com/2595/3917613925_34c5f22685.jpg)](http://www.flickr.com/photos/10243554@N02/3917613925/)

Sampai proses ini, tabel DBF sudah siap untuk kita pindahkan ke dalam MySQL. Tapi sebelum melakukan proses per-pindahan kita harus membuat dahulu 1 buah database pada MySQL untuk menampung seluruh tabel-tabel DBF tersebut. Sekarang mari kita buat dahulu 1 buah database dengan nama **porting_dbf** seperti dibawah ini :

    
    
    martinus@martinus-laptop:~$ mysql -u root -padmin;
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 46
    Server version: 5.0.75-0ubuntu10.2 (Ubuntu)
    
    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
    
    mysql> create database porting_dbf;
    Query OK, 1 row affected (0.00 sec)
    
    mysql> quit;
    Bye
    martinus@martinus-laptop:~$
    



Pembuatan database untuk menampung tabel DBF sudah siap, nah sekarang mari kita akses database **porting_dbf** tersebut menggunakan OpenOffice Base dengan cara jalankan-lah dahulu OpenOffice Base kemudian pada jendela **Database Wizard** pilihlah opsi **Connect to an existing database** dan pilihlah **MySQL** seperti gambar dibawah ini kemudian tekanlah tombol **Next** :
[![DBF2MYSQL_6](http://farm3.static.flickr.com/2574/3917613935_3ceb3a54a6.jpg)](http://www.flickr.com/photos/10243554@N02/3917613935/)

Pada jendela berikutnya, pilihlah opsi **Connect using JDBC (Java Database Connectivity)** pada pilihan **How do you want to connect to your MySQL database ?** seperti gambar dibawah ini kemudian tekanlah tombol **Next** :
[![DBF2MYSQL_7](http://farm3.static.flickr.com/2636/3917619389_ca5b4de5d4.jpg)](http://www.flickr.com/photos/10243554@N02/3917619389/)

Di langkah selanjutnya, isikan **porting_dbf** pada kolom isian **Name of the Database** dan **localhost** pada kolom isian **Server URL** seperti gambar dibawah ini :
[![DBF2MYSQL_8](http://farm3.static.flickr.com/2481/3917619393_b97db8be01.jpg)](http://www.flickr.com/photos/10243554@N02/3917619393/)
Jika konfigurasi Server MySQL anda tidak default, sesuaikan konfigurasi pada langkah ini dengan konfigurasi Server MySQL anda !!

Setelah menekan tombol **Next**, isikan user yang akan digunakan untuk proses koneksi ke MySQL pada kolom isian **User name** dan beri centang pada pilihan **Password required** jika user yang anda gunakan memakai password seperti gambar dibawah ini :
[![DBF2MYSQL_9](http://farm4.static.flickr.com/3502/3917619397_5cf5b1aacf.jpg)](http://www.flickr.com/photos/10243554@N02/3917619397/)

Kemudian pada jendela selanjutnya pilihlah opsi **No, do not register the database** pada pertanyaan **Do you want the wizard to register the database in OpenOffice.org ?** dan pilihlah opsi **Open the database for editing** pada pertanyaan **After the database file has been saved, what do you want to do ? ** seperti gambar dibawah ini :
[![DBF2MYSQL_10](http://farm3.static.flickr.com/2627/3917619407_95971b2c04.jpg)](http://www.flickr.com/photos/10243554@N02/3917619407/)

Setelah menekan tombol **Finish** kemudian melakukan proses penyimpanan, maka tampilan OpenOffice Base akan tampak seperti gambar dibawah ini :
[![DBF2MYSQL_11](http://farm4.static.flickr.com/3531/3917619413_8f717dabaf.jpg)](http://www.flickr.com/photos/10243554@N02/3917619413/)

Akses DBF dari OpenOffice sudah selesai, akses database dari OpenOffice sudah selesai juga. Sekarang mari kita migrasikan data yang terdapat pada tabel DBF ke dalam MySQL dengan cara bukalah file OpenOffice yang mengakses ke DBF dan ke MySQL secara bersama-sama seperti gambar dibawah ini :
[![DBF2MYSQL_12](http://farm3.static.flickr.com/2582/3917619417_6f950d3eaa.jpg)](http://www.flickr.com/photos/10243554@N02/3917619417/)

Pada OpenOffice yang mengakses tabel DBF, lakukan klik kanan **Copy** untuk melakukan proses **Copy** tabel seperti gambar dibawah ini :
[![DBF2MYSQL_13](http://farm4.static.flickr.com/3512/3917641885_7a06ae42f0.jpg)](http://www.flickr.com/photos/10243554@N02/3917641885/)

Kemudian pindah-lah ke OpenOffice yang mengakses ke MySQL dan lakukan klik kanan **Paste Special ...** seperti gambar dibawah ini :
[![DBF2MYSQL_14](http://farm3.static.flickr.com/2442/3917641891_ecd100503f.jpg)](http://www.flickr.com/photos/10243554@N02/3917641891/)

Nah ketika kita melakukan proses **Paste Special ...** maka akan keluar jendela yang menanyakan tentang **Source** dan pilihlah **Data source table** seperti gambar dibawah ini :
[![DBF2MYSQL_15](http://farm3.static.flickr.com/2428/3917641895_b02207ff86.jpg)](http://www.flickr.com/photos/10243554@N02/3917641895/)

Setelah menekan tombol **OK** maka akan tampil jendela **Copy table** dan pastikanlah opsi **Definitions and data** terpilih seperti gambar dibawah ini :
[![DBF2MYSQL_16](http://farm3.static.flickr.com/2605/3917641901_b15868659f.jpg)](http://www.flickr.com/photos/10243554@N02/3917641901/)

Tekanlah tombol **Next** untuk menuju ke jendela **Apply Columns**, pada jendela ini pilihlah semua kolom yang ingin dimasukkan ke dalam database MySQL seperti gambar dibawah ini :
[![DBF2MYSQL_17](http://farm4.static.flickr.com/3506/3917641905_56eab06822.jpg)](http://www.flickr.com/photos/10243554@N02/3917641905/)

Setelah menekan tombol **Next** kita akan dibawa ke jendela **Type formatting** seperti gambar dibawah ini dan cek sekali lagi apakah data yang di import sudah benar atau belum.
[![DBF2MYSQL_18](http://farm4.static.flickr.com/3443/3917641913_35abf18613.jpg)](http://www.flickr.com/photos/10243554@N02/3917641913/)

Jika kita merasa sudah benar, sekarang tekanlah tombol **Create** untuk memulai proses pembuatan tabel di MySQL dan jika muncul dialog yang menanyakan tentang **Primary key** pilihlah dengan menekan tombol **Yes** seperti gambar dibawah ini :
[![DBF2MYSQL_19](http://farm4.static.flickr.com/3482/3918434378_bb8052f0c9.jpg)](http://www.flickr.com/photos/10243554@N02/3918434378/)

Setelah menekan tombol **Yes**, proses pembuatan tabel di MySQL akan dilakukan dan kita bisa langsung melihat hasilnya seperti gambar dibawah ini :
[![DBF2MYSQL_20](http://farm3.static.flickr.com/2509/3918434382_b10751ebae.jpg)](http://www.flickr.com/photos/10243554@N02/3918434382/)

Dan sekarang mari kita cek melalui terminal apakah benar datanya sudah masuk atau belum seperti dibawah ini:

    
    
    martinus@martinus-laptop:~$ mysql -u root -padmin;
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 48
    Server version: 5.0.75-0ubuntu10.2 (Ubuntu)
    
    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
    
    mysql> use porting_dbf;
    Reading table information for completion of table and column names
    You can turn off this feature to get a quicker startup with -A
    
    Database changed
    mysql> select count(*) from TITIP;
    +----------+
    | count(*) |
    +----------+
    |      850 |
    +----------+
    1 row in set (0.00 sec)
    
    mysql> quit
    Bye
    martinus@martinus-laptop:~$
    



Hore.. datanya ternyata benar-benar sudah masuk :) Buat teman-teman yang membaca sampai akhir, maaf kalau tulisan kali ini gambarnya terlalu banyak yang efeknya membuat aksesnya jadi lambat :malu:


**Tulisan ini dibuat untuk menyukseskan [Lomba Blog Open Source](http://www.informatika.lipi.go.id/seminar/lombablog/) P2I-LIPI dan [Seminar Open Source](http://www.informatika.lipi.go.id/seminar/) P2I-LIPI 2009. **
