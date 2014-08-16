---
comments: true
date: 2008-04-25 14:27:23+00:00
layout: post
slug: portable-classpath-di-netbeans
title: Portable Classpath di NetBeans
wordpress_id: 27
categories:
- Java
- NetBeans
---

Mungkin banyak teman-teman yang sudah tidak asing lagi bagaimana caranya menambahkan suatu library kedalam [IDE NetBeans](http://www.netbeans.org/), yups caranya sih sangat mudah yaitu tinggal klik kanan node Library di Project Inspector kemudian pilih **Add JAR/Folder** seperti gambar dibawah ini:
[![AddLibrary](http://farm3.static.flickr.com/2079/2441011080_94ff31e2db_m.jpg)  
Click to View Large Image
](http://www.flickr.com/photos/10243554@N02/2441011080/)

<!-- more -->
Sebenarnya sih tidak ada yang salah dengan cara seperti diatas, tetapi akan bermasalah kalau kita sering membagikan contoh project atau _prototype_ project kita ke teman-teman yang lain atau misalkan secara tidak sengaja seluruh folder project tersebut ikut ter-commit ke repository :D Nah efek samping dari cara diatas yaitu :




  1. Jika teman kita tidak menginstal [NetBeans](http://www.netbeans.org/) tetapi hanya menginstal [apache-ant](http://ant.apache.org/) saja, project yang kita berikan tidak mungkin langsung berhasil dijalankan karena ada beberapa library yang dibutuhkan tidak diketemukan didalam classpath.


  2. Ketika teman kita membuka contoh project yang kita berikan dari IDE [NetBeans](http://www.netbeans.org/), bisa dipastikan [NetBeans](http://www.netbeans.org/) pasti mengeluarkan **Warning Message** yang menandakan bahwa ada beberapa library yang tidak diketemukan. Dan solusinya kita harus **me-Resolve Reference Problem** permasalahan tersebut dengan cara seperti gambar dibawah ini ( Apakah teman-teman pernah mengalami kasus seperti ini ? Saya pernah mengalaminya :malu: ) :

[![ResolveReferenceProblem](http://farm3.static.flickr.com/2262/2441011084_10003d23dc_m.jpg)  
Click to View Large Image
](http://www.flickr.com/photos/10243554@N02/2441011084/)



Agar [NetBeans](http://www.netbeans.org/) tidak mengeluarkan pesan seperti diatas ketika kita memberikan contoh project atau _prototype_ project kita ke seorang teman, ada 1 file yang perlu kita edit dahulu supaya library yang akan digunakan di project kita menjadi lebih portable. File tersebut yaitu **private.properties** yang terdapat di dalam folder **_NamaProject/nbproject/private_** seperti gambar dibawah ini:

[![privateprop](http://farm4.static.flickr.com/3035/2441011092_b2344c04fb_m.jpg)
  
Click to View Large Image
](http://www.flickr.com/photos/10243554@N02/2441011092/)

Sudah tahu dimana letak permasalahannya ?? Yups [NetBeans](http://www.netbeans.org/) membuat **_full path_** pada file **private.properties** ke library yang kita gunakan yang dapat kita lihat pada baris 1 dan 2 seperti dibawah ini:

    
    
    file.reference.ibatis-dao-2.jar=/home/anton/NBPortableClasspath/lib/ibatis-dao-2.jar
    file.reference.ibatis-sqlmap-2.jar=/home/anton/NBPortableClasspath/lib/ibatis-sqlmap-2.jar
    jaxws.endorsed.dir=/opt/netbeans-6.0.1/java1/modules/ext/jaxws21/api
    user.properties.file=/home/javamaniac/.netbeans/6.0/build.properties
    



Agar project kita dapat berjalan mulus di komputer teman kita yang hanya menginstal [apache-ant](http://ant.apache.org/) maupun [NetBeans](http://www.netbeans.org/), edit saja file **private.properties** diatas menjadi seperti berikut :

    
    
    file.reference.ibatis-dao-2.jar=lib/ibatis-dao-2.jar
    file.reference.ibatis-sqlmap-2.jar=lib/ibatis-sqlmap-2.jar
    jaxws.endorsed.dir=/opt/netbeans-6.0.1/java1/modules/ext/jaxws21/api
    user.properties.file=/home/javamaniac/.netbeans/6.0/build.properties
    



Setelah selesai melakukan pengeditan pada file **private.properties**, sekarang cobalah untuk melakukan proses **build** dari [NetBeans](http://www.netbeans.org/). Jika tidak ada pesan error yang muncul, sekarang mari kita coba kopikan folder project diatas ke komputer lain yang berbeda sistem operasinya dan di komputer tersebut hanya terinstal JDK plus [apache-ant](http://ant.apache.org/) saja. Dan dibawah ini adalah hasilnya :

Ini output di Windows setelah kita melakukan pengeditan diatas :

    
    
    D:/NBPortableClasspath>type D:/NBPortableClasspath/nbproject/private/private.properties
    file.reference.ibatis-dao-2.jar=lib/ibatis-dao-2.jar
    file.reference.ibatis-sqlmap-2.jar=lib/ibatis-sqlmap-2.jar
    jaxws.endorsed.dir=/opt/netbeans-6.0.1/java1/modules/ext/jaxws21/api
    user.properties.file=/home/javamaniac/.netbeans/6.0/build.properties
    
    D:/NBPortableClasspath>ant -p
    Buildfile: build.xml
    Builds, tests, and runs the project NBPortableClasspath.
    Main targets:
    
     clean        Clean build products.
     compile      Compile project.
     debug        Debug project in IDE.
     default      Build and test whole project.
     jar          Build JAR.
     javadoc      Build Javadoc.
     run          Run a main class.
     test         Run unit tests.
     test-single  Run single unit test.
    Default target: default
    D:/NBPortableClasspath>ant clean run
    Buildfile: build.xml
    
    -pre-pre-compile:
        [mkdir] Created dir: D:/NBPortableClasspath/build/classes
    
    -do-compile:
        [javac] Compiling 3 source files to D:/NBPortableClasspath/build/classes
    
    
    compile:
    
    run:
    
    BUILD SUCCESSFUL
    Total time: 4 seconds
    D:/NBPortableClasspath>
    



Dan dibawah ini output kalau kita tidak mengedit file **private.properties** :

    
    
    D:/NBPortableClasspath>type D:/NBPortableClasspath/nbproject/private/private.properties
    file.reference.ibatis-dao-2.jar=/home/anton/NBPortableClasspath/lib/ibatis-dao-2.jar
    file.reference.ibatis-sqlmap-2.jar=/home/anton/NBPortableClasspath/lib/ibatis-sqlmap-2.jar
    jaxws.endorsed.dir=/opt/netbeans-6.0.1/java1/modules/ext/jaxws21/api
    user.properties.file=/home/javamaniac/.netbeans/6.0/build.properties
    D:/NBPortableClasspath>ant -p
    Buildfile: build.xml
    Builds, tests, and runs the project NBPortableClasspath.
    Main targets:
    
     clean        Clean build products.
     compile      Compile project.
     debug        Debug project in IDE.
     default      Build and test whole project.
     jar          Build JAR.
     javadoc      Build Javadoc.
     run          Run a main class.
     test         Run unit tests.
     test-single  Run single unit test.
    Default target: default
    D:/NBPortableClasspath>ant clean run
    Buildfile: build.xml
    -do-clean:
       [delete] Deleting directory D:/NBPortableClasspath/build
    
    -pre-pre-compile:
        [mkdir] Created dir: D:/NBPortableClasspath/build/classes
    
    -do-compile:
        [javac] Compiling 3 source files to D:/NBPortableClasspath/build/classes
        [javac] D:/NBPortableClasspath/src/nbportableclasspath/TesDaoImpl.java:8: pa
    ckage com.ibatis.dao.client does not exist
        [javac] import com.ibatis.dao.client.DaoManager;
        [javac]                             ^
        [javac] D:/NBPortableClasspath/src/nbportableclasspath/TesDaoImpl.java:9: pa
    ckage com.ibatis.dao.client.template does not exist
        [javac] import com.ibatis.dao.client.template.SqlMapDaoTemplate;
        [javac]                                      ^
        [javac] D:/NBPortableClasspath/src/nbportableclasspath/TesDaoImpl.java:17: c
    annot find symbol
        [javac] symbol: class SqlMapDaoTemplate
        [javac] public class TesDaoImpl extends SqlMapDaoTemplate implements TesIbat
    isDaoJar {
        [javac]                                 ^
        [javac] D:/NBPortableClasspath/src/nbportableclasspath/TesIbatisDaoJar.java:
    8: package com.ibatis.dao.client does not exist
        [javac] import com.ibatis.dao.client.Dao;
        [javac]                             ^
        [javac] D:/NBPortableClasspath/src/nbportableclasspath/TesIbatisDaoJar.java:
    16: cannot find symbol
        [javac] symbol: class Dao
        [javac] public interface TesIbatisDaoJar extends Dao {
        [javac]                                          ^
        [javac] D:/NBPortableClasspath/src/nbportableclasspath/TesDaoImpl.java:19: c
    annot find symbol
        [javac] symbol  : class DaoManager
        [javac] location: class nbportableclasspath.TesDaoImpl
        [javac]     public TesDaoImpl(DaoManager daoManager) {
        [javac]                       ^
        [javac] 6 errors
    
    BUILD FAILED
    D:/NBPortableClasspath/nbproject/build-impl.xml:323: The following error occurr
    ed while executing this line:
    D:/NBPortableClasspath/nbproject/build-impl.xml:158: Compile failed; see the co
    mpiler error output for details.
    
    Total time: 2 seconds
    D:/NBPortableClasspath>
    



**Perhatian kalau ingin benar-benar portable ( No NetBeans Locking ): **  

Buatlah sebuah folder khusus untuk menampung seluruh library yang akan dipakai dan tempatkan folder tersebut di bawah folder project seperti gambar dibawah ini :

[![folderlib](http://farm3.static.flickr.com/2105/2441011090_8e7f571e28_m.jpg)
  
Click to View Large Image
](http://www.flickr.com/photos/10243554@N02/2441011090/)

Usahakan jangan menggunakan library yang ditambahkan lewat **Library Manager** meskipun library tersebut standart bawaan [NetBeans](http://www.netbeans.org/). Karena kalau kita menggunakan library bawaan [NetBeans](http://www.netbeans.org/), maka [NetBeans](http://www.netbeans.org/) akan menuliskan fullpath ke library yang kita gunakan pada file **project.properties** seperti pada gambar dibawah ini :

[![ViaLibraryManager](http://farm3.static.flickr.com/2327/2441011086_edecee927f_m.jpg)
  
Click to View Large Image
](http://www.flickr.com/photos/10243554@N02/2441011086/)

Apa akibatnya jika kita memberikan project tersebut pada teman yang tidak menginstal [NetBeans](http://www.netbeans.org/) ? Hasilnya sudah bisa ditebak diluar kepala, pasti akan error karena [NetBeans](http://www.netbeans.org/) menambahkan **_full path_** ke library yang digunakan oleh project tersebut sedangkan library-nya tidak terdapat pada komputer teman kita :)

So, happy NetBeaning guy's :)
