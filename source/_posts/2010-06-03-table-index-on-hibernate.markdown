---
comments: true
date: 2010-06-03 19:13:04+00:00
layout: post
slug: table-index-on-hibernate
title: Table Index On Hibernate
wordpress_id: 873
categories:
- Java
- NetBeans
tags:
- DataBase
- Hibernate
- Java
- MySQL
- NetBeans
---

Buat teman-teman yang sudah terbiasa menggunakan MySQL mungkin pernah mendengar atau mendapatkan saran seperti ini **"Jika ingin query-nya berjalan cepat maka kita harus menambahkan sebuah index pada kolom-kolom yang sering digunakan pada klausa where"**. Saran seperti ini memang betul sih jika kita menggunakan MySQL sebagai solusi DataBase Server yang kita gunakan, sedangkan untuk DataBase Server lain mungkin berbeda lagi penerapan-nya karena saya juga belum mempunyai pengalaman :D

Dulu.. pada milis [netbeans-indonesia@yahoogroups.com](mailto:netbeans-indonesia@yahoogroups.com) ada pertanyaan seperti ini **"TANYA : Table Index Pada Hibernate"** (thread lengkap untuk pertanyaan ini bisa dibaca [disini](http://tech.groups.yahoo.com/group/netbeans-indonesia/message/8066)), nah karena dulu saya juga belum tahu dan ketika itu mencari-cari referensi di Google juga tidak mendapatkan hasil yang memuaskan (apa saya yang kurang jeli ya ??) akhirnya keputusan terakhir adalah solusi pembuatan index harus dilakukan manual melalui MySQL bukan dari sisi Hibernate.

Nah ternyata, cara untuk menambahkan sebuah index pada sebuah kolom pada tabel di hibernate dapat dilakukan dengan menggunakan Annotations (@) **@org.hibernate.annotations.Table** pada domain class yang kita buat. Sedangkan cara penggunaan annotations **@org.hibernate.annotations.Table** adalah seperti contoh kode dibawah ini :

    
    
    @org.hibernate.annotations.Table(
        appliesTo="<< table-name >>",
        indexes={
            @Index(name="<< index-name >>", columnNames={"<< column-names >>"}),
            @Index(name="<< another-index-name >>", columnNames={"<< another-column-names >>"})
        }
    )
    



Yang perlu diperhatikan disini yaitu **"Annotations @org.hibernate.annotations.Table ini bukan merupakan pengganti dari annotations @javax.persistence.Table"** dan dibawah ini adalah kutipan dari halaman manual hibernate :


> 
@org.hibernate.annotations.Table is a complement, not a replacement to @javax.persistence.Table. Especially, if you want to change the default name of a table, you must use @javax.persistence.Table, not @org.hibernate.annotations.Table.




Merasa penasaran ??? Jika iya, yuk mari kita coba sekarang :) Peralatan yang dipakai pada latihan kali ini adalah :




  1. MySQL DataBase


  2. Hibernate Annotations


  3. Spring Framework 3.0.2


<!-- more -->
Semua perlengkapan sudah siap ? Jika sudah, sekarang mari kita buat sebuah domain class sebagai contoh yaitu Buku yang mempunyai kolom **id, tanggalMasuk, nomorSeri, namaPengarang, kategori dan penerbit** dan kolom yang akan kita index adalah kolom **nomorSeri dan namaPengarang**. Hasilnya adalah seperti kode dibawah ini :

    
    
    package id.web.martinusadyh.tableindexhibernate;
    
    import java.io.Serializable;
    import java.util.Date;
    import javax.persistence.Column;
    import javax.persistence.Entity;
    import javax.persistence.GeneratedValue;
    import javax.persistence.Id;
    import javax.persistence.Table;
    import javax.persistence.Temporal;
    import org.hibernate.annotations.Index;
    
    @Entity
    @Table(name="master_buku")
    @org.hibernate.annotations.Table(
        appliesTo="master_buku",
        indexes={
            @Index(name="nomor_seri", columnNames={"nomor_seri"}),
            @Index(name="nama_pengarang", columnNames={"nama_pengarang"})
        }
    )
    public class Buku implements Serializable {
        @Id @GeneratedValue
        private Long id;
        @Temporal(javax.persistence.TemporalType.DATE)
        @Column(name="tanggal_masuk")
        private Date tanggalMasuk;
        @Column(name="nomor_seri")
        private String nomorSeri;
        @Column(name="nama_pengarang")
        private String namaPengarang;
        @Column(name="kategori")
        private String kategori;
        @Column(name="penerbit")
        private String penerbit;
        
        // Automatic Getter n Setter
    }
    



Nah jika sudah selesai membuat sebuah domain class, sekarang mari kita mapping melalui file **hibernate.xml** seperti dibawah ini :

    
    
    
    
    <hibernate-configuration>
      <session-factory>
        <property name="hibernate.hbm2ddl.auto">update</property>
        <property name="hibernate.dialect">org.hibernate.dialect.MySQLInnoDBDialect</property>
        <mapping class="id.web.martinusadyh.tableindexhibernate.Buku"></mapping>
      </session-factory>
    </hibernate-configuration>
    



Jika sudah, sekarang buatlah file **jdbc.properties** untuk mengisi informasi yang berkaitan dengan database seperti dibawah ini :

    
    
    # To change this template, choose Tools | Templates
    # and open the template in the editor.
    hibernate.dialect = org.hibernate.dialect.MySQLInnoDBDialect
    jdbc.driver=com.mysql.jdbc.Driver
    jdbc.url=jdbc:mysql://localhost/lat_hibernate
    jdbc.username=root
    jdbc.password=admin
    



Dan yang terakhir yaitu memanggil semuanya melalui file konfigurasi Spring yaitu **applicationContext.xml** seperti dibawah ini :

    
    
    
    <beans xmlns="http://www.springframework.org/schema/beans" xmlns:tx="http://www.springframework.org/schema/tx" xmlns:p="http://www.springframework.org/schema/p" xmlns:context="http://www.springframework.org/schema/context" xmlns:util="http://www.springframework.org/schema/util" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemalocation="
              http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
              http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-3.0.xsd
              http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-3.0.xsd
              http://www.springframework.org/schema/util http://www.springframework.org/schema/util/spring-util-3.0.xsd
    ">
        <context:property-placeholder location="classpath:jdbc.properties"></context:property-placeholder>
        <context:annotation-config></context:annotation-config>
        <tx:annotation-driven></tx:annotation-driven>
    
        <bean p:driverclassname="${jdbc.driver}" class="org.springframework.jdbc.datasource.DriverManagerDataSource" p:url="${jdbc.url}" p:username="${jdbc.username}" p:password="${jdbc.password}" id="dataSource"></bean>
    
        <bean p:datasource-ref="dataSource" p:configlocation="classpath:hibernate.cfg.xml" id="sessionFactory" class="org.springframework.orm.hibernate3.annotation.AnnotationSessionFactoryBean">
            <property name="hibernateProperties">
                <props>
                    <prop key="dialect">${hibernate.dialect}</prop>
                </props>
            </property>
        </bean>
    
        <bean p:sessionfactory-ref="sessionFactory" id="transactionManager" class="org.springframework.orm.hibernate3.HibernateTransactionManager"></bean>
    </beans>
    



Sebagai **launcher**-nya, buatlah sebuah **MainClass** dengan isi seperti dibawah ini :

    
    
    package id.web.martinusadyh.tableindexhibernate;
    
    public class Main {
        public static void main(String[] args) {
            ApplicationContext ctx = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        }
    }
    



Setelah semua selesai, sekarang jalankan-lah project yang telah kita buat diatas dan mari kita cek apakah tabel master_buku hasil **generate** hibernate ini berhasil mempunyai index atau tidak dengan menjalankan perintah pada **mysql prompt** seperti dibawah ini :

    
    
    mysql> show create table master_buku\G
    *************************** 1. row ***************************
           Table: master_buku
    Create Table: CREATE TABLE `master_buku` (
      `id` bigint(20) NOT NULL auto_increment,
      `kategori` varchar(255) default NULL,
      `nama_pengarang` varchar(255) default NULL,
      `nomor_seri` varchar(255) default NULL,
      `penerbit` varchar(255) default NULL,
      `tanggal_masuk` date default NULL,
      PRIMARY KEY  (`id`),
      KEY `nama_pengarang` (`nama_pengarang`),
      KEY `nomor_seri` (`nomor_seri`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1
    1 row in set (0.00 sec)
    
    mysql> show index from master_buku;
    +-------------+------------+----------------+--------------+----------------+-----------+-------------+----------+--------+------+------------+---------+
    | Table       | Non_unique | Key_name       | Seq_in_index | Column_name    | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment |
    +-------------+------------+----------------+--------------+----------------+-----------+-------------+----------+--------+------+------------+---------+
    | master_buku |          0 | PRIMARY        |            1 | id             | A         |           0 |     NULL | NULL   |      | BTREE      |         | 
    | master_buku |          1 | nama_pengarang |            1 | nama_pengarang | A         |           0 |     NULL | NULL   | YES  | BTREE      |         | 
    | master_buku |          1 | nomor_seri     |            1 | nomor_seri     | A         |           0 |     NULL | NULL   | YES  | BTREE      |         | 
    +-------------+------------+----------------+--------------+----------------+-----------+-------------+----------+--------+------+------------+---------+
    3 rows in set (0.00 sec)
    
    mysql> 
    



Yuhuuuu .... index sudah berhasil dibuat langsung dari Hibernate, sekarang kita sudah tidak perlu susah-susah lagi untuk menambahkan index secara manual melalui MySQL Prompt. Mantap kan ??? Semuanya bisa dilakukan dari java :)

**Link-link terkait :**




  1. [Source Code Project TableIndexOnHibernate](http://code.google.com/p/martin-personal-project/source/browse/#svn/trunk/java/TableIndexHibernate)


  2. [Demo TableIndexOnHibernate](http://www.ziddu.com/download/10127256/TableIndexHibernate.zip.html)



