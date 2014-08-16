---
comments: true
date: 2009-03-28 09:24:31+00:00
layout: post
slug: instalasi-openoffice-301-di-opensolaris-200811
title: Instalasi OpenOffice 3.0.1 di OpenSolaris 2008.11
wordpress_id: 46
categories:
- OpenSolaris
---

Buat teman-teman yang ingin menginstall OpenOffice tapi tidak mempunyai koneksi internet untuk melakukan proses installasi via IPS (Image Packaging System)-nya OpenSolaris, bisa melakukan proses installasi secara manual yaitu dengan mendownload source codenya langsung dari situs OpenOffice dan prosesnya juga mudah koq :) Sebelum mulai menginstall OpenOffice-nya, install dulu JRE (Java Runtime Enviroment) nah baru kemudian download-lah installer OpenOffice dari [sini](http://download.openoffice.org/other.html#en-US)

Nah kalau proses download sudah selesai, sekarang ektrak dengan perintah seperti dibawah ini :

    
    
    martin@opensolarisbox:~/Desktop/OpenOffice$ tar zxvf OOo_3.0.1_Solarisx86_install_wJRE_en-US.tar.gz
    ............
    ............
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/pkginfo
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/archive/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/archive/none.bz2
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/pkgmap
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/reloc/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/reloc/opt/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/reloc/opt/openoffice.org3/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/reloc/opt/openoffice.org3/licenses/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/reloc/opt/openoffice.org3/share/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/reloc/opt/openoffice.org3/share/readme/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/reloc/opt/openoffice.org3/program/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/reloc/opt/openoffice.org3/program/resource/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/reloc/opt/openoffice.org3/readmes/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/install/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/install/copyright
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/install/depend
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-en-US/install/i.none
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-math/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-math/pkgmap
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-math/pkginfo
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-math/reloc/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-math/reloc/opt/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-math/reloc/opt/openoffice.org3/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-math/reloc/opt/openoffice.org3/program/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-math/install/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-math/install/i.none
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-math/install/copyright
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-math/install/depend
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-math/archive/
    OOO300_m15_native_packed-1_en-US.9379/packages/openofficeorg3-math/archive/none.bz2
    OOO300_m15_native_packed-1_en-US.9379/licenses/
    OOO300_m15_native_packed-1_en-US.9379/licenses/LICENSE_en-US
    OOO300_m15_native_packed-1_en-US.9379/licenses/LICENSE_en-US.html
    OOO300_m15_native_packed-1_en-US.9379/update
    OOO300_m15_native_packed-1_en-US.9379/readmes/
    OOO300_m15_native_packed-1_en-US.9379/readmes/README_en-US
    OOO300_m15_native_packed-1_en-US.9379/readmes/README_en-US.html
    OOO300_m15_native_packed-1_en-US.9379/JavaSetup.jar
    


<!-- more -->
Setelah selesai di ekstrak, sekarang masuklah ke dalam direktori **OOO300_m15_native_packed-1_en-US.9379** dengan mengetikkan perintah seperti dibawah ini:

    
    
    martin@opensolarisbox:~/Desktop/OpenOffice$ cd OOO300_m15_native_packed-1_en-US.9379/
    martin@opensolarisbox:~/Desktop/OpenOffice/OOO300_m15_native_packed-1_en-US.9379$
    



Sekarang coba jalankan perintah **java -jar JavaSetup.jar** seperti gambar dibawah ini :
[![OO_Instal1](http://farm4.static.flickr.com/3122/3391074977_5680538855.jpg)  
Installasi OpenOffice butuh akses root](http://www.flickr.com/photos/10243554@N02/3391074977/)

Nah jika keluar tampilan seperti gambar diatas, berarti kita harus menginstall OpenOffice dengan mode **root** atau super user. Sekarang gantilah akses user anda menjadi root dengan mengetikkan **su** kemudian jalankanlah lagi perintah **java -jar JavaSetup.jar**. Tunggu beberapa saat, harusnya saat ini anda akan melihat tampilan seperti gambar dibawah ini :
[![OO_Instal2](http://farm4.static.flickr.com/3460/3391890666_c0de3d16c6.jpg)  
Panel Instalasi OpenOffice](http://www.flickr.com/photos/10243554@N02/3391890666/)

Sedangkan untuk proses step by step installasinya bisa dilihat seperti pada screenshot dibawah ini :
[![OO_Instal3](http://farm4.static.flickr.com/3248/3391890668_471944991e.jpg)  
Tipe Installasi OpenOffice Custom/Typical](http://www.flickr.com/photos/10243554@N02/3391890668/)

[![OO_Instal4](http://farm4.static.flickr.com/3539/3391890680_37bd29ff3f.jpg)  
Mode Installasi Custom](http://www.flickr.com/photos/10243554@N02/3391890680/)

[![OO_Instal5](http://farm4.static.flickr.com/3645/3391890682_437fc4769c.jpg)  
Daftar paket OpenOffice yang akan di install](http://www.flickr.com/photos/10243554@N02/3391890682/)

[![OO_Instal6](http://farm4.static.flickr.com/3643/3391890686_4bee002a26.jpg)  
Proses Installasi OpenOffice](http://www.flickr.com/photos/10243554@N02/3391890686/)

[![OO_Instal7](http://farm4.static.flickr.com/3576/3391890688_899cdb3669.jpg)  
Proses Installasi OpenOffice Berhasil](http://www.flickr.com/photos/10243554@N02/3391890688/)

[![OO_Instal8](http://farm4.static.flickr.com/3548/3391897874_6d19181a57.jpg)  
Tampilan Depan OpenOffice ](http://www.flickr.com/photos/10243554@N02/3391897874/)

[![OO_Instal9](http://farm4.static.flickr.com/3623/3391897876_96b57ebe32.jpg)  
Panel About OpenOffice](http://www.flickr.com/photos/10243554@N02/3391897876/)

Hm... keren juga yah OpenOffice 3.0 :)
