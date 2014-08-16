---
comments: true
date: 2009-11-06 08:18:45+00:00
layout: post
slug: editing-your-pdf-with-openoffice
title: Editing Your PDF With OpenOffice
wordpress_id: 80
categories:
- Java
- NetBeans
- OpenSolaris
- Other
- Shell Script
- Slackware
---

Pernah merasa butuh mengedit file PDF ? Jika jawaban-nya adalah **Ya** dan file PDF yang ingin di edit/dimodifikasi tidak begitu **kompleks** mungkin kita bisa menggunakan [Sun PDF Import Extension](http://extensions.services.openoffice.org/project/pdfimport) dari OpenOffice.org yang bisa kita gunakan untuk memodifikasi file PDF :) Sedangkan beberapa fitur yang akan kita dapatkan jika kita menginstall extension [
Sun PDF Import Extension](http://extensions.services.openoffice.org/project/pdfimport) ini adalah :
**
- Text attributes like font family, font size, weight (bold, not bold), style (italic, not italic) are imported together with their respective text
- Retain font appearance, when a PDF file uses a font not installed on your system, the font is replaced with the best alternative font
- Converts images and vector graphics
- Each line in a paragraph is converted into one text object
- Import of password-protected PDF files
- Import shapes with default style
- Support for colors and bitmaps
- Backgrounds remain behind other elements
**
Sedangkan beberapa fitur yang belum didukung yaitu :
**
- Native PDF forms
- Proper paragraphs
- Processing layout of LaTeX PDF
- Import of complex vector graphics elements
- Conversion of tables
- Import of EPS graphics
- RTL (right-to-left) text/font support
**
<!-- more -->
Sekarang yang perlu kita lakukan agar OpenOffice.org dapat membuka file PDF yaitu, downladlah dahulu extension diatas pada halaman download [Sun PDF Import Extension](http://extensions.services.openoffice.org/project/pdfimport). Setelah di download, sekarang bukalah OpenOffice dan pilihlah menu **Tools > Extension Manager** seperti gambar dibawah ini :
[![Accessing Extension Manager Dialog](http://farm3.static.flickr.com/2701/4079331627_996b945e01.jpg)  
Accessing Extension Manager Dialog](http://www.flickr.com/photos/10243554@N02/4079331627/)

Kemudian pada jendela **Extension Manager** tambahkanlah extension [Sun PDF Import Extension](http://extensions.services.openoffice.org/project/pdfimport) dengan cara menekan tombol **Add** dan arahkan pada lokasi dimana anda menyimpan hasil download extension [Sun PDF Import Extension](http://extensions.services.openoffice.org/project/pdfimport) seperti dibawah ini :
[![Adding Extension](http://farm4.static.flickr.com/3482/4079331623_a0c1420015.jpg)  
Adding Extension](http://www.flickr.com/photos/10243554@N02/4079331623/)

Jika sudah, maka harusnya sekarang kita melihat tampilan lisensi dari extension [Sun PDF Import Extension](http://extensions.services.openoffice.org/project/pdfimport). Geser scrollbar sampai kebawah kemudian tekanlah tombol **Accept** seperti gambar dibawah ini :
[![Sun PDF License](http://farm3.static.flickr.com/2602/4079331621_68f52977ab.jpg)  
Sun PDF License](http://www.flickr.com/photos/10243554@N02/4079331621/)

Tunggu beberapa saat untuk proses penginstallan, dan jika sudah selesai maka harusnya tampilan jendela **Extension Manager** akan menampilkan extension [Sun PDF Import Extension](http://extensions.services.openoffice.org/project/pdfimport) seperti gambar dibawah ini :
[![Sun PDF Import Installed Successfully](http://farm3.static.flickr.com/2628/4079331635_3e89c4c60e.jpg)  
Sun PDF Import Installed Successfully](http://www.flickr.com/photos/10243554@N02/4079331635/)

Nah sekarang coba bukalah koleksi file PDF anda, dan harusnya sekarang file PDF akan terbuka pada OpenOffice Draw dan siap untuk menerima pengeditan yang akan kita lakukan seperti gambar dibawah ini :
[![PDFExt_In_Action](http://farm4.static.flickr.com/3522/4079331629_0b0cc12807.jpg)  
Sun PDF Import In Action](http://www.flickr.com/photos/10243554@N02/4079331629/)

Hm... asyik bukan, makin lama OpenOffice makin keren euy :)

**Link-link terkait :**
- [Wiki PDF](http://en.wikipedia.org/wiki/Portable_Document_Format)
- [Wiki OpenOffice](http://en.wikipedia.org/wiki/OpenOffice)
- [Download Sun PDF Import Extension](http://extensions.services.openoffice.org/project/pdfimport)
- [Kumpulan Majalah Bali-wae](http://id-noob.googlecode.com/)
