---
comments: true
date: 2010-08-29 02:30:23+00:00
layout: post
slug: installasi-android-sdk-untuk-pengembangan-aplikasi-android
title: Installasi Android SDK Untuk Pengembangan Aplikasi Android
wordpress_id: 969
categories:
- Android
- Java
tags:
- ADT
- Android
- android sdk
- Eclipse
- Java
---
Ingin membuat sebuah aplikasi untuk Android ? Jika iya, maka langkah pertama yang harus kita lakukan yaitu mempersiapkan lingkungan pengembangan pada komputer kita. Sebelum mulai menginstall Android SDK dan teman-teman-nya, pastikan dahulu bahwa SUN JDK 1.6 sudah terinstall pada komputer kita dan pastikan juga variabel **$JAVA_HOME** mengarah pada direktori SUN JDK yang sebenarnya. Jika sudah, sekarang mari kita bahas satu persatu mempersiapkan lingkungan pengembangan Android yang kurang lebih seperti dibawah ini :

  1. Installasi Android SDK
  2. Installasi Plugin Android Development Tools (ADT) Pada Eclipse 3.5.2 (Galileo) Classic
  3. Konfigurasi Plugin ADT Pada Eclipse 3.5.2 (Galileo)

Masih tertarik ingin membuat sebuah aplikasi untuk Android ? Jika iya, mari kita lanjutkan pembahasan-nya lebih detail lagi seperti dibawah ini :
<!-- more -->


  1. **Installasi Android SDK**

Untuk menginstall Android SDK, silahkan mengunjungi alamat [http://developer.android.com/sdk/index.html](http://developer.android.com/sdk/index.html) dan download-lah yang sesuai dengan sistem operasi yang digunakan. Jika menggunakan GNU/Linux, caranya adalah sebagai berikut :

    martinus@martinusadyh:[~]$ wget -c http://dl.google.com/android/android-sdk_r06-linux_86.tgz
    --2010-08-29 05:23:06--  http://dl.google.com/android/android-sdk_r06-linux_86.tgz
    Resolving dl.google.com... 64.233.181.190, 64.233.181.91, 64.233.181.93, ...
    Connecting to dl.google.com|64.233.181.190|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 16971139 (16M) [application/x-tar]
    Saving to: `android-sdk_r06-linux_86.tgz'
    
    100%[================================================================================================================================>] 16,971,139  73.5K/s   in 4m 16s  
    
    2010-08-29 05:27:23 (64.8 KB/s) - `android-sdk_r06-linux_86.tgz' saved [16971139/16971139]
    
    martinus@martinusadyh:[~]$


Proses download sudah selesai, sekarang ekstrak pada direktori yang diinginkan (jika menggunakan windows bisa diekstrak pada `C:\>` atau `/home/[nama-user]` jika menggunakan GNU/Linux) yang nantinya akan membuat sebuah direktori seperti `C:\android-sdk-windows_86` di Windows atau `/home/[nama-user]/android-sdk-linux_86` jika menggunakan GNU/Linux.

Jika proses ekstrak sudah selesai, sekarang downloadlah Android Component dengan cara masuklah pada direktori `/home/[nama-user]/android-sdk-linux_86/tools` melalui terminal dan jalankan perintah `android` seperti dibawah ini :

    martinus@martinusadyh:[~]$ cd android-sdk-linux_86/tools/
    martinus@martinusadyh:[~/android-sdk-linux_86/tools]$ android 
    Starting Android SDK and AVD Manager
    No command line parameters provided, launching UI.
    See 'android --help' for operations from the command line.

Setelah kita mengetikkan `android` pada terminal, maka tidak lama akan muncul **Android SDK and AVD Manager**. Untuk menginstall dan menambahkan komponen, sekarang pilihlah menu **Available Packages** dan pilihlah semua opsi yang terdapat pada menu sebelah kanan seperti gambar dibawah ini :
{% img /images/blog-images/Java_NetBeans/InstallasiAndroidSDKUntukPengembanganAplikasiAndroid/AndroidComponent.png Menambahkan Android Component %}
**Menambahkan Android Component**

Kemudian tekanlah tombol **Install Selected** dan pilihlah opsi **Accept All** pada dialog **Choose Packages to Install** setelah itu baru tekan tombol **Install** seperti dibawah ini :
{% img /images/blog-images/Java_NetBeans/InstallasiAndroidSDKUntukPengembanganAplikasiAndroid/ChoosePackagesToInstall.png ChoosePackagesToInstall %}
**Menambahkan Android Component**

Tunggu sampai proses download selesai dan jika sudah proses installasi Android SDK ini bisa dikatakan sudah selesai. Sekarang mari kita lanjut ke tahapan selanjut-nya ;)

  2. **Installasi Plugin Android Development Tools (ADT) Pada Eclipse 3.5.2 (Galileo) Classic**

Karena ADT ini merupakan sebuah plugin pada Eclipse, maka pastikan dahulu anda menginstall Eclipse yang sesuai yaitu **Eclipse 3.5.2 (Galileo) Classic** yang bisa kita download dari [http://www.eclipse.org/downloads/](http://www.eclipse.org/downloads/). (Aneh kenapa plugin ADT ini tidak jalan ya di Eclipse Helios versi EE ??? Ada yang sudah pernah mencoba di Helios ???) Jika proses installasi Eclipse sudah selesai, sekarang installah plugin ADT ini dengan cara pilihlah menu **Help > Install New Software** dan masukkanlah alamat [https://dl-ssl.google.com/android/eclipse/](https://dl-ssl.google.com/android/eclipse/) pada field **Work with** kemudian tekan **ENTER** dan tunggulah beberapa saat sampai muncul plugin **Developer Tools** dan berilah tanda centang seperti dibawah ini :
{% img /images/blog-images/Java_NetBeans/InstallasiAndroidSDKUntukPengembanganAplikasiAndroid/AndroidDevelopmentTools.png Installasi Plugin ADT Pada Eclipse %}
**Installasi Plugin ADT Pada Eclipse**

Tekanlah tombol **Next** hingga plugin **Android Development Tools** ter-install pada Eclipse kemudian restartlah Eclipse agar plugin **Android Development Tools** dapat segera digunakan :)


> 
Jika proses installasi plugin ADT diatas mengalami masalah seperti dibawah ini :

>
>> 
Cannot complete the install because one or more required items could not be found.
Software being installed: Android Development Tools 0.9.7.v201005071157-36220 (com.android.ide.eclipse.adt.feature.group 0.9.7.v201005071157-36220)
Missing requirement: Android Development Tools 0.9.7.v201005071157-36220 (com.android.ide.eclipse.adt.feature.group 0.9.7.v201005071157-36220) requires 'org.eclipse.gef 0.0.0' but it could not be found

> 
> 

Maka cara pemecahan-nya yaitu install-lah dahulu plugin **WST Server Adapters** dengan cara pilihlah menu **Help > Install New Software** dan masukkanlah alamat [http://download.eclipse.org/releases/galileo/](http://download.eclipse.org/releases/galileo/) pada field **Work with** kemudian tekan **ENTER** tunggu sampai menampilkan daftar plugin lalu ketikkan **WST Server Adapters** pada field **Type Filter Text** seperti dibawah ini :
{% img /images/blog-images/Java_NetBeans/InstallasiAndroidSDKUntukPengembanganAplikasiAndroid/InstallWST.png Installasi Plugin WST Server Adapters Pada Eclipse %}
**Installasi Plugin WST Server Adapters Pada Eclipse**

Jika sudah selesai, restartlah Eclipse-nya dan lanjutkan untuk menginstall plugin ADT :)




Sampai disini proses installasi Plugin sudah bisa dikatakan selesai :)




  3. **Konfigurasi Plugin ADT Pada Eclipse 3.5.2 (Galileo)**

Jika proses installasi plugin ADT berjalan dengan lancar, maka langkah selanjutnya yaitu menentukan lokasi **Android SDK** dengan cara pilihlah menu **Window > Preferences** dan pilihlah menu **Android** pada panel sebelah kiri seperti gambar dibawah ini :
{% img /images/blog-images/Java_NetBeans/InstallasiAndroidSDKUntukPengembanganAplikasiAndroid/PreferencesAndroid.png Konfigurasi Plugin ADT %}
**Konfigurasi Plugin ADT**

Pada jendela **Preferences** diatas, tekanlah tombol **Browse** dan arahkan pada tempat dimana kita menginstall **Android SDK** kemudian tekanlah tombol **Apply** hingga tampilannya seperti gambar dibawah ini :
{% img /images/blog-images/Java_NetBeans/InstallasiAndroidSDKUntukPengembanganAplikasiAndroid/gambar_preferences_android2.png gambar_preferences_android2 %}  
**Tampilan Android SDK Yang Sudah Dikenali**

Jika sudah sekarang mari kita konfigurasi **Android Virtual Device (ADV)** melalui menu **Window > Android SDK and ADV Manager** seperti gambar dibawah ini :
{% img /images/blog-images/Java_NetBeans/InstallasiAndroidSDKUntukPengembanganAplikasiAndroid/JendelaADV.png Dialog Konfigurasi Android Virtual Device %}
**Dialog Konfigurasi Android Virtual Device**

Pada dialog **Android SDK and ADV Manager** tekanlah tombol **New** pada panel sebelah kanan dan isikan Nama Virtual Device serta pilihlah versi Android yang ingin di simulasikan pada field Target seperti dibawah ini setelah itu tekanlah tombol **Create AVD** :
{% img /images/blog-images/Java_NetBeans/InstallasiAndroidSDKUntukPengembanganAplikasiAndroid/AndroidVD.png Konfigurasi Android Virtual Device %}
**Konfigurasi Android Virtual Device**


Proses installasi Android SDK dan konfigurasi plugin ADT pada Eclipse sudah selesai, nah sekarang untuk mengetest apakah hasil installasi ini berjalan dengan sukses atau tidak. Cobalah untuk membuat sebuah project baru yang berbasis pada direktori **[android-sdk-home]/samples/**, dan jika tidak ada masalah maka kita akan dapat menjalankan salah satu project samples seperti dibawah ini :
{% img /images/blog-images/Java_NetBeans/InstallasiAndroidSDKUntukPengembanganAplikasiAndroid/SnakeAndroidSampleProject.png Android Emulator Menjalankan Sample Project Snake %}
**Android Emulator Menjalankan Sample Project Snake**

Nah setelah perlengkapan perang kita sudah siap, sekarang waktu-nya untuk mempelajari lebih dalam lagi bagaimana membuat sebuah aplikasi untuk Android :D Sekarang, waktu-nya untuk belajar dahulu ya teman-teman  :senyum: 

**Referensi-referensi terkait :**

  1. [Android Installation Problem](http://blog.tobsen.de/2009/12/android-sdk-installationsprobleme.html)
  2. http://developer.android.com/