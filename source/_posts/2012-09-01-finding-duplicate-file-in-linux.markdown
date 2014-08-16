---
author: admin
comments: true
date: 2012-09-01 14:12:48+00:00
layout: post
slug: finding-duplicate-file-in-linux
title: Finding Duplicate File in Linux
wordpress_id: 1969
categories:
- CentOS
- Slackware
- Ubuntu
tags:
- Duplicate
- Find
- Find Duplicate File
- Linux
---

Kemarin ada yang tanya, gimana sih caranya mencari file duplicate di **GNU/Linux** ? Setelah beberapa kali mencari bantuan di [Google](http://google.com) akhirnya ketemu juga caranya yaitu dengan menjalankan perintah seperti dibawah ini :
[plain]
$ find /tmp -type f | rev | sort | sed -nr ':a N;/^([^/]*\/).*\n\1/p;D;ba' | uniq | rev
[/plain]
Catatan: Direktori `/tmp` bisa kita ganti ke direktori yang di inginkan.

Tips ini saya temukan secara tidak sengeja di [Google](http://google.com) tapi sayang-nya lupa dimana tepat-nya, jadi supaya tidak lupa saya posting sekalian di blog supaya bisa jadi referensi di kemudian hari :)
