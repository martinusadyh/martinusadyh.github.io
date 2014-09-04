---
layout: post
title: "Setup Octopress in Linux Mint"
date: 2014-09-04 19:04:48 +0700
comments: true
sharing: true
keywords: "Static Blog, Blog, Octopress, Linux, Linux Mint 17, Ruby, Ubuntu 14.04, Git, GitHub"
description: "Sudah sejak lama saya sebenarnya saya migrasi blog dari platform WordPress ke static blog, alasan utama-nya adalah ingin mengejar loading page yang lebih cepat dan supaya setiap postingan"
categories:
- Linux
tags:
- Static Blog
- Blog
- Octopress
- Linux
---

Sudah sejak lama saya sebenarnya saya migrasi blog dari _platform_ [WordPress](http://wordpress.com) ke _static_ blog, alasan utama-nya adalah ingin mengejar _loading page_ yang lebih cepat dan supaya setiap postingan saya bisa di simpan di [Git](http://git-scm.com/) (tentu-nya dengan menggunakan _repo_ gratisan di [GitHub](https://github.com/)) :D :) Dari banyak-nya pilihan _static blog generator_ yang bisa dilihat di [StaticGen](https://www.staticgen.com/), saya akhirnya memutuskan untuk menggunakan [Octopress](http://octopress.org) dikarenakan **Octopress** merupakan _static blog generator_ yang paling populer saat ini dan tutorial setup-nya juga sudah dibuatkan oleh pak [Endy Muhardin](https://www.facebook.com/endy.muhardin?fref=ts) di tulisan [Terima Kasih WordPress](http://software.endy.muhardin.com/aplikasi/terima-kasih-wordpress/) :D

Nah yang jadi masalah saya adalah karena **Octopress** ini dibuat dengan bahasa pemrograman ruby yang mana saya bener-bener buta :( . Karena kemarin sempat 3 kali setup ruby untuk kepentingan **Octopress** baru berhasil dan sukses menjalankan perintah `rake generate && rake preview`, akhirnya saya putuskan untuk men-dokumentasikan langkah-langkah tersebut pada postingan kali ini :)

Semua langkah-langkah ini dijalankan di sistem operasi Linux Mint 17 dengan kondisi _fresh install_ , jadi memang semua kebutuhan juga belum ada. Langkah pertama yang harus dilakukan adalah install dulu _library_ yang dibutuhkan dengan menjalankan perintah `sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev curl` seperti dibawah ini :
```
martinusadyh@martinusadyh ~ $ sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev curl
Reading package lists... Done
Building dependency tree       
Reading state information... Done
libreadline6 is already the newest version.
zlib1g is already the newest version.
The following packages were automatically installed and are no longer required:
  libmysqlcppconn7 libodbc1 libvsqlitepp3 python-pyodbc
Use 'apt-get autoremove' to remove them.
The following extra packages will be installed:
  dpkg-dev g++ g++-4.8 libbison-dev libc-dev-bin libc6-dev libstdc++-4.8-dev
  libtinfo-dev libyaml-0-2 m4
Suggested packages:
  autoconf2.13 autoconf-archive gnu-standards autoconf-doc libtool bison-doc
  debian-keyring g++-multilib g++-4.8-multilib gcc-4.8-doc libstdc++6-4.8-dbg
  glibc-doc libstdc++-4.8-doc
Recommended packages:
  automake automaken libalgorithm-merge-perl libssl-doc
The following NEW packages will be installed:
  autoconf bison build-essential dpkg-dev g++ g++-4.8 libbison-dev
  libc-dev-bin libc6-dev libreadline6-dev libssl-dev libstdc++-4.8-dev
  libtinfo-dev libyaml-0-2 libyaml-dev m4 zlib1g-dev
0 upgraded, 17 newly installed, 0 to remove and 44 not upgraded.
Need to get 13.6 MB of archives.
After this operation, 56.7 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
...
...
Setting up libreadline6-dev:amd64 (6.3-4ubuntu2) ...
Setting up zlib1g-dev:amd64 (1:1.2.8.dfsg-1ubuntu1) ...
Setting up libssl-dev:amd64 (1.0.1f-1ubuntu2.5) ...
Setting up libyaml-dev:amd64 (0.1.4-3ubuntu3) ...
Processing triggers for libc-bin (2.19-0ubuntu6.3) ...
martinusadyh@martinusadyh ~ $
```
<!-- more -->

Karena kita menggunakan [RVM](http://octopress.org/docs/setup/rvm/) untuk menginstall ruby, maka lanjutkan dengan mendownload **RVM** dengan perintah `curl -L https://get.rvm.io | bash -s stable --ruby` kemudian jalankan perintah ` source /home/martinusadyh/.rvm/scripts/rvm` supaya kita bisa langsung menggunakan **RVM** seperti dibawah ini :
```
martinusadyh@martinusadyh ~ $ curl -L https://get.rvm.io | bash -s stable --ruby
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   184  100   184    0     0     61      0  0:00:03  0:00:02  0:00:01    61
100 20776  100 20776    0     0   3965      0  0:00:05  0:00:05 --:--:-- 17532
Downloading https://github.com/wayneeseguin/rvm/archive/stable.tar.gz

Installing RVM to /home/martinusadyh/.rvm/
    Adding rvm PATH line to /home/martinusadyh/.profile /home/martinusadyh/.bashrc /home/martinusadyh/.zshrc.
    Adding rvm loading line to /home/martinusadyh/.bash_profile /home/martinusadyh/.zlogin.
    Fixing environment for *.
Unknown ruby interpreter version (do not know how to handle): *.
Installation of RVM in /home/martinusadyh/.rvm/ is almost complete:

  * To start using RVM you need to run `source /home/martinusadyh/.rvm/scripts/rvm`
    in all your open shell windows, in rare cases you need to reopen all shell windows.

# Martinus Ady H,
#
#   Thank you for using RVM!
#   We sincerely hope that RVM helps to make your life easier and more enjoyable!!!
#
# ~Wayne, Michal & team.

In case of problems: http://rvm.io/help and https://twitter.com/rvm_io

  * WARNING: You have '~/.profile' file, you might want to load it,
    to do that add the following line to '/home/martinusadyh/.bash_profile':

      source ~/.profile

rvm 1.25.29 (stable) by Wayne E. Seguin <wayneeseguin@gmail.com>, Michal Papis <mpapis@gmail.com> [https://rvm.io/]
Searching for binary rubies, this might take some time.
No binary rubies available for: mint/17/x86_64/ruby-2.1.2.
Continuing with compilation. Please read 'rvm help mount' to get more information on binary rubies.
Checking requirements for mint.
Installing requirements for mint.
Updating system............
Installing required packages: libsqlite3-dev, sqlite3, libgdbm-dev, libncurses5-dev, automake, libtool, libffi-dev..........
Requirements installation successful.
Found user configured '-j' flag in 'rvm_make_flags', pleae note that RVM can detect number of CPU threads and set the '-j' flag automatically if you do not set it.
Installing Ruby from source to: /home/martinusadyh/.rvm/rubies/ruby-2.1.2, this may take a while depending on your cpu(s)...
ruby-2.1.2 - #downloading ruby-2.1.2, this may take a while depending on your connection...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 11.4M  100 11.4M    0     0   345k      0  0:00:33  0:00:33 --:--:--  477k
ruby-2.1.2 - #extracting ruby-2.1.2 to /home/martinusadyh/.rvm/src/ruby-2.1.2....
ruby-2.1.2 - #configuring....................................................
ruby-2.1.2 - #post-configuration.
ruby-2.1.2 - #compiling.....................................................................................
ruby-2.1.2 - #installing.................................
ruby-2.1.2 - #making binaries executable..
Rubygems 2.2.2 already available in installed ruby, skipping installation, use --force to reinstall.
ruby-2.1.2 - #gemset created /home/martinusadyh/.rvm/gems/ruby-2.1.2@global
ruby-2.1.2 - #importing gemset /home/martinusadyh/.rvm/gemsets/global.gems..........................................................
ruby-2.1.2 - #generating global wrappers........
ruby-2.1.2 - #gemset created /home/martinusadyh/.rvm/gems/ruby-2.1.2
ruby-2.1.2 - #importing gemsetfile /home/martinusadyh/.rvm/gemsets/default.gems evaluated to empty gem list
ruby-2.1.2 - #generating default wrappers........
ruby-2.1.2 - #adjusting #shebangs for (gem irb erb ri rdoc testrb rake).
Install of ruby-2.1.2 - #complete 
Ruby was built without documentation, to build it run: rvm docs generate-ri
Creating alias default for ruby-2.1.2...

  * To start using RVM you need to run `source /home/martinusadyh/.rvm/scripts/rvm`
    in all your open shell windows, in rare cases you need to reopen all shell windows.
martinusadyh@martinusadyh ~ $ source /home/martinusadyh/.rvm/scripts/rvm
```

Langkah selanjutnya adalah install-lah ruby versi 1.9.3 dengan mengetikkan perintah `rvm install 1.9.3` dan jalankan perintah `rvm use 1.9.3` untuk menggunakan ruby versi 1.9.3 seperti dibawah ini :
```
martinusadyh@martinusadyh ~ $ rvm install 1.9.3
Searching for binary rubies, this might take some time.
No binary rubies available for: mint/17/x86_64/ruby-1.9.3-p547.
Continuing with compilation. Please read 'rvm help mount' to get more information on binary rubies.
Checking requirements for mint.
Requirements installation successful.
Installing Ruby from source to: /home/martinusadyh/.rvm/rubies/ruby-1.9.3-p547, this may take a while depending on your cpu(s)...
ruby-1.9.3-p547 - #downloading ruby-1.9.3-p547, this may take a while depending on your connection...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 9801k  100 9801k    0     0   381k      0  0:00:25  0:00:25 --:--:--  416k
ruby-1.9.3-p547 - #extracting ruby-1.9.3-p547 to /home/martinusadyh/.rvm/src/ruby-1.9.3-p547....
ruby-1.9.3-p547 - #applying patch /home/martinusadyh/.rvm/patches/ruby/GH-488.patch.
ruby-1.9.3-p547 - #configuring.............................................
ruby-1.9.3-p547 - #post-configuration.
ruby-1.9.3-p547 - #compiling................................................................................................................................................................
ruby-1.9.3-p547 - #installing........................
ruby-1.9.3-p547 - #making binaries executable..
ruby-1.9.3-p547 - #downloading rubygems-2.2.2
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  404k  100  404k    0     0  65039      0  0:00:06  0:00:06 --:--:--  104k
No checksum for downloaded archive, recording checksum in user configuration.
ruby-1.9.3-p547 - #extracting rubygems-2.2.2....
ruby-1.9.3-p547 - #removing old rubygems.........
ruby-1.9.3-p547 - #installing rubygems-2.2.2...............
ruby-1.9.3-p547 - #gemset created /home/martinusadyh/.rvm/gems/ruby-1.9.3-p547@global
ruby-1.9.3-p547 - #importing gemset /home/martinusadyh/.rvm/gemsets/global.gems..........................................................
ruby-1.9.3-p547 - #generating global wrappers........
ruby-1.9.3-p547 - #gemset created /home/martinusadyh/.rvm/gems/ruby-1.9.3-p547
ruby-1.9.3-p547 - #importing gemsetfile /home/martinusadyh/.rvm/gemsets/default.gems evaluated to empty gem list
ruby-1.9.3-p547 - #generating default wrappers........
ruby-1.9.3-p547 - #adjusting #shebangs for (gem irb erb ri rdoc testrb rake).
Install of ruby-1.9.3-p547 - #complete 
WARNING: Please be aware that you just installed a ruby that is no longer maintained (2014-02-23), for a list of maintained rubies visit:

    http://bugs.ruby-lang.org/projects/ruby/wiki/ReleaseEngineering

Please consider upgrading to ruby-2.1.2 which will have all of the latest security patches.
Ruby was built without documentation, to build it run: rvm docs generate-ri

martinusadyh@martinusadyh ~ $ rvm use 1.9.3
Using /home/martinusadyh/.rvm/gems/ruby-1.9.3-p547
martinusadyh@martinusadyh ~ $
```

Sampai disini seharusnya ruby sudah terinstall dengan baik dan benar, jalankan perintah `ruby --version` untuk mengecek hasil installasi diatas.
```
martinusadyh@martinusadyh ~ $ ruby --version
ruby 1.9.3p547 (2014-05-14 revision 45962) [x86_64-linux]
martinusadyh@martinusadyh ~ $ 
```

Setelah ruby terinstall, sekarang masuk ke dalam direktori **Octopress** dan jalankan perintah `gem install bundler` seperti dibawah ini :
```
martinusadyh@martinusadyh ~ $ cd octopress/
martinusadyh@martinusadyh ~/octopress $ gem install bundler
Fetching: bundler-1.7.2.gem (100%)
Successfully installed bundler-1.7.2
1 gem installed
Installing ri documentation for bundler-1.7.2...
Installing RDoc documentation for bundler-1.7.2...
martinusadyh@martinusadyh ~/octopress $ rbenv rehash
martinusadyh@martinusadyh ~/octopress $ bundle install
Fetching gem metadata from https://rubygems.org/........
Resolving dependencies...
Installing rake 10.3.2
Installing RedCloth 4.2.9
Installing blankslate 2.1.2.4
Installing timers 1.1.0
Installing celluloid 0.15.2
Installing chunky_png 1.3.1
Installing fast-stemmer 1.0.2
Installing classifier-reborn 2.0.1
Installing coffee-script-source 1.8.0
Installing execjs 2.2.1
Installing coffee-script 2.3.0
Installing colorator 0.1
Installing fssm 0.2.10
Installing sass 3.2.19
Installing compass 0.12.7
Installing ffi 1.9.3
Installing tilt 1.4.1
Installing haml 4.0.5
Installing jekyll-coffeescript 1.0.1
Installing jekyll-gist 1.1.0
Installing jekyll-paginate 1.0.0
Installing jekyll-sass-converter 1.2.1
Installing rb-fsevent 0.9.4
Installing rb-inotify 0.9.5
Installing listen 2.7.9
Installing jekyll-watch 1.1.0
Installing kramdown 1.4.1
Installing liquid 2.6.1
Installing mercenary 0.3.4
Installing posix-spawn 0.3.9
Installing yajl-ruby 1.1.0
Installing pygments.rb 0.6.0
Installing redcarpet 3.1.2
Installing safe_yaml 1.0.3
Installing parslet 1.5.0
Installing toml 0.1.1
Installing jekyll 2.3.0
Installing jekyll-sitemap 0.5.1
Installing octopress-hooks 2.2.1
Installing octopress-date-format 2.0.1
Installing rack 1.5.2
Installing rack-protection 1.5.3
Installing rdiscount 2.1.7.1
Installing rubypants 0.2.0
Installing sass-globbing 1.0.0
Installing sinatra 1.4.5
Installing stringex 1.4.0
Using bundler 1.7.2
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
Post-install message from haml:

HEADS UP! Haml 4.0 has many improvements, but also has changes that may break
your application:

* Support for Ruby 1.8.6 dropped
* Support for Rails 2 dropped
* Sass filter now always outputs <style> tags
* Data attributes are now hyphenated, not underscored
* html2haml utility moved to the html2haml gem
* Textile and Maruku filters moved to the haml-contrib gem

For more info see:

http://rubydoc.info/github/haml/haml/file/CHANGELOG.md

martinusadyh@martinusadyh ~/octopress $
```

Jika semua proses diatas selesai, sekarang jalankan perintah `rake generate && rake preview` untuk melihat blog kita di localhost :) Supaya lebih memudahkan menjalankan perintah `rake` di kemudian hari, tambahkan perintah `source /home/martinusadyh/.rvm/scripts/rvm` di `.bashrc` dengan cara seperti dibawah ini :
```
martinusadyh@martinusadyh ~/octopress $ echo "source /home/martinusadyh/.rvm/scripts/rvm" >> ~/.bashrc
```

Yaps dan sekarang kita sudah bisa nge-blog lagi :)