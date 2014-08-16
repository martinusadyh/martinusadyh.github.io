---
comments: true
date: 2009-12-02 18:09:14+00:00
layout: post
slug: enabling-font-smoothing-in-gnome
title: Enabling Font Smoothing In GNOME
wordpress_id: 89
categories:
- Slackware
---

Apakah teman-teman sudah puas dengan tampilan font rendering yang terdapat pada Desktop Manager GNOME ? Jika jawaban-nya tidak, mungkin teman-teman perlu mencoba mengaktifkan fitur **font smoothing** agar tampilan font terlihat lebih **smooth** :) . Fitur ini tidak bisa kita konfigurasi melalui dialog **Fonts Preferences** yang dapat diakses melalui **System > Preferences > Appearence** karena memang ternyata GNOME belum menyediakan fasilitas ini :(

Agar tampilan font kita terlihat lebih **smooth**, simpanlah kode dibawah ini dengan nama **.fonts.conf** dan letakkan pada direktori **/home/namauseranda** :

    
    
    
    
    
    <fontconfig>
    	<match target="font">
    		<edit mode="assign" name="autohint">
    			<bool>true</bool>
    		</edit>
    	</match>
    	<match target="font">
    		<edit mode="assign" name="rgba">
    			<const>none</const>
    		</edit>
    	</match>
    	<match target="font">
    		<edit mode="assign" name="hinting">
    			<bool>false</bool>
    		</edit>
    	</match>
    	<match target="font">
    		<edit mode="assign" name="hintstyle">
    			<const>hintnone</const>
    		</edit>
    	</match>
    	<match target="font">
    		<edit mode="assign" name="antialias">
    			<bool>true</bool>
    		</edit>
    	</match>
    </fontconfig>
    


**Note: Source code asli bisa diambil dari [Kubuntu Fonts Config](http://rewind.themasterplan.in/dl/Kubuntu_FontsConf)**

Setelah menyimpan konfigurasi font diatas sekarang coba-lah untuk logout kemudian login lagi dan lihat bagaimana perbedaan-nya :) Untuk sumber resmi dari tulisan ini, mungkin teman-teman bisa melihat tulisan The Masterplan tentang [Sexy smooth fonts on Kubuntu](http://rewind.themasterplan.in/2007/07/15/sexy-smooth-fonts-on-kubuntu/) :)
