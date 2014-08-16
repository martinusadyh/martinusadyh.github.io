---
comments: true
date: 2009-05-31 07:09:42+00:00
layout: post
slug: violeted-constraints-when-installing-packages-in-opensolaris
title: Violeted Constraints When Installing Packages in OpenSolaris
wordpress_id: 57
categories:
- OpenSolaris
- Other
---

Pernah mendapatkan pesan **pkg: the following package(s) violated constraints:** ketika ingin menginstall sebuah packages di OpenSolaris ?? Yaps saya pernah :D dan ini berkali-kali saya alamin, kejadian ini terjadi kalau kita mempunyai lebih dari 1 mirror repositori selain yang terdapat di [http://pkg.opensolaris.org/release/](http://pkg.opensolaris.org/release/). Masalah ini saya alami ketika saya ingin menginstall packages amp di OpenSolaris yang saya gunakan, sedangkan konfigurasi repository yang saya pakai adalah sebagai berikut :

    
    
    [martin@opensolarisbox:~]# pkg authority
    AUTHORITY                           URL
    Development                         http://pkg.opensolaris.org/dev/
    Blastwave                           http://blastwave.network.com:10000/
    OpenSolaris (preferred)             http://pkg.opensolaris.org/release/
    
    [martin@opensolarisbox:~]#
    



Sedangkan untuk menginstall packages amp, saya gunakan perintah pkg install amp dan akhirnya saya dengan sukses mendapatkan pesan error seperti dibawah ini :

    
    
    martin@opensolarisbox:~]# pkg install amp
    Creating Plan -
    pkg: the following package(s) violated constraints:
    	Package pkg:/SUNWcsl@0.5.11,5.11-0.111 conflicts with constraint in installed pkg:/entire:
    	        Pkg SUNWcsl: Optional min_version: 0.5.11,5.11-0.101 max version: 0.5.11,5.11-0.101 defined by: pkg:/entire
    [martin@opensolarisbox:~]#
    


<!-- more -->
Dan secara kebetulan juga di milis **opensolaris-help@opensolaris.org** ada kejadian serupa dan dibawah ini adalah potongan emailnya beserta solusi yang dianjurkan :


> 
Hemantha Holla wrote:
> Matt Harrington wrote:
>> I had this working towards the end of 2008, but I'm reinstalling
>> 2008.11 on a new system and can't seem to install Flash from the extra
>> repository.  PackageManager gives me this error:
>>
>> pkg: the following package(s) violated constraints:
>>     Package pkg:/SUNWcsl@0.5.11,5.11-0.111 conflicts with constraint in
>> installed pkg:/entire:
>>             Pkg SUNWcsl: Optional min_version: 0.5.11,5.11-0.101 max
>> version: 0.5.11,5.11-0.101 defined by: pkg:/entire
>>
> Since there is a flash pkg for 111 in extra, it is being picked up,
> which in turn depends on 111 packages. Specifying the full fmri of the
> package for build 101 to pkg install like
> 'pkg install flash@10.0.22.87,5.11-0.101:20090402T232732Z' may work.
>
> HTH
> Hemantha
>> Some other info:
>>
>> $ uname -a
>> SunOS osol-desktop 5.11 snv_101b i86pc i386 i86pc Solaris
>>
>> $ pkg authority
>> AUTHORITY                           URL
>> contrib                             http://pkg.opensolaris.org/contrib/
>> opensolaris.org (preferred)         http://pkg.opensolaris.org/release/
>> extra.opensolaris.org
>> https://pkg.sun.com/opensolaris/extra/
>>
>> Any ideas?
>>
>> --Matt
>> _______________________________________________
>> opensolaris-help mailing list
>> opensolaris-help@opensolaris.org




Hm... ternyata begitu toh, ok sekarang saya coba lagi dengan mengetikkan perintah dibawah ini :

    
    
    [martin@opensolarisbox:~]# pkg install amp@0.5.11,5.11-0.101
    DOWNLOAD                                    PKGS       FILES     XFER (MB)
    SUNWphp52                                    2/9       5/661     0.17/9.69
    
    



Weee jalan euy, senangnya hatiku sekarang ;) :D
**Tiada rasa yang paling menyenangkan ketika kita berhasil memecahkan sebuah masalah** :D:P
