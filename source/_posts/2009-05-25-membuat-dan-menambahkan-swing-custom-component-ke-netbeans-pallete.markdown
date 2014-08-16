---
comments: true
date: 2009-05-25 18:47:02+00:00
layout: post
slug: membuat-dan-menambahkan-swing-custom-component-ke-netbeans-pallete
title: Membuat dan Menambahkan Swing Custom Component Ke NetBeans Pallete
wordpress_id: 41
categories:
- Java
- NetBeans
tags:
- java swing netbeans
---

Mungkin ada diantara teman-teman yang sudah pernah membikin sebuah custom komponen di Java Swing, nah ada baiknya juga kalau custom komponen tersebut bisa kita pakai secara berulang-ulang dan kita tinggal melakukan proses **drag-n-drop** saja dari NetBeans Pallete ketika kita ingin menggunakannya. Tentunya lebih mudah bukan dengan proses seperti itu, daripada kita harus manual menulis kode untuk komponen yang sudah kita bikin :)

Sedangkan untuk mulai membuat sebuah Swing komponen yang bisa ditampilkan pada NetBeans Pallete, ada beberapa langkah yang harus kita lakukan yaitu :
1. Konfigurasi Project. (Pembuatan custom komponen memerlukan setting project **khusus** menurut saya loh ini :D ) 
2. Menulis Kode Yang Ingin Di Jadikan Sebagai Custom Komponen.
3. Konfigurasi Icon dan Membuat Class BeanInfo
4. Edit File Manifest.mf
5. Build dan sebarkan :)
6. Menambahkan Ke NetBeans Pallete

Nah setelah kita tahu langkah-langkah yang harus kita lakukan, maka siapkan dahulu sebungkus Marlboro Putih dan segelas susu coklat untuk menemani perjalanan ke planet Java dan mari kita mulai dari langkah pertama :)
<!-- more -->





  1. **Konfigurasi Project**.
Sekarang buatlah sebuah project Java dengan nama project **MartinSwingUtil** (nama project terserah sesuai dengan keinginan masing-masing pembaca, tetapi dalam contoh ini nama project yang digunakan adalah **MartinSwingUtil**) hingga tampilannya seperti gambar dibawah ini :
[![Project1](http://farm4.static.flickr.com/3303/3562842167_589c36240a.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3562842167/)

Dari tampilan diatas, memang tidak ada yang spesial karena hanya menampilkan **New Project** biasa. Sekarang bukalah pallete **File Explorer** kemudian buatlah 2 buah direktori yaitu **beaninfo** dan **component** didalam direktori **src** hingga tampilannya menjadi seperti gambar dibawah ini :
[![Project2](http://farm4.static.flickr.com/3640/3562842173_83f5a9cc2e.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3562842173/)

Tujuan utama kita membuat 2 buah direktori diatas adalah sebagai berikut :
- Direktori **beaninfo** ini digunakan untuk menyimpan seluruh informasi bean dari seluruh custom komponen yang kita buat.
- Direktori **component** ini digunakan untuk menyimpan seluruh class custom komponen kita

Setelah membuat 2 buah direktori, sekarang kembalilah ke **Project Explorer** kemudian klik kanan pada **Project Node** dan pilihlah **Properties** seperti gambar dibawah ini :
[![Project3](http://farm4.static.flickr.com/3553/3562842177_b05a5452c3.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3562842177/)

Sekarang hapuslah isi dari tabel **Source Package Folders** kemudian tambahkanlah direktori **beaninfo** dan **component** yang terdapat didalam direktori **src** hingga menjadi seperti gambar dibawah ini :
[![Project4](http://farm4.static.flickr.com/3366/3562842183_2e4d4e00ca.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3562842183/)

Sampai langkah ini, proses konfigurasi project sudah selesai sekarang mari kita lanjutkan pada langkah ke 2 yaitu Menulis Kode Yang Ingin Di Jadikan Sebagai Custom Komponen.





  2. ** Menulis Kode Yang Ingin Di Jadikan Sebagai Custom Komponen**
Pada posting saya yang [kemarin](http://martinusadyh.web.id/2008/09/09/dropdownbutton-di-java-swing/), saya pernah menulis bagaimana cara membuat sebuah [DropDownButton](http://martinusadyh.web.id/2008/09/09/dropdownbutton-di-java-swing/) pada Java Swing dan class tersebut saya beri nama **MDropDownButton**. Nah pada tulisan ini, kita akan menggunakan kode tersebut untuk contohnya. Karena custom komponen yang saya posting kemarin termasuk dalam kategori **Button**, sekarang buatlah sebuah packages **id.web.martinusadyh.button** (untuk nama packages terserah sesuai dengan keinginan masing-masing pembaca) pada direktori **src/component** seperti gambar dibawah ini :
[![Project5](http://farm4.static.flickr.com/3360/3562874601_a23c0fe61c.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3562874601/)

Setelah membuat sebuah packages, sekarang buatlah sebuah **Java Class** kemudian pastekanlah kode yang terdapat pada posting [kemarin](http://martinusadyh.web.id/2008/09/09/dropdownbutton-di-java-swing/) hingga tampilannya menjadi seperti gambar dibawah ini :
[![Project6](http://farm3.static.flickr.com/2465/3562874603_d3e7cb41b5.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3562874603/)

Karena class **MDropDownButton** membutuhkan sebuah icon, simpanlah dahulu gambar **popuparrow.gif** dibawah ini :
![popuparrow](http://farm4.static.flickr.com/3367/3562842159_64993ed7b1_o.gif)

Setelah menyimpan gambar diatas, sekarang buatlah sebuah packages **id.web.martinusadyh.images** kemudian pastekanlah gambar **popuparrow.gif** pada packages yang telah dibuat hingga menjadi seperti gambar dibawah ini :
[![Project7](http://farm4.static.flickr.com/3417/3562874609_45a02cd159.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3562874609/)

Ok custom komponen kita sekarang sudah siap untuk digunakan, cuma masih belum mempunyai icon ketika kita tambahkan ke dalam NetBeans Pallete. Sekarang mari kita lanjutkan ke langkah berikutnya.




  3. **Konfigurasi Icon dan Membuat Class BeanInfo**
Agar custom komponen kita mempunyai icon ketika kita tambahkan ke dalam NetBeans Pallete, kita harus membuat dahulu sebuah class yang merupakan turunan dari class **java.beans.SimpleBeanInfo** . Sekarang buatlah 2 buah packages pada direktori **src/beaninfo** seperti gambar dibawah ini :
[![Project8](http://farm4.static.flickr.com/3623/3562874611_0d8c166d57.jpg)](http://www.flickr.com/photos/10243554@N02/3562874611/)

Sekarang carilah icon untuk custom komponen kita, sedangkan untuk ukurannya sebaiknya gunakan yang 16X16 pixel. Dan sebagai contoh simpanlah gambar **MDropDownButton.gif** dibawah ini :
![MDropDownButton](http://farm4.static.flickr.com/3617/3562842145_100c6bd9dc_o.gif)

kemudian pastekanlah gambar **MDropDownButton.gif** pada packages **id.web.martinusadyh.images** hingga tampilannya seperti gambar dibawah ini :
[![Project9](http://farm4.static.flickr.com/3621/3562874619_bcd2bf8382.jpg)](http://www.flickr.com/photos/10243554@N02/3562874619/)

Setelah selesai dengan icon, sekarang buatlah sebuah class dengan nama **MDropDownButtonBeanInfo** pada packages **id.web.martinusadyh.button** yang merupakan turunan dari **java.beans.SimpleBeanInfo** kemudian pastekanlah kode dibawah ini :

    
    
     */
    public class MDropDownButtonBeanInfo extends java.beans.SimpleBeanInfo {
    
        @Override
        public java.awt.Image getIcon(int iconKind) {
            return loadImage("/id/web/martinusadyh/images/MDropDownButton.gif");
        }
    }
    



Nah hasil akhir dari semua proses yang sudah kita lewati adalah seperti gambar dibawah ini :
[![Project10](http://farm3.static.flickr.com/2437/3562874625_163258b3f0.jpg)](http://www.flickr.com/photos/10243554@N02/3562874625/)





  4. ** Edit File Manifest.mf**
Agar custom komponen yang sudah kita buat di kenal sebagai **Java Beans** kita harus mendaftarkan-nya pada file **Manifest.mf**, dan sekarang bukalah **File Explorer** dan double klik pada file **Manifest.mf** kemudian editlah menjadi seperti dibawah ini :

    
    
    Manifest-Version: 1.0
    X-COMMENT: Main-Class will be added automatically by build
    
    Name: id/web/martinusadyh/button/MDropDownButton.class
    Java-Beans: True
    
    Name: id/web/martinusadyh/button/MDropDownButtonBeanInfo.class
    Java-Bean: False
    







  5. **Build dan sebarkan :)**
Selesai, sekarang coba lakukan proses **Clean and Build** dengan menekan kombinasi tombol **SHIFT+F11** untuk mendapatkan file jar yang siap di distribusikan :)




  6. **Menambahkan ke NetBeans Pallete**
Setelah selesai membuat custom komponen, sekarang mari kita coba dengan menambahkannya ke NetBeans Pallete. Dan untuk mengetesnya buatlah sebuah project baru kemudian tambahkanlah sebuah **Main Form** dan bukalah **Main Form** tersebut pada **Design Mode** seperti gambar dibawah ini :
[![Project11](http://farm4.static.flickr.com/3651/3563853708_8795f9fa13.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3563853708/)

Masuklah ke **Pallete Manager** dengan cara klik kanan pada **Pallete** kemudian pilihlah **Pallete Manager** seperti gambar dibawah ini :
[![Project12](http://farm4.static.flickr.com/3346/3563853718_ecef8c3d67.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3563853718/)

Sekarang buatlah kategori baru dengan menekan tombol **New Category** kemudian isikan **MartinSwingUtil** seperti gambar dibawah ini :
[![Project13](http://farm4.static.flickr.com/3408/3563853728_06e7996f6c.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3563853728/)

Setelah itu tekanlah tombol **Add from JAR** kemudian arahkanlah ke direktori yang menyimpan file **MartinSwingUtil.jar** seperti gambar dibawah ini :
[![Project14](http://farm4.static.flickr.com/3383/3563853742_d9ce79f2c3.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3563853742/)

Pada jendela berikutnya, pilihlah **MDropDownButton** pada panel **Availlable Component** seperti gambar dibawah ini :
[![Project15](http://farm4.static.flickr.com/3358/3563853744_2a6268ff4a.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3563853744/)

Kemudian pada jendela **Select Pallete Category ** pilihlah **MartinSwingUtil** kemudianlah tekanlah tombol **Finish** seperti gambar dibawah ini :
[![Project16](http://farm4.static.flickr.com/3643/3563853748_679d3662cf.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3563853748/)

Setelah mengikuti langkah diatas, harusnya di NetBeans Pallete sekarang sudah muncul seperti gambar dibawah ini :
[![Project17](http://farm3.static.flickr.com/2165/3563911220_4138b10355.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/3563911220/)




Nah mudah bukan caranya membuat sebuah custom komponen kemudian menambahkannya ke dalam NetBeans Pallete ? :)

**Link-link terkait :**




  1. [SubVersion Mudah Dengan RabbitVCS](http://martinusadyh.web.id/2010/03/13/subversion-mudah-dengan-rabbitvcs/)


