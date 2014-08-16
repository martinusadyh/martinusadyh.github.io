---
comments: true
date: 2009-03-25 17:23:56+00:00
layout: post
slug: playing-mp3-di-opensolaris-200811
title: Playing MP3 di OpenSolaris 2008.11
wordpress_id: 45
categories:
- OpenSolaris
---

Setelah beberapa hari kencan dengan OpenSolaris cuma ditemanin ama suara jangkrik dan kodok di sawah, akhirnya malam ini kesampaian juga install codec MP3 di OpenSolaris :)  Codec MP3 untuk OpenSolaris bisa didownload dari situs [Fluendo Web Shop](https://shop.fluendo.com/) tapi kita harus register dahulu sebelum mulai mendownload codecnya (proses registrasinya free koq, cuma sayangnya codec-nya koq cuma berlaku 1 thn yah ?? emang bener 1 thn ? :D ) :)

Setelah proses registrasi selesai, sekarang download dan simpan di hard disk lokal kemudian ekstrak dengan perintah seperti dibawah ini :

    
    
    martin@opensolarisbox:~/Desktop$ tar xjvf fluendo-mp3-7.solaris-intel.tar.bz2
    codecs/
    codecs/libgstflump3dec.so
    README.txt
    LICENSE.txt
    martin@opensolarisbox:~/Desktop$
    


Kemudian copy-kan file **libgstflump3dec.so** ke direktori **/usr/lib/gstreamer-0.10/** seperti dibawah ini :

    
    
    martin@opensolarisbox:~/Desktop$ pfexec cp codecs/libgstflump3dec.so /usr/lib/gstreamer-0.10/
    


<!-- more -->
Dan proses terakhir, cek proses instalasi dengan mengetikkan perintah **gst-inspect flump3dec** seperti dibawah ini :

    
    
    martin@opensolarisbox:~/Desktop$ gst-inspect flump3dec
    Factory Details:
      Long name:	Fluendo MP3 Decoder (C build)
      Class:	Codec/Decoder/Audio
      Description:	Decodes MPEG-1 Layer 1, 2 and 3 streams to raw audio frames
      Author(s):	Fluendo Support <support@fluendo.com>
      Rank:		primary (256)
    
    Plugin Details:
      Name:			flump3dec
      Description:		Fluendo MP3 decoder
      Filename:		/usr/lib/gstreamer-0.10/libgstflump3dec.so
      Version:		0.10.10
      License:		unknown
      Source module:	gst-fluendo-mp3
      Binary package:	Fluendo MP3 Decoder
      Origin URL:		http://www.fluendo.com
    
    GObject
     +----GstObject
           +----GstElement
                 +----FluMp3Dec
    
    Pad Templates:
      SRC template: 'src'
        Availability: Always
        Capabilities:
          audio/x-raw-int
                 endianness: 1234
                     signed: true
                      width: 16
                      depth: 16
                       rate: { 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000 }
                   channels: [ 1, 2 ]
    
      SINK template: 'sink'
        Availability: Always
        Capabilities:
          audio/mpeg
                mpegversion: 1
                      layer: [ 1, 3 ]
                       rate: { 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000 }
                   channels: [ 1, 2 ]
    
    
    Element Flags:
      no flags set
    
    Element Implementation:
      Has change_state() function:
      Has custom save_thyself() function: gst_element_save_thyself
      Has custom restore_thyself() function: gst_element_restore_thyself
    
    Element has no clocking capabilities.
    Element has no indexing capabilities.
    Element has no URI handling capabilities.
    
    Pads:
      SRC: 'src'
        Implementation:
          Has custom eventfunc():
          Has custom queryfunc():
            Provides query types:
    		(1):	position (Current position)
    		(2):	duration (Total duration)
          Has custom intconnfunc(): gst_pad_get_internal_links_default
        Pad Template: 'src'
      SINK: 'sink'
        Implementation:
          Has chainfunc():
          Has custom eventfunc():
          Has custom queryfunc(): gst_pad_query_default
            Provides query types:
          Has custom intconnfunc(): gst_pad_get_internal_links_default
        Pad Template: 'sink'
    
    Element Properties:
      name                : The name of the object
                            flags: readable, writable
                            String. Default: null Current: "flump3dec0"
    martin@opensolarisbox:~/Desktop$
    



Nah setelah melakukan proses seperti diatas, sekarang coba jalankan [Rhythmbox](http://www.gnome.org/projects/rhythmbox/) dan pilih koleksi MP3 kemudian mainkan. Hasil akhirnya saya bisa dengerin suara merdu si [Simone Simsons](http://en.wikipedia.org/wiki/Simone_Simons) dan  [Sharon den Adel](http://en.wikipedia.org/wiki/Sharon_den_Adel) di OpenSolaris :)
[![mp3_osol](http://farm4.static.flickr.com/3541/3385594794_ccbb796a87.jpg)  
Malam-2x ku tak sunyi lagi sekarang :D ](http://www.flickr.com/photos/10243554@N02/3385594794/)

**Link-link terkait : **
- [Memutar MP3 di OpenSolaris](http://blog-indonesia.com/blog-archive-8564-32.html)
- [Playing Your mp3s with Songbird](http://blogs.sun.com/observatory/entry/playing_your_mp3s_with_songbird)
