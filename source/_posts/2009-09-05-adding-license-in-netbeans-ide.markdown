---
comments: true
date: 2009-09-05 06:43:54+00:00
layout: post
slug: adding-license-in-netbeans-ide
title: Adding License in NetBeans IDE
wordpress_id: 66
categories:
- Java
- NetBeans
- OpenSolaris
- Slackware
---

Mau bikin project opensource ? Kalau iya, kita harus pikirkan juga donk lisensi untuk source code yang ingin kita opensource-kan :) Buat teman-teman pengguna NetBeans IDE, pasti pernah donk melihat potongan souce code seperti dibawah ini  :

    
    
    /*
     * To change this template, choose Tools | Templates
     * and open the template in the editor.
     */
    



Yups.. tampilan kode diatas adalah tampilan standart dari NetBeans IDE setiap kita membuat sebuah file Java baru, nah bagaimana jika kita ingin menambahkan lisensi untuk source code kita menjadi seperti dibawah ini :

    
    
    /*
     * Copyright (c) 2009, Martinus Ady H <mrt.itnewbies@gmail.com>
     * All rights reserved.
     *
     * Redistribution and use in source and binary forms, with or without
     * modification, are permitted provided that the following conditions
     * are met:
     *
     * o Redistributions of source code must retain the above copyright notice,
     *   this list of conditions and the following disclaimer.
     * o Redistributions in binary form must reproduce the above copyright
     *   notice, this list of conditions and the following disclaimer in the
     *   documentation and/or other materials provided with the distribution.
     * o Neither the name of the <organization> nor the names of its contributors
     *   may be used to endorse or promote products derived from this software
     *   without specific prior written permission.
     *
     * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
     * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
     * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
     * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
     * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
     * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
     * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
     * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
     * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
     * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
     * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     */
    



Mau pastein lisensi-nya satu persatu diseluruh source code ? Tentunya pekerjaan yang sangat melelahkan donk :D Nah biar cepat, simpan dan modifikasi-lah **Template** lisensi BSD dibawah ini ke dalam komputer anda :

    
    
    <#if licenseFirst??>
    ${licenseFirst}
    
    ${licensePrefix} Copyright (c) ${date?date?string("yyyy")} Martinus Ady H <mrt.itnewbies@gmail.com>.
    ${licensePrefix} All rights reserved.
    ${licensePrefix}
    ${licensePrefix} Redistribution and use in source and binary forms, with or without
    ${licensePrefix} modification, are permitted provided that the following conditions
    ${licensePrefix} are met:
    ${licensePrefix}
    ${licensePrefix} o Redistributions of source code must retain the above copyright notice,
    ${licensePrefix}   this list of conditions and the following disclaimer.
    ${licensePrefix} o Redistributions in binary form must reproduce the above copyright
    ${licensePrefix}   notice, this list of conditions and the following disclaimer in the
    ${licensePrefix}   documentation and/or other materials provided with the distribution.
    ${licensePrefix} o Neither the name of the <organization> nor the names of its contributors
    ${licensePrefix}   may be used to endorse or promote products derived from this software
    ${licensePrefix}   without specific prior written permission.
    ${licensePrefix}
    ${licensePrefix} THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    ${licensePrefix} "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
    ${licensePrefix} TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
    ${licensePrefix} PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
    ${licensePrefix} CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
    ${licensePrefix} EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
    ${licensePrefix} PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
    ${licensePrefix} OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
    ${licensePrefix} WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
    ${licensePrefix} OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
    ${licensePrefix} ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    ${licensePrefix}
    ${licensePrefix} ${name}.java
    ${licensePrefix}
    ${licensePrefix} Created on ${date}, ${time}
    <#if licenseLast??>
    ${licenseLast}
    
    


<!-- more -->
Setelah menyimpan template diatas, sekarang coba bukalah jendela **Template Manager** dengan memilih menu **Tools > Templates** seperti gambar dibawah ini :
[![Templates](http://farm3.static.flickr.com/2635/3888425777_75aefd6774.jpg)  
Tampilan Template Manager](http://www.flickr.com/photos/10243554@N02/3888425777/)

Nah pada jendela **Template Manager** sekarang coba **expands** node **License** seperti gambar dibawah ini :
[![node-license](http://farm3.static.flickr.com/2456/3889216578_ef836dcf8b.jpg)  
Pilih Node License](http://www.flickr.com/photos/10243554@N02/3889216578/)

Untuk menambahkan lisensi baru, klik kanan pada node **License** kemudian pilihlah **Add** dan arahkanlah pada file **Template** lisensi BSD yang sudah disimpan pada langkah sebelumnya seperti gambar dibawah ini :
[![AddLicense-1](http://farm3.static.flickr.com/2664/3889216566_bed531ff1d.jpg)  
Klik kanan Add Untuk Menambah License](http://www.flickr.com/photos/10243554@N02/3889216566/)
[![AddLicense-2](http://farm3.static.flickr.com/2505/3889216568_05197a53f1.jpg)  
Arahkan Pada File Template Yang Sudah Di Download](http://www.flickr.com/photos/10243554@N02/3889216568/)
[![AddLicense-3](http://farm3.static.flickr.com/2486/3889216574_50bca32d8b.jpg)  
Hasil Akhir](http://www.flickr.com/photos/10243554@N02/3889216574/)

Masalah lisensi sekarang sudah selesai, sekarang bagaimana menambahkan-nya kedalam source code yang kita tulis ?? Caranya gampang sekali, pada jendela **Template Manager** expand-lah node **Java** dan pilihlah **Java Class** dan tekanlah tombol **Duplicate** kemudian editlah nama file hasil duplikasinya menjadi dari **Class_1** menjadi **JavaBSD** dengan menekan tombol **Rename** seperti gambar dibawah ini :
[![rename](http://farm3.static.flickr.com/2468/3889216582_0babbfd885_o.png)](http://www.flickr.com/photos/10243554@N02/3889216582/)

Setelah merubah nama file menjadi **JavaBSD** sekarang bukalah template file **JavaBSD** diatas pada Editor dengan menekan tombol **Open in Editor** kemudian editlah menjadi seperti dibawah ini :

    
    
    <#assign licenseFirst = "/*">
    <#assign licensePrefix = " * ">
    <#assign licenseLast = " */">
    <#include "../Licenses/license-BSD.txt">
    
    <#if package?? && package != "">
    package ${package};
    
    
    /**
     *
     * @author ${user}
     */
    public class ${name} {
    
    }
    



Nah sekarang semua template sudah siap untuk digunakan, sedangkan untuk mencobanya buatlah sebuah project baru kemudian tambahkanlah source code java yang sudah mempunyai lisensi BSD tersebut dengan cara menekan kombinasi tombol **CTRL+N** kemudian pilihlah **Java** pada **Categories** dan **JavaBSD** pada **File Types** seperti gambar dibawah ini :
[![new_bsd](http://farm3.static.flickr.com/2633/3889216576_a52fec723c.jpg)  
Tampilan Akhir Penambahan License](http://www.flickr.com/photos/10243554@N02/3889216576/)

Setelah menekan tombol **Next** dan **Finish** maka tampilah source code dengan lisensi BSD secara otomatis seperti dibawah ini :

    
    
    /*
     *  Copyright (c) 2009 Martinus Ady H <mrt.itnewbies@gmail.com>.
     *  All rights reserved.
     *
     *  Redistribution and use in source and binary forms, with or without
     *  modification, are permitted provided that the following conditions
     *  are met:
     *
     *  o Redistributions of source code must retain the above copyright notice,
     *    this list of conditions and the following disclaimer.
     *  o Redistributions in binary form must reproduce the above copyright
     *    notice, this list of conditions and the following disclaimer in the
     *    documentation and/or other materials provided with the distribution.
     *  o Neither the name of the <organization> nor the names of its contributors
     *    may be used to endorse or promote products derived from this software
     *    without specific prior written permission.
     *
     *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
     *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
     *  TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
     *  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
     *  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
     *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
     *  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
     *  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
     *  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
     *  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
     *  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     *
     *  NewClass_1.java
     *
     *  Created on Sep 5, 2009, 1:08:02 PM
     */
    
    package cobalicense;
    
    /**
     *
     * @author martinus
     */
    public class NewClass_1 {
    
    }
    



Nah sekarang membuat project open source lebih terasa **afdol** soalnya sudah ada lisensi-nya sekalian :) Dan untuk teman-teman yang tidak mau pusing-pusing cari template lisensi yang **NetBeans enabled**, mungkin bisa pakai copy paste beberapa template lisensi dibawah ini (cuma ada 2 GPL ma LGPL ajah :D ) :
**LGPLv2 License:**

    
    
    <#if licenseFirst??>
    ${licenseFirst}
    
    ${licensePrefix} Copyright (c) ${date?date?string("yyyy")} Martinus Ady H <mrt.itnewbies@gmail.com>.
    ${licensePrefix} All rights reserved.
    ${licensePrefix}
    ${licensePrefix} This library is free software; you can redistribute it and/or modify it
    ${licensePrefix} under the terms of the GNU Lesser General Public License as published by
    ${licensePrefix} the Free Software Foundation; either version 2.1 of the License, or
    ${licensePrefix} (at your option) any later version.
    ${licensePrefix}
    ${licensePrefix} This library is distributed in the hope that it will be useful, but
    ${licensePrefix} WITHOUT ANY WARRANTY; without even the implied warranty of
    ${licensePrefix} MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser
    ${licensePrefix} General Public License for more details.
    ${licensePrefix}
    ${licensePrefix} You should have received a copy of the GNU Lesser General Public License
    ${licensePrefix} along with this library; if not, write to the Free Software Foundation,
    ${licensePrefix} Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
    ${licensePrefix}
    ${licensePrefix} ${name}.java
    ${licensePrefix}
    ${licensePrefix} Created on ${date}, ${time}
    <#if licenseLast??>
    ${licenseLast}
    
    



**GPLv2 License:**

    
    
    <#if licenseFirst??>
    ${licenseFirst}
    
    ${licensePrefix} Copyright (c) ${date?date?string("yyyy")} Martinus Ady H <mrt.itnewbies@gmail.com>.
    ${licensePrefix} All rights reserved.
    ${licensePrefix}
    ${licensePrefix} This program is free software; you can redistribute it and/or modify it
    ${licensePrefix} under the terms of the GNU General Public License as published by the
    ${licensePrefix} Free Software Foundation; either version 2 of the License, or
    ${licensePrefix} (at your option) any later version.
    ${licensePrefix}
    ${licensePrefix} This program is distributed in the hope that it will be useful, but
    ${licensePrefix} WITHOUT ANY WARRANTY; without even the implied warranty of
    ${licensePrefix} MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
    ${licensePrefix} Public License for more details.
    ${licensePrefix}
    ${licensePrefix} You should have received a copy of the GNU General Public License along
    ${licensePrefix} with this program; if not, write to the Free Software Foundation, Inc.,
    ${licensePrefix} 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
    ${licensePrefix}
    ${licensePrefix} ${name}.java
    ${licensePrefix}
    ${licensePrefix} Created on ${date}, ${time}
    <#if licenseLast??>
    ${licenseLast}
    
    



Nah bagaimana teman-teman ? Tertarik mengembangkan aplikasi open source ?? :) Lisensi mana yang menjadi pilihan teman-teman nantinya (GPL or BSD) ? Kalau saya pribadi, lebih menyukai **_style_** dari **BSD License** dan menurut saya lisensi ini adalah murni **"OpenSource"** karena :


> 
The BSD License allows proprietary use, and for the software released under the license to be incorporated into proprietary products. Works based on the material may be released under a proprietary license or as closed source software. This is the reason for widespread use of the BSD code in proprietary products, ranging from Juniper Networks routers to Mac OS X.[4]

It is possible for something to be distributed with the BSD License and some other license to apply as well. This was in fact the case with very early versions of BSD itself, which included proprietary material from AT&T.;




So... mari tentukan pilihan masing-masing :)

**Link-link terkait :**
- [Daftar Lisensi OpenSource](http://www.opensource.org/licenses/alphabetical)
- [Wiki BSD License](http://en.wikipedia.org/wiki/BSD_licenses)
- [Wiki GNU GPL License](http://en.wikipedia.org/wiki/GNU_General_Public_License)
- [Wiki GNU LGPL License](http://en.wikipedia.org/wiki/GNU_Lesser_General_Public_License)

**Tulisan ini dibuat untuk menyukseskan [Lomba Blog Open Source](http://www.informatika.lipi.go.id/seminar/lombablog/) P2I-LIPI dan [Seminar Open Source](http://www.informatika.lipi.go.id/seminar/) P2I-LIPI 2009. **
