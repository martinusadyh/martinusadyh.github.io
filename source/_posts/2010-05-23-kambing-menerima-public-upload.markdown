---
comments: true
date: 2010-05-23 03:07:09+00:00
layout: post
slug: kambing-menerima-public-upload
title: Kambing Menerima Public Upload
wordpress_id: 824
categories:
- CentOS
- Slackware
- Ubuntu
tags:
- CentOS
- download
- repository
- Server
- Slackware
- Ubuntu
- upload
---

Wah barusan ada email di milis [id-slackware@googlegroups.com](mailto:id-slackware@googlegroups.com) bahwa sekarang kambing menerima upload dari luar (publik), wah mantep juga nih sepertinya dan ini adalah pengumuman yang saya baca di email tersebut :


> 
DH All,

berhubung banyak sekali permintaan menghosting konten-konten Open Source di Indonesia, akhirnya KambiNG membuka layanan upload bebas. Segala konten yang diupload dapat dilihat di [http://kambing.ui.ac.id/UPLOAD/](http://kambing.ui.ac.id/UPLOAD/)

Kode etik & ketentuan upload adalah sebagai berikut:

> 
> 

>   1. Tidak meng-upload barang2 bajakan
> 

>   2. Tidak menggunakan layanan ini sebagai transit file
> 

>   3. Tidak diperbolehkan membuat direktori
> 

>   4. Tidak diperbolehkan menghapus file yang sudah diupload
> 

>   5. Memberitahu [kontak@kambing.ui.ac.id](mailto:kontak@kambing.ui.ac.id) apabila konten yang sudah diupload tersebut untuk dirapihkan pada direktori-direktori tertentu di Kambing
> 

>   6. Disarankan untuk menyebarluaskan konten yang sudah diupload ke mirror-mirror lain agar konten Anda dapat disebarkan secara masal
> 

>   7. KambiNG tidak menjamin keberadaan konten tersebut selama tidak di-mirror oleh server mirror lain (kalau crash, KambiNG tidak ada kewajiban untuk
menyediakan kembali)
> 

>   8. Apabila ada yang mengupload konten-konten yang menyalahi aturan diatas, maka KambiNG akan menutup permanen IP uploader baik untuk upload & download
dari KambiNG
> 

<!-- more -->
Ini adalah layanan dengan konsep community generated content, jadi monggo untuk berkontribusi. Layanan ini diinisiasi oleh Pendayagunaan Open Source Software (POSS) UI untuk mendukung perkembangan OSS di Indonesia.

O iya, layanan anonymous FTP tetap berlaku namun hanya read-only saja, kalau mau upload bisa menggunakan username: **upload** dan password: **upload**

thnx

#adin




Karena penasaran, akhirnya iseng-iseng cobain akses ftp ke kambing melalui terminal dan seperti dibawah inilah hasilnya :

    
    
    martinus@martinusadyh:[~]$ ftp kambing.ui.ac.id
    Connected to kambing.ui.ac.id.
    220-                                                @@@@@@                                              
    220-                                              @@@@@@@@@@                                            
    220-                                             @@@@@@@@@@@@          @@                               
    220-                                            @@@@@@@@@@@@@     @@@@@@@@@@@                           
    220-                @@@@@@@@@                 @@@@@@@@@@@@@    @@@@           @@                        
    220-                @@@@@@@@@@@              @@@@@@@@@@@     @@@@              @@@                      
    220-                 @@@@@@@@@@@            @@@@@@@@@       @@@       @@@@       @@@                    
    220-                  @@@@@@@@@@.         @@@@@@@@         o@@     @@@@@@@@@       @@@8                 
    220-                    @@@@@@@@         @@@@@             @@@    @@@     @@@      @@@@@@               
    220-                      @@@@@                             @@    @@@@     @@@    @@@ @@@@              
    220-                                                @@@@@@@ @@@     @@@@   @@    @@@    @@@@            
    220-                                       @@@@@@@@@@@@@@@@   @@@@       @@@@   @@@       @@@@          
    220-                             @@@@@@@@@@@@@@@@@@@@@@@@@@    @@@@@@@@@@@@    @@@        @@@@@@        
    220-                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        @@@@@@@@O     @@              @@@      
    220-           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                @@@@@                          @@     
    220-           @@@@@@@@@@@@@@@@@@@@@@@@@@@@                                  @                   @@@    
    220-             @@@@@@@@@@@      @@@@@@@@@                                  @@                   @@    
    220-                              @@@@@@@@@                                  @@@                 @@o    
    220-                              @@@@@@@@@                                   @@@              @@@      
    220-                              @@@@@@@@@   @@@@@@@@@@@@@                     @@@@@@@@@@@@@@@@        
    220-                              @@@@@@@@@@@@@@@@@@@@@@@@@@                        @@@                 
    220-                    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                        @@@                  
    220-              @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                              @@@                   
    220-              @@@@@@@@@@@@@@@@@@@@@@@@@                                    @@@@                     
    220-                   @@@@@@@@@@@@@@@@@@@@                                 @@@@                        
    220-                              @@@@@@@@@                                                             
    220-                              @@@@@@@@@              @@@@@@@@                                       
    220-                              @@@@@@@@@     @@@@@@@@@@@@@@@@@@@@                                    
    220-                             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                  
    220-          @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                 
    220-     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                   
    220-    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                             
    220-     @@@@@@@@@@@@@@@@@        @@@@@@@@@                                  @@@                        
    220-                              @@@@@@@@@                                  @@@                        
    220-                              @@@@@@@@@       @@  @@@  @@  @@@@@@@  @@@@@@@@ @@@   @@  @@@@@@       
    220-                              @@@@@@@@@        @@ @@@@ @@ @@@@@@@@@ @@   @@@ @@@   @@  @@@@         
    220-                              @@@@@@@@         @@@@ @@@@  @@@       @@   @@@ @@@   @@     @@@       
    220-                              @@@@@@@@          @@@  @@@   @@@@@@@  @@@@@@@@  @@@@@@@ @@@@@@@       
    220-                               @@@@@@@                                                              
    220-                               @@@@@@@        @     @      @                                        
    220-                               @@@@@@@       @@@   @@      @@                                       
    220-                               @@@@@@        @@@   @@      @@                                       
    220-                               @@@@@@        @@@   @@      @@                                       
    220-                                @@@@          @@@ @@@  @@  @@  @@                                   
    220-                                                 @                                                  
    220-
    220-Silahkan lihat-lihat konten-konten F/OSS di server ini dengan max 4 concurrent connection per IP address
    220-
    220-Anda dapat berkontribusi terhadap konten KambiNG dengan meng-upload menggunakan:
    220-Username: upload
    220-Password: upload
    220-segala konten yang sudah di-upload dapat dilihat pada:
    220-- http://kambing.ui.ac.id/UPLOAD/
    220-- ftp://kambing.ui.ac.id/UPLOAD/
    220-
    220-Segala tindak-tanduk anda diawasi oleh para KambiNG yang Galak !
    220-
    220-Layanan ini merupakan persembahan dari Universitas Indonesia, http://www.ui.ac.id/
    220-Dengan kolaborasi antara lembaga-lembaga berikut:
    220-- Pendayagunaan Open Source Software UI, http://poss.ui.ac.id/
    220-- Kantor Pengembangan dan Pelayanan Sistem Informasi UI, http://www.ppsi.ui.ac.id/
    220-
    220-tabe,
    220 
    Name (kambing.ui.ac.id:martinus): upload
    331 Please specify the password.
    Password:
    230 Login successful.
    Remote system type is UNIX.
    Using binary mode to transfer files.
    ftp> ls
    200 PORT command successful. Consider using PASV.
    150 Here comes the directory listing.
    -rw-------    1 ftp      ftp           179 May 22 13:56 examples.desktop
    -rw-------    1 ftp      ftp        198488 May 22 13:12 gnulinuxsebuahpengantar.pdf
    226 Directory send OK.
    ftp> 
    



Wew.. mantap euy :)

