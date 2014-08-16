---
comments: true
date: 2007-10-22 08:42:07+00:00
layout: post
slug: membuat-no-urut-di-ireport
title: Membuat No. Urut di iReport
wordpress_id: 18
categories:
- Java
---

Sabtu siang kemarin saya ditanya sama mas [dany](http://dany.web.id/) tentang bagaimana cara membuat nomor urut di Report yang dibuat dengan iReport, berhubung saya sendiri belum pernah coba :malu: akhirnya percakapan saya dengan  mas [dany](http://dany.web.id/) yang berlangsung lewat chatting di YahooMessenger hanya sekedar sharing saja :D dan saya janji untuk mencoba dirumah kemudian menuliskan hasilnya di blog.

Ok sekarang kita langsung saja ke inti permasalahannya yaitu membuat nomor urut pada report yang dibuat menggunakan iReport, sedangkan bahan latihan yang digunakan pada latihan kali ini saya menggunakan **Template** Report yang sama pada posting ["Reporting dengan NetBeans"](http://martinusadyh.web.id/2007/10/12/reporting-dengan-netbeans/) kemarin. Karena report yang kemarin belum terdapat nomor urutnya :D jadi daripada buat baru lagi mending pakai yang lama :P

<!-- more -->
Sedangkan langkah-langkah untuk membuat nomor urut di report yang dihasilkan oleh iReport adalah sebagai berikut:




  1. Pertama-tama buka dahulu report yang telah dibuat [kemarin](http://martinusadyh.web.id/2007/10/12/reporting-dengan-netbeans/) (kalau belum punya silahkan baca dulu posting kemaren tentang ["Reporting dengan NetBeans"](http://martinusadyh.web.id/2007/10/12/reporting-dengan-netbeans/)) seperti tampilan pada gambar dibawah ini:
[![report_template](http://farm3.static.flickr.com/2043/1552396758_948e8a36cd_m.jpg)  
Click to large](http://farm3.static.flickr.com/2043/1552396758_0e705795b5_o.png)



  2. Sekarang tambahkanlah sebuah variabel baru dengan cara memilih menu **View > Variable**, kemudian pada jendela Variable tekanlah tombol **New** untuk menambahkan sebuah variabel baru. Setelah itu pada jendela **Add/Modify Variable** isikanlah sebagai berikut :



    * **Variable Name** NOURUT


    * **Variable Class Type** java.lang.Integer


    * **Calculation Type** count


    * **Reset Type** None


    * **Increment Type** None


    * **Variable Expression** $V{NOURUT}



hingga tampilannya menjadi seperti berikut :
[![isi_variabel_nourut](http://farm3.static.flickr.com/2276/1687212834_0c19c54cfb_m.jpg)  
Click to large](http://www.flickr.com/photos/10243554@N02/1687212834/)
Setelah itu tekanlah OK untuk menutup jendela **Add/Modify Variable** dan tekanlah close pada jendela Variable hingga kembali ke tampilan report template.



  3. Sekarang pada report template tambahkanlah **Static Text** dan **Text Field** kemudian aturlah seperti gambar dibawah ini:
[![tampilan_report_no](http://farm3.static.flickr.com/2113/1686412343_79da354fc0_m.jpg)  
Click to large](http://www.flickr.com/photos/10243554@N02/1686412343/)
Keterangan konfigurasi **Static Text** dan **Text Field** adalah sebagai berikut:


    * Untuk **Static Text**, klik kanan kemudian pilihlah **Properties** kemudian pada jendela **Static Text Properties** pilihlah **Tab Static Text** kemudian isikan **No.** seperti gambar dibawah ini:
[![staticfieldconf](http://farm3.static.flickr.com/2063/1687212904_452e873e2d_m.jpg)  
Click to large](http://www.flickr.com/photos/10243554@N02/1687212904/)



    * Untuk **Text Field**, klik kanan kemudian pilihlah **Properties** kemudian pada jendela **Text Field Properties** pilihlah **Tab Text Field** kemudian isikan sebagai berikut:


      * **Text Field Expression Class** java.lang.Integer


      * **Text Field Expression** $V{NOURUT}


sehingga tampilannya menjadi seperti gambar dibawah ini:
[![textfieldconf](http://farm3.static.flickr.com/2112/1686412377_eeefd7f37a_m.jpg)  
Click to large](http://www.flickr.com/photos/10243554@N02/1686412377/)



Sudah selesai, sekarang coba jalankan dan jika tidak terjadi error maka tampilan report anda akan tampil seperti pada gambar dibawah ini:
[![report_jadi_no](http://farm3.static.flickr.com/2083/1687212876_4e72e363c0_m.jpg)  
Click to large](http://www.flickr.com/photos/10243554@N02/1687212876/)

Hmm... tapi koq ada yang aneh ya ? Angka pertama koq nol bukannya satu ? Ok supaya angka pertama bernilai satu dan bukannya nol, sekarang mari kita buat sebuah parameter yang mempunyai nilai awal = 1 dan akan ditambahkan pada variabel **NOURUT**. Mengapa ditambahkan ke variabel **NOURUT** ? Karena variabel **NOURUT** nilai awalnya = 0 dan parameter yang akan kita buat ini akan dikirimkan setiap kali kita menjalankan reportnya :D (kwkw.. kenapa saya membuat sebuah parameter baru, soalnya saya belum menemukan bagaimana cara meng-**incrementkan** variabel **NOURUT** :( )

Ok untuk cara-cara pembuatan sebuah parameter baru yaitu :


    * Pilih menu **View Parameters** kemudian pada jendela Parameters tekanlah tombol **New** untuk mulai menambahkan parameter baru. Kemudian pada jendela **Add/Modify parameter** isikanlah sebagai berikut:


      * **Parameter Name** DEFA_VALUE


      * **Parameter Class Type** java.lang.Integer


      * **Default Value Expression** new Integer("1")


hingga tampilannya seperti dibawah ini:
[![newparamter](http://farm3.static.flickr.com/2252/1687212858_9ae55f2e97_m.jpg)  
Click to large](http://www.flickr.com/photos/10243554@N02/1687212858/)



    * Setelah menambahkan parameter baru, sekarang editlah **Text Field** yang telah ditambahkan pada langkah ke 3 diatas dengan cara klik kanan kemudian pilihl properties setelah itu pada jendela **Text Field Properties** pilihlah **Tab Text Field** kemudian pada kolom isian **Text Field Expression** isikan seperti dibawah ini:

    
    
    new Integer($V{NOURUT}.intValue()+$P{DEFA_VALUE}.intValue())
    


hingga tampilannya menjadi seperti gambar dibawah ini:
[![edittextfield](http://farm3.static.flickr.com/2149/1687212818_1cd7104872_m.jpg)  
Click to large](http://www.flickr.com/photos/10243554@N02/1687212818/)



Setelah melakukan pengeditan seperti diatas, sekarang coba jalankan lagi report anda dan jika tidak ada error maka tampilan report anda akan tampak seperti gambar dibawah ini:
[![reportfixjadi](http://farm3.static.flickr.com/2213/1687212890_00e11bdaa3_m.jpg)  
Click to large](http://www.flickr.com/photos/10243554@N02/1687212890/)



Hmm... sekarang reportnya sudah mempunyai nomor urut dan kelihatan lebih rapi :) Mudah bukan ?? Silahkan dicoba dan kalau masih bingung silahkan ditanyakan. Kritik, saran dan komentar sangat-sangat ditunggu ;)
