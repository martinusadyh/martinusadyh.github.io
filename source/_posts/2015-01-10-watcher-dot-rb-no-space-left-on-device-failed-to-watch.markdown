---
layout: post
title: "Watcher.rb: No space left on device - Failed to watch"
date: 2015-01-10 00:01:21 +0700
comments: true
categories: 
---

Malam ini ketika saya melakukan update blog, saya mendapatkan sebuah pesan error ketika menjalankan perintah `rake preview` untuk melihat _preview_ blog saya seperti terlihat dibawah ini :
```
martinusadyh@martinusadyh:[~/MyArticle/STATIC_BLOG/octopress]$ rake preview
Starting to watch source with Jekyll and Compass. Starting Rack on port 4000
[2015-01-09 23:50:47] INFO  WEBrick 1.3.1
[2015-01-09 23:50:47] INFO  ruby 1.9.3 (2014-11-13) [x86_64-linux]
[2015-01-09 23:50:47] INFO  WEBrick::HTTPServer#start: pid=11095 port=4000
Configuration file: /home/martinusadyh/MyArticle/STATIC_BLOG/octopress/_config.yml
>>> Compass is watching for changes. Press Ctrl-C to Stop.
Errno::ENOSPC on line ["85"] of /home/martinusadyh/.rvm/gems/ruby-1.9.3-p551/gems/rb-inotify-0.9.5/lib/rb-inotify/watcher.rb: No space left on device - Failed to watch "/home/martinusadyh/MyArticle/STATIC_BLOG/octopress/sass/partials/sidebar": The user limit on the total number of inotify watches was reached or the kernel failed to allocate a needed resource.
Run with --trace to see the full backtrace
            Source: source
       Destination: public
      Generating... 
                    done.
FATAL: Listen error: unable to monitor directories for changes.
Visit https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers for info on how to fix this.
jekyll 2.3.0 | Error:  FATAL: Listen error: unable to monitor directories for changes.
Visit https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers for info on how to fix this.

^C[2015-01-09 23:52:18] INFO  going to shutdown ...
martinusadyh@martinusadyh:[~/MyArticle/STATIC_BLOG/octopress]$
```
Untung-nya pesan error diatas sekaligus memberikan [tautan](https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers) untuk meningkatkan jumlah _inotify-watchers_ yang terdapat pada sistem kita, dan dibawah ini merupakan ringkasan untuk keperluan sebagai catatan pribadi jika ketemu dengan masalah yang sama lagi :)

### Melihat jumlah max_user_watches yang terdapat di sistem
```
martinusadyh@martinusadyh:[~/MyArticle/STATIC_BLOG/octopress]$ cat /proc/sys/fs/inotify/max_user_watches
8192
martinusadyh@martinusadyh:[~/MyArticle/STATIC_BLOG/octopress]$ 
```

### Menaikkan jumlah max_user_watches sementara
```
martinusadyh@martinusadyh:[~/MyArticle/STATIC_BLOG/octopress]$ sudo sysctl fs.inotify.max_user_watches=10000
martinusadyh@martinusadyh:[~/MyArticle/STATIC_BLOG/octopress]$ sudo sysctl -p
```

### Menaikkan jumlah max_user_watches permanen
```
martinusadyh@martinusadyh:[~/MyArticle/STATIC_BLOG/octopress]$ echo fs.inotify.max_user_watches=10000 | sudo tee -a /etc/sysctl.conf
martinusadyh@martinusadyh:[~/MyArticle/STATIC_BLOG/octopress]$ sudo sysctl -p
martinusadyh@martinusadyh:[~/MyArticle/STATIC_BLOG/octopress]$ 
```

