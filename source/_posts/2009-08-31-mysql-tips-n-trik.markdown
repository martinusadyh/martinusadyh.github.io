---
comments: true
date: 2009-08-31 04:17:07+00:00
layout: post
slug: mysql-tips-n-trik
title: MySQL Tips n Trik
wordpress_id: 63
categories:
- DataBase
- Java
- NetBeans
- OpenSolaris
- Slackware
tags:
- DataBase
- MySQL
- Server
- Tips dan trik
---

Bagi teman-teman yang sudah sering sekali menggunakan [MySQL](http://www.mysql.com/) sebagai database server-nya mungkin sudah tidak asing lagi dengan beberapa tips dan trik yang ada pada tulisan kali ini :) Tapi kenapa saya menulis ini, karena saya sendiri sering lupa dan membuat saya sering **googling** lagi untuk kasus yang sama :malu: Beberapa perintah atau tips dan trik yang sering membuat saya lupa yaitu :

  * Mengganti Password Root di MySQL
  * Mereset Password Root MySQL
  * Melihat DataBase Engine yang Terinstall
  * Backup Data dengan Menggunakan Perintah `mysqldump`
  * Restore Data Pada MySQL
  * Backup Per Tabel Menggunakan Perintah `SELECT INTO OUTFILE`
  * Insert Data Menggunakan Perintah `LOAD DATA INFILE`
  * Melihat Struktur Tabel di MySQL

<!-- more -->

### Mengganti Password Root di MySQL

Ada kalanya kita merasa bahwa password untuk user **root** [MySQL](http://www.mysql.com/) kita susah untuk di ingat, nah untuk mengganti password *root* tersebut kita dapat menggunakan perintah `mysqladmin -u root -p'password_sekarang' password 'password_baru'` dimana `'password_sekarang'` adalah password user *root* sebelum dirubah dan *'password_baru'* adalah password baru yang ingin digunakan. Dan jika kita menjalankannya dari terminal, maka hasilnya akan seperti tampilan dibawah ini :

    martinus@martinus-laptop:~$ mysqladmin -u root -p'admin' password 'password_baru'
    martinus@martinus-laptop:~$ mysql -u root -ppassword_baru
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 33
    Server version: 5.0.75-0ubuntu10.2 (Ubuntu)

    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.

    mysql>

### Mereset Password Root MySQL

Nah jika pada langkah pertama diatas, kita diasumsikan telah mengetahui password root mysql. Sekarang bagaimana jika kita kelupaan dengan password root mysql tersebut ? Wah merupakan bencana dong ? Hm.. jangan panik dahulu, untuk **mereset password root mysql** langkah pertama yang harus kita lakukan yaitu matikan dahulu service mysqld-nya. Kalau di Slackware, kita bisa gunakan perintah `/etc/rc.d/rc.mysqld stop` dengan menggunakan akses **root** seperti dibawah ini :

    root@martinusadyh:[~]# /etc/rc.d/rc.mysqld stop
    STOPPING server from pid file /var/run/mysql/mysql.pid
    100418 11:38:21  mysqld ended

    root@martinusadyh:[~]#

Untuk mengecek apakah service mysqld masih berjalan atau tidak, sekarang jalankan perintah `ps aux | grep mysqld` dan pastikan tidak ada output mysqld seperti dibawah ini :

    root@martinusadyh:[~]# ps aux | grep mysqld
    root@martinusadyh:[~]#

Sekarang mari jalankan lagi service mysqld dengan menggunakan opsi `--skip-grant-tables` seperti dibawah ini :

    root@martinusadyh:[~]# /usr/bin/mysqld_safe --skip-grant-tables
    nohup: ignoring input and redirecting stderr to stdout
    Starting mysqld daemon with databases from /var/lib/mysql


Bukalah terminal baru dengan menggunakan kombinasi tombol `CTRL+SHIFT+TAB` kemudian login-lah ke mysql dengan menggunakan user root tanpa password seperti dibawah ini :

    martinus@martinusadyh:[/]$ mysql -u root mysql
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 1
    Server version: 5.0.84 Source distribution
    
    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
    
    mysql>

Setelah berhasil login dengan menggunakan user root tanpa password, sekarang **reset-lah password root mysql** dengan menjalankan perintah `update user set password=PASSWORD('_password-baru_') where user='root';` dimana _password-baru_ adalah password baru yang ingin anda ganti seperti dibawah ini :

    mysql> update user set Password=PASSWORD('123') where user='root';
    Query OK, 3 rows affected (0.00 sec)
    Rows matched: 3  Changed: 3  Warnings: 0

Password root mysql berhasil direset, sekarang coba matikan lagi service mysqld-nya dengan menggunakan perintah kill dan jalankan lagi service mysqld-nya secara normal, setelah service mysqld berjalan dengan normal maka coba loginlah dengan menggunakan user root dan password yang telah diganti seperti dibawah ini :

    martinus@martinusadyh:[/]$ mysql -u root -p123
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 1
    Server version: 5.0.84 Source distribution
    
    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
    
    mysql> 

### Melihat DataBase Engine yang Terinstall

Sebelum membuat sebuah tabel yang menggunakan **engine** tertentu, sebaiknya mari kita cek dahulu apakah server [MySQL](http://www.mysql.com/) kita sudah mempunyai dukungan atau belum pada **engine** yang akan kita gunakan. Sedangkan untuk melihat **engine** apa saja yang sudah didukung pada server [MySQL](http://www.mysql.com/), kita dapat menggunakan perintah `show engines\G` seperti dibawah ini :
**Pastikan dahulu bahwa anda sudah login pada server [MySQL](http://www.mysql.com/) anda !!**

    mysql> show engines\g
    +------------+----------+----------------------------------------------------------------+
    | Engine     | Support  | Comment                                                        |
    +------------+----------+----------------------------------------------------------------+
    | MyISAM     | DEFAULT  | Default engine as of MySQL 3.23 with great performance         |
    | MEMORY     | YES      | Hash based, stored in memory, useful for temporary tables      |
    | InnoDB     | YES      | Supports transactions, row-level locking, and foreign keys     |
    | BerkeleyDB | NO       | Supports transactions and page-level locking                   |
    | BLACKHOLE  | YES      | /dev/null storage engine (anything you write to it disappears) |
    | EXAMPLE    | NO       | Example storage engine                                         |
    | ARCHIVE    | YES      | Archive storage engine                                         |
    | CSV        | YES      | CSV storage engine                                             |
    | ndbcluster | DISABLED | Clustered, fault-tolerant, memory-based tables                 |
    | FEDERATED  | DISABLED | Federated MySQL storage engine                                 |
    | MRG_MYISAM | YES      | Collection of identical MyISAM tables                          |
    | ISAM       | NO       | Obsolete storage engine                                        |
    +------------+----------+----------------------------------------------------------------+
    12 rows in set (0.00 sec)
    
    mysql>

### Backup Data dengan Menggunakan Perintah `mysqldump`

Proses backup database merupakan sebuah proses yang sangat penting sekali, maka sebaiknya kita berteman dekat dengan perintah `mysqldump` :) Untuk proses backup ini sendiri ada berbagai cara yaitu :

  * Backup Standart

  Untuk melakukan proses backup standart, kita bisa menggunakan perintah `mysqldump -B nama_database -u root -p > hasil_backup.sql` dimana `-B nama_database` ini adalah nama database yang ingin anda backup. Hasil dari perintah ini adalah kita akan mendapatkan seluruh database schema (struktur table) beserta isinya seperti dibawah ini :

    martinus@martinus-laptop:~$ mysqldump -B latibatis -u root -padmin > cb.sql
    martinus@martinus-laptop:~$ more cb.sql
    --
    -- Current Database: `latibatis`
    --
    
    CREATE DATABASE /*!32312 IF NOT EXISTS*/ `latibatis` /*!40100 DEFAULT CHARACTER SET latin1 */;
    
    USE `latibatis`;
    
    --
    -- Table structure for table `LAT`
    --
    
    DROP TABLE IF EXISTS `LAT`;
    SET @saved_cs_client     = @@character_set_client;
    SET character_set_client = utf8;
    CREATE TABLE `LAT` (
      `id` int(11) NOT NULL auto_increment,
      `item_cd` varchar(15) default NULL,
      `name` varchar(15) default NULL,
      PRIMARY KEY  (`id`),
      UNIQUE KEY `item_cd_2` (`item_cd`),
      KEY `item_cd` (`item_cd`)
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
    SET character_set_client = @saved_cs_client;
    
    --
    -- Dumping data for table `LAT`
    --
    
    LOCK TABLES `LAT` WRITE;
    /*!40000 ALTER TABLE `LAT` DISABLE KEYS */;
    INSERT INTO `LAT` VALUES (1,'003.01','BESI BETON'),(2,'003.02','BESI BAJA'),(3,'003.03','BESI TUA');
    /*!40000 ALTER TABLE `LAT` ENABLE KEYS */;
    UNLOCK TABLES;
    
    --
    --
    Dump completed on 2009-08-28 19:16:48
    martinus@martinus-laptop:~$

  * Backup Schema DataBase-nya saja

  Jika kita ingin hanya struktur tabelnya saja (schema database) nya saja yang dibackup, anda dapat menggunakan perintah `mysqldump -B nama_database -u root -p -d > schema_backup.sql` dimana opsi `-d` adalah opsi untuk mengambil statement `CREATE TABLE` saja. Dan hasilnya adalah seperti dibawah ini :

    martinus@martinus-laptop:~$ mysqldump -B latibatis -u root -padmin -d > schmea_cb.sql
    martinus@martinus-laptop:~$ more schmea_cb.sql
    --
    -- Current Database: `latibatis`
    --
    
    CREATE DATABASE /*!32312 IF NOT EXISTS*/ `latibatis` /*!40100 DEFAULT CHARACTER SET latin1 */;
    
    USE `latibatis`;
    
    --
    -- Table structure for table `LAT`
    --
    
    DROP TABLE IF EXISTS `LAT`;
    SET @saved_cs_client     = @@character_set_client;
    SET character_set_client = utf8;
    CREATE TABLE `LAT` (
      `id` int(11) NOT NULL auto_increment,
      `item_cd` varchar(15) default NULL,
      `name` varchar(15) default NULL,
      PRIMARY KEY  (`id`),
      UNIQUE KEY `item_cd_2` (`item_cd`),
      KEY `item_cd` (`item_cd`)
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
    SET character_set_client = @saved_cs_client;
    
    martinus@martinus-laptop:~$

  * Backup Isi DataBase-nya saja

  Sedangkan kalau kita hanya ingin mengambil isi tabelnya saja, kita bisa menggunakan perintah `mysqldump -B nama_database -u root -p -t > isitable_cb.sql` seperti dibawah ini :

    martinus@martinus-laptop:~$ mysqldump -B latibatis -u root -padmin -t > isitable_cb.sql
    martinus@martinus-laptop:~$ more isitable_cb.sql
    --
    -- Current Database: `latibatis`
    --
    
    CREATE DATABASE /*!32312 IF NOT EXISTS*/ `latibatis` /*!40100 DEFAULT CHARACTER SET latin1 */;
    
    USE `latibatis`;
    
    --
    -- Dumping data for table `LAT`
    --
    
    LOCK TABLES `LAT` WRITE;
    /*!40000 ALTER TABLE `LAT` DISABLE KEYS */;
    INSERT INTO `LAT` VALUES (1,'003.01','BESI BETON'),(2,'003.02','BESI BAJA'),(3,'003.03','BESI TUA');
    /*!40000 ALTER TABLE `LAT` ENABLE KEYS */;
    UNLOCK TABLES;
    -- Dump completed on 2009-08-28 19:30:00
    martinus@martinus-laptop:~$
    

  * Backup Isi DataBase Sesuai Kolom

  Jika kita ingin mengambil isi tabel sesuai kolomnya, kita dapat menambahkan opsi `--complete-insert` pada perintah `mysqldump` menjadi seperti dibawah ini:

    martinus@martinus-laptop:~$ mysqldump -B latibatis -u root -padmin -t --complete-insert > isitable_complete_insert_cb.sql
    martinus@martinus-laptop:~$ more isitable_complete_insert_cb.sql
    --
    -- Current Database: `latibatis`
    --
    
    CREATE DATABASE /*!32312 IF NOT EXISTS*/ `latibatis` /*!40100 DEFAULT CHARACTER SET latin1 */;
    
    USE `latibatis`;
    
    --
    -- Dumping data for table `LAT`
    --
    
    LOCK TABLES `LAT` WRITE;
    /*!40000 ALTER TABLE `LAT` DISABLE KEYS */;
    INSERT INTO `LAT` (`id`, `item_cd`, `name`) VALUES (1,'003.01','BESI BETON'),(2,'003.02','BESI BAJA'),(3,'003.03','BESI TUA');
    /*!40000 ALTER TABLE `LAT` ENABLE KEYS */;
    UNLOCK TABLES;
    
    -- Dump completed on 2009-08-28 20:00:42
    martinus@martinus-laptop:~$

### Restore Data Pada MySQL

Pada tips dan trik nomor 3 diatas, kita sudah belajar bagaimana cara backup database menggunakan perintah `mysqldump`. Nah sekarang setelah mendapatkan hasil backup dari database, maka kita perlu juga untuk melakukan proses `restore`. Sedangkan untuk me-restore hasil backup yang telah dilakukan pada langkah nomor 3 di atas, kita dapat menggunakan perintah seperti dibawah ini :

    martinus@martinus-laptop:~$ mysql -u root -padmin < cb.sql
    martinus@martinus-laptop:~$

### Backup Per Tabel Menggunakan Perintah `SELECT INTO OUTFILE`

Ada kalanya kita hanya ingin membackup tidak 1 database penuh, tetapi hanya pada tabel-tabel tertentu saja. Untuk keperluan ini, kita juga dapat menggunakan perintah `select * from tabel_name into outfile '/path/file/backup.sql';` seperti contoh dibawah ini:

    mysql> select * from LAT into outfile '/tmp/DATA_LAT.sql' FIELDS TERMINATED BY ',';
    Query OK, 3 rows affected (0.00 sec)
    
    mysql> quit;
    martinus@martinus-laptop:~$ more /tmp/DATA_LAT.sql
    1,003.01,BESI BETON
    2,003.02,BESI BAJA
    3,003.03,BESI TUA

### Insert Data Per Tabel Menggunakan Perintah `LOAD DATA INFILE`

Sedangkan untuk menginsert data, kita juga dapat menggunakan perintah `LOAD DATA INFILE` seperti dibawah ini :

    mysql> LOAD DATA INFILE '/tmp/DATA_LAT.sql' INTO TABLE LAT FIELDS TERMINATED BY ',';
    mysql> select * from LAT;
    +----+---------+------------+
    | id | item_cd | name       |
    +----+---------+------------+
    |  1 | 003.01  | BESI BETON |
    |  2 | 003.02  | BESI BAJA  |
    |  3 | 003.03  | BESI TUA   |
    +----+---------+------------+
    3 rows in set (0.00 sec)
    
    mysql>

### Melihat Struktur Tabel di MySQL

Untuk melihat struktur tabel yang telah kita buat pada [MySQL](http://www.mysql.com/), kita dapat menggunakan perintah `show create table _table_name_\G` dimana `table_name` adalah nama tabel yang ingin dilihat. Sedangkan contohnya adalah sebagai berikut :

    mysql> show create table LAT\G
    *************************** 1. row ***************************
           Table: LAT
    CREATE TABLE `LAT` (
      `id` int(11) NOT NULL auto_increment,
      `item_cd` varchar(15) default NULL,
      `name` varchar(15) default NULL,
      PRIMARY KEY  (`id`),
      UNIQUE KEY `item_cd_2` (`item_cd`),
      KEY `item_cd` (`item_cd`)
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1
    1 row in set (0.00 sec)
    
    mysql>

Langkah-langkah yang ditulis disini memang sangat sederhana dan mungkin masih ada cara yang lebih canggih dan lebih elegan lagi :D Untuk lebih jelas dan lebih detailnya, halaman manual [MySQL](http://www.mysql.com/) sangat-sangat dianjurkan untuk selalu dibaca :D :) Nah jika sudah menemukan cara yang lebih elegan, mungkin ada ketertarikan untuk membuat semuanya menjadi **sedikit** lebih otomatis dengan bantuan berbagai macam script seperti disini dan disana :) Nah klo sudah membuat script otomatis, boleh donk di bagi-bagi disini :malu:

**Link-link terkait:**

- [Halaman manual MySQL](http://dev.mysql.com/doc/mysql/en/)
- [membuat-database-user-dan-password-di-mysql-berbasis-username-system](http://martinusadyh.web.id/2009/04/09/membuat-database-user-dan-password-di-mysql-berbasis-username-system/)
- [Backup MySQL](http://endy.artivisi.com/blog/lain/backup-mysql/)