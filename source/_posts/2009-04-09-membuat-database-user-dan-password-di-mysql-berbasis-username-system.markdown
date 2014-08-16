---
comments: true
date: 2009-04-09 16:31:52+00:00
layout: post
slug: membuat-database-user-dan-password-di-mysql-berbasis-username-system
title: Membuat DataBase, User dan Password di MySQL Berbasis Username System
wordpress_id: 52
categories:
- DataBase
- OpenSolaris
- Shell Script
- Slackware
tags:
- cara membuat database dengan mysql
- cara membuat database MysQl
- membuat database dengan mysql
---

Sore tadi waktu ngelihat milis tanya-jawab@linux.or.id, ada pertanyaan dari om [Dewa Ehem](http://ffaradyc.blogsome.com/) tentang bagaimana sih cara membuat database, user dan password sekaligus berbasis pada user yang terdaftar pada mesin linux kita.  Nah dibawah ini pertanyaan yang dikirim oleh om [Dewa Ehem](http://ffaradyc.blogsome.com/) ke milis tanya-jawab@linux.or.id


> 
From: "Funny Farady Coastera"
To: tanya-jawab@linux.or.id
Date: Thu, 9 Apr 2009 16:35:55 +0700
Subject: [tanya-jawab] mengatur privilege user mysql secara masal

Assalamu'alaikum Wr. Wb
Kemarin-kemarin saya sudah pernah nanyain cara membuat user secara masal
menggunakan adduser, sekarang saya mau ngelanjutin pertanyaannya, itu juga
kalau boleh. Ada tidak script yang mampu membuat database sesuai dengan nama
usernya, password jg sesuai dengan nama usernya kemudian mempunyai privilege
select, create, insert, edit, khusus untuk database tersebut (satu user satu
database)

Mohon kalau ada scriptnya, bisa di sharing.. guna pembelajaran bersama.
NB, via console yah.. Bisa pake python, perl atau yang lainnya.. sangat d
mohon bantuannya.
BTW, kalau thread ini masuk kategori programming mohon di pindah

Wassalamu'alaikum Wr. Wb



<!-- more -->
Nah gara-gara pertanyaan tersebut, akhirnya jadi iseng-iseng deh ngebuat shell scriptnya :D Dan hasil dari pertanyaan yang diajukan dari om [Dewa Ehem](http://ffaradyc.blogsome.com/) adalah sebagai berikut :

``` sh mysql_gen_by_user.sh https://gist.github.com/martinusadyh/7617845.js

#!/bin/sh

# Variable declaration
MYSQL_ROOT_USER=root
MYSQL_ROOT_PASSWD=admin
HOME_DIR=/export/home
TMP_FILE=/tmp/LIST_OF_USER.txt
SQL_FILE=/tmp/SQL_FILE.sql

# Function declaration
getListOfUser() {
  cut -d " " -f2 $TMP_FILE | sort | cut -d " " -f1
}

# List available user in home dir
ls $HOME_DIR > $TMP_FILE

for user in $(getListOfUser) ; do
  echo "Creating database and db user base on " $user

  # Creating database with $user
  echo "create database $user;" >> $SQL_FILE

  # Create user first
  echo "CREATE USER '$user'@'localhost' IDENTIFIED BY '$user';" >> $SQL_FILE

  # Give permission to this $user
  echo "GRANT SELECT, INSERT, UPDATE, DELETE ON $user.* TO '$user'@'localhost';" >> $SQL_FILE
done

# Connecting to MySQL then insert to database
mysql -u $MYSQL_ROOT_USER -p$MYSQL_ROOT_PASSWD < $SQL_FILE
echo "Deleting temporary file"
rm -rf $TMP_FILE
rm -rf $SQL_FILE
echo "Creating MySQL User based on user home done. "

```

Penjelasan kode diatas adalah sebagai berikut :




  1. 
Pada baris ke 4-5 kita pertama-tama mendefinisikan dahulu user dan password yang mempunyai akses full pada database MySQL. Kemudian pada baris berikutnya yaitu pada baris 6 kita mendefinisikan direktori **/home** sebagai target untuk mengetahui jumlah user yang terdaftar pada sistem kita :)



  2. 
Nah pada baris 7 dan 8 kita menggunakan 2 buah textfile sebagai file temporary yang berfungsi untuk menampung seluruh nama user yang terdaftar pada sistem dan perintah SQL untuk tiap-tiap username tersebut.



  3. 
Kemudian pada baris 11-13, kita buat 1 buah fungsi yang akan membaca nilai variabel **$TMP_FILE** yang mempunyai nilai **/tmp/LIST_OF_USER.txt**. Sedangkan fungsi ini akan digunakan pada perulangan yang terjadi pada baris 18-29.



  4. 
Pada baris 16, kita akan mencoba melihat ada berapa user yang terdapat di dalam direktori **/home** dan menuliskan hasilnya pada file **/tmp/LIST_OF_USER.txt** melalui variabel **$TMP_FILE**



  5. 
Pada baris 18-29 ini adalah proses intinya yaitu pertama-tama kita akan membaca seluruh daftar user yang sudah disimpan pada file **/tmp/LIST_OF_USER.txt** melalui fungsi **getListOfUser** dan menampung hasil pembacaan tersebut pada variabel **user**. Semua proses ini dapat dilihat pada baris ke 18, setelah kita mendapatkan nilai **$user**, kita akan menuliskan perintah SQL untuk membuat user di MySQL pada sebuah file yaitu **/tmp/SQL_FILE.sql**. Pada baris 22-28 ini adalah perintah di MySQL untuk membuat database, user dan memberi hak akses **SELECT, INSERT, UPDATE dan DELETE** di database.



  6. 
Setelah selesai membuat sebuah file, sekarang mari kita coba membuat database dan user pada MySQL sesuai dengan user yang terdaftar pada sistem. Caranya yaitu pada waktu login ke MySQL kita kirimkan juga file yang telah kita buat pada baris 18-29, agar ketika proses login kita tidak disuguhi **prompt password** maka gabungkan nilai password pada opsi -p ketika login dan proses ini dapat dilihat pada baris ke 32



  7. 
Setelah semua proses selesai, sebaiknya kita bersihkan dulu file-file temporary yang sudah dibuat. Dan ini bisa dilihat pada baris 34-35 kemudian beritahu user bahwa proses telah selesai :)




Ok semua prosedur dan script sepertinya sudah selesai, sekarang mari kita coba script diatas :) Sebelum mencoba script diatas, mari kita cek dulu bahwa kita belum mempunyai database berdasarkan nama user. Caranya adalah seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/Latihan/shellScript]$ mysql -u root -p
    Enter password:
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 53
    Server version: 5.0.67 Source distribution
    
    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
    
    mysql> show databases;
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | test               |
    +--------------------+
    3 rows in set (0.00 sec)
    
    mysql> quit
    Bye
    [martin@opensolarisbox:~/Latihan/shellScript]$
    



Ok kita belum punya database berdasarkan username, sekarang beri hak eksekusi pada script yang telah kita buat diatas dengan perintah **chmod +x** kemudian jalankan scriptnya seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/Latihan/shellScript]$ chmod +x mysqlUser.sh
    [martin@opensolarisbox:~/Latihan/shellScript]$ ./mysqlUser.sh
    Creating database and db user base on  dewa
    Creating database and db user base on  ehem
    Creating database and db user base on  martin
    Deleting temporary file
    Creating MySQL User based on user home done.
    [martin@opensolarisbox:~/Latihan/shellScript]$
    



Sekarang mari kita cek pada MySQL apakah database dan user sudah dibuat sesuai dengan harapan kita ?

    
    
    [martin@opensolarisbox:~/Latihan/shellScript]$ mysql -u root -p
    Enter password:
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 55
    Server version: 5.0.67 Source distribution
    
    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
    
    mysql> show databases;
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | dewa               |
    | ehem               |
    | martin             |
    | mysql              |
    | test               |
    +--------------------+
    6 rows in set (0.00 sec)
    
    mysql> show grants for 'dewa'@'localhost';
    +-------------------------------------------------------------------------------------------------------------+
    | Grants for dewa@localhost                                                                                   |
    +-------------------------------------------------------------------------------------------------------------+
    | GRANT USAGE ON *.* TO 'dewa'@'localhost' IDENTIFIED BY PASSWORD '*40494FDF155F3A47EEC1B99D4D4B0CFC56CEDFBE' |
    | GRANT SELECT, INSERT, UPDATE, DELETE ON `dewa`.* TO 'dewa'@'localhost'                                      |
    +-------------------------------------------------------------------------------------------------------------+
    2 rows in set (0.00 sec)
    
    mysql> show grants for 'ehem'@'localhost';
    +-------------------------------------------------------------------------------------------------------------+
    | Grants for ehem@localhost                                                                                   |
    +-------------------------------------------------------------------------------------------------------------+
    | GRANT USAGE ON *.* TO 'ehem'@'localhost' IDENTIFIED BY PASSWORD '*E96BA83EF4FE05623DAA90696D92E551A7B865D6' |
    | GRANT SELECT, INSERT, UPDATE, DELETE ON `ehem`.* TO 'ehem'@'localhost'                                      |
    +-------------------------------------------------------------------------------------------------------------+
    2 rows in set (0.00 sec)
    
    mysql> show grants for 'martin'@'localhost';
    +---------------------------------------------------------------------------------------------------------------+
    | Grants for martin@localhost                                                                                   |
    +---------------------------------------------------------------------------------------------------------------+
    | GRANT USAGE ON *.* TO 'martin'@'localhost' IDENTIFIED BY PASSWORD '*CD4AFD8FF7FC169D64F8F55753F4DFAD49B5D780' |
    | GRANT SELECT, INSERT, UPDATE, DELETE ON `martin`.* TO 'martin'@'localhost'                                    |
    +---------------------------------------------------------------------------------------------------------------+
    2 rows in set (0.00 sec)
    
    mysql> quit
    Bye
    [martin@opensolarisbox:~/Latihan/shellScript]$
    



Dan untuk membuktikannya, mari kita coba login ke MySQL dengan user yang terdaftar pada sistem dan passwordnya sama dengan nama user tersebut seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/Latihan/shellScript]$ mysql -u martin -pmartin
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 56
    Server version: 5.0.67 Source distribution
    
    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
    
    mysql> show databases;
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | martin             |
    | test               |
    +--------------------+
    3 rows in set (0.37 sec)
    
    mysql> quit
    Bye
    [martin@opensolarisbox:~/Latihan/shellScript]$
    



Nah selesai juga akhirnya, dan asyik juga yah :D :)
