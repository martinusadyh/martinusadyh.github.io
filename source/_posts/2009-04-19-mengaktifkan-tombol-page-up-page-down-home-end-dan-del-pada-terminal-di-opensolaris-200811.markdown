---
comments: true
date: 2009-04-19 19:29:13+00:00
layout: post
slug: mengaktifkan-tombol-page-up-page-down-home-end-dan-del-pada-terminal-di-opensolaris-200811
title: Mengaktifkan tombol PAGE UP, PAGE DOWN, HOME, END dan DEL pada terminal di
  OpenSolaris 2008.11
wordpress_id: 55
categories:
- OpenSolaris
---

Pada installasi default OpenSolaris 2008.11, ketika kita ingin melakukan konfigurasi atau bermain-main pada teks mode ada sesuatu yang agak ganjil  yaitu tombol HOME dan END tidak berfungsi sebagaimana mestinya :D Setelah googling kesana dan kemari, akhirnya ketahuan juga masalahnya yaitu ada di konfigurasi file **terminfo** yang terdapat pada OpenSolaris (hm.... baru tahu apa itu terminfo ya baru sekarang dogh :malu: ). Karena banyaknya referensi yang saya dapat dan akhirnya sukses membuat bingung saya :malu: , akhirnya saya menggunakan referensi dari blognya om Miroslav Osladill yang bisa dilihat [disini](http://www.osladil.cz/oprava-kl%C3%A1ves-home-end-pgup-pgdn) . Dan untuk konfigurasi tombol PAGE UP, PAGE DOWN, HOME dan END bisa ikutin langkah-langkah dibawah ini :

    
    
    [martin@opensolarisbox:~]# mkdir /tmp/xterm
    [martin@opensolarisbox:~]# env TERMINFO=/usr/share/lib/terminfo/ /bin/infocmp xterm > /tmp/xterm/xterm.ti
    [martin@opensolarisbox:~]# echo ' knp=\E[6~, kpp=\E[5~, kend=\EOF, khome=\EOH, ' >> /tmp/xterm/xterm.ti
    [martin@opensolarisbox:~]# more /tmp/xterm/xterm.ti
    #	Reconstructed via infocmp from file: /usr/share/lib/terminfo//x/xterm
    xterm|vs100|xterm terminal emulator,
    	am, km, mir, msgr, xenl,
    	cols#80, it#8, lines#65,
    	acsc=``aaffggjjkkllmmnnooppqqrrssttuuvvwwxxyyzz{{||}}~~,
    	bel=^G, blink=\E[5m, bold=\E[1m, clear=\E[H\E[2J,
    	cr=\r, csr=\E[%i%p1%d;%p2%dr, cub=\E[%p1%dD, cub1=\b,
    	cud=\E[%p1%dB, cud1=\n, cuf=\E[%p1%dC, cuf1=\E[C,
    	cup=\E[%i%p1%d;%p2%dH, cuu=\E[%p1%dA, cuu1=\E[A,
    	dch=\E[%p1%dP, dch1=\E[P, dl=\E[%p1%dM, dl1=\E[M,
    	ed=\E[J, el=\E[K, el1=\E[1K$<3>, enacs=\E(B\E)0,
    	home=\E[H, ht=\t, hts=\EH, ich=\E[%p1%d@, ich1=\E[@,
    	il=\E[%p1%dL, il1=\E[L, ind=\n, ka1=\EOq, ka3=\EOs,
    	kb2=\EOr, kbs=\b, kc1=\EOp, kc3=\EOn, kcub1=\EOD,
    	kcud1=\EOB, kcuf1=\EOC, kcuu1=\EOA, kent=\EOM,
    	kf0=\E[21~, kf1=\E[11~, kf10=\EOx, kf2=\E[12~,
    	kf3=\E[13~, kf4=\E[14~, kf5=\E[15~, kf6=\E[17~,
    	kf7=\E[18~, kf8=\E[19~, kf9=\E[20~, rc=\E8, rev=\E[7m,
    	ri=\EM, rmacs=^O, rmcup=\E[2J\E[?47l\E8,
    	rmkx=\E[?1l\E>, rmso=\E[m, rmul=\E[m,
    	rs1=\E>\E[1;3;4;5;6l\E[?7h\E[m\E[r\E[2J\E[H, rs2=@,
    	sc=\E7,
    	sgr=\E[0%?%p1%p6%|%t;1%;%?%p2%t;4%;%?%p1%p3%|%t;7%;%?%p4%t;5%;m%?%p9%t^N%e^O%;,
    	sgr0=\E[m, smacs=^N, smcup=\E7\E[?47h, smkx=\E[?1h\E=,
    	smso=\E[7m, smul=\E[4m, tbc=\E[3g,
     knp=\E[6~, kpp=\E[5~, kend=\EOF, khome=\EOH,
    [martin@opensolarisbox:~]# env TERMINFO=/tmp/xterm /bin/tic -v /tmp/xterm/xterm.ti
    Working in /tmp/xterm
    Created x/xterm
    Linked v/vs100
    [martin@opensolarisbox:~]# ls /usr/share/lib/terminfo/x
    x1700        x1750        xitex        xpcterm      xtalk        xtermc       xtermm
    x1720        x820         xl83         xpcterms     xterm        xterm-color  xterms
    [martin@opensolarisbox:~]# mv /usr/share/lib/terminfo/x/xterm /usr/share/lib/terminfo/x/xterm.orig
    [martin@opensolarisbox:~]# ls /tmp/xterm/
    v         x         xterm.ti
    [martin@opensolarisbox:~]# ls /tmp/xterm/x
    xterm
    [martin@opensolarisbox:~]# cp /tmp/xterm/x/xterm /usr/share/lib/terminfo/x/
    [martin@opensolarisbox:~]# ls /usr/share/lib/terminfo/x/
    x1700        x1750        xitex        xpcterm      xtalk        xtermc       xtermm       xterms
    x1720        x820         xl83         xpcterms     xterm        xterm-color  xterm.orig
    [martin@opensolarisbox:~]#
    


<!-- more -->
Sedangkan untuk tombol DEL pada terminal, saya coba mengikuti instruksi yang terdapat [disini](http://defect.opensolaris.org/bz/show_bug.cgi?id=3090) dengan cara mengganti nilai **Delete key generates:** ke ASCII DEL (cara gantinya yaitu pada gnome-terminal klik **Edit > Profile > Compatibility**) hasilnya tombol DEL koq malah berganti fungsi menjadi BACKSPACE yah ~_~' :malu:

[![SblmDiDEL](http://farm4.static.flickr.com/3656/3456056645_b2e0e9982f.jpg)  
Ini tampilan sebelum di tekan tombol DEL](http://www.flickr.com/photos/10243554@N02/3456056645/)

[![SetelahPencetDEL](http://farm4.static.flickr.com/3648/3456056649_5fe1f3307c.jpg)  
Setelah di DEL koq yang kehapus depannya yach ?? ~_~' ](http://www.flickr.com/photos/10243554@N02/3456056649/)


Ada teman-teman yang mengalami hal serupa ?? Atau saya yang kurang teliti ngebacanya yah ?? :D :malu:

**Referensi-referensi:**
- [Delete, Home, End and Insert keys don't work in default terminal](http://defect.opensolaris.org/bz/show_bug.cgi?id=3090)
- [home, end, page up, page down keys non-functional in gnome-terminal](http://defect.opensolaris.org/bz/show_bug.cgi?id=5574)
- [Keyboard Usage Problems](http://tech.groups.yahoo.com/group/solarisx86/message/19865)
- [Oprava kláves Home, End, PgUp, PgDn](http://www.osladil.cz/oprava-kl%C3%A1ves-home-end-pgup-pgdn)
- [Wiki Termcap](http://en.wikipedia.org/wiki/Termcap)
- [Wik TermInfo](http://en.wikipedia.org/wiki/Terminfo)
