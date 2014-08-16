---
comments: true
date: 2010-02-24 00:28:19+00:00
layout: post
slug: monitoring-mysql-database-server-with-mysql-monitor
title: Monitoring MySQL DataBase Server with MySQL Monitor
wordpress_id: 125
categories:
- CentOS
- DataBase
tags:
- CentOS
- DataBase
- Java
- MySQL
- NetBeans
---

Beberapa minggu terakhir ini, saya kebagian tugas melakukan installasi [MySQL Enterprise Server](http://mysql.com/trials/) beserta peralatan pendukung untuk melakukan monitoring-nya sekalian :) Secara kebetulan juga di minggu yang sama, di milis [netbeans-indonesia@yahoogroups.com](mailto:netbeans-indonesia@yahoogroups.com) ada pertanyaan yang ditanyakan oleh [Pak Budi](http://budigunawan.wordpress.com/) tentang [Table Index Pada Hibernate](http://tech.groups.yahoo.com/group/netbeans-indonesia/message/8066). Diskusi berjalan sangat hangat dan akhir-nya pembahasan secara perlahan namun pasti mengarah ke topik bagaimana melakukan **tunning** pada  database server yang kebetulan juga pakai [MySQL Community Server](http://www.mysql.com/downloads/) yang notabene bisa kita download secara gratis :)

Nah pada tulisan kali ini, saya cuma ingin berbagi pengalaman bagaimana cara meng-install dan menggunakan [MySQL Monitor](http://www.mysql.com/products/enterprise/advisors.html) untuk keperluan **monitoring** terhadap [MySQL Server](http://www.mysql.com/downloads/) kita (Maklum meskipun sudah jelas dibahas pada halaman manual-nya, saya masih sering salah langkah juga :( ). Saya juga tahu bahwa [MySQL Monitor](http://www.mysql.com/products/enterprise/advisors.html) ini tidak gratis melainkan sebuah aplikasi yang berbayar. Tapi jangan kuatir, [MySQL Monitor](http://www.mysql.com/products/enterprise/advisors.html) ini tersedia secara **gratis** selama **30 hari** dan semua fitur tidak ada yang dipangkas :) Ok kita sudahi dulu basa-basi-nya, sekarang mari kita masuk ke inti masalah-nya yaitu bagaimana meng-install dan menggunakan [MySQL Monitor](http://www.mysql.com/products/enterprise/advisors.html). Sebelum membaca lebih lanjut, yang perlu kita lakukan pertama kali yaitu melakukan registrasi pada situs [MySQL Enterprise Server](http://mysql.com/trials/) dahulu untuk mendapatkan **link** download-nya baru kemudian mari kita download file-file yang kita perlukan :D :) (**Note: Proses registrasi pada situs [MySQL Enterprise Server](http://mysql.com/trials/) ini hanya bisa digunakan untuk 1 account email saja**)

Sudah siap untuk melakukan proses **download** ? Jika sudah, silahkan download file-file dibawah ini :




  1. **mysql_monitoring_service.key**
File ini digunakan untuk aktivasi ketika akan menggunakan [MySQL Monitor](http://www.mysql.com/products/enterprise/advisors.html)



  2. **AdvisorScript-Trial-2.1.0.1093.jar**
File ini digunakan untuk aktivasi ketika akan menggunakan [MySQL Monitor](http://www.mysql.com/products/enterprise/advisors.html)



  3. **mysql-enterprise-gpl-5.1.40sp1-0.rhel5.i386.tar**
File ini adalah versi **Enterprise** dari [MySQL Community Server](http://www.mysql.com/downloads/), kalau ingin coba-coba download saja. Tapi kalau menurut saya, koq seperti-nya tidak ada beda-nya ya antara versi **Community** sama yang **Enterprise** (Ini murni berdasarkan pengalaman **ngoprek** selama beberapa minggu terakhir ini, jadi belum sempat **explore** lebih dalam lagi :D )



  4. **mysqlmonitor-2.1.1.1141-linux-x86-installer.bin**
File ini merupakan server untuk melakukan proses **monitoring**, nanti-nya yang akan kita akses adalah hasil proses installasi dari file ini. Didalam file ini juga sudah terdapat [Apache Tomcat](http://tomcat.apache.org/) dan [MySQL Server](http://www.mysql.com/downloads/) untuk menjalankan **Dashboard** dan menyimpan data hasil monitoring yang kita lakukan. 
**Note: Download-lah dengan file yang sesuai dengan spesifikasi server yang teman-teman gunakan**



  5. **mysqlmonitoragent-2.1.1.1144-linux-glibc2.3-x86-32bit-installer.bin**
File ini fungsi-nya adalah sebagai reporter ke [MySQL Monitor Server](http://www.mysql.com/products/enterprise/advisors.html), agar **Dashboard** dapat berfungsi dengan baik maka semua proses koneksi ke **MySQL Server** harus melalui **MySQL Monitor Agent** ini dahulu baru kemudian diteruskan ke **MySQL Server** sebenar-nya :) 
**Note: Download-lah dengan file yang sesuai dengan spesifikasi server yang teman-teman gunakan**



  6. **mysql-monitor-html.tar.gz**
Dan yang terakhir adalah jangan lupa untuk sekalian mendownload halaman manual-nya juga, karena didalam file ini banyak sekali konfigurasi yang diterangkan secara **jelas, padat dan terpercaya** :D :) Untuk teman-teman yang ingin bermain-main dengan [MySQL Monitor](http://www.mysql.com/products/enterprise/advisors.html), file ini **WAJIB** hukum-nya untuk didownload.




Nah setelah semua selesai di download, sekarang tiba saat-nya untuk proses installasi. Karena ini pengalaman pertama saya, maka pilihan **Sistem Operasi** yang saya pilih yaitu [CentOS](http://centos.org/). Pilihan ini dikarenakan agar kita tidak perlu melakukan perubahan pada **init script** yang dibawa oleh [MySQL Monitor](http://www.mysql.com/products/enterprise/advisors.html) :) Jadi untuk teman-teman, silahkan siapkan dahulu **environment** yang akan digunakan yah :) (Untuk Sistem Operasi yang lain, jika saya ada waktu akan saya tulis bagaimana integrasi pada masing-masing karakteristik **init script**-nya dan yang pasti bukan pada Sistem Operasi Microsoft Windows :) )

Sekarang pastikan dahulu bahwa teman-teman sudah meng-install [MySQL](http://mysql.com/) pada server yang ingin kita **monitor**, sedangkan pada tulisan ini [MySQL](http://mysql.com/) yang digunakan adalah [MySQL Community Server](http://www.mysql.com/downloads/) bawaan dari distro [CentOS](http://centos.org/) yang cara installasi dan konfigurasi-nya bisa teman-teman lihat pada [tutorial kemarin](http://martinusadyh.web.id/2010/02/23/installing-mysql-in-centos-5-4/) :)
<!-- more -->


> 
Karena pada tulisan ini [MySQL](http://mysql.com/) yang digunakan yaitu [MySQL Community Server](http://www.mysql.com/downloads/) dan bukan-nya [MySQL Enterprise Server](http://mysql.com/trials/), maka jika teman-teman ingin menggunakan versi [MySQL Enterprise Server](http://mysql.com/trials/), pastikan dahulu bahwa teman-teman sudah **meng-uninstall** [MySQL Community Server](http://www.mysql.com/downloads/) setelah itu baru mulai melakukan proses installasi versi **Enterprise**-nya dengan cara sebagai berikut :

> 
> 

>   1. **Ekstrak File mysql-enterprise-gpl-5.1.40sp1-0.rhel5.i386.tar**
Proses ekstrak bisa dilakukan dengan cara sebagai berikut melalui terminal :

>     
>     
>     [root@localhost ~]# tar xvf mysql-enterprise-gpl-5.1.40sp1-0.rhel5.i386.tar 
>     MySQL-test-enterprise-gpl-5.1.40sp1-0.rhel5.i386.rpm
>     MySQL-enterprise-gpl-debuginfo-5.1.40sp1-0.rhel5.i386.rpm
>     MySQL-devel-enterprise-gpl-5.1.40sp1-0.rhel5.i386.rpm
>     MySQL-embedded-enterprise-gpl-5.1.40sp1-0.rhel5.i386.rpm
>     MySQL-server-enterprise-gpl-5.1.40sp1-0.rhel5.i386.rpm
>     MySQL-shared-enterprise-gpl-5.1.40sp1-0.rhel5.i386.rpm
>     MySQL-client-enterprise-gpl-5.1.40sp1-0.rhel5.i386.rpm
>     MySQL-shared-compat-enterprise-gpl-5.1.40sp1-0.rhel5.i386.rpm
>     [root@localhost ~]# 
>     
> 
> 

> 

>   2. **Proses Installasi**
Proses installasi dapat dilakukan dengan mengetikkan perintah seperti dibawah ini :

>     
>     
>     [root@localhost ~]# rpm -i MySQL-client-enterprise-gpl-5.1.40sp1-0.rhel5.i386.rpm 
>     [root@localhost ~]# rpm -i MySQL-devel-enterprise-gpl-5.1.40sp1-0.rhel5.i386.rpm 
>     [root@localhost ~]# rpm -i MySQL-embedded-enterprise-gpl-5.1.40sp1-0.rhel5.i386.rpm 
>     [root@localhost ~]# rpm -i MySQL-enterprise-gpl-debuginfo-5.1.40sp1-0.rhel5.i386.rpm 
>     [root@localhost ~]# rpm -i MySQL-shared-enterprise-gpl-5.1.40sp1-0.rhel5.i386.rpm 
>     [root@localhost ~]# rpm -i MySQL-test-enterprise-gpl-5.1.40sp1-0.rhel5.i386.rpm 
>     [root@localhost ~]# rpm -i MySQL-server-enterprise-gpl-5.1.40sp1-0.rhel5.i386.rpm 
>     
>     PLEASE REMEMBER TO SET A PASSWORD FOR THE MySQL root USER !
>     To do so, start the server, then issue the following commands:
>     
>     /usr/bin/mysqladmin -u root password 'new-password'
>     /usr/bin/mysqladmin -u root -h localhost.localdomain password 'new-password'
>     
>     Alternatively you can run:
>     /usr/bin/mysql_secure_installation
>     
>     which will also give you the option of removing the test
>     databases and anonymous user created by default.  This is
>     strongly recommended for production servers.
>     
>     See the manual for more instructions.
>     
>     Please report any problems with the /usr/bin/mysqlbug script!
>     
>     The latest information about MySQL is available at http://www.mysql.com/
>     Support MySQL by buying support/licenses from http://shop.mysql.com/
>     
>     Starting MySQL..[  OK  ]
>     Giving mysqld 2 seconds to start
>     [root@localhost ~]# 
>     
> 
> 

> 

>   3. **Konfigurasi Password dan Testing**
Setelah proses installasi selesai, sekarang mari kita konfigurasi password yang akan digunakan oleh user **root** dan jika sudah selesai mari kita test dengan cara login menggunakan user **root** tersebut dengan cara seperti dibawah ini :

>     
>     
>     [root@localhost MySQL]# /usr/bin/mysqladmin -u root password 'admin'
>     [root@localhost MySQL]# mysql -u root -padmin
>     Welcome to the MySQL monitor.  Commands end with ; or \g.
>     Your MySQL connection id is 2
>     Server version: 5.1.40sp1-enterprise-gpl-pro MySQL Enterprise Server - Pro Edition (GPL)
>     
>     Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
>     
>     mysql> 
>     
> 
> 

> 

Jika semua proses diatas sudah dilakukan, maka kita sudah dapat menggunakan [MySQL Enterprise Server](http://mysql.com/trials/) yang ber-umur **30 hari** saja. Dan jika teman-teman tertarik, mungkin teman-teman juga dapat membeli **subscription**-nya pada situs [MySQL](http://mysql.com/) :D :)







Kalau semua persiapan sudah selesai, sekarang mari kita mulai melakukan installasi dan konfigurasi [MySQL Monitor](http://www.mysql.com/products/enterprise/advisors.html) beserta **Monitor Agent**-nya. Supaya lebih mudah, proses installasi dan konfigurasi ini dibagi menjadi beberapa bagian yang kurang lebih seperti berikut :




  1. Installasi MySQL Monitor Server


  2. Pembuatan User MySQL Untuk Monitor Agent


  3. Installasi MySQL Monitor Agent


  4. Testing Konfigurasi Menggunakan Skenario Strest Test



OK sudah jelas kan kira-kira langkah apa saja yang akan kita lakukan ?? Kalau sudah jelas, sekarang mari kita mulai :)


  1. **Installasi MySQL Monitor Server**
**MySQL Monitor Server** atau bisa disebut dengan **Service Manager** ini adalah merupakan jantung dari [MySQL Monitor](http://www.mysql.com/products/enterprise/advisors.html), dan pada proses installasi ini [MySQL Monitor](http://www.mysql.com/products/enterprise/advisors.html) membawa beberapa komponen-komponen tambahan secara default yaitu :


    * Apache Tomcat


    * MySQL Server


    * Java VM



Untuk memulai proses installasi-nya, gantilah dahulu hak akses teman-teman menjadi **super user** atau **root** kemudian berilah hak akses **executable** pada file **mysqlmonitor-2.1.1.1141-linux-x86-installer.bin** dan memulai proses installasi-nya dengan mengetikkan perintah **./mysqlmonitor-2.1.1.1141-linux-x86-installer.bin --mode text** seperti dibawah ini :

    
    
    [root@localhost MySQL]# chmod +x mysqlmonitor-2.1.1.1141-linux-x86-installer.bin 
    [root@localhost MySQL]# ./mysqlmonitor-2.1.1.1141-linux-x86-installer.bin --mode text
    



Setelah menjalankan perintah seperti diatas, maka pada layar terminal akan muncul pemilihan bahasa yang akan digunakan. Pilihlah nomor 1 dengan mengetikkan angka 1 atau bisa menekan tombol **ENTER** seperti dibawah ini :

    
    
    Language Selection
    
    Please select the installation language
    [1] English - English
    [2] Japanese - 日本語
    Please choose an option [1] : 1
    



Pada menu selanjut-nya, layar terminal kita akan muncul sambutan selamat datang dan menanyakan ingin di install di direktori mana **Service Manager** ini. Tekanlah tombol **ENTER** untuk menyetujui bahwa kita ingin menginstall pada direktori **/opt/mysql/enterprise/monitor** seperti dibawah ini :

    
    
    ----------------------------------------------------------------------------
    Welcome to the setup wizard for the MySQL Enterprise Monitor
    
    You will need a product key to complete installation. When the Monitor first starts, provide your existing MySQL Enterprise subscription or Trial credentials to obtain a key. Need an account? Go to http://www.mysql.com/trials/ to register for a trial subscription.
    
    ----------------------------------------------------------------------------
    Please specify the directory where the MySQL Enterprise Monitor will be installed
    
    Installation directory [/opt/mysql/enterprise/monitor]: 
    



Langkah selanjut-nya yaitu adalah menentukan port yang ingin digunakan oleh [Apache Tomcat](http://tomcat.apache.org/), jika kita tidak ingin merubah konfigurasi **default** tekanlah tombol **ENTER** pada setiap pertanyaan yang diajukan seperti dibawah ini :

    
    
    ----------------------------------------------------------------------------
    Tomcat Server Options
    
    Please specify the following parameters for the bundled Tomcat Server
    
    Tomcat Server Port [18080]: 
    
    Tomcat Shutdown Port [18005]: 
    
    Tomcat SSL Port [18443]: 
    
    
    
    Is SSL support required?           [y/N]: 
    



Langkah terakhir untuk konfigurasi yang perlu kita lakukan yaitu melakukan konfigurasi pada **Repository** yang akan digunakan. Pada langkah ini, konfigurasi yang penulis pakai adalah seperti berikut :


    * Repository Username = **service_manager**


    * Password = **admin**


    * Repository Username = **service_manager**


    * Bundled MySQL Database Port = **13306**



Semua konfigurasi ini akan disimpan dalam bentuk **plain text** tanpa enskripsi sama sekali pada file **/opt/mysql/enterprise/monitor/configuration_report.txt**, jadi pastikan benar-benar bahwa direktori **/opt** ini aman dari **tangan-tangan jahil** :D Karena semua konfigurasi menggunakan nilai default, jadi tekanlah tombol **ENTER** untuk setiap pertanyaan seperti dibawah ini :

    
    
    ----------------------------------------------------------------------------
    Repository Configuration
    
    Please specify the following parameters for the bundled MySQL server
    
    Repository Username [service_manager]: 
    
    Password :
    Re-enter :
    Bundled MySQL Database Port [13306]: 
    
    ----------------------------------------------------------------------------
    Configuration Report
    
    
    
    Note:
    
    The settings you specified will be saved here:
    /opt/mysql/enterprise/monitor/configuration_report.txt
    
    IMPORTANT: This configuration report includes passwords stored in plain text; it 
    is intended to help you install and configure your agents. We strongly advise 
    you to secure or delete this text file immediately after installation
    Press [Enter] to continue : 
    



Untuk memulai proses installasi tekanlah tombol **ENTER** pada pertanyaan **Do you want to continue? [Y/n]: ** dan tekanlah tombol **n** kemudian **ENTER** pada pertanyaan **View Readme File [Y/n]:** seperti dibawah ini :

    
    
    ----------------------------------------------------------------------------
    Setup is now ready to install MySQL Enterprise Monitor on your computer.
    
    Do you want to continue? [Y/n]: 
    
    ----------------------------------------------------------------------------
    Please wait while Setup installs MySQL Enterprise Monitor on your computer.
    
     Installing
     0% ______________ 50% ______________ 100%
     #########################################
    
    ----------------------------------------------------------------------------
    Completed installing files
    
    
    
    Setup has completed installing the MySQL Enterprise Monitor files on your 
    computer
    
    Uninstalling the MySQL Enterprise Monitor files can be done by invoking:
    /opt/mysql/enterprise/monitor/uninstall
    
    To complete the installation, launch the MySQL Enterprise Dashboard and complete 
    the initial setup and product activation information. Refer to the readme file 
    for additional information and a list of known issues.
    
    
    Press [Enter] to continue : 
    
    ----------------------------------------------------------------------------
    Setup has finished installing MySQL Enterprise Monitor on your computer.
    
    View Readme File [Y/n]: n
    
    Info: To configure the MySQL Enterprise Monitor please visit the following page: 
    http://localhost:18080
    Press [Enter] to continue : 
    [root@localhost MySQL]# 
    


Proses installasi **Service Manager** sudah selesai, sekarang mari kita coba dengan membuka sebuah browser dan masukkan alamat **http://localhost:18080** kemudian tekanlah tombol **ENTER**. Pada halaman awal ini, ada beberapa hal yang perlu kita lakukan yaitu :


    * Tambahkan file **mysql_monitoring_service.key** pada kolom isian **MySQL Enterprise Product Key**


    * Tambahkan file **AdvisorScript-Trial-2.1.0.1093.jar** pada kolom isian **Advisor Jar File**


    * Buat user **admin** dengan password **admin**


    * Buat user **agent** dengan password **admin**



Hasil dari konfigurasi diatas adalah seperti gambar dibawah ini :
[![AddKey](http://farm5.static.flickr.com/4043/4382562171_384fe90f2e.jpg)  
Konfigurasi dan Aktivasi MySQL Enterprise Monitor](http://www.flickr.com/photos/10243554@N02/4382562171/)

Jika sudah tekanlah tombol **Complete Setup** dan kita akan dibawa ke halaman **Enterprise Dashboard** seperti gambar dibawah ini :
[![after_login](http://farm5.static.flickr.com/4064/4382562179_9b8d8f86c5.jpg)  
Tampilan Awal Enterprise Dashboard Milik MySQL Monitor](http://www.flickr.com/photos/10243554@N02/4382562179/)

Sampai disini proses installasi sudah selesai, gampang bukan :)




  2. **Pembuatan User MySQL Untuk Monitor Agent**
Setelah selesai melakukan installasi **Service Manager** ini, langkah selanut-nya yaitu meng-install **Agent**-nya. Tapi sebelum menginstall **MySQL Monitor Agent** ini, kita harus membuat dahulu sebuah user yang akan digunakan oleh **MySQL Monitor Agent** ini untuk mengakses ke server target kita (**Catatan: server target disini maksud-nya adalah DataBase Server kita, bukan DataBase Server Bundled yang dibawa oleh MySQL Monitor Server**).

Untuk user MySQL yang akan dibuat ini harus mempunyai **privileges** terhadap server MySQL kita, sedangkan penentuan **privileges** ini tergantung kepada informasi yang akan diambil atau ditampilkan oleh **MySQL Monitor Agent** ke **Enterprise Dashboard**. Sedangkan **privileges** dibawah ini mengijinkan **MySQL Monitor Agent** melakukan tugas-nya tanpa ada batasan, beberapa **privileges** tersebut antara lain :


    * **SHOW DATABASES** : Privileges ini mengijinkan **Monitor Agent** untuk mengambil informasi tentang MySQL Server


    * **REPLICATION CLIENT** : Privileges ini mengijinkan **Monitor Agent** untuk mengambil informasi tentang status Replication master/slave.


    * **SELECT** : Privileges ini mengijinkan **Monitor Agent** untuk mengambil informasi tentang statistik tabel


    * **SUPER** : Privileges ini mengijinkan **Monitor Agent** untuk mengeksekusi perintah **SHOW ENGINE INNODB STATUS** yang digunakan untuk mengumpulkan data tentang tabel bertipe InnoDB


    * **PROCESS** : Ketika melakukan monitoring pada MySQL versi 5.1.24 atau diatas-nya yang menggunakan **InnoDB**, **privileges** ini diperlukan untuk menjalankan perintah **SHOW ENGINE INNODB STATUS**


    * **INSERT** : Untuk membbuat UUID yang dibutuhkan oleh **Monitor Agent**


    * **CREATE** : Mengijinkan **Monitor Agent** untuk membuat tabel


Setelah mengetahui **privileges** yang dibutuhkan oleh **Monitor Agent** sekarang mari kita buat user-nya dengan cara loginlah dahulu ke MySQL Server yang ingin dimonitor kemudian jalankanlah perintah **grant create, insert, select, replication client, show databases, super, process on *.* to 'admin'@'localhost' identified by 'admin';** seperti dibawah ini :

    
    
    [root@localhost MySQL]# mysql -u root -padmin
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 5
    Server version: 5.0.77 Source distribution
    
    Type 'help;' or '\h' for help. Type '\c' to clear the buffer.
    
    mysql> grant create, insert, select, replication client, show databases, super, process on *.* to 'admin'@'localhost' identified by 'admin';
    Query OK, 0 rows affected (0.00 sec)
    
    mysql> show grants for 'admin'@'localhost';
    +----------------------------------------------------------------------------------------------------------------------------------------------------------+
    | Grants for admin@localhost                                                                                                                               |
    +----------------------------------------------------------------------------------------------------------------------------------------------------------+
    | GRANT SELECT, INSERT, CREATE, PROCESS, SHOW DATABASES, SUPER, REPLICATION CLIENT ON *.* TO 'admin'@'localhost' IDENTIFIED BY PASSWORD '43e9a4ab75570f5b' | 
    +----------------------------------------------------------------------------------------------------------------------------------------------------------+
    1 row in set (0.01 sec)
    
    mysql> quit
    Bye
    [root@localhost MySQL]# 
    


**Note: User yang nanti-nya akan dipakai oleh Monitor Agent yaitu admin dan password yang digunakan yaitu admin**

Sampai disini, proses pembuatan User MySQL untuk **Monitor Agent** sudah selesai. Sekarang kita bisa lanjut pada tahapan selanjut-nya yaitu melakukan installasi **Monitor Agent**-nya :)




  3. **Installasi MySQL Monitor Agent**
Untuk menginstall **MySQL Monitor Agent** caranya tidak jauh berbeda dengan cara installasi **MySQL Monitor Server** atau **Service Manager** yaitu pertama-tama kita harus memberi akses executable kemudian menjalankan dengan perintah **./mysqlmonitoragent-2.1.1.1144-linux-glibc2.3-x86-32bit-installer.bin --mode text** seperti dibawah ini :

    
    
    [root@localhost MySQL]# chmod +x mysqlmonitoragent-2.1.1.1144-linux-glibc2.3-x86-32bit-installer.bin 
    [root@localhost MySQL]# ./mysqlmonitoragent-2.1.1.1144-linux-glibc2.3-x86-32bit-installer.bin --mode text
    



Pada pertanyaan pertama yaitu pilihan bahasa, tekanlah tombol **ENTER** untuk menerima nilai **default** seperti dibawah ini :

    
    
    Language Selection
    
    Please select the installation language
    [1] English - English
    [2] Japanese - 日本語
    Please choose an option [1] : 
    



Pada pertanyaan selanjut-nya, layar terminal kita akan muncul sambutan selamat datang dan menanyakan ingin di install di direktori mana MySQL Monitor Agent ini. Tekanlah tombol **ENTER** untuk menyetujui bahwa kita ingin menginstall pada direktori **/opt/mysql/enterprise/agent** seperti dibawah ini :

    
    
    ----------------------------------------------------------------------------
    Welcome to the MySQL Enterprise Monitor Agent Setup Wizard.
    
    ----------------------------------------------------------------------------
    Installation directory
    
    
    Please specify the directory where MySQL Enterprise Monitor Agent will be installed
    
    
    Installation directory [/opt/mysql/enterprise/agent]: 
    



Pertanyaan selanjut-nya yaitu masalah koneksi, pilih yang teman-teman gunaakan. Apakah **Monitor Agent** ini koneksi-nya menggunakan **TCP/IP** atau melalui **Socket**. Jika menggunakan **TCP/IP**, maka tekanlah tombol **ENTER** seperti dibawah ini :

    
    
    How will the agent connect to the database it is monitoring?
    
    
    [1] TCP/IP
    [2] Socket
    Please choose an option [1] : 
    



Setelah pertanyaan tentang koneksi yang digunakan ke DataBase Server yang dimonitor, pada pertanyaan ini kita akan ditanya tentang alamat dari DataBase Server tersebut. Pada pertanyaan **Monitored Database Information** ini, konfigurasi yang digunakan adalah seperti berikut :


    * MySQL hostname or IP address = **127.0.0.1** (Sesuaikan dengan kondisi di lapangan, biasanya sih antara database yang dimonitor dan **Monitor Agent** ini berada dalam 1 server. Jadi kita bisa menggunakan nilai default)


    * Validate MySQL hostname or IP address = **Y** (Pilih saja nilai default, agar di cek sekalian apakah sudah benar atau belum informasi **hostname** atau **IP** yang kita berikan)


    * MySQL Port = **3306** (Sesuaikan dengan kondisi di Server, ganti nilai ini jika port DataBase yang ingin di monnitor berbeda)


    * MySQL Username = **admin** (Isi dengan user yang telah dibuat pada langkah [Pembuatan User MySQL Untuk Monitor Agent](PembuatanUserDiDataBaseTarget))


    * MySQL Password = **admin** (Isi dengan password yang telah dibuat pada langkah [Pembuatan User MySQL Untuk Monitor Agent](PembuatanUserDiDataBaseTarget))



Jika tidak ada perubahan, maka kurang lebih tampilan pada layar terminal akan tampak seperti dibawah ini :

    
    
    ----------------------------------------------------------------------------
    Monitored Database Information
    
    IMPORTANT: The agent user account specified below requires special MySQL privileges.
    
    Visit the following URL for more information:
    https://enterprise.mysql.com/docs/monitor/2.1/en/mem-install.html#mem-agent-rights
    
    MySQL hostname or IP address [127.0.0.1]: 
    
    
    
    Validate MySQL hostname or IP address [Y/n]:  
    
    
    MySQL Port [3306]: 
    
    MySQL Username []: admin
    
    MySQL Password :
    Re-enter :
    



Langkah selanjutnya yaitu mengkonfigurasi **Query Analyzer**, konfigurasi ini akan berfungsi untuk melihat semua proses query yang dilakukan pada DataBase yang kita monitor. Agar **Query Analyzer** ini dapat befungsi, maka kita **harus mengubah koneksi di client yang biasanya menggunakan port 3306 agar mengarah ke port yang dibuka oleh Query Analyzer ini**. Sedangkan konfigurasi yang digunakan untuk **Query Analyzer** ini yaitu :


    * HEnable Proxy (recommended) = **Y** (Pilih Y jika kita menginginkan fitur Query Analyzer)


    * Proxy Port = **6446** (Pilih saja nilai default, jika port 6446 sudah digunakan ganti dengan port lain :D :) )


    * Hostname or IP address = **localhost** (Masukkan alamat dimana MySQL Enterprise Monitor terinstall)


    * Tomcat Server Port = **18080** (Masukkan port yang digunakan oleh server tomcat, pilih nilai default saja jika pada waktu proses installasi MySQL Enterprise Monitor tidak melakukan perubahan)


    * Tomcat SSL Port = **18443** (Masukkan port SSL yang digunakan oleh sever tomcat, pilih nilai default saja jika pada waktu proses installasi MySQL Enterprise Monitor tidak melakukan perubahan)


    * Use SSL = **N** (Pilih nilai default saja jika pada waktu proses installasi MySQL Enterprise Monitor tidak melakukan perubahan)


    * Agent Username = **agent** (Masukkan username untuk agent yang dibuat pada proses installasi MySQL Enterprise Monitor, default agent)


    * Agent Password = **admin**(Masukkan password yang digunakan oleh agent yang dibuat pada proses installasi MySQL Enterprise Monitor)


    * User Account = **root** (Pilih default saja)



Setelah melakukan konfigurasi seperti diatas, maka tampilan pada layar terminal kira-kira kurang lebih seperti dibawah ini :

    
    
    ----------------------------------------------------------------------------
    Query Analyzer Configuration
    
    MySQL Proxy enables Query Analyzer by listening on the port specified below for client connections that are then passed through to a backend MySQL database server. It is not needed for basic monitoring functionality, but is required for Query Analyzer.
    
    IMPORTANT UPDATE: The default value for the proxy port has changed.  See the README file for important information if you have previously used the Query Analyzer.
    
    Visit the following URL for more information:
    https://enterprise.mysql.com/docs/monitor/2.1/en/mem-query-analyzer.html
    
    
    
    Enable Proxy (recommended) [Y/n]: 
    
    
    Proxy Port [6446]: 
    
    Backend Host: 127.0.0.1   (cannot be changed)
    
    Backend Port: 3306   (cannot be changed)
    
    ----------------------------------------------------------------------------
    MySQL Enterprise Monitor Options
    
    Hostname or IP address []: localhost
    
    Tomcat Server Port [18080]: 
    
    Tomcat SSL Port [18443]: 
    
    
    
    Use SSL? [y/N]: 
    
    
    Agent Username [agent]: 
    
    Agent Password :
    Re-enter :
    ----------------------------------------------------------------------------
    User Account
    
    The agent does not need to run with root user privileges. The agent will switch to the user account provided below when started by the root user.
    
    User Account [root]: 
    
    ----------------------------------------------------------------------------
    



Fyuh.... akhir-nya hampir selesai juga, nah sekarang untuk mulai proses installasi tekanlah tombol **ENTER** sekali lagi dan  jika ada pertanyaan **View Readme File** jawab saja dengan menekan tombol **n** kemudian **ENTER** :D seperti dibawah ini :

    
    
    ----------------------------------------------------------------------------
    Configuration Report
    
    
    
    Here are the settings you specified:
    
    Installation directory: /opt/mysql/enterprise/agent
    
    Monitored MySQL Database:
    -------------------------
    Hostname or IP address: 127.0.0.1
    Port: 3306
    MySQL username: admin
    MySQL password: admin
    
    Query Analyzer Configuration
    -------------------------
    Proxy Enabled: yes
    Proxy Port: 6446
    Proxy User: root
    
    MySQL Enterprise Monitor:
    -------------------------
    Hostname or IP address: localhost
    Tomcat Server Port: 18080
    Press [Enter] to continue : 
    Tomcat SSL Port: 18443
    Use SSL: 0
    Agent username: agent
    
    Press [Enter] to continue : 
    
    ----------------------------------------------------------------------------
    Setup is now ready to begin installing MySQL Enterprise Monitor Agent on your computer.
    
    Do you want to continue? [Y/n]: 
    
    ----------------------------------------------------------------------------
    Please wait while Setup installs MySQL Enterprise Monitor Agent on your computer.
    
     Installing
     0% ______________ 50% ______________ 100%
     #########################################
    
    ----------------------------------------------------------------------------
    Start MySQL Enterprise Monitor Agent
    
    Info to start MySQL Enterprise Monitor Agent
    
    The MySQL Monitor Agent was successfully installed. To start the MySQL Agent 
    please invoke:
    /opt/mysql/enterprise/agent/etc/init.d/mysql-monitor-agent start
    Press [Enter] to continue : 
    
    ----------------------------------------------------------------------------
    Setup has finished installing MySQL Enterprise Monitor Agent on your computer.
    
    View Readme File [Y/n]: n
    
    [root@localhost MySQL]# 
    



Hm.... udah pusing dan bingung ? :D Saya juga awal-nya gitu koq, jadi santai aja, hayuuuk kita lanjut ke tahap testing :)




  4. **Testing Konfigurasi Menggunakan Skenario Strest Test**
Horee.... gimana teman-teman ?? :) Lumayan yah :) Ok, setelah semua proses intallasi selesai mari sekarang kita coba dengan menjalankan **Monitor Agent**-nya dengan perintah seperti dibawah ini :

    
    
    [root@localhost MySQL]# /opt/mysql/enterprise/agent/etc/init.d/mysql-monitor-agent start /opt/mysql/enterprise/agent/etc/mysql-monitor-agent.ini  && tail -f /opt/mysql/enterprise/agent/mysql-monitor-agent.log
    Starting MySQL Enterprise agent service...                 [  OK  ]
    
    2010-02-24 13:50:57: (critical) MySQL Monitor Agent 2.1.1.1144 started.
    2010-02-24 13:50:58: (critical) network-io.c:317: successfully reconnected to dashboard at http://agent:admin@localhost:18080/heartbeat
    2010-02-24 13:50:58: (critical) agent_mysqld.c:707: successfully connected to database at 127.0.0.1:3306 as user admin (with password: YES)
    



Jika sudah, sekarang mari kita lihat tampilan pada **MySQL Monitor Server** atau **Service Manager** dengan mengetikkan alamat **http://localhost:18080/** kemudian loginlah dengan username **admin** dan password **admin**, dan jika konfigurasi yang dilakukan selama ini sudah benar maka kita akan melihat tampilan **Enterprise Dashboard** seperti gambar dibawah ini :
[![TampilanAwal](http://farm5.static.flickr.com/4055/4382809165_66ebb9853f.jpg)  
Tampilan Awal Enterprise Dashboard Yang Menampilkan 1 Agent :) ](http://www.flickr.com/photos/10243554@N02/4382809165/)

Nah sekarang mari kita coba dengan menggunakan **Skenario Stress Test**, skenario ini bisa dibuat atau dijalankan dengan berbagai macam cara dan metode. Inti-nya sih, kita akan mencoba tembak DataBase Server yang di monitor dengan jumlah **HIT** yang ..... (terserah deh, sampai server Sistem Operasi-nya tewas juga gpp :D Inti-nya sih lakukan **_Flood Attack_** ke DataBase Server-nya :D ) Dan dibawah ini adalah hasil yang saya dapatkan ketika melakukan perintah **select * from nama_table;** yang jumlah kolom-nya ada 23 buah dan jumlah data-nya sendiri cuma sekitar 5618 record :) Memang kecil, kalau kita lihat dari jumlah record-nya untuk data sekelas **production** ini tidak ada apa-apanya :D Tapi server saya kan ada di VirtualBox :) Jadi ya wajar :D :P (Peace :) )

[![TampilanKetikaPeakTinggi](http://farm5.static.flickr.com/4069/4382809169_27936cb364.jpg)  
Tampilan Pada Enterprise Dashboard Ketika Terjadi Proses Flood Query](http://www.flickr.com/photos/10243554@N02/4382809169/)

[![TampilanKetikaPeakTinggi2](http://farm5.static.flickr.com/4071/4382809171_e2774a880a.jpg)  
Tampilan Pada Enterprise Dashboard Tab Event Ketika Terjadi Proses Flood Query 2](http://www.flickr.com/photos/10243554@N02/4382809171/)

[![TampilanLoadAverage](http://farm5.static.flickr.com/4027/4382842081_865d4fe692.jpg)  
Tampilan Grafik Load Average Ketika Terjadi Flood Query](http://www.flickr.com/photos/10243554@N02/4382842081/)




Fyuh.... akhir-nya selesai juga tulisan-nya, dan maaf loh teman-teman kalau jadi **ngantuk** gara-gara baca tulisan saya. Nah sekarang bagaimana menurut pendapat teman-teman sendiri ? Ada yang mau mencoba dan men-**sharing**-kan pengalaman sekaligus **tips dan trik** bermain-main dengan [MySQL Monitor](http://www.mysql.com/products/enterprise/advisors.html) ini ? :) Atau mungkin teman-teman mempunyai **tool** atau apapun itu yang tujuan-nya untuk monitoring, manajemen dan tunning DataBase MySQL Server ? Kalau ada, **sharing** ya :D:)

Dan akhir kata dari saya, selamat menikmati dan mohon maaf kalau didalam tulisan ini terjadi salah **arti** atau salah ketik. ;)

**Link-link terkait : **




  1. [MySQL Enterprise Server](http://mysql.com/trials/)


  2. [MySQL Monitor](http://www.mysql.com/products/enterprise/advisors.html)


  3. [MySQL Community Server](http://www.mysql.com/downloads/)


  4. [Apache Tomcat](http://tomcat.apache.org/)


  5. [Milis NetBeans Bahasa Indonesia](mailto:netbeans-indonesia@yahoogroups.com)


  6. [CentOS](http://centos.org/)


