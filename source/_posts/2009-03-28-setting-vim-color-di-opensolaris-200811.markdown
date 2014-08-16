---
comments: true
date: 2009-03-28 18:56:33+00:00
layout: post
slug: setting-vim-color-di-opensolaris-200811
title: Setting VIM Color di OpenSolaris 2008.11
wordpress_id: 49
categories:
- OpenSolaris
---

Buat teman-teman yang seneng bermain di Terminal atau Console, pasti sudah tidak asing lagi kan ama yang namanya [Vim](http://www.vim.org/) :) Yups, [Vim](http://www.vim.org/) adalah text editor yang berjalan di mode teks sedangkan di mode GUI temen-teman bisa pakai yang namanya GVim.

Nah yang paling saya sukai di [Vim](http://www.vim.org/) yaitu syntax hightlighting-nya yang sangat bagus dan tiap-tiap file type beda-beda warna-nya :) :D (keren banget). Mungkin teman-teman juga sudah tahu kalau untuk meng-enable pewarnaan kita bisa pakai perintah **:syntax on** pada mode command di [Vim](http://www.vim.org/), tapi apa yang terjadi ketika saya mencoba memberikan perintah tersebut di [Vim](http://www.vim.org/) yang berjalan di OpenSolaris ? Hasilnya adalah seperti gambar dibawah ini :
[![SyntaxOn](http://farm4.static.flickr.com/3560/3393046556_cfeba3b2f0.jpg)  
Tampilannya koq cuma bold aja yah ???](http://www.flickr.com/photos/10243554@N02/3393046556/)

dan ketika saya mencoba meng-enable line number dengan memberikan perintah **:set nu** hasilnya menjadi seperti ini :
[![setnu](http://farm4.static.flickr.com/3443/3393046562_431dfdb67f.jpg)  
Wah tambah parah, koq malah dikasih underline :( ](http://www.flickr.com/photos/10243554@N02/3393046562/)
<!-- more -->
Setelah googling sebentar dan menemukan link [disini](http://vim.wikia.com/wiki/Getting_colors_to_work_on_solaris), akhirnya saya membuat sebuah file .vimrc yang terletak di **/export/home/martin/** dan mengisi file .vimrc tersebut dengan konfigurasi seperti dibawah ini :

    
    
    set term=xtermc
    syntax on
    set nu
    



dan hasil akhirnya adalah seperti ini :
[![after](http://farm4.static.flickr.com/3433/3393046572_fb9dc9d213.jpg)  
Hm.. looking good now :) ](http://www.flickr.com/photos/10243554@N02/3393046572/)


Cool kan ?? Untuk konfigurasi yang lain, silahkan ditambahkan sendiri-sendiri sesuai dengan selera masing-masing :)

**Link-link terkait :**
- [http://vim.wikia.com/wiki/Getting_colors_to_work_on_solaris](http://vim.wikia.com/wiki/Getting_colors_to_work_on_solaris)
