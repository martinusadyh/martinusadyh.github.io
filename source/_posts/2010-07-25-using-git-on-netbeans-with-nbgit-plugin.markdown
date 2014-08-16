---
comments: true
date: 2010-07-25 10:57:50+00:00
layout: post
slug: using-git-on-netbeans-with-nbgit-plugin
title: Using Git On NetBeans with nbgit Plugin
wordpress_id: 944
categories:
- Java
- NetBeans
tags:
- Git
- Java
- java swing
- NetBeans
- project
- Project Management
- subversion
---

Beberapa hari terakhir ini, kita di [ArtiVisi](http://artivisi.com/) melakukan migrasi repository dari [Subversion](http://subversion.tigris.org/) ke [Git](http://git-scm.com/) :) (cuma masih belum semua, melainkan hanya beberapa project saja yang di migrasikan sedangkan yang lain masih tetap menggunakan Subversion). Migrasi ini dilakukan karena **main repo** kita sedang di pindah juga, dan ternyata proses **pindah server** tidak berjalan mulus seperti yang dibayangkan (hard disk server baru ternyata bad sector). Nah untuk mengantisipasi hal ini (seluruh team tidak bisa kerja, karena repository utama mati), maka sebagian project yang masih **in-development tree** dan timeline-nya mepet dipindah menggunakan [Git](http://git-scm.com/) :) Nah karena kita di [ArtiVisi](http://artivisi.com/) menggunakan NetBeans sebagai IDE utama, maka hal pertama yang dicari adalah dukungan NetBeans terhadap Git dan untungnya kita bisa menginstall plugin [nbgit](http://code.google.com/p/nbgit/) agar bisa menggunakan Git secara lancar di NetBeans IDE :)

Untuk NetBeans 6.9, project [nbgit](http://code.google.com/p/nbgit/) pada saat tulisan ini dibuat belum menyediakan file ***.nbm** melainkan menyediakan versi **source code** yang bisa kita download pada alamat [http://nbgit.googlecode.com/files/nbgit-0.4-netbeans-6.9.zip](http://nbgit.googlecode.com/files/nbgit-0.4-netbeans-6.9.zip). Agar dapat digunakan pada NetBeans, maka kita harus membuat file **.nbm** sendiri berdasarkan source code yang telah disediakan diatas. Untuk membuat file **.nbm** dan menginstallnya pada NetBeans, download dan ekstrak-lah **source code** nbgit tersebut kemudian bukalah pada NetBeans IDE kemudian klik kanan pada project **nbgit** dan pilihlah menu **Create NBM** seperti gambar dibawah ini :

[![CreateNBM](http://farm5.static.flickr.com/4099/4825927169_f37eec4d28_m.jpg)](http://www.flickr.com/photos/10243554@N02/4825927169/)  
**Membuat File NBM**

<!-- more -->
Atau jika tidak ingin membuat sebuah file **.nbm** kita bisa langsung menginstall secara **"on the fly"** ke NetBeans dengan memilih menu **Install/Reload In Development IDE** seperti gambar dibawah ini :

[![InstallOnTheFly](http://farm5.static.flickr.com/4079/4825927181_9a48df6ef1_m.jpg)](http://www.flickr.com/photos/10243554@N02/4825927181/)  
**Install On The Fly**

Jika proses pembuatan (kompilasi) telah selesai, maka kita bisa mendapatkan file **org-nbgit.nbm** pada direktori **$PROJECT-DIR/build/org-nbgit.nbm**  (dimana **$PROJECT-DIR** adalah direktori hasil ekstrak file **nbgit-0.4-netbeans-6.9.zip**) yang ditampilkan pada jendela **Output window** yang isinya kurang lebih seperti dibawah ini :

    
    
    Generating information for Auto Update...
    nbm:
    Building jar: /home/martinus/Desktop/nbgit-0.4-netbeans-6.9/build/org-nbgit.nbm
    Not signing NBM file /home/martinus/Desktop/nbgit-0.4-netbeans-6.9/build/org-nbgit.nbm; no stored-key password provided or keystore (/home/martinus/Desktop/nbgit-0.4-netbeans-6.9/${keystore}) doesn't exist
    BUILD SUCCESSFUL (total time: 21 seconds)
    



Jika sudah kita bisa meng-install plugin **org-nbgit.nbm** tersebut seperti plugin-plugin NetBeans yang lain (melalui menu **Tools > Plugin** dan pilih tab **Downloaded**) :) Nah jika plugin **nbgit** sudah terinstall pada NetBeans, sekarang bukalah menu **Team** dan harusnya sudah terdapat menu untuk **Git** seperti gambar dibawah ini :

[![MenuGit](http://farm5.static.flickr.com/4100/4826573772_1d4bc04612_m.jpg)](http://www.flickr.com/photos/10243554@N02/4826573772/)  
**Menu Git Pada NetBeans IDE**

Sekarang kita sudah dapat menggunakan **Git** untuk kegiatan sehari-hari kita, dan dibawah ini adalah beberapa **Git in Action** pada NetBeans yang saya gunakan :D







    

[![NBGitDiffViewer](http://farm5.static.flickr.com/4073/4826573774_308624c119.jpg)](http://www.flickr.com/photos/10243554@N02/4826573774/)  
**Tampilan Diff Viewer NbGit**
    

    

[![NbGitBrowser](http://farm5.static.flickr.com/4079/4826573776_a35921975a.jpg)](http://www.flickr.com/photos/10243554@N02/4826573776/)  
**Tampilan NbGit Browser**
    





    

[![GitRepoProperties](http://farm5.static.flickr.com/4138/4826573766_916c3eb2d0.jpg)](http://www.flickr.com/photos/10243554@N02/4826573766/)  
**Tampilan Repository Properties NBGit**  
****
    

    




Nah bagaimana teman-teman siap menggunakan [Git](http://git-scm.com/) di lingkungan teman-teman ?? :) Dan oh iya, dibawah ini mungkin referensi-referensi yang bisa teman-teman gunakan jika ingin bermain-main dengan [Git](http://git-scm.com/) ;)

**Link-link terkait :**




  1. [Git](http://git-scm.com/)


  2. [Subversion](http://subversion.tigris.org/)


  3. [nbgit](http://code.google.com/p/nbgit/)


  4. [Book Pro Git](http://progit.org/book/)


