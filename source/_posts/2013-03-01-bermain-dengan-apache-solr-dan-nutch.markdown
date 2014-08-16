---
comments: true
date: 2013-03-01 17:38:10+00:00
layout: post
slug: bermain-dengan-apache-solr-dan-nutch
title: Bermain dengan Apache Solr dan Nutch
wordpress_id: 2407
categories:
- Java
tags:
- Apache
- full text searching
- Java
- nutch
- search engine java
- solr
- web crawler java
---

Sudah lama saya tidak menulis hal-hal yang berkaitan dengan dunia TI, dan akhirnya setelah cukup lama beristirahat akhirnya malam ini saya mencoba menuliskan pengalaman bermain-main dengan [Apache SOLR](http://lucene.apache.org/solr/) dan [Apache Nutch](http://nutch.apache.org/). Sebenarnya kedua mainan ini merupakan barang lama, tapi bagi saya merupakan barang baru dikarenakan ada teman yang minta tolong dikonfigurasikan menggunakan kedua mainan ini dan ternyata mengkombinasikan 2 mainan ini tidak semudah seperti yang dibayangkan, maka akhirnya saya jadikan sebuah catatan tersendiri hanya sebagai pengingat saja :D

Nah untuk yang belum tahu apasih sebenarnya [Apache SOLR](http://lucene.apache.org/solr/) ini, bahasa mudahnya **SOLR** ini adalah sebuah aplikasi mesin pencari seperti [Google](http://google.com) yang ditulis menggunakan bahasa pemrograman java. Dan berikut ini adalah penjelasan yang lebih lengkap diambil dari web resmi-nya [Apache SOLR](http://lucene.apache.org/solr/):


> 
SolrTM is the popular, blazing fast open source enterprise search platform from the Apache LuceneTM project. Its major features include powerful full-text search, hit highlighting, faceted search, near real-time indexing, dynamic clustering, database integration, rich document (e.g., Word, PDF) handling, and geospatial search. Solr is highly reliable, scalable and fault tolerant, providing distributed indexing, replication and load-balanced querying, automated failover and recovery, centralized configuration and more. Solr powers the search and navigation features of many of the world's largest internet sites.
Solr is written in Java and runs as a standalone full-text search server within a servlet container such as Tomcat. Solr uses the Lucene Java search library at its core for full-text indexing and search, and has REST-like HTTP/XML and JSON APIs that make it easy to use from virtually any programming language. Solr's powerful external configuration allows it to be tailored to almost any type of application without Java coding, and it has an extensive plugin architecture when more advanced customization is required.




Sedangkan [Apache Nutch](http://nutch.apache.org/) adalah sebuah aplikasi **web-crawler** yang ditulis menggunakan bahasa pemrograman java juga, dan penjelasan lengkapnya adalah seperti berikut ini :


> 
Apache Nutch is an open source web-search software project. Stemming from [Apache Lucene](http://lucene.apache.org/java/), it now builds on Apache Solr adding web-specifics, such as a crawler, a link-graph database and parsing support handled by Apache Tika for HTML and and array other document formats.

Apache Nutch can run on a single machine, but gains a lot of its strength from running in a [Hadoop cluster](http://hadoop.apache.org/)

The system can be enhanced (eg other document formats can be parsed) using a highly flexible, easily extensible and thoroughly maintained plugin infrastructure.




Pada tulisan kali ini, kita akan mencoba membangun sebuah mesin pencari menggunakan [Apache SOLR](http://lucene.apache.org/solr/) dan untuk **web-crawler**-nya menggunakan [Apache Nutch](http://nutch.apache.org/). Dikarenakan percobaan menggunakan versi terbaru dari kedua aplikasi ini bermasalah, maka pada tulisan kali ini kita akan menggunakan :




  1. [Apache Solr 3.6.2](http://apache.mirrors.tds.net/lucene/solr/3.6.2/apache-solr-3.6.2.tgz) dan


  2. [Apache Nutch 1.6](http://mirror.cc.columbia.edu/pub/software/apache/nutch/1.6/apache-nutch-1.6-bin.zip)



Langkah pertama yang perlu dilakukan adalah pastikan bahwa Java telah terinstall pada komputer atau laptop anda, jika sudah konfigurasilah `environment variable JAVA_HOME` dahulu. Untuk mengecek apakah `JAVA_HOME` sudah terkonfigurasi dengan benar atau tidak, jalankan perintah `echo $JAVA_HOME` di terminal. Jika menampilkan direktori tempat dimana java terinstall, maka konfigurasi `JAVA_HOME` sudah benar. Selanjutnya adalah downloadlah [Apache Solr](http://lucene.apache.org/solr/) dari link diatas, kemudian ekstrak ke sebuah direktori hingga kita mendapatkan direktori **apache-solr-3.6.2** Sekarang masuklah kedalam direktori `apache-solr-3.6.2/example` dan jalankan perintah `java -jar start.jar` seperti dibawah ini :
[plain]
martinusadyh@artivisi:/tmp/apache-solr-3.6.2/example$ java -jar start.jar 
...
...
...
Mar 01, 2013 10:23:43 PM org.apache.solr.servlet.SolrUpdateServlet init
INFO: SolrUpdateServlet.init() done
2013-03-01 22:23:43.638:INFO::Started SocketConnector@0.0.0.0:8983
[/plain]
<!-- more -->
Jika sudah, sekarang bukalah alamat [http://localhost:8983/solr/admin/](http://localhost:8983/solr/admin/) dan jika tidak ada masalah, maka kita akan melihat tampilan seperti gambar dibawah ini :
[caption id="attachment_2418" align="alignnone" width="300"][![Halaman Depan Apache Solr](http://martinusadyh.web.id/wp-content/uploads/2013/03/HalamanDepanApacheSolr-300x113.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=389) Halaman Depan Apache Solr[/caption]

Setelah [Apache Solr](http://lucene.apache.org/solr/) berhasil kita jalankan, sekarang waktunya bermain-main dengan [Apache Nutch](http://nutch.apache.org/). Downloadlah **Apache Nutch** pada link diatas kemudian ekstraklah hingga kita mendapatkan sebuah direktori **apache-nutch-1.6**, sekarang editlah file `apache-nutch-1.6/conf/nuch-site.xml` menjadi seperti dibawah ini :

    
    
    
    
    
    
    <configuration>
    	<property>
    		<name>http.agent.name</name>
    		<value>SSG Web Crawler</value>
    	</property>
    </configuration>
    


**Konfigurasi ini bertujuan untuk memberi nama crawler yang akan kita gunakan nanti-nya.**

Untuk memberi tahu [Apache Nutch](http://nutch.apache.org/) url mana saja yang harus di **crawling**, sekarang buatlah sebuah direktori dengan nama **urls** didalam direktori **apache-nutch-1.6** kemudian buatlah sebuah file dengan nama `seed.txt` dan daftarkan url apa saja yang ingin di crawling seperti contohnya adalah :

    
    
    http://kompas.com/
    http://detik.com/
    http://goal.com/
    



Jika sudah, masih ada 1 konfigurasi file yang perlu kita edit yaitu file `apache-nutch-1.6/conf/regex-urlfilter.txt`. Bukalah file tersebut dan editlah baris paling bawah sendiri menjadi seperti dibawah ini :

    
    
    # accept anything else
    +^http://([a-z0-9]*\.)*kompas.com/
    +^http://([a-z0-9]*\.)*detik.com/
    +^http://([a-z0-9]*\.)*goal.com/
    



Sekarang mari kita test apakah semua url yang sudah kita daftarkan berhasil di **crawling** oleh [Apache Nutch](http://nutch.apache.org/) dengan menjalankan perintah `bin/nutch crawl urls -dir crawl -depth 3 -topN 5` pada direktori **apache-nutch-1.6** seperti dibawah ini :
[plain]
martinusadyh@artivisi:/tmp/apache-nutch-1.6$ bin/nutch crawl urls -dir crawl -depth 3 -topN 5
solrUrl is not set, indexing will be skipped...
crawl started in: crawl
rootUrlDir = urls
threads = 10
depth = 3
solrUrl=null
topN = 5
Injector: starting at 2013-03-01 23:34:15
Injector: crawlDb: crawl/crawldb
Injector: urlDir: urls
Injector: Converting injected urls to crawl db entries.
Injector: total number of urls rejected by filters: 0
Injector: total number of urls injected after normalization and filtering: 3
Injector: Merging injected urls into crawl db.
...
...
...
[/plain]

Tunggulah beberapa saat, proses **crawling** ini bisa sangat lama tergantung dengan banyak-nya url yang ingin di **crawling** dan cepatnya koneksi internet yang kita gunakan :D Sampai disini [Apache Solr](http://lucene.apache.org/solr/) dan [Apache Nutch](http://nutch.apache.org/) berjalan sesuai dengan harapan kita, dan sekarang waktunya untuk melakukan integrasi untuk kedua-nya. Jadi apa yang akan di **crawling** oleh [Apache Nutch](http://nutch.apache.org/) bisa kita cari di [Apache Solr](http://lucene.apache.org/solr/).

Nah untuk mulai proses integrasi ini, sekarang copykanlah dahulu file `apache-nutch-1.6/conf/schema.xml` ke direktori `apache-solr-3.6.2/example/solr/conf` dengan menggunakan perintah `cp` seperti dibawah ini :
[plain]
martinusadyh@artivisi:/tmp$ cp apache-nutch-1.6/conf/schema.xml apache-solr-3.6.2/example/solr/conf/
martinusadyh@artivisi:/tmp$ 
[/plain]

Jika sudah sekarang editlah file `apache-solr-3.6.2/example/solr/conf/solrconfig.xml` dan kemudian editlah baris dibawah ini :

    
    
      <requesthandler name="/select" class="solr.SearchHandler">
        
         <lst name="defaults">
           <str name="echoParams">explicit</str>
           <int name="rows">10</int>
           <str name="df">text</str>
         </lst>
    



menjadi seperti dibawah ini :

    
    
      <requesthandler name="/select" class="solr.SearchHandler">
        
         <lst name="defaults">
           <str name="echoParams">explicit</str>
           <int name="rows">10</int>
           <str name="df">content</str> 
         </lst>
    



Setelah mengedit file `apache-solr-3.6.2/example/solr/conf/solrconfig.xml` sekarang editlah juga file `apache-solr-3.6.2/example/solr/conf/schema.xml` dan carilah baris seperti dibawah ini :

    
    
    		
            <field indexed="true" stored="false" type="string" name="host"></field>
            <field indexed="true" stored="true" type="url" name="url" required="true"></field>
            <field indexed="true" stored="false" type="text" name="content"></field>
            <field indexed="true" stored="true" type="text" name="title"></field>
            <field indexed="false" stored="true" type="string" name="cache"></field>
            <field indexed="false" stored="true" type="date" name="tstamp"></field>
    



Dan kemudian editlah menjadi seperti dibawah ini :

    
    
    		
            <field indexed="true" stored="false" type="string" name="host"></field>
            <field indexed="true" stored="true" type="url" name="url" required="true"></field>
            <field indexed="true" stored="true" type="text" name="content"></field> 
            <field indexed="true" stored="true" type="text" name="title"></field>
            <field indexed="false" stored="true" type="string" name="cache"></field>
            <field indexed="false" stored="true" type="date" name="tstamp"></field>
    



Jika sudah, sekarang waktunya kita untuk melakukan pengetesan apakah hasil **crawling** dari [Apache Nutch](http://nutch.apache.org/) bisa ke index oleh [Apache Solr](http://lucene.apache.org/solr/). Yang pertama perlu lakukan adalah menjalankan **Solr**-nya dahulu dengan perintah `java -jar start.jar` seperti dibawah ini :
[plain]
martinusadyh@artivisi:/tmp/apache-solr-3.6.2/example$ java -jar start.jar 
....
....
....
INFO: JNDI not configured for solr (NoInitialContextEx)
Mar 02, 2013 12:14:30 AM org.apache.solr.core.SolrResourceLoader locateSolrHome
INFO: solr home defaulted to 'solr/' (could not find system property or JNDI)
Mar 02, 2013 12:14:30 AM org.apache.solr.servlet.SolrUpdateServlet init
INFO: SolrUpdateServlet.init() done
2013-03-02 00:14:30.581:INFO::Started SocketConnector@0.0.0.0:8983
[/plain]

Setelah [Apache Solr](http://lucene.apache.org/solr/)-nya berjalan, sekarang masuk ke dalam direktori **apache-nutch-1.6** dan jalankan perintah `bin/nutch solrindex http://127.0.0.1:8983/solr/ crawl/crawldb -linkdb crawl/linkdb crawl/segments/*` seperti dibawah ini :
[plain]
martinusadyh@artivisi:/tmp/apache-nutch-1.6$ bin/nutch solrindex http://127.0.0.1:8983/solr/ crawl/crawldb -linkdb crawl/linkdb crawl/segments/*
SolrIndexer: starting at 2013-03-02 00:23:17
SolrIndexer: deleting gone documents: false
SolrIndexer: URL filtering: false
SolrIndexer: URL normalizing: false
Indexing 11 documents
SolrIndexer: finished at 2013-03-02 00:24:04, elapsed: 00:00:47
martinusadyh@artivisi:/tmp/apache-nutch-1.6$ 
[/plain]

Jika sudah, mari kita mengecek-nya dengan memasukkan **query string** seperti gambar dibawah ini :
[caption id="attachment_2433" align="alignnone" width="300"][![Coba Search Dari File Seed](http://martinusadyh.web.id/wp-content/uploads/2013/03/Coba-Search-Dari-File-Seed-300x140.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=390) Coba Search Dari File Seed[/caption]

Dan inilah hasil pencarian yang kita lakukan :
[caption id="attachment_2434" align="alignnone" width="300"][![Hasil Pencarian Dari Nutch](http://martinusadyh.web.id/wp-content/uploads/2013/03/Hasil-Pencarian-Dari-Nutch-300x173.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=391) Hasil Pencarian Dari Nutch[/caption]

Hmm... bagaimana, mudah bukan ? :)

**Referensi-referensi:**




  1. [Apache Solr](http://lucene.apache.org/solr/)


  2. [Apache Nutch](http://nutch.apache.org/)


  3. [Building a Search Engine with Nutch and Solr in 10 Minutes](http://blog.building-blocks.com/building-a-search-engine-with-nutch-and-solr-in-10-minutes)



