---
comments: true
date: 2010-08-16 17:51:09+00:00
layout: post
slug: coloring-your-git-output
title: Coloring Your Git Output
wordpress_id: 954
categories:
- Java
- Slackware
tags:
- Git
- Java
- PHP
- Project Management
---

Buat teman-teman yang sudah lama menggunakan [Git](http://en.wikipedia.org/wiki/Git_(software)), mungkin sudah tahu teknik ini :) Yaps... karena saya juga merasa baru tahu, jadi tidak ada salahnya untuk sekedar **"mencatat"**-nya pada posting kali ini :) :D Nah biasanya kalau kita bekerja dengan [Git](http://en.wikipedia.org/wiki/Git_(software)), dan ingin melihat sebuah status atau log dari proses **push** yang dilakukan dari terminal (konsole) maka kita akan mendapatkan tampilan yang kurang lebih seperti ini :
[plain]
martinus@martinusadyh:[~/Desktop/tinymce]$ git status
# On branch master
# Changed but not updated:
#   (use "git add ..." to update what will be committed)
#   (use "git checkout -- ..." to discard changes in working directory)
#
#	modified:   jscripts/tiny_mce/tiny_mce_popup.js
#
# Untracked files:
#   (use "git add ..." to include in what will be committed)
#
#	jscripts/tiny_mce/langs/id.js
#	jscripts/tiny_mce/langs/in.js
no changes added to commit (use "git add" and/or "git commit -a")
martinus@martinusadyh:[~/Desktop/tinymce]$ 
[/plain]
<!-- more -->
Yaps kita akan mendapatkan tampilan yang sangat **"standart"** sesuai dengan konfigurasi warna yang digunakan pada terminal (konsole) teman-teman. Nah setelah beberapa saat mengobok-obok ["paman Google"](http://google.com), ternyata kita bisa melakukan konfigurasi pada file `~/.gitconfig` (Jika file `~/.gitconfig` belum ada, silahkan teman-teman buat sendiri) agar mendapatkan hasil yang di inginkan :) Sedangkan konfigurasi `~/.gitconfig` yang terdapat pada laptop saya adalah sebagai berikut :

    
    
    [gui]
    	fontdiff = -family Monaco -size 9 -weight normal -slant roman -underline 0 -overstrike 0
    [user]
    	email = martinus@artivisi.com
    	name = Martinus Ady H
    [core]
    	pager = less -FRSX
    [color]
    	ui = auto
    	diff = auto
    	status = auto
    	branch = auto
    	interactive = auto
    [color "status"]
    	added = yellow
    	changed = green bold
    	untracked = cyan
    [color "diff"]
    	meta = yellow bold
    	frag = magenta bold
    	old = red bold
    	new = green bold
    



Dengan konfigurasi `~/.gitconfig` seperti diatas, maka tampilan Git yang terdapat pada terminal (konsole) bisa menjadi lebih **"berwarana"** seperti tampilan screenshot dibawah ini :

[![git-status](http://farm5.static.flickr.com/4123/4897993987_48c7cc98e7.jpg)](http://www.flickr.com/photos/10243554@N02/4897993987/)  
**Tampilan Output git status**

[![git-show](http://farm5.static.flickr.com/4096/4897993975_0a4493b384.jpg)](http://www.flickr.com/photos/10243554@N02/4897993975/)  
**Tampilan Output git show**

Bagaimana keren bukan ??? Bagaiman dengan isi `~/.gitconfig` yang teman-teman gunakan ? Mau sharing disini ???? :)

**Referensi terkait :**




  1. [Stack Overflow (What does Your gitconfig contain)](http://stackoverflow.com/questions/267761/what-does-your-gitconfig-contain)


  2. [git cheat sheets](http://cheat.errtheblog.com/s/git)


  3. [git-colors](http://jblevins.org/log/git-colors)


