---
comments: true
date: 2013-04-23 05:22:15+00:00
layout: post
slug: step-by-step-apache-tomcat-ssl-configuration
title: Step by step Apache Tomcat SSL Configuration
wordpress_id: 2706
categories:
- Java
keywords: "Apache, https, Java, Single Sign On, SSL, Tomcat"
description: "Sedang bingung bagaimana mengaktifkan fitur SSL (Secure Sockets Layer) pada Apache Tomcat? Jika iya, pada tulisan kali ini mari kita bahas bagaimana mengkonfigurasi Apache Tomcat"
tags:
- Apache
- https
- Java
- Single Sign On
- SSL
- Tomcat
---

Sedang bingung bagaimana mengaktifkan fitur **SSL _(Secure Sockets Layer)_** pada [Apache Tomcat](http://tomcat.apache.org/) ? Jika iya, pada tulisan kali ini mari kita bahas bagaimana mengkonfigurasi **Apache Tomcat** yang kita gunakan agar bisa mendukung fitur **SSL** ini. Pada tulisan kali ini sistem operasi yang digunakan adalah **GNU/Linux Ubuntu 12.04** sehingga semua proses konfigurasi dan installasi aplikasi akan mengikuti cara kerja dan struktur direktori milik Ubuntu :) Supaya lebih memudahkan, maka tulisan kali ini akan dibagi menjadi beberapa tahapan yang kurang lebih sebagai berikut :




  1. **Installasi Java Development Kit**,
Sebelum melakukan installasi **JDK**, ada baiknya kita mengecek dahulu apakah di sistem kita sebelumnya sudah terinstall **java (baik JRE maupun JDK)** dengan versi yang lain. Pastikan bahwa kita hanya mempunyai 1 versi **java** saja yang terinstall, jalankan perintah dibawah ini untuk melakukan pengecekan versi **Java** yang terinstall pada sistem kita :
```
server@pangrango# dpkg --get-selections | grep jdk
```
**Catatan**: Jika ditemukan, hapus semua dengan menggunakan perintah sudo apt-get remove _nama-package_

Dan pastikan juga didalam direktori `/usr/lib/jvm/` kosong, semua proses ini kita lakukan supaya kita tidak bingung apakah certificate kita terbaca atau tidak oleh **Apache Tomcat**. Jika sudah sekarang lakukan installasi java dengan mengetikkan perintah `sudo apt-get install openjdk-7-jdk`, dan kalau sudah lakukan pengecekkan dengan mengetikkan perintah `java -version` atau `javac -version`. 
<!-- more -->



  2. **Pembuatan Certificate**
Untuk membuat **certificate** kita bisa menggunakan perintah `keytool`, yang perlu diperhatikan pada langkah ini adalah isikan kolom isian **What is your first and last name?** dengan **hostname** tempat **Apache Tomcat** di install. Cara paling mudah untuk mengetahui **hostname** adalah dengan mengetikkan perintah `hostname` seperti dibawah ini :
```
server@pangrango:~$ hostname
pangrango
server@pangrango:~$ 
```

Setelah mengetahui **hostname** kita, sekarang mari kita buat sebuah certificate dengan menjalankan perintah `keytool -genkey -alias tomcat -keypass changeit -keyalg RSA -validity 730` seperti dibawah ini :
```
server@pangrango:~$ keytool -genkey -alias tomcat -keypass changeit -keyalg RSA -validity 730
Enter keystore password:  
Re-enter new password: 
What is your first and last name?
  [Unknown]:  pangrango
What is the name of your organizational unit?
  [Unknown]:  s2gis-dev
What is the name of your organization?
  [Unknown]:  S2GIS
What is the name of your City or Locality?
  [Unknown]:  Jakarta
What is the name of your State or Province?
  [Unknown]:  Jakarta
What is the two-letter country code for this unit?
  [Unknown]:  ID
Is CN=pangrango, OU=s2gis-dev, O=S2GIS, L=Jakarta, ST=Jakarta, C=ID correct?
  [no]:  yes
  
server@pangrango:~$ 
```
**Catatan**: Kolom isian keystore password dan keypass harus sama

Proses pembuatan certificate sudah selesai, sekarang mari kita import dengan menjalankan perintah seperti dibawah ini :
```
server@pangrango:~$ keytool -export -alias tomcat -keypass changeit -file /tmp/server.crt
Enter keystore password:  
Certificate stored in file 
server@pangrango:~$ 
```

Dan langkah terakhir yang harus kita lakukan adalah menambahkan certificate yang sudah kita buat kedalam **keystore** di **java** dengan mengetikkan perintah seperti dibawah ini :
```
server@pangrango:~$ sudo keytool -import -file /tmp/server.crt -keypass changeit -keystore /usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/cacerts 
Enter keystore password:  
Owner: CN=pangrango, OU=s2gis-dev, O=S2GIS, L=Jakarta, ST=Jakarta, C=ID
Issuer: CN=pangrango, OU=s2gis-dev, O=S2GIS, L=Jakarta, ST=Jakarta, C=ID
Serial number: 4299a11a
Valid from: Tue Apr 23 09:41:00 WIT 2013 until: Thu Apr 23 09:41:00 WIT 2015
Certificate fingerprints:
	 MD5:  B5:C9:09:67:8C:F0:31:DE:C2:66:94:CA:7E:E7:94:43
	 SHA1: E4:4A:BD:A3:90:C5:10:C6:6B:88:64:5C:C8:FA:E6:9F:29:31:51:A9
	 SHA256: 80:FA:D2:9F:CC:FF:25:79:1A:4D:16:31:72:98:40:F8:D3:72:B5:C8:4A:65:08:0E:52:CE:36:3B:C5:DF:4C:F6
	 Signature algorithm name: SHA256withRSA
	 Version: 3

Extensions: 

#1: ObjectId: 2.5.29.14 Criticality=false
SubjectKeyIdentifier [
KeyIdentifier [
0000: 24 82 41 37 6B 3E 76 F7   FE C2 89 35 02 44 F1 37  $.A7k>v....5.D.7
0010: 08 68 F1 EE                                        .h..
]
]

Trust this certificate? [no]:  yes
Certificate was added to keystore
server@pangrango:~$ 
```



  3. **Installasi dan Konfigurasi SSL Apache Tomcat**
Installasi Java dan pembuatan certificate sudah selesai, sekarang mari kita install **Apache Tomcat**-nya dengan mengetikkan perintah `sudo apt-get install tomcat7`. Tunggulah beberapa saat hingga proses installasi selesai, jika sudah selesai matikan service tomcatnya dengan perintah `sudo /etc/init.d/tomcat7 stop` kemudian copy-lah file `.keystore` ke direktori `/usr/share/tomcat7/` dengan perintah seperti berikut :

```
server@pangrango:~$ sudo cp .keystore /usr/share/tomcat7/
server@pangrango:~$ ls -al /usr/share/tomcat7
total 36
drwxr-xr-x   4 root root  4096 Mar 27 15:52 .
drwxr-xr-x 275 root root 12288 Mar 27 13:49 ..
drwxr-xr-x   2 root root  4096 Mar 27 13:49 bin
-rw-r--r--   1 root root    39 Jul 13  2012 defaults.md5sum
-rw-r--r--   1 root root  1960 Jul 13  2012 defaults.template
-rw-r--r--   1 root root  2247 Mar 27 15:52 .keystore
drwxr-xr-x   2 root root  4096 Mar 27 13:49 lib 
```

Jika sudah sekarang editlah file `/var/lib/tomcat7/conf/server.xml` dan carilah baris dibawah ini :

```xml
<!-- 
    <Connector port="8443" protocol="HTTP/1.1" SSLEnabled="true"
               maxThreads="150" scheme="https" secure="true"
               clientAuth="false" sslProtocol="TLS" />
-->
```

kemudian edit hingga menjadi seperti dibawah ini :

```xml
    <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol" SSLEnabled="true"
               maxThreads="150" scheme="https" secure="true"
               clientAuth="false" sslProtocol="TLS" 
               keystoreFile="/usr/share/tomcat7/.keystore"
               keystorePass="changeit" />
```


Setelah melakukan perubahan diatas, simpan dan jalankan **Apache Tomcat**-nya dengan mengetikkan perintah `sudo /etc/init.d/tomcat7 start && tail -f /var/log/tomcat7/catalina.out` seperti dibawah ini :

```
server@pangrango:~$ sudo /etc/init.d/tomcat7 start && tail -f /var/log/tomcat7/catalina.out 
 * Starting Tomcat servlet engine tomcat7                                                                                                                        [ OK ] 
Mar 27, 2013 4:01:36 PM org.apache.catalina.core.StandardService startInternal
INFO: Starting service Catalina
Mar 27, 2013 4:01:36 PM org.apache.catalina.core.StandardEngine startInternal
INFO: Starting Servlet Engine: Apache Tomcat/7.0.26
Mar 27, 2013 4:01:36 PM org.apache.catalina.startup.HostConfig deployDirectory
INFO: Deploying web application directory /var/lib/tomcat7/webapps/ROOT
Mar 27, 2013 4:01:37 PM org.apache.coyote.AbstractProtocol start
INFO: Starting ProtocolHandler ["http-bio-8080"]
Mar 27, 2013 4:01:37 PM org.apache.catalina.startup.Catalina start
INFO: Server startup in 1040 ms
```

Dan sekarang bukalah sebuah browser dan arahkan ke alamat `https://localhost:8443`, jika tidak ada kesalahan maka kita akan melihat tampilan seperti screenshot dibawah ini :

{% imgcap /images/blog-images/Java_NetBeans/StepbystepApacheTomcatSSLConfiguration/TampilanAwalHTTPS.png 300 168 Tampilan Awal Ketika Membuka Halaman Https %}

{% imgcap /images/blog-images/Java_NetBeans/StepbystepApacheTomcatSSLConfiguration/TambahkanSecurityException.png 300 168 Tambahkan Security Exception %}

{% imgcap /images/blog-images/Java_NetBeans/StepbystepApacheTomcatSSLConfiguration/SSLSukses.png 300 168 Konfigurasi SSL Berhasil %}

Bagaimana mudah bukan ? :)

**Referensi-referensi:**




  1. [SSL Configuration How-To](http://tomcat.apache.org/tomcat-6.0-doc/ssl-howto.html)


  2. [Setting SSL Tomcat 5 minutes](http://java.dzone.com/articles/setting-ssl-tomcat-5-minutes)



