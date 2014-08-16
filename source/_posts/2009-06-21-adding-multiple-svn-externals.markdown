---
comments: true
date: 2009-06-21 20:30:00+00:00
layout: post
slug: adding-multiple-svn-externals
title: Adding Multiple SVN Externals
wordpress_id: 59
categories:
- Other
---

Apa sih svn externals itu ?? Untuk penjelasan tentang apa itu svn externals bisa dibaca di halaman manual Subversion [Chapter 7 Section 2.3.6](http://svnbook.red-bean.com/en/1.0/ch07s02.html#svn-ch-7-sect-2.3.6) atau kalau tidak mau membaca yang bahasa inggris, pak Endy sudah menjelaskan dengan detail tentang penggunaan svn externals itu [disini](http://endy.artivisi.com/blog/lain/svn-externals/).

Nah sekarang kasus yang dihadapi yaitu, bagaimana jika kita ingin menambah lebih dari 1 svn externals ?? Hm... bukannya caranya gampang, tinggal jalankan saja perintah **svn propset svn:externals "com.myrepository.modul.satu.project.lain https://myrepository.com/svn/project-lain/trunk/com.myrepository.modul.satu.project.lain" .** secara berulang sesuai dengan modul yang ingin diambil.  Ok sekarang mari kita coba simulasikan, kita akan mengambil 3 modul dari **project-lain** dan 3 modul itu yaitu **modul.satu.project.lain**, **modul.dua.project.lain** dan **modul.tiga.project.lain**.

Sekarang mari kita coba, langkah pertama yaitu menambahkan properties **svn:externals** untuk **modul.satu.project.lain** dan mengambil modulnya dengan perintah seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$ svn propset svn:externals "com.myrepository.modul.satu.project.lain https://myrepository.com/svn/project-lain/trunk/com.myrepository.modul.satu.project.lain" .
    property 'svn:externals' set on '.'
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$  svn up
    Fetching external item into 'com.myrepository.modul.satu.project.lain'
    A    com.myrepository.modul.satu.project.lain/nbproject
    A    com.myrepository.modul.satu.project.lain/nbproject/project.properties
    A    com.myrepository.modul.satu.project.lain/nbproject/project.xml
    A    com.myrepository.modul.satu.project.lain/nbproject/genfiles.properties
    A    com.myrepository.modul.satu.project.lain/nbproject/build-impl.xml
    Updated external to revision 7.
    
    Updated to revision 27.
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$
    



Ok berhasil, mari sekarang kita cek apakah properties **svn:externals** sudah disimpan ??? Mari kita lihat pada file **.svn/dir-props** dan hasilnya adalah seperti berikut :

    
    
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$ more .svn/dir-props
    K 13
    svn:externals
    V 121
    com.myrepository.modul.satu.project.lain https://myrepository.com/svn/project-lain/trunk/com.myrepository.modul.satu.project.lain
    
    END
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$
    


<!-- more -->
Ok sudah betul, sekarang mari kita lanjutkan dengan menambahkan properties **svn:externals** untuk **modul.dua.project.lain** dengan cara yang sama seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$ svn propset svn:externals "com.myrepository.modul.dua.project.lain https://myrepository.com/svn/project-lain/trunk/com.myrepository.modul.dua.project.lain" .
    property 'svn:externals' set on '.'
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$  svn up
    Fetching external item into 'com.myrepository.modul.dua.project.lain'
    A    com.myrepository.modul.dua.project.lain/nbproject
    A    com.myrepository.modul.dua.project.lain/nbproject/project.properties
    A    com.myrepository.modul.dua.project.lain/nbproject/project.xml
    A    com.myrepository.modul.dua.project.lain/nbproject/genfiles.properties
    A    com.myrepository.modul.dua.project.lain/nbproject/build-impl.xml
    Updated external to revision 7.
    
    Updated to revision 27.
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$
    



Nah sekarang mari kita cek lagi, apakah properties **svn:externals** kita sudah bertambah ??? Mari kita lihat dengan perintah **more** seperti dibawah ini:

    
    
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$ more .svn/dir-props
    K 13
    svn:externals
    V 121
    com.myrepository.modul.dua.project.lain https://myrepository.com/svn/project-lain/trunk/com.myrepository.modul.dua.project.lain
    
    END
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$
    



Nah ternyata baru kita tahu, dengan menggunakan perintah diatas maka subversion akan menimpa konfigurasi **svn:externals** kita sebelumnya. Sekarang bagaimana agar konfigurasi **svn:externals** kita tidak ditimpa dengan url yang terakhir ?? Caranya sangat gampang, yaitu buatlah dahulu daftar modul berserta alamat repository yang ingin dimasukkan ke dalam properties **svn:externals** seperti berikut :

    
    
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$ echo "com.myrepository.modul.satu.project.lain https://myrepository.com/svn/project-lain/trunk/com.myrepository.modul.satu.project.lain" > LIST_SVN_EXTERNAL
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$ echo "com.myrepository.modul.dua.project.lain https://myrepository.com/svn/project-lain/trunk/com.myrepository.modul.dua.project.lain" >> LIST_SVN_EXTERNAL
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$ echo "com.myrepository.modul.tiga.project.lain https://myrepository.com/svn/project-lain/trunk/com.myrepository.modul.tiga.project.lain" >> LIST_SVN_EXTERNAL
    



Setelah membuat daftar modul, sekarang setting properties **svn:external**-nya dengan perintah dan lihat file **.svn/dir-props** seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$ svn propset svn:externals . -F LIST_SVN_EXTERNAL
    property 'svn:externals' set on '.'
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$ more .svn/dir-props
    K 13
    svn:externals
    V 121
    com.myrepository.modul.satu.project.lain https://myrepository.com/svn/project-lain/trunk/com.myrepository.modul.satu.project.lain
    com.myrepository.modul.dua.project.lain https://myrepository.com/svn/project-lain/trunk/com.myrepository.modul.dua.project.lain
    com.myrepository.modul.tiga.project.lain https://myrepository.com/svn/project-lain/trunk/com.myrepository.modul.tiga.project.lain
    
    END
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$
    



Sekarang coba update working copy kita, dan harusnya hasilnya akan tampil seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$ svn up
    
    Fetching external item into 'com.myrepository.modul.satu.project.lain'
    External at revision 7.
    
    Fetching external item into 'com.myrepository.modul.dua.project.lain'
    External at revision 7.
    
    Fetching external item into 'com.myrepository.modul.tiga.project.lain'
    A    com.myrepository.modul.tiga.project.lain/nbproject
    A    com.myrepository.modul.tiga.project.lain/nbproject/project.properties
    A    com.myrepository.modul.tiga.project.lain/nbproject/project.xml
    A    com.myrepository.modul.tiga.project.lain/nbproject/genfiles.properties
    A    com.myrepository.modul.tiga.project.lain/nbproject/build-impl.xml
    A    com.myrepository.modul.tiga.project.lain/manifest.mf
    A    com.myrepository.modul.tiga.project.lain/src
    A    com.myrepository.modul.tiga.project.lain/src/main
    A    com.myrepository.modul.tiga.project.lain/src/main/java
    A    com.myrepository.modul.tiga.project.lain/build.xml
    U   com.myrepository.modul.tiga.project.lain
    Updated external to revision 7.
    
    Updated to revision 27.
    [martin@opensolarisbox:~/PROJECT/project-saya/trunk]$
    



Mudah bukan :)

**Referensi-referensi terkait :**




  1. [SubVersion Mudah Dengan RabbitVCS](http://martinusadyh.web.id/2010/03/13/subversion-mudah-dengan-rabbitvcs/)


