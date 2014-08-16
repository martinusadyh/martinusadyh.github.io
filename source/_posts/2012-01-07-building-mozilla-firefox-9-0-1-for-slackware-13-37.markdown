---
comments: true
date: 2012-01-07 02:34:52+00:00
layout: post
slug: building-mozilla-firefox-9-0-1-for-slackware-13-37
title: Building Mozilla Firefox 9.0.1 for Slackware 13.37
wordpress_id: 1545
categories:
- Slackware
tags:
- Firefox
- SlackBuild
- Slackware
---

[![](http://martinusadyh.web.id/wp-content/uploads/2012/01/firefox.png)](http://martinusadyh.web.id/wp-content/uploads/2012/01/firefox.png)Ingin mencoba [Firefox 9.0.1](http://www.mozilla.org/en-US/firefox/new/) di Slackware 13.37 tapi susah mencari file SlackBuild-nya di [SBo](http://slackbuilds.org/) ? Jika iya, berarti kita mempunyai permasalahan yang sama :D Awal masalah saya sampai akhirnya mencoba menginstall Firefox adalah, beberapa plugin (ekstension) yang biasa saya gunakan bermasalah terhadap Firefox versi 4.0 bawaan Slackware 13.37 :(

Karena sudah mencoba mencari di [SBo](http://slackbuilds.org/) file SlackBuild untuk firefox juga tidak ditemukan, dan ternyata kita cuma mendapatkan file binary saja ketika kita mendownload langsung pada [situs resmi Firefox](http://www.mozilla.org/en-US/firefox/new/). Maka langkah terakhir yang bisa kita lakukan yaitu **menggunakan file SlackBuild firefox 4.0 milik Slackware 13.37** yang bisa di download pada [mirror lokal slackware](http://ftp.paudni.kemdiknas.go.id/slackware/slackware64-13.37/source/xap/mozilla-firefox/). Dari beberapa file yang terdapat pada halaman mirror tersebut, download file-file berikut ini saja :




  1. mimeTypes.rdf.gz


  2. mozilla-firefox-mimeTypes-fix.diff.gz


  3. firefox.png


  4. mozilla-firefox.desktop


  5. slack-desc


  6. mozilla-firefox.SlackBuild



Setelah selesai mengumpulkan file-file SlackBuild yang diperlukan, sekarang waktunya kita untuk mendownload **source code** firefox yang bisa kita dapatkan pada alamat [ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/9.0.1/source/](ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/9.0.1/source/). Download-lah 2 file yang diperlukan yaitu :




  1. firefox-9.0.1.source.tar.bz2.asc


  2. firefox-9.0.1.source.tar.bz2


<!-- more -->
Agar proses kompilasi berhasil, sekarang rubah-lah file `mozilla-firefox.SlackBuild` pada baris 38 yang isinya :

    
    
    fi
    BUILD=${BUILD:-2}
    
    MOZVERS=${MOZVERS:-2.0}
    RELEASEVER=$(echo $VERSION | cut -f 1 -d r)
    



menjadi seperti dibawah ini :

    
    
    fi
    BUILD=${BUILD:-2}
    
    MOZVERS=${MOZVERS:-release}
    RELEASEVER=$(echo $VERSION | cut -f 1 -d r)
    



Jika sudah, simpan perubahan yang dilakukan. Dan sekarang masuklah kedalam direktori tempat dimana seluruh file SlackBuild dan source code mozilla-firefox ditempatkan. Dan jalankan perintah `./mozilla-firefox.SlackBuild` dengan menggunakan **akses root** agar proses kompilasi segera berjalan. Tunggulah beberapa saat sampai proses ini selesai, jika telah selesai maka kita akan mendapatkan file `/tmp/mozilla-firefox-9.0.1-x86_64-2.txz` yang bisa di install dengan menggunakan perintah `installpkg` seperti dibawah ini :
[plain]
root@artivisi:/mnt/DATA/SLACKBUILDS/firefox# installpkg /tmp/mozilla-firefox-9.0.1-x86_64-2.txz
Verifying package mozilla-firefox-9.0.1-x86_64-2.txz.
Installing package mozilla-firefox-9.0.1-x86_64-2.txz:
PACKAGE DESCRIPTION:
# mozilla-firefox (Mozilla Firefox Web browser)
#
# This project is a redesign of the Mozilla browser component written
# using the XUL user interface language.  Firefox empowers you to
# browse faster, more safely and more efficiently than with any other
# browser.
#
# Visit the Mozilla Firefox project online:
#   http://www.mozilla.org/projects/firefox/
#
Executing install script for mozilla-firefox-9.0.1-x86_64-2.txz.
Package mozilla-firefox-9.0.1-x86_64-2.txz installed.

root@artivisi:/mnt/DATA/SLACKBUILDS/firefox# 
[/plain]

Jika sudah, sekarang mari kita test. Jalankan firefox melalui menu maupun dari terminal/console, dan ketika kita mengecek versi-nya harusnya kita akan mendapatkan tampilan seperti gambar dibawah ini :
[![Mozilla Firefox 9.0.1 on Slackware 13.37](http://martinusadyh.web.id/wp-content/gallery/tutorial/screenshot_0.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=157)

Bagaimana mudah bukan cara installasi-nya ? Apakah tertarik untuk mencoba mozilla-firefox 9.0.1 ? 
