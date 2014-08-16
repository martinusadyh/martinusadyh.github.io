---
comments: true
date: 2011-12-13 18:17:35+00:00
layout: post
slug: liquibase-xml-generator
title: LiquiBase XML Generator
wordpress_id: 1524
categories:
- DataBase
- Java
tags:
- Generator
- Liquibase XML Generator
- Source Code
- Source Code Generator
- XML
---

Beberapa terakhir ini, di project yang sedang saya kerjakan ada beberapa mainan yang baru buat saya. Nah yang pertama yaitu [Liquibase](http://www.liquibase.org/). Untuk yang belum tahu, **Liquibase** ini adalah sebuah database independent library open source (lisensi yang digunakan adalah Apache 2.0) yang dapat digunakan untuk tracking, managing dan applying perubahan terhadap database. Dan semua konfigurasi di **Liquibase** ini tersimpan pada sebuah file **XML** yang nantinya dapat disimpan kedalam **version control**.

Beberapa fitur dari **Liquibase** ini adalah :




  1. Merging changes from multiple developers


  2. Code branches


  3. Database "diff"


  4. Managing production data as well as various test datasets


  5. Generating database change documentation


  6. Cluster-safe database upgrades


  7. Automated updates or generation of SQL scripts that can be approved and applied by a DBA


  8. Generating starting change logs from existing databases



Pada tulisan ini, saya tidak akan membahas tentang bagaimana menggunakan **tag-tag** yang dikenali oleh **Liquibase**. Jika ingin tahu **tag** apa saja yang di dukung oleh **Liquibase** bisa langsung menuju ke halaman [Liquibase QuickStart](http://www.liquibase.org/quickstart). Dibalik fitur-fitur keren yang dibawa oleh **Liquibase**, sekarang mari kita lihat bagaimana tampilan konfigurasi database yang harus kita tulis supaya bisa dikenali dan digunakan oleh **Liquibase**. Dibawah ini adalah contoh konfigurasi database yang harus kita tulis agar bisa digunakan oleh **Liquibase** :

    
    
    <databasechangelog xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.liquibase.org/xml/ns/dbchangelog/1.0" xsi:schemalocation="http://www.liquibase.org/xml/ns/dbchangelog/1.0 http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-1.0.xsd">
        <preconditions>
                <dbms type="mysql"></dbms>
        </preconditions>
    
        <changeset id="1" author="nvoxland">
            <createtable tablename="person">
                <column autoincrement="true" type="int" name="id">
                    <constraints primarykey="true" nullable="false"></constraints>
                </column>
                <column type="varchar(50)" name="firstname"></column>
                <column type="varchar(50)" name="lastname">
                    <constraints nullable="false"></constraints>
                </column>
            </createtable>
        </changeset>
        <changeset id="2" author="nvoxland">
            <comment>Add a username column so we can use "person" for authentication</comment>
            <addcolumn tablename="person">
                <column type="varchar(8)" name="usernae"></column>
            </addcolumn>
        </changeset>
    </databasechangelog>
    


**Source code lengkap bisa dilihat ke [http://www.liquibase.org/samples/changelogs/mysql.changelog.xml](http://www.liquibase.org/samples/changelogs/mysql.changelog.xml)**

Nah bisa dibayangkan bukan, jika misalkan kita punya tabel kurang lebih sekitar 100 buah plus dengan tambahan relasi antar tabel (kalau ini tidak mungkin tidak :D), komen dan index kolom-nya segala? :D 
<!-- more -->
Untung-nya juga, ternyata ada aplikasi yang dapat kita gunakan untuk membantu membuatkan konfigurasi seperti diatas asalkan kita mempunyai schema database yang live :D Nama aplikasi tersebut adalah [SQL Power Architect](http://www.sqlpower.ca/page/architect), aplikasi ini secara default sudah mendukung file XML milik **LiquiBase**. **Dan jika kita men-design ER** menggunakan **SQL Power Architect** ini, hasilnya juga bisa langsung disimpan menjadi konfigurasi XML milik **LiquiBase** mudah bukan ?

Masalahnya sekarang adalah bagaimana jika kita hanya mempunyai schema yang sudah terdapat di database, dan kita ingin membuatkan file konfigurasi XML untuk **Liquibase** ? Sebagai contoh, kita sudah mempunyai database dengan nama **petsdb** yang schema-nya terdiri dari 2 tabel seperti berikut :
[plain]
mysql> show create table category\G
*************************** 1. row ***************************
       Table: category
Create Table: CREATE TABLE `category` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
1 row in set (0.00 sec)

mysql> show create table item\G
*************************** 1. row ***************************
       Table: item
Create Table: CREATE TABLE `item` (
  `ID` bigint(20) NOT NULL,
  `CATEGORY_ID_FK` bigint(20) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`),
  KEY `FK317B13E61327CF` (`CATEGORY_ID_FK`),
  CONSTRAINT `FK317B13E61327CF` FOREIGN KEY (`CATEGORY_ID_FK`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
1 row in set (0.00 sec)
[/plain]

Nah sebelum melanjutkan, sekarang download-lah dahulu [SQL Power Architect](http://www.sqlpower.ca/page/architect) dan installah java karena **SQL Power Architect** ini merupakan aplikasi berbasis Java. Jika sudah, buatlah dahulu database baru dengan nama **petsdb2** di MySQL seperti berikut ini :
[plain]
mysql> create database petsdb2;
Query OK, 1 row affected (0.03 sec)

mysql> 
[/plain]

Setelah membuat database **petsdb2** diatas, sekarang ekstrak dan jalankan **SQL Power Architect** dengan perintah `java -jar architect.jar`. Tunggu-lah beberapa saat hingga dashboard Power Architect muncul seperti gambar dibawah ini :
[![dashboard_power_architect](http://martinusadyh.web.id/wp-content/gallery/tutorial/dashboard_power_architect.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=148)

Pertama-tama yang harus dilakukan sebelum mulai bekerja dengan **SQL Power Architect** adalah melakukan konfigurasi koneksi database, untuk melakukan hal ini pilihlah menu **Connections > Database Connection Manager** untuk menampilkan jendela **Database Connection Manager** seperti gambar dibawah ini :
[![database_connection_manager](http://martinusadyh.web.id/wp-content/gallery/tutorial/database_connection_manager.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=149)

Tekanlah tombol **Add** untuk mulai menambah koneksi ke database, dan lakukan konfigurasi seperti gambar dibawah ini untuk koneksi ke database **petsdb** :
[![petsdb](http://martinusadyh.web.id/wp-content/gallery/tutorial/petsdb1.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=151)

Ulangi langkah diatas untuk koneksi ke database **petsdb2**, dan hasil akhir nanti-nya adalah kurang lebih seperti gambar dibawah ini :
[![hasil_tambah_koneksi](http://martinusadyh.web.id/wp-content/gallery/tutorial/hasil_tambah_koneksi.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=150)

Jika sudah, sekarang tambahkan semua koneksi database tersebut ke dashboard **SQL Power Architect** dengan cara klik kanan pada **PlayPen Database** kemudian pilih menu **Add Source Connection** dan pilihlah nama koneksi **petsdb** dan **petsdb2** hingga hasil akhirnya seperti gambar dibawah ini :
[![tambah_koneksi_dashboard](http://martinusadyh.web.id/wp-content/gallery/tutorial/tambah_koneksi_dashboard.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=155)

Untuk membuat file XML Liquibase, kita akan menggunakan fitur **Compare DM** yang dapat diakses pada menu **Tools > Compare DM** yang akan menampilkan jendela **Compare Data Model** seperti gambar dibawah ini :
[![compare_data_model](http://martinusadyh.web.id/wp-content/gallery/tutorial/compare_data_model.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=152)

Sekarang lakukan konfigurasi seperti terlihat pada gambar dibawah ini agar proses **Compare Data Model** dapat menghasilkan file XML Liquibase :
[![konfigurasi_compare_dm](http://martinusadyh.web.id/wp-content/gallery/tutorial/konfigurasi_compare_dm.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=154)

Setelah itu, sekarang tekan tombol **Start** dan tunggu beberapa saat sampai **SQL Power Architect** menampilkan hasil pembuatan file XML Liquibase seperti gambar dibawah ini :
[![contoh_hasil_generate_xml_liquibase](http://martinusadyh.web.id/wp-content/gallery/tutorial/contoh_hasil_generate_xml_liquibase.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=153)

Sampai disini simpan-lah hasil tersebut dengan menekan tombol **Save**, dan hasil dari proses diatas akan membentuk sebuah file XML yang dikenali oleh Liquibase seperti dibawah ini :

    
    
    <changeset id="1" author="martinus">
    	<createtable tablename="category">
    		<column type="BIGINT" name="ID">
    			<constraints nullable="false"></constraints>
    		</column>
    		<column type="VARCHAR(20)" name="NAME"></column>
    	</createtable>
    </changeset>
    
    <changeset id="2" author="martinus">
    	<addprimarykey columnnames="ID" constraintname="category_PK" tablename="category"></addprimarykey>
    </changeset>
    
    <changeset id="3" author="martinus">
    	<createtable tablename="item">
    		<column type="BIGINT" name="ID">
    			<constraints nullable="false"></constraints>
    		</column>
    		<column type="BIGINT" name="CATEGORY_ID_FK">
    			<constraints nullable="false"></constraints>
    		</column>
    		<column type="VARCHAR(20)" name="NAME">
    			<constraints nullable="false"></constraints>
    		</column>
    		<column type="LONGVARCHAR(65535)" name="DESCRIPTION"></column>
    	</createtable>
    </changeset>
    
    <changeset id="4" author="martinus">
    	<addprimarykey columnnames="ID" constraintname="item_PK" tablename="item"></addprimarykey>
    </changeset>
    
    <changeset id="5" author="martinus">
    	<addforeignkeyconstraint basecolumnnames="CATEGORY_ID_FK" basetablename="item" constraintname="FK317B13E61327CF" referencedcolumnnames="ID" referencedtablename="category"></addforeignkeyconstraint>
    </changeset>
    



Sampai disini proses yang kita lakukan adalah tinggal mengecek sekali lagi, apakah konfigurasi diatas sudah benar-benar cocok atau tidak. Jika sudah merasa siap, maka kita bisa langsung menambahkan-nya kedalam project kita :) Bagaimana, mudah bukan ? Mimpi buruk menulis file xml satu persatu sudah hilang sekarang :)

Sebenarnya inti dari tulisan ini hanya ingin menunjukkan ternyata ada tool opensource yang dapat kita gunakan untuk melakukan konfigurasi XML secara otomatis saja, karena ketika saya mencoba mencari plugin / generator untuk pembuatan file XML Liquibase ini tidak pernah menunjukkan hasil yang menggembirakan. :)

**Link-link terkait :**




  1. [Liquibase Library](http://www.liquibase.org/)


  2. [SQL Power Architect](http://www.sqlpower.ca/page/architect)


