---
comments: true
date: 2009-06-20 13:55:25+00:00
layout: post
slug: view-your-database-schema-with-openoffice-301
title: View Your DataBase Schema with OpenOffice 3.0.1
wordpress_id: 58
categories:
- Java
- Other
---

Hore.. OpenOffice sekarang sudah bisa menampilkan schema database loh, misalkan kita punya 3 tabel yaitu **T_ARTIKEL, T_KOMENTAR** dan **T_ARTIKEL_T_KOMENTAR** dengan struktur tabel seperti dibawah ini:

    
    
    mysql> show create table T_ARTIKEL;
    *************************** 1. row ***************************
           Table: T_ARTIKEL
    Create Table: CREATE TABLE `T_ARTIKEL` (
      `id` bigint(20) NOT NULL auto_increment,
      `content` varchar(255) default NULL,
      `mode` varchar(255) default NULL,
      `publishDate` datetime default NULL,
      `title` varchar(255) default NULL,
      PRIMARY KEY  (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1
    1 row in set (0.01 sec)
    
    ERROR:
    No query specified
    
    mysql> show create table T_KOMENTAR;
    *************************** 1. row ***************************
           Table: T_KOMENTAR
    Create Table: CREATE TABLE `T_KOMENTAR` (
      `id` bigint(20) NOT NULL auto_increment,
      `email` varchar(255) default NULL,
      `komentar` varchar(255) default NULL,
      `url` varchar(255) default NULL,
      `username` varchar(255) default NULL,
      PRIMARY KEY  (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1
    1 row in set (0.66 sec)
    
    ERROR:
    No query specified
    
    mysql> show create table T_ARTIKEL_T_KOMENTAR;
    *************************** 1. row ***************************
           Table: T_ARTIKEL_T_KOMENTAR
    Create Table: CREATE TABLE `T_ARTIKEL_T_KOMENTAR` (
      `T_ARTIKEL_id` bigint(20) NOT NULL,
      `listKomentar_id` bigint(20) NOT NULL,
      UNIQUE KEY `listKomentar_id` (`listKomentar_id`),
      KEY `FK2BF571DCDAEA7AB0` (`listKomentar_id`),
      KEY `FK2BF571DC8E399F31` (`T_ARTIKEL_id`),
      CONSTRAINT `FK2BF571DC8E399F31` FOREIGN KEY (`T_ARTIKEL_id`) REFERENCES `T_ARTIKEL` (`id`),
      CONSTRAINT `FK2BF571DCDAEA7AB0` FOREIGN KEY (`listKomentar_id`) REFERENCES `T_KOMENTAR` (`id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1
    1 row in set (0.47 sec)
    
    ERROR:
    No query specified
    
    mysql>
    



Kalau tabel yang kita miliki cuma sedikit sih tidak begitu masalah, sekarang bagaimana kalau tabel kita lebih dari 10 ? Mau dilihat satu persatu dari terminal ? :D Nah untungnya sekarang kita bisa melihat schema database tersebut dari OpenOffice :) Sedangkan perlengkapan yang saya pakai disini adalah seperti berikut:
- [MySQL server versi 5.0.67](http://mysql.com)
- [OpenOffice 3.0.1](http://openoffice.org/)

Sedangkan langkah-langkah yang harus kita lakukan yaitu adalah sebagai berikut:
1. Memasang MySQL JDBC Driver di OpenOffice
2. Akses Database MySQL menggunakan OpenOffice
<!-- more -->





  1. **Memasang MySQL JDBC Driver di OpenOffice**
Bukalah dahulu OpenOffice anda, kemudian masuklah ke menu **Tools > Options**, setelah jendela Options terbuka sekarang pilihlah menu Java seperti gambar dibawah ini :
[![JavaOptions](http://farm4.static.flickr.com/3372/3643168009_b0d0fb8fa1.jpg)  
Click to View Large](http://www.flickr.com/photos/10243554@N02/3643168009/)

Sekarang tekanlah tombol **Class Path..** untuk membuka jendela **Class Path**. Pada jendela **Class Path** tekanlah tombol **Add Archive** kemudian pilihlah file **mysql-connector-java-5.1.6-bin.jar** seperti gambar dibawah ini :
[![jdbc](http://farm4.static.flickr.com/3615/3643168015_3115c285d9.jpg)  
Click to View Large](http://www.flickr.com/photos/10243554@N02/3643168015/)

Setelah menambahkan MySQL JDBC Driver, sekarang restart OpenOffice anda dan agar OpenOffice siap digunakan untuk mengakses database melalui JDBC :)





  2. **Akses Database MySQL menggunakan OpenOffice**
Untuk mengakses MySQL dari OpenOffice, pertama yang harus dilakukan yaitu jalankan dahulu OpenOffice Base hingga muncul jendela **DataBase Wizard**. Pada jendela **DataBase Wizard** ini, pilihlah opsi **Connect to an existing database** kemudian pilihlah MySQL seperti gambar dibawah ini :
[![DB1](http://farm4.static.flickr.com/3391/3643168021_c3d4a00ff2.jpg)  
Click to View Large](http://www.flickr.com/photos/10243554@N02/3643168021/)

Setelah itu tekanlah tombol Next, pada jendela selanjutnya yaitu **Set up a connection to a MySQL database** pilihlah opsi **Connect Using JDBC (Java Database Connectivity)** seperti gambar dibawah ini :
[![DB2png](http://farm4.static.flickr.com/3118/3643168025_50a9f45598.jpg)  
Click to View Large](http://www.flickr.com/photos/10243554@N02/3643168025/)

Tekanlah tombol Next untuk masuk ke jendela **Set up connection to MySQL database using JDBC**, pada jendela ini ada beberapa kolom isian yang harus kita isi yaitu :
**Name of the database** : Nama database yang ingin diakses, masukkan nama database anda. (Dalam tulisan ini, nama databasenya yaitu **coba_schema**)
**Server URL **			 : Alamat MySQL Server, kalau server MySQL di install di 1 komputer isikan **localhost** untuk kolom isian ini.
**Port Number**			 : Port MySQL, default adalah 3306
Isikan konfigurasi yang sesuai hingga tampilannya menjadi seperti gambar dibawah ini :
[![DB3](http://farm4.static.flickr.com/3626/3643168031_e8910ba46a.jpg)  
Click to View Large](http://www.flickr.com/photos/10243554@N02/3643168031/)

**Note:** Anda juga bisa mengecek apakah MySQL JDBC Driver yang kita pasang sudah dikenali atau belum dengan menekan tombol **Test Class**

Tekanlah tombol Next untuk masuk ke jendela **Set up the user authentication**, kemudian isikan username yang ingin mengakses database tersebut dan jika mempunyai password beri centang pada pada opsi **Password required** seperti gambar dibawah ini:
[![DB4](http://farm3.static.flickr.com/2463/3643168035_47d428048c.jpg)  
Click to View Large](http://www.flickr.com/photos/10243554@N02/3643168035/)

Sekarang tekanlah tombol Next sekali lagi untuk masuk ke jendela **Decide how to proceed after saving the database**, pilihlah opsi **No, do not register the database** pada pertanyaan **Do you want the wizard to register the database in OpenOffice.org ?** dan pilihlah opsi **Open the database for editing** pada pertanyaan **After the database files has been saved, what do you want to do?** seperti gambar dibawah ini kemdian tekanlah tombol Finish untuk menyimpan konfigurasi yang sudah kita lakukan.
[![Screenshot](http://farm4.static.flickr.com/3397/3644022138_e8c4289064.jpg)  
Click to View Large](http://www.flickr.com/photos/10243554@N02/3644022138/)




Setelah anda melakukan proses diatas dan melakukan penyimpanan, maka OpenOffice akan menampilkan **Login Form** untuk melakukan proses login ke MySQL. Isikan password untuk user yang telah anda tambahkan pada proses diatas seperti gambar dibawah ini kemudian tekanlah tombol OK.
[![DB5](http://farm3.static.flickr.com/2431/3643997572_ef6f8f5b6f.jpg)  
Click to View Large](http://www.flickr.com/photos/10243554@N02/3643997572/)

Jika proses login anda berhasil, maka OpenOffice akan menampilkan database anda seperti gambar dibawah ini :
[![DBManager](http://farm4.static.flickr.com/3643/3643997576_46f3891bfb.jpg)  
Click to View Large](http://www.flickr.com/photos/10243554@N02/3643997576/)

Untuk melihat database schema, sekarang pilihlah menu **Tool > Relationship...** dan anda akan melihat tampilan seperti gambar dibawah ini :
[![schema](http://farm3.static.flickr.com/2438/3643997580_97fbbd76eb.jpg)  
Click to View Large](http://www.flickr.com/photos/10243554@N02/3643997580/)

Keren bukan ?? :) OpenOffice Rock :)
