---
comments: true
date: 2007-10-02 13:49:28+00:00
layout: post
slug: using-cvs-at-sourceforgenet
title: Using CVS at SourceForge.net
wordpress_id: 11
categories:
- Java
---

Untuk teman-teman yang masih bingung bagaimana menggunakan [CVS](http://en.wikipedia.org/wiki/Concurrent_Versions_System) di [sourceforge.net](http://sourceforge.net/), mungkin langkah-langkah yang saya lakukan ini bisa menjadi panduan bagaimana menggunakan [CVS](http://en.wikipedia.org/wiki/Concurrent_Versions_System) di [sourceforge.net](http://sourceforge.net/).

Oh iya saya akses [CVS](http://en.wikipedia.org/wiki/Concurrent_Versions_System) di [sourceforge.net](http://sourceforge.net/) ini dari warnet dan Sistem Operasi yang saya gunakan adalah Windows XP :malu: , mungkin cara ini bisa diterapkan pada warnet-warnet berbasis Windows yang memakai DeepFreeze atau sistem proteksi yang melarang user untuk instal program macam-macam pada komputer di warnetnya.

Pertama-tama download dulu [ssh client](ftp.reportlab.com/tools/ssh-1.2.14-win32bin.zip) ama [cvs client](http://ftp.gnu.org/non-gnu/cvs/binary/stable/x86-woe/cvs-1-11-22.zip) nya, kemudian buat 1 folder tempat Project anda berada, misalkan disini buat foldernya di **C:\>**



> 
C:\> mkdir Project




Nah klo sudah, dibawah folder Project saya membuat 1 folder lagi yaitu folder tools. (Folder tools ini untuk menaruh **cvs.exe** ama **ssh.exe** saya)


> 
C:\>cd Project
C:\Project> mkdir tool



<!-- more -->
Nah klo sudah membuat direktori yang diperlukan, sekarang bikin script batch sederhana dah taruh di **C:\Project>**, scriptnya seperti ini:

    
    
    set HOME=C:\Project\
    set CVSROOT=:ext:USERNAME@PROJECT_NAME.cvs.sourceforge.net:/cvsroot/PROJECT_NAME
    set CVS_RSH=C:\Project\tool\ssh.exe
    



Nah klo sudah, sekarang coba masuk ke DOS Prompt dan masuk ke dalam folder **C:\Project>** kemudian jalankan script batch yang telah dibuat diatas.


> 
C:\Project> classpath_CVS.bat
C:\Project> set HOME=C:\Project\
C:\Project> set CVSROOT=:ext:USERNAME@PROJECT_NAME.cvs.sourceforge.net:/cvsroot/PROJECT_NAME
C:\Project> set CVS_RSH=C:\Project\tool\ssh.exe




Nah klo sudah, sekarang coba akses ke **shell.sourceforge.net** memakai ssh yang dijalankan dari DOS Prompt, hasilnya nanti mungkin seperti ini:


> 
C:\Project> C:\Project\tool\ssh.exe -l USERNAME shell.sourceforge.net
Password:
Last login: Wed Dec 20 10:08:05 2006 from 203.88.86.46
........
........




Klo sudah berarti ssh-nya sukses, klo dah coba akses ssh ke alamat berikut **PROJECTNAME.cvs.sourceforge.net**, caranya begini:


> 
C:\Project> C:\Project\tool\ssh.exe -l USERNAME PROJECT_NAME.cvs.sourceforge.net
Password:
Last login: Mon Jan 1 08:07:06 2007 from 203.88.86.46

Welcome to *.cvs.sourceforge.net

This is a restricted Shell Account
You cannot execute anything here.

Connection to projectname.cvs.sourceforge.net closed.

C:\Project>




Ok semua langkah kayaknya udah sukses, sekarang masukkan folder project (terutama source code yang mau dipublish di CVS) ke dalam **C:\Project>**. Misalkan disini saya mempunyai folder **ContohAplikasiku**, didalam folder ini isinya source code yang akan saya publish di CVS. Nah nanti struktur foldernya seperti ini:

    
    
    C:/\Project>
       |__ ContohAplikasiku/
       | \_ src/
       |  |_ doc/
       |
       |_ tool
          \_ cvs.exe
          |_ ssh.exe
    



Nah klo sudah import module nya dengan cara sebagai berikut:


> 
C:\Project> C:\Project\tool\cvs.exe import ContohAplikasiku/




Klo sudah coba **checkout** dengan mode anonymous ini cara yang saya lakukan, mungkin ada teman-teman yang bisa memberikan cara yang lebih baik ??? :)

Klo mau lebih mudah sebenarnya bisa memakai [winCVS](http://www.wincvs.org/download.html) yang ga perlu ribet tapi saya konfigurasi di [winCVS](http://www.wincvs.org/download.html) error mulu :( Bisanya cuma dari DOS Prompt yah akhirnya make DOS Prompt, maklum aksesnya pakai komputer warnet :D

Referensi :

* [CVS SourceForge.net FAQ at Phyton Devel Mailing List](http://mail.python.org/pipermail/python-checkins/2000-August/012980.html)


* [CVS Documentation at SourceForge.net](http://sourceforge.net/docs/E04/)


* [Tutorial CVS](http://cvsbook.red-bean.com/)
