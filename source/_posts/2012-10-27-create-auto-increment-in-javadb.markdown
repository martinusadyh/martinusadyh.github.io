---
author: admin
comments: true
date: 2012-10-27 14:33:42+00:00
layout: post
slug: create-auto-increment-in-javadb
title: Create Auto Increment In JavaDB
wordpress_id: 1985
categories:
- DataBase
- Java
tags:
- CRUD JavaDB
- CRUD Swing JavaDB
- JavaDB
---

[caption id="attachment_1883" align="alignleft" width="110"][![JavaDB](http://martinusadyh.web.id/wp-content/uploads/2012/08/JavaDB.png)](http://martinusadyh.web.id/wp-content/uploads/2012/08/JavaDB.png)JavaDB[/caption]Kemarin sempat bermain-main sebentar dengan [JavaDB](http://www.oracle.com/technetwork/java/javadb/index.html) dan ternyata baru tahu, kalau editor SQL di NetBeans ternyata tidak (belum) ada fitur untuk membuat kolom **auto increment** untuk **JavaDB** :( Nah untuk teman-teman yang ingin membuat kolom **auto increment** di **JavaDB** mungkin bisa menambahkan perintah `ID INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)` pada script `create table` di JavaDB seperti terlihat pada script dibawah ini :

    
    
    create table M_BARANG
    (
    	ID INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY
            (START WITH 1, INCREMENT BY 1),
    	HARGA NUMERIC(19),
    	ISEDITABLE SMALLINT,
    	KETERANGAN VARCHAR(255),
    	KODE_BARANG VARCHAR(255) not null
    )
    


<!-- more -->
Script diatas jika dijalankan akan membuat sebuah tabel dengan nama `M_BARANG` dengan kolom `ID` sebagai primary key dan auto increment :) Untuk mengetest apakah kolom auto_increment kita berjalan dengan benar, sekarang mari kita coba meng-entri 1 record kedalam tabel `M_BARANG` dengan perintah seperti berikut :

    
    
    insert into M_BARANG(KODE_BARANG, KETERANGAN, HARGA, ISEDITABLE) 
    VALUES ('BRG01', 'BARANG TEST', 1200, 1);
    



dan langsung lakukan test, untuk melihat apakah data yang kita insert sudah masuk kedalam tabel `M_BARANG` dengan perintah :

    
    
    select  *
    from    M_BARANG;
    



Jika tidak ada error, maka harusnya akan tampak seperti gambar dibawah ini :
[caption id="attachment_1923" align="alignnone" width="300"][![HasilTestAutoIncrement](http://martinusadyh.web.id/wp-content/uploads/2012/08/HasilTestAutoIncrement-300x218.png)](http://martinusadyh.web.id/wp-content/uploads/2012/08/HasilTestAutoIncrement.png) HasilTestAutoIncrement[/caption]

Nah mudah bukan caranya ? Jadi sekarang, happy coding guys.. :)

