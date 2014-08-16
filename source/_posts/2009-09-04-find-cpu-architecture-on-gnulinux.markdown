---
comments: true
date: 2009-09-04 18:20:38+00:00
layout: post
slug: find-cpu-architecture-on-gnulinux
title: Find CPU Architecture on GNU/Linux
wordpress_id: 64
categories:
- Slackware
---

Gara-gara kemarin ada yang tanya tentang CPU Architecture di milis [id-slackware@googlegroups.com](http://groups.google.com/group/id-slackware/browse_thread/thread/6c7a0d22fcf5255d) akhirnya iseng-iseng deh coba-coba lihat spesifikasi laptop yang saya pakai masih 32 bit atau sudah 64 bit :)  Ada beberapa cara yang saya tahu untuk mengetahui informasi tentang CPU di GNU/Linux, tapi jangan tanya apa artinya loh :malu: karena saya cuma tahu gimana cara lihatnya aja :malu:
<!-- more -->
Untuk melihat informasi CPU, kita bisa melihat dari file **/proc/cpuinfo** dan hasil dari pembacaan file **/proc/cpuinfo** pada laptop saya adalah seperti dibawah ini :

    
    
    martinus@martinus-laptop:~$ cat /proc/cpuinfo
    processor	: 0
    vendor_id	: GenuineIntel
    cpu family	: 6
    model		: 23
    model name	: Intel(R) Core(TM)2 Duo CPU     T6500  @ 2.10GHz
    stepping	: 10
    cpu MHz		: 2100.000
    cache size	: 2048 KB
    physical id	: 0
    siblings	: 2
    core id		: 0
    cpu cores	: 2
    apicid		: 0
    initial apicid	: 0
    fdiv_bug	: no
    hlt_bug		: no
    f00f_bug	: no
    coma_bug	: no
    fpu		: yes
    fpu_exception	: yes
    cpuid level	: 13
    wp		: yes
    flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant_tsc arch_perfmon pebs bts pni dtes64 monitor ds_cpl est tm2 ssse3 cx16 xtpr pdcm sse4_1 xsave lahf_lm
    bogomips	: 4189.95
    clflush size	: 64
    power management:
    
    processor	: 1
    vendor_id	: GenuineIntel
    cpu family	: 6
    model		: 23
    model name	: Intel(R) Core(TM)2 Duo CPU     T6500  @ 2.10GHz
    stepping	: 10
    cpu MHz		: 2100.000
    cache size	: 2048 KB
    physical id	: 0
    siblings	: 2
    core id		: 1
    cpu cores	: 2
    apicid		: 1
    initial apicid	: 1
    fdiv_bug	: no
    hlt_bug		: no
    f00f_bug	: no
    coma_bug	: no
    fpu		: yes
    fpu_exception	: yes
    cpuid level	: 13
    wp		: yes
    flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant_tsc arch_perfmon pebs bts pni dtes64 monitor ds_cpl est tm2 ssse3 cx16 xtpr pdcm sse4_1 xsave lahf_lm
    bogomips	: 4189.45
    clflush size	: 64
    power management:
    
    martinus@martinus-laptop:~$
    



Sedangkan informasi tentang CPU Architecture dapat kita lihat pada opsi **flags** yang isinya kurang lebih seperti berikut :

    
    
    martinus@martinus-laptop:~$ cat /proc/cpuinfo | grep flags
    flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant_tsc arch_perfmon pebs bts pni dtes64 monitor ds_cpl est tm2 ssse3 cx16 xtpr pdcm sse4_1 xsave lahf_lm
    flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant_tsc arch_perfmon pebs bts pni dtes64 monitor ds_cpl est tm2 ssse3 cx16 xtpr pdcm sse4_1 xsave lahf_lm
    martinus@martinus-laptop:~$
    



Sekarang lakukanlah pengecekan pada hasil output diatas, apakah ada beberapa informasi seperti dibawah ini :

* **lm** : Long Mode (64 bit) 


* **tm** : Transparent Mode (32 bit) 


* **rm** : Real Mode (16 bit) 


Nah sekarang silahkan teman-teman cek pada komputer dan laptopnya masing-masing, semoga tulisan ini bisa sedikit membantu teman-teman yang lagi bingung untuk download paket yang mana ;)

**Link-link terkait : **
[How to Confirm If Your CPU is 32 bit or 64 bit](http://www.unixtutorial.org/2009/05/how-to-confirm-if-your-cpu-is-32bit-or-64bit/)
[Linux HowTo Find If Processor is 64 bit or Not](http://www.cyberciti.biz/faq/linux-how-to-find-if-processor-is-64-bit-or-not/)
[Arsip Milis id-slackware@googlegroups.com](http://groups.google.com/group/id-slackware/browse_thread/thread/6c7a0d22fcf5255d)

**Tulisan ini dibuat untuk menyukseskan [Lomba Blog Open Source](http://www.informatika.lipi.go.id/seminar/lombablog/) P2I-LIPI dan [Seminar Open Source](http://www.informatika.lipi.go.id/seminar/) P2I-LIPI 2009. **
