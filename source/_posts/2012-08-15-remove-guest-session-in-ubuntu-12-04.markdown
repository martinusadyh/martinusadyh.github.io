---
author: admin
comments: true
date: 2012-08-15 20:00:50+00:00
layout: post
slug: remove-guest-session-in-ubuntu-12-04
title: Remove Guest Session in Ubuntu 12.04
wordpress_id: 1837
categories:
- Ubuntu
tags:
- Ubuntu
- Ubuntu 12.04
---

Ingin menghilangkan guest session di Ubuntu 12.04 ? Jika iya, silahkan edit file `/etc/lightdm/lightdm.conf` dan tambahkan baris `allow-guest=false` menjadi seperti dibawah ini :
 

    
    [SeatDefaults]
    user-session=ubuntu
    greeter-session=unity-greeter
    allow-guest=false
    



Setelah merubah file `/etc/lightdm/lightdm.conf` simpan dan logout :)
