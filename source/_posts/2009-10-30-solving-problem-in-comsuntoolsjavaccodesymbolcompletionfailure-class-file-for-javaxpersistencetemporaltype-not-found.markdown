---
comments: true
date: 2009-10-30 20:16:18+00:00
layout: post
slug: solving-problem-in-comsuntoolsjavaccodesymbolcompletionfailure-class-file-for-javaxpersistencetemporaltype-not-found
title: 'Solving Problem in com.sun.tools.javac.code.Symbol$CompletionFailure: class
  file for javax.persistence.TemporalType not found'
wordpress_id: 78
categories:
- Java
- NetBeans
tags:
- 'com sun tools javac code Symbol$CompletionFailure: class file for javax persistence
  TemporalType not found'
---

Bingung dengan judul diatas ? Saya sendiri sebenarnya juga bingung karena kejadian yang saya alami ini juga kadang-kadang saja terjadi :( . Dan seperti-nya ini berkaitan dengan project yang menggunakan JPA (menggunakan TopLink atau Hibernate JPA di NetBeans IDE) , ceritanya saya mendapatkan pesan error seperti dibawah ini ketika melakukan proses kompilasi project :

    
    
    /home/martinus/JDKBUG/project-jdkbug-gen/com.artivisi.jdkbug.domain/dist/com.artivisi.jdkbug.domain.jar(com/artivisi/jdkbug/domain/SampleDomain.class): warning: Cannot find annotation method 'name()' in type 'javax.persistence.Table': class file for javax.persistence.Table not found
    /home/martinus/JDKBUG/project-jdkbug-gen/com.artivisi.jdkbug.domain/dist/com.artivisi.jdkbug.domain.jar(com/artivisi/jdkbug/domain/SampleDomain.class): warning: Cannot find annotation method 'mappedBy()' in type 'javax.persistence.OneToMany': class file for javax.persistence.OneToMany not found
    An exception has occurred in the compiler (1.6.0_16). Please file a bug at the Java Developer Connection (http://java.sun.com/webapps/bugreport)  after checking the Bug Parade for duplicates. Include your program and the following diagnostic in your report.  Thank you.
    com.sun.tools.javac.code.Symbol$CompletionFailure: class file for javax.persistence.TemporalType not found
    /home/martinus/JDKBUG/project-jdkbug-gen/com.artivisi.jdkbug.ui/nbproject/build-impl.xml:349: The following error occurred while executing this line:
    /home/martinus/JDKBUG/project-jdkbug-gen/com.artivisi.jdkbug.service/nbproject/build-impl.xml:365: The following error occurred while executing this line:
    /home/martinus/JDKBUG/project-jdkbug-gen/com.artivisi.jdkbug.service/nbproject/build-impl.xml:168: Compile failed; see the compiler error output for details.
    BUILD FAILED (total time: 1 second)
    



Nah aneh-nya library **Hibernate-JPA** sudah saya tambahkan pada **project-domain** dan **project-service-impl**, kalau saya melakukan proses kompilasi di **project-domain** dan di** project-service-impl** masalah ini tidak timbul. Tapi kalau melakukan proses kompilasi dari UI, baru deh muncul itu pesan error :(

Coba googling cuma mendapatkan 3 link saja, yang sepertinya menandakan bahwa jarang yang mendapatkan pesan error seperti di atas :( Setelah membaca [Bug ID 6550655](http://bugs.sun.com/view_bug.do?bug_id=6550655) ternyata solusinya gampang, yaitu **tambahkan library TopLink atau Hibernate JPA di setiap project yang membutuhkan project-domain **:)

Semoga berguna buat teman-teman yang mengalami kasus yang sama :D :)
