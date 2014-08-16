---
author: admin
comments: true
date: 2011-02-19 11:22:20+00:00
layout: post
slug: membuat-laptop-anda-tetap-dingin-di-slackware
title: Membuat Laptop Anda Tetap Dingin di Slackware
wordpress_id: 1209
categories:
- Slackware
tags:
- CPU Freq
- Laptop
- Slackware
---

Barusan tidak sengaja baca-baca tulisan om Walecha yang berjudul [Mengakali Panasnya CPU](http://walecha.net/content/mengakali-panasnya-cpu), dan ternyata cocok dengan kondisi saya yang akhir-akhir ini merasa laptop jadi sering banget menjadi panas (untungnya belum pernah sampai restart sendiri gara-gara masalah kepanasan) :D Nah ternyata di Slackware 13.0 yang saya gunakan _**"by default"**_ belum ada tool bernama [cpufrequtils](http://www.kernel.org/pub/linux/utils/kernel/cpufreq/cpufrequtils.html) :(

Nah buat teman-teman yang masih menggunakan Slackware 13.0 seperti saya, silahkan download dahulu [slackbuild script cpufrequtils](http://slackbuilds.org/repository/13.0/libraries/cpufrequtils/) dan install pada laptop teman-teman :) dan dibawah ini adalah hasil perintah **cpufreq-info** yang terdapat di laptop yang saya gunakan :
[plain]
root@martinusadyh:[/media/data/SLACKBUILDS/cpufrequtils]# cpufreq-info 
cpufrequtils 005: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to cpufreq@vger.kernel.org, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which need to switch frequency at the same time: 0
  hardware limits: 1.20 GHz - 2.10 GHz
  available frequency steps: 2.10 GHz, 1.60 GHz, 1.20 GHz
  available cpufreq governors: ondemand, userspace
  current policy: frequency should be within 1.20 GHz and 2.10 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz (asserted by call to hardware).
analyzing CPU 1:
  driver: acpi-cpufreq
  CPUs which need to switch frequency at the same time: 1
  hardware limits: 1.20 GHz - 2.10 GHz
  available frequency steps: 2.10 GHz, 1.60 GHz, 1.20 GHz
  available cpufreq governors: ondemand, userspace
  current policy: frequency should be within 1.20 GHz and 2.10 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 1.20 GHz (asserted by call to hardware).
root@martinusadyh:[/media/data/SLACKBUILDS/cpufrequtils]# 
[/plain]

Dan dibawah ini adalah hasil ketika mencoba menjalankan proses yang sedikit membutuhkan proses CPU :
[plain]
martinus@martinusadyh:[~]$ cpufreq-info | grep 'CPU frequency'
  current CPU frequency is 1.20 GHz.
  current CPU frequency is 1.20 GHz.
martinus@martinusadyh:[~]$ cpufreq-info | grep 'CPU frequency'
  current CPU frequency is 1.20 GHz.
  current CPU frequency is 2.10 GHz.
martinus@martinusadyh:[~]$ cpufreq-info | grep 'CPU frequency'
  current CPU frequency is 2.10 GHz.
  current CPU frequency is 1.20 GHz.
martinus@martinusadyh:[~]$ cpufreq-info | grep 'CPU frequency'
  current CPU frequency is 1.20 GHz.
  current CPU frequency is 1.20 GHz.
[/plain]

Untuk detail gimana konfigurasinya, silahkan merujuk langsung ke tulisan om Walecha yang berjudul [Mengakali Panasnya CPU](http://walecha.net/content/mengakali-panasnya-cpu) :)
