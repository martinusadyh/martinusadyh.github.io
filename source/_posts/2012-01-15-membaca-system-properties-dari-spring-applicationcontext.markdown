---
comments: true
date: 2012-01-15 10:18:05+00:00
layout: post
slug: membaca-system-properties-dari-spring-applicationcontext
title: Membaca System Properties dari Spring ApplicationContext
wordpress_id: 1567
categories:
- Java
tags:
- Java
- Java Properties
- SpEL
- Spring Expression Language
- Spring Framework
- System Properties
---

Apakah pernah punya pengalaman ingin membaca [Java System Properties](http://docs.oracle.com/javase/tutorial/essential/environment/sysprop.html) dari aplikasi yang kita buat menggunakan [Spring Framework](http://www.springsource.org/) tetapi kesulitan ? Jika pernah, ternyata Spring Framework sejak versi 3 telah menambahkan fitur baru yaitu **Spring Expression Language (SpEL)** yang informasi-nya ternyata bisa kita baca pada halaman [fitur-fitur pada SpringFramework 3.0](http://static.springsource.org/spring/docs/3.0.5.RELEASE/reference/new-in-3.html). Dengan adanya penambahan fitur ini, kita bisa membuat sebuah konfigurasi yang benar-benar sangat flexible :)

Bagi yang belum tahu apa itu **Java System Properties** ini adalah merupakan sebuah kumpulan nilai konfigurasi pada sistem kita yang digunakan oleh Java. Nah sedangkan untuk mengetahui properties apa saja yang terdapat pada sistem kita, sekarang buatlah 1 buah class sederhana yang isinya kurang lebih seperti ini :

    
    
    public class TestSystemProperties {
    	public static void main(String[] args) {
    		for (String propertyName : System.getProperties().stringPropertyNames()) {
    			System.out.println("Nama Properties [" + propertyName + "] Value ["+System.getProperty(propertyName) + "]");
    		}
    	}
    }
    



Simpan, lakukan proses kompilasi dan coba jalankan. Jika tidak ada pesan kesalahan, maka kita akan melihat daftar sistem properties yang kurang lebih seperti dibawah ini :
[plain]
Nama Properties [java.runtime.name] Value [Java(TM) SE Runtime Environment]
Nama Properties [sun.boot.library.path] Value [/usr/lib/java/jre/lib/i386]
Nama Properties [java.vm.version] Value [20.1-b02]
Nama Properties [java.vm.vendor] Value [Sun Microsystems Inc.]
Nama Properties [java.vendor.url] Value [http://java.sun.com/]
Nama Properties [path.separator] Value [:]
Nama Properties [java.vm.name] Value [Java HotSpot(TM) Server VM]
Nama Properties [file.encoding.pkg] Value [sun.io]
Nama Properties [user.country] Value [US]
Nama Properties [sun.java.launcher] Value [SUN_STANDARD]
Nama Properties [sun.os.patch.level] Value [unknown]
Nama Properties [java.vm.specification.name] Value [Java Virtual Machine Specification]
Nama Properties [user.dir] Value [/home/martinus/Latihan/Java]
Nama Properties [java.runtime.version] Value [1.6.0_26-b03]
Nama Properties [java.awt.graphicsenv] Value [sun.awt.X11GraphicsEnvironment]
Nama Properties [java.endorsed.dirs] Value [/usr/lib/java/jre/lib/endorsed]
Nama Properties [os.arch] Value [i386]
...
...
[/plain]
<!-- more -->
Sekarang pertanyaan-nya adalah, apakah kita bisa menambah properties sendiri dan nantinya diakses dari aplikasi yang kita buat ? Jawaban-nya tentu bisa dong, cara yang paling gampang adalah tambahkan opsi `-DnamaProperties=value` pada perintah `java` ketika menjalankan aplikasi kita :) Sedangkan untuk mengambil properties-nya, kita bisa menggunakan statement `System.getProperty("namaProperties");`. Untuk melakukan pengujian, edit-lah kode `TestSystemProperties.java` diatas menjadi seperti dibawah ini :

    
    
    public class TestSystemProperties {
    	public static void main(String[] args) {
    		for (String propertyName : System.getProperties().stringPropertyNames()) {
    			System.out.println("Nama Properties [" + propertyName + "] Value ["+System.getProperty(propertyName) + "]");
    		}
    		System.out.println("=========================================");
    		// nama properties yang harus di setting adalah java.tutorial
    		System.out.println("Ambil properties " + System.getProperty("java.tutorial"));
    		System.out.println("=========================================");
    	}
    }
    



Sekarang lakukan proses kompilasi kemudian jalankan dengan perintah `java -Djava.tutorial="halo ini test loh" TestSystemProperties`, jika tidak ada pesan kesalahan maka kita akan dapat melihat tulisan **halo ini test loh** ini muncul pada standart output seperti dibawah ini :
[plain]
...
...
=========================================
Ambil properties halo ini test loh
=========================================
[/plain]

Terus sekarang apa hubungan-nya antara **Java System Properties** dengan **Spring Expression Language (SpEL)** ? Ada dong :) saya dari dulu ingin sekali membuat aplikasi yang mudah dikonfigurasi, baik koneksi database-nya maupun konfigurasi lain-lain yang nantinya akan diperlukan:) Biasa-nya ketika membuat sebuah aplikasi yang menggunakan **Spring Framework**, konfigurasi untuk koneksi database saya simpan pada sebuah file dengan nama `jdbc.properties` yang isinya seperti berikut ini :

    
    
    hibernate.dialect = org.hibernate.dialect.MySQLInnoDBDialect
    jdbc.driver = com.mysql.jdbc.Driver
    jdbc.url = jdbc:mysql://localhost/belajar
    jdbc.username = root
    jdbc.password = admin
    



Kemudian file konfigurasi diatas akan dibaca oleh **Spring Framework** dari file `applicationContext.xml` yang isinya seperti dibawah ini :

    
    
    
    <beans xmlns="http://www.springframework.org/schema/beans" xmlns:context="http://www.springframework.org/schema/context" xmlns:p="http://www.springframework.org/schema/p" xmlns:tx="http://www.springframework.org/schema/tx" xmlns:util="http://www.springframework.org/schema/util" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemalocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
    		http://www.springframework.org/schema/util http://www.springframework.org/schema/util/spring-util-3.0.xsd
    		http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd
    		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-3.0.xsd">
    
        ...
        <context:property-placeholder location="classpath*:jdbc.properties"></context:property-placeholder>
        ...
        
        <bean p:maxwait="4000" p:maxactive="80" p:driverclassname="${jdbc.driver}" destroy-method="close" class="org.apache.commons.dbcp.BasicDataSource" p:url="${jdbc.url}" p:username="${jdbc.username}" p:maxidle="20" p:password="${jdbc.password}" id="dataSource"></bean>
    
        ...
        ...
    </beans>
    



Kedua file diatas (`jdbc.properties` dan `applicationContext.xml`) akan dimasukkan kedalam sebuah file dengan ekstensi **jar** kemudian file ini ditambahkan ke dalam `CLASSPATH` aplikasi supaya bisa digunakan. Nah permasalahan dengan cara seperti ini adalah, bagaimana jika client ingin merubah alamat database server-nya (meskipun hal ini kecil sekali kemungkinan-nya jika kita menggunakan database seperti MySQL dan PostgreSQL, tapi bagaimana jika ternyata yang digunakan adalah **Embedded Database** yang lokasi database-nya bisa dipindah-pindah sesuai dengan keinginan)? 

Jika kita masih menggunakan metode diatas, maka cara satu-satunya yang masuk akal adalah, client harus menghubungi kita dan memberitahu kita berapa alamat IP yang baru. Sedangkan kita dibelakang meja hanya akan merubah 1 baris kode pada file `jdbc.properties` kemudian membuat ulang file **jar** kemudian hasil terbaru ini akan kita kirim ke client sebagai update. Kejadian ini akan terus berulang-ulang kita lakukan kalau client-nya sering gonta-ganti lokasi server-nya :D

Nah supaya kegiatan diatas tidak terjadi lagi, kita harus mengeluarkan konfigurasi alamat server database-nya keluar dari file **jar** dan mengijinkan supaya user bisa langsung mengedit alamat server tersebut. Cara yang saya tempuh adalah menjadikan alamat server database-nya menjadi sebuah system property dan `applicationContext.xml` akan membaca property tersebut dengan bantuan **Spring Expression Language (SpEL)**.

Untuk mengimplementasikan hal diatas, kita cukup mengedit 1 file saja yaitu file `jdbc.properties` menjadi seperti dibawah ini :


    
    
    hibernate.dialect = org.hibernate.dialect.MySQLInnoDBDialect
    jdbc.driver = com.mysql.jdbc.Driver
    jdbc.url = jdbc:mysql://#{ systemProperties['hostDB'] }/belajar
    jdbc.username = root
    jdbc.password = admin
    


Contoh konfigurasi file jdbc.properties yang menggunakan **SpEL** (Perhatikan syntax #{ systemProperties['hostDB'] })

Setelah melakukan perubah konfigurasi seperti diatas, sekarang kita bisa menjalankan aplikasi dengan menggunakan perintah `java -DhostDB=localhost -jar dist/Aplikasi.jar` saja :) Bagaimana mudah bukan ? Jika model aplikasi kita seperti ini, maka kita bisa tenang jika client mau gonta-ganti konfigurasi alamat database servernya :D :)


**Referensi terkait :**




  1. [Fitur-fitur baru pada SpringFramework 3.0](http://static.springsource.org/spring/docs/3.0.5.RELEASE/reference/new-in-3.html)


  2. [Daftar Java System Properties](http://docs.oracle.com/javase/tutorial/essential/environment/sysprop.html)


  3. [Spring Framework](http://www.springsource.org/)


  4. [Dokumentasi Spring Expression Language](http://static.springsource.org/spring/docs/3.0.5.RELEASE/reference/expressions.html)


