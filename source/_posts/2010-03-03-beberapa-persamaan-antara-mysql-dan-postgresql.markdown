---
comments: true
date: 2010-03-03 19:20:48+00:00
layout: post
slug: beberapa-persamaan-antara-mysql-dan-postgresql
title: Beberapa Persamaan Antara MySQL dan PostgreSQL
wordpress_id: 225
categories:
- DataBase
- Java
- NetBeans
- Slackware
tags:
- DataBase
- MySQL
- PostgreSQL
- Server
- Slackware
---

Buat teman-teman yang sudah pernah menggunakan [](http://mysql.com)MySQL dan sedang menjajaki [PostgreSQL](http://www.postgresql.org/), mungkin tulisan ini bisa dijadikan sebagai **shortcut** untuk segera mulai menggunakan [PostgreSQL](http://www.postgresql.org/). Karena tulisan ini merupakan pengalaman saya dalam menggunakan [PostgreSQL](http://www.postgresql.org/) selama beberapa hari terakhir ini :) , dan jika teman-teman mencari bagaimana cara melakukan konfigurasi [PostgreSQL](http://www.postgresql.org/) sebagai server mungkin tidak akan menemukan-nya dalam tulisan kali ini karena tulisan kali ini lebih ditujukan dalam proses **development** yang **just work** saja :D Maklum ini juga baru mulai **belajar**  bagaimana menggunakan [PostgreSQL](http://www.postgresql.org/) yang baik dan benar :)

Nah dari hasil **oprek-oprek** beberapa hari terakhir ini, agar kita dapat mulai menggunakan [PostgreSQL](http://www.postgresql.org/) dalam proses **development** kita maka pengetahuan dasar yang harus kita ketahui dalam mengoperasikan [PostgreSQL](http://www.postgresql.org/) adalah kurang lebih seperti berikut :




  1. Membuat DataBase


  2. Membuat User


  3. Proses Login


  4. Melihat Informasi Tabel


  5. DataBase Backup


  6. DataBase Restore



Sedangkan pada tulisan kali ini akan dibahas persamaan-nya antara [](http://mysql.com)MySQL dan [PostgreSQL](http://www.postgresql.org/) dengan maksud dan tujuan agar teman-teman yang masih **mysql mode** bisa cepat menggunakan [PostgreSQL](http://www.postgresql.org/) sebagai database server-nya (seperti saya :D :) ), dan Sistem Operasi yang digunakan pada tulisan kali ini yaitu Slackware dan saya rasa tidak ada perbedaan mencolok dengan distribusi GNU/Linux yang lain :) Ok kalau begitu, sekarang mari kita lihat bagaimana cara  Membuat DataBase pada [](http://mysql.com)MySQL dan [PostgreSQL](http://www.postgresql.org/) :)
<!-- more -->




  1. 
**Membuat DataBase**
Untuk mulai bermain-main dengan DataBase, maka hal pertama yang perlu kita lakukan yaitu adalah membuat DataBase itu sendiri. Sekarang mari kita bahas pembuatan DataBase pada [](http://mysql.com)MySQL dan [PostgreSQL](http://www.postgresql.org/) yang kurang lebih seperti dibawah ini :


    1. **Cara Pada MySQL**
Buat teman-teman yang sudah **_familiar_** dengan [](http://mysql.com)MySQL mungkin sudah tidak asing lagi bagaimana cara membuat sebuah database pada [](http://mysql.com)MySQL, yups cara-nya adalah dengan menggunakan perintah **create database _[databasename]_** (sebelum menjalankan perintah **create database** loginlah dahulu pada [](http://mysql.com)MySQL Server) seperti dibawah ini :
[plain]
martinus@martinusadyh:[~]$ mysql -u root -padmin
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 1
Server version: 5.0.84 Source distribution

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database martindb;
Query OK, 1 row affected (0.07 sec)

mysql>
[/plain]
**Note: Nama DataBase yang digunakan adalah martindb**

Dan pada [](http://mysql.com)MySQL kita juga bisa melihat DataBase yang telah dibuat dengan mengetikkan perintah **show databases** seperti perintah dibawah ini :
[plain]
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema | 
| martindb           | 
| ........           | 
| ........           | 
+--------------------+
4 rows in set (0.21 sec)

mysql> 
[/plain]



    2. **Cara Pada PostgreSQL**
Nah sekarang bagaimana kalau di [PostgreSQL](http://www.postgresql.org/) ? Untuk membuat sebuah DataBase pada [PostgreSQL](http://www.postgresql.org/) rubah-lah akses anda menjadi **root** dahulu dengan mengetikkan perintah **su -** setelah itu baru ganti hak akses menjadi **user postgres** dengan mengetikkan perintah **su - postgres** seperti dibawah ini :
[plain]
martinus@martinusadyh:[~]$ su -
Password: 

Things are more like they used to be than they are new.

root@martinusadyh:[~]# su - postgres

You do not have mail.

postgres@martinusadyh:[~]$
[/plain]

Setelah menggunakan akses **user postgres**, sekarang buat-lah sebuah DataBase dengan nama **martindb** dengan mengetikkan perintah **createdb martindb** seperti dibawah ini :
[plain]
postgres@martinusadyh:[~]$ createdb martindb
postgres@martinusadyh:[~]$ 
[/plain]

Dan kita juga bisa melihat database-nya dengan mengetikkan perintah **psql -l** seperti perintah dibawah ini :
[plain]
postgres@martinusadyh:[~]$ psql -l
                              List of databases
   Name    |  Owner   | Encoding | Collation | Ctype |   Access privileges   
-----------+----------+----------+-----------+-------+-----------------------
 martindb  | postgres | LATIN1   | C         | en_US | 
 postgres  | postgres | LATIN1   | C         | en_US | 
 template0 | postgres | LATIN1   | C         | en_US | =c/postgres
                                                     : postgres=CTc/postgres
 template1 | postgres | LATIN1   | C         | en_US | =c/postgres
                                                     : postgres=CTc/postgres
(4 rows)

postgres@martinusadyh:[~]$ 
[/plain]

Dua langkah yang dilakukan untuk [PostgreSQL](http://www.postgresql.org/) diatas **(perintah createdb dan psql -l)**, sepenuh-nya dijalankan dari **Linux Prompt** dengan menggunakan **user postgres**. Selain itu [PostgreSQL](http://www.postgresql.org/) mempunyai beberapa metode lagi untuk kebutuhan diatas, dan semua-nya itu bisa dibaca pada [halaman manual PostgreSQL](http://www.postgresql.org/docs/8.4/interactive/index.html) :) :D



Bagaimana teman-teman, tidak begitu sulit kan ? Kalau tidak, mari kita lanjut ke tahap selanjut-nya :)




  2. 
**Membuat User**
Proses pembuatan DataBase pada [](http://mysql.com)MySQL dan [PostgreSQL](http://www.postgresql.org/) sudah berhasil kita lakukan, sekarang bagaimana cara membuat user dan memberi ijin user yang akan kita buat pada DataBase yang sudah dibuat sebelum-nya ? 


    1. **Cara Pada MySQL**
Untuk membuat sebuah user dengan nama **belajar** dan password **java** pada [](http://mysql.com)MySQL yang mempunyai akses penuh pada DataBase **martindb** yang sudah dibuat pada langkah sebelumnya, jalankan perintah dibawah ini pada **mysql>** prompt :
[plain]
mysql> grant all on martindb.* to 'belajar'@'localhost' identified by 'java';
Query OK, 0 rows affected (0.20 sec)

mysql> 
[/plain]



    2. **Cara Pada PostgreSQL**
Sedangkan untuk membuat sebuah user dengan nama **belajar** dan password **java** pada [PostgreSQL](http://www.postgresql.org/) yang mempunyai akses penuh pada DataBase **martindb** yang sudah dibuat pada langkah sebelumnya, jalankan perintah dibawah ini pada **Linux Prompt** dengan menggunakan akses **user postgres** :
[plain]
postgres@martinusadyh:[~]$ createuser -D -P belajar
Enter password for new role: 
Enter it again: 
Shall the new role be a superuser? (y/n) y
postgres@martinusadyh:[~]$ 
[/plain]
**Note : Opsi -D artinya no create db, -P menampilkan prompt untuk mengisi password. Isikan java pada pertanyaan "Enter password for new role:" dan "Enter it again:" **

Setelah selesai membuat sebuah user, sekarang coba loginlah pada [PostgreSQL](http://www.postgresql.org/) menggunakan user **postgres** dengan mengetikkan **psql -U postgres** dan tambahkan akses **GRANT ALL PRIVILEGES** untuk user **belajar** ke database **martindb** seperti dibawah ini :
[plain]
postgres@martinusadyh:[~]$ psql -U postgres
psql (8.4.2)
Type "help" for help.

postgres=# grant all privileges on database martindb to belajar;
GRANT
postgres=# 
[/plain]



Fyuh.... akhirnya pembuatan user dan pemberian akses ke database selesai juga, sekarang mari kita testing dengan login menggunakan user yang sudah kita buat :)




  3. 
**Proses Login**
Sekarang mari kita testing apakah user yang sudah dibuat pada langkah kedua diatas sudah berjalan dengan semesti-nya atau belum :)


    1. **Cara Pada MySQL**
Untuk login pada [](http://mysql.com)MySQL dengan menggunakan user **belajar** dan pasword **java** kita bisa mengetikkan perintah **mysql -u _[username]_ -p_Password_ _[databasename]_** seperti dibawah ini :
[plain]
martinus@martinusadyh:[~]$ mysql -u belajar -pjava martindb 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 3
Server version: 5.0.84 Source distribution

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema | 
| martindb           | 
| test               | 
+--------------------+
3 rows in set (0.00 sec)

mysql> 
[/plain]



    2. **Cara Pada PostgreSQL**
Sedangkan cara pada [PostgreSQL](http://www.postgresql.org/)-nya adalah mengetikkan perintah **psql -U _[username]_ -W -d _[databasename]_** seperti dibawah ini :
[plain]
martinus@martinusadyh:[~]$ psql -U belajar -W -d martindb
Password for user belajar: 
psql (8.4.2)
Type "help" for help.

martindb=# \l
                              List of databases
   Name    |  Owner   | Encoding | Collation | Ctype |   Access privileges   
-----------+----------+----------+-----------+-------+-----------------------
 martindb  | postgres | LATIN1   | C         | en_US | =Tc/postgres
                                                     : postgres=CTc/postgres
                                                     : belajar=CTc/postgres
 postgres  | postgres | LATIN1   | C         | en_US | 
 template0 | postgres | LATIN1   | C         | en_US | =c/postgres
                                                     : postgres=CTc/postgres
 template1 | postgres | LATIN1   | C         | en_US | =c/postgres
                                                     : postgres=CTc/postgres
(4 rows)

martindb=# 
[/plain]



Horee.... kita sudah bisa menggunakan [PostgreSQL](http://www.postgresql.org/) layak-nya kita menggunakan [](http://mysql.com)MySQL, sekarang yuuuk mari kita **explore** fitur-fitur yang lain :) ;)




  4. 
**Melihat Informasi Tabel**
Karena DataBase kita masih kosong, sekarang buatlah dahulu sebuah tabel dengan nama tabel **pengunjung** dan kolomnya yaitu **nama** baik pada [](http://mysql.com)MySQL dan [PostgreSQL](http://www.postgresql.org/) dengan mengetikkan perintah **create table pengunjung(nama varchar(11));** seperti dibawah ini :
**MySQL**
[plain]
mysql> create table pengunjung(nama varchar(11));
Query OK, 0 rows affected (0.00 sec)

mysql>
[/plain]
**PostgreSQL**
[plain]
martindb=# create table pengunjung(nama varchar(11));
CREATE TABLE
martindb=# 
[/plain]

Setelah membuat sebuah tabel pada [](http://mysql.com)MySQL maupun [PostgreSQL](http://www.postgresql.org/), sekarang mari kita lihat bagaimana menampilkan informasi yang berkaitan dengan tabel dari kedua database :


    1. **Cara Pada MySQL**
Untuk melihat informasi tabel pada [](http://mysql.com)MySQL kita bisa menggunakan beberapa perintah, dan perintah-perintah yang saya tahu :D yaitu **show tables, show create table _[table-name]_ dan desc _[table-name]_** yang tampilan-nya kurang lebih seperti dibawah ini :
[plain]
mysql> show tables;
+--------------------+
| Tables_in_martindb |
+--------------------+
| pengunjung         | 
+--------------------+
1 row in set (0.00 sec)

mysql> show create table pengunjung;
+------------+------------------------------------------------------------------------------------------------------+
| Table      | Create Table                                                                                         |
+------------+------------------------------------------------------------------------------------------------------+
| pengunjung | CREATE TABLE `pengunjung` (
  `nama` varchar(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 | 
+------------+------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> desc pengunjung;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| nama  | varchar(11) | YES  |     | NULL    |       | 
+-------+-------------+------+-----+---------+-------+
1 row in set (0.00 sec)

mysql>
[/plain]



    2. **Cara Pada PostgreSQL**
Sedangkan pada [PostgreSQL](http://www.postgresql.org/), seperti-nya tidak ada perintah yang sepadan dengan perintah **show create table _[table-name]_** yang terdapat pada [](http://mysql.com)MySQL. Tetapi [PostgreSQL](http://www.postgresql.org/) mempunyai beberapa perintah yang sama untuk menampilkan informasi tabel yaitu **\d (sama dengan perintah show tables), \d _[table-name]_ dan \dt _[table-name]_** yang  tampilan-nya kurang lebih seperti dibawah ini :
[plain]
martindb=# \d
           List of relations
 Schema |    Name    | Type  |  Owner  
--------+------------+-------+---------
 public | pengunjung | table | belajar
(1 row)

martindb=# \d pengunjung
         Table "public.pengunjung"
 Column |         Type          | Modifiers 
--------+-----------------------+-----------
 nama   | character varying(11) | 

martindb=# \dt pengunjung
           List of relations
 Schema |    Name    | Type  |  Owner  
--------+------------+-------+---------
 public | pengunjung | table | belajar
(1 row)

martindb=#
[/plain]



Hehehe... :D saya belum bisa menjelaskan banyak tentang tabel, saya masih perlu baca [primbon](http://www.postgresql.org/docs/8.4/interactive/index.html) saya dulu :)




  5. 
**DataBase Backup**
Nah bagaimana jika kita tiba-tiba ingin melakukan proses backup pada ke dua DataBase tersebut ? Ok, cara backup-nya sebenarnya tidak jauh berbeda yaitu :


    1. **Cara Pada MySQL**
Untuk melakukan proses backup pada [](http://mysql.com)MySQL kita bisa menggunakan perintah **mysqldump -B _[nama-database]_ -u _[user-name]_ -p_[password]_ > _[file-backup.sql]_** seperti perintah dibawah ini :
[plain]
martinus@martinusadyh:[~]$ mysqldump -B martindb -u belajar -pjava > martindb-mysql.sql
martinus@martinusadyh:[~]$
[/plain]
Sedangkan hasil **dump** yang dihasilkan dari perintah diatas adalah seperti dibawah ini :

    
    
    -- MySQL dump 10.11
    --
    -- Host: localhost    Database: martindb
    -- ------------------------------------------------------
    -- Server version	5.0.84
    
    /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
    /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
    /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
    /*!40101 SET NAMES utf8 */;
    /*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
    /*!40103 SET TIME_ZONE='+00:00' */;
    /*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
    /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
    /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
    /*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
    
    --
    -- Current Database: `martindb`
    --
    
    CREATE DATABASE /*!32312 IF NOT EXISTS*/ `martindb` /*!40100 DEFAULT CHARACTER SET latin1 */;
    
    USE `martindb`;
    
    --
    -- Table structure for table `pengunjung`
    --
    
    DROP TABLE IF EXISTS `pengunjung`;
    /*!40101 SET @saved_cs_client     = @@character_set_client */;
    /*!40101 SET character_set_client = utf8 */;
    CREATE TABLE `pengunjung` (
      `nama` varchar(11) default NULL
    ) ENGINE=MyISAM DEFAULT CHARSET=latin1;
    /*!40101 SET character_set_client = @saved_cs_client */;
    
    --
    -- Dumping data for table `pengunjung`
    --
    
    LOCK TABLES `pengunjung` WRITE;
    /*!40000 ALTER TABLE `pengunjung` DISABLE KEYS */;
    /*!40000 ALTER TABLE `pengunjung` ENABLE KEYS */;
    UNLOCK TABLES;
    /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
    
    /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
    /*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
    /*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
    /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
    /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
    /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
    /*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
    
    -- Dump completed on 2010-03-04  1:45:41
    





    2. **Cara Pada PostgreSQL**
Sedangkan pada [PostgreSQL](http://www.postgresql.org/) kita bisa menggunakan perintah **pg_dump -U _[user-name]_ -W _[nama-database]_ > _[file-backup.sql]_** seperti dibawah ini :
[plain]
martinus@martinusadyh:[~]$ pg_dump -U belajar -W martindb > martindb-postgresql.sql
Password: 
martinus@martinusadyh:[~]$
[/plain]
**Note: Proses dump dengan perintah ini, tidak serta merta memberi statement create database seperti pada "MySQL". Jadi sebaiknya berhati-hati**
Dan hasil **dump** yang dihasilkan dari perintah diatas adalah seperti dibawah ini :

    
    
    --
    -- PostgreSQL database dump
    --
    
    SET statement_timeout = 0;
    SET client_encoding = 'LATIN1';
    SET standard_conforming_strings = off;
    SET check_function_bodies = false;
    SET client_min_messages = warning;
    SET escape_string_warning = off;
    
    SET search_path = public, pg_catalog;
    
    SET default_tablespace = '';
    
    SET default_with_oids = false;
    
    --
    -- Name: pengunjung; Type: TABLE; Schema: public; Owner: belajar; Tablespace: 
    --
    
    CREATE TABLE pengunjung (
        nama character varying(11)
    );
    
    
    ALTER TABLE public.pengunjung OWNER TO belajar;
    
    --
    -- Data for Name: pengunjung; Type: TABLE DATA; Schema: public; Owner: belajar
    --
    
    COPY pengunjung (nama) FROM stdin;
    \.
    
    
    --
    -- Name: public; Type: ACL; Schema: -; Owner: postgres
    --
    
    REVOKE ALL ON SCHEMA public FROM PUBLIC;
    REVOKE ALL ON SCHEMA public FROM postgres;
    GRANT ALL ON SCHEMA public TO postgres;
    GRANT ALL ON SCHEMA public TO PUBLIC;
    
    
    --
    -- PostgreSQL database dump complete
    --
    





Sampai proses ini, kita sudah mempunyai **sedikit bekal** yang cukup lah untuk mulai melangkah lebih dalam ke [PostgreSQL](http://www.postgresql.org/) :) , setelah kita mengetahui bagaimana proses **backup** maka selanjutnya kita akan coba melakukan proses restore data yang sudah berhasil kita backup :)




  6. 
**DataBase Restore**
Untuk cara **restore** file hasil **dump** antara [](http://mysql.com)MySQL dan [PostgreSQL](http://www.postgresql.org/) tidak jauh berbda, sedangkan untuk **syntax**-nya yaitu seperti dibawah ini :


    1. **Cara Pada MySQL**
Kalau kita mempunyai file backup seperti diatas, dan jika DataBase **martindb** belum dibuat pada server [](http://mysql.com)MySQL. Maka kita bisa dengan aman menjalankan perintah seperti dibawah ini dan membiarkan [](http://mysql.com)MySQL membuatkan DataBase **martindb** lagi secara otomatis :) (berdasarkan file **martindb-mysql.sql**) :
[plain]
martinus@martinusadyh:[~]$ mysql -u belajar -pjava < martindb-mysql.sql 
martinus@martinusadyh:[~]$ mysql -u belajar -pjava martindb;
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 7
Server version: 5.0.84 Source distribution

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show tables;
+--------------------+
| Tables_in_martindb |
+--------------------+
| pengunjung         | 
+--------------------+
1 row in set (0.00 sec)

mysql>
[/plain]



    2. **Cara Pada PostgreSQL**
Nah yang berbahaya di [PostgreSQL](http://www.postgresql.org/) adalah jika kita mempunyai backup seperti diatas, dan DataBase **martindb** terhapus. Maka kita tidak bisa secara langsung menjalankan perintah **psql -U _[username]_ -W -d _[database-name]_ < _[backup-filename.sql]_** secara langsung seperti yang dilakukan oleh [](http://mysql.com)MySQL. Solusi-nya yaitu, sebelum menjalankan perintah **psql -U _[username]_ -W -d _[database-name]_ < _[backup-filename.sql]_**, lakukan dulu langkah-langkah Membuat DataBase dan beri **PRIVILEGES** lagi pada user **belajar** ke DataBase yang baru dibuat. Nah setelah semua-nya selesai, baru kita bisa dengan aman menjalankan perintah **psql -U _[username]_ -W -d _[database-name]_ < _[backup-filename.sql]_** seperti dibawah ini :
[plain]
martinus@martinusadyh:[~]$ psql -U belajar -W -d martindb < martindb-postgresql.sql 
Password for user belajar: 
SET
SET
SET
SET
SET
SET
SET
SET
SET
CREATE TABLE
ALTER TABLE
REVOKE
REVOKE
GRANT
GRANT
martinus@martinusadyh:[~]$ psql -U belajar -W -d martindb
Password for user belajar: 
psql (8.4.2)
Type "help" for help.

martindb=# \d
           List of relations
 Schema |    Name    | Type  |  Owner  
--------+------------+-------+---------
 public | pengunjung | table | belajar
(1 row)

martindb=# select * from pengunjung;
 nama 
------
(0 rows)

martindb=# 
[/plain]



Hm.. saya belum menemukan, apakah bisa hasil **dump** dari [PostgreSQL](http://www.postgresql.org/) bisa seperti hasil **dump** milik [](http://mysql.com)MySQL, atau saya yang kurang baca [primbon](http://www.postgresql.org/docs/8.4/interactive/index.html) kali ya :D




Nah bagaimana teman-teman, sudah mulai ada gambaran tentang [PostgreSQL](http://www.postgresql.org/) ?? Bagaimana, ingin menggunakan [PostgreSQL](http://www.postgresql.org/) sebagai DataBase Server utama di tempat teman-teman ? :D Jika iya, syukurlah :) mari kita sama-sama **ngoprek** [PostgreSQL](http://www.postgresql.org/) :D :) dan untuk teman-teman yang merasa kurang dengan tulisan ini saya mohon maaf. Karena tujuan dari tulisan ini sebenarnya adalah agar teman-teman bisa langsung menggunakan [PostgreSQL](http://www.postgresql.org/) tanpa perlu bingung-bingung baca [primbon](http://www.postgresql.org/docs/8.4/interactive/index.html)-nya :) Dan akhir kata, jangan lupa untuk selalu membaca [Halaman Manual PostgreSQL 8.4 (Bahasa Inggris)](http://www.postgresql.org/docs/8.4/interactive/index.html) yang membahas secara mendetail tentang konfigurasi dan perintah-perintah dasar [PostgreSQL](http://www.postgresql.org/) yah, dan dibawah tulisan ini mungkin ada beberapa link yang bisa jadi bahan referensi buat teman-teman :)

**Link-link terkait :**




  * [Installing PostgreSQL 8.4.2 on Slackware 13.0](http://martinusadyh.web.id/2010/02/28/installing-postgresql-8-4-2-on-slackware-13-0/)


  * [Halaman Manual PostgreSQL 8.4 (Bahasa Inggris)](http://www.postgresql.org/docs/8.4/interactive/index.html)


  * [MySQL and PostgreSQL Command Equivalents](http://blog.endpoint.com/2009/12/mysql-and-postgres-command-equivalents.html)


  * [ 15 Practical PostgreSQL DataBase Administration Commands](http://www.thegeekstuff.com/2009/04/15-practical-postgresql-database-adminstration-commands/)


  * [](http://mysql.com)MySQL


  * [PostgreSQL](http://www.postgresql.org/)


  * [MySQL Tips dan Trik](http://martinusadyh.web.id/2009/08/31/mysql-tips-n-trik/)


  * [Tips dan trik DataBase Lain-nya](http://martinusadyh.web.id/category/database/)


