---
comments: true
date: 2010-03-26 22:42:06+00:00
layout: post
slug: installasi-file-tar-gz-dan-tar-bz2
title: Installasi File tar.gz dan tar.bz2
wordpress_id: 186
categories:
- CentOS
- Shell Script
- Slackware
- Ubuntu
tags:
- CentOS
- Instalasi
- Slackware
- tar bz2
- tar file
- tar gz
- Ubuntu
---

Bingung bagaimana caranya menginstall file yang mempunya ekstensi **tar.gz** atau **tar.bz2** ? Apasih sebenarnya file **tar.gz** atau **tar.bz2** ini ? Buat teman-teman yang belum tahu, file dengan ekstensi **tar.gz** atau **tar.bz2** ini biasanya adalah sebuah **source code** dari sebuah aplikasi. Masih bingung juga dengan penjelasan barusan ? Kalau iya, sebenarnya distribusi GNU/Linux itu terdapat 2 macam model distribusi packages ? 2 macam model distribusi ? Yups.. 2 macam model distribusi tersebut yaitu :

  1. **Binary Packages**, ini dibuat untuk tujuan penggunaan secara umum, maksudnya penggunaan secara umum disini adalah agar dapat dijalankan di semua tipe dan arsitektur komputer. Dan biasanya distribusi ini juga tidak menggunakan opsi-opsi khusus yang terdapat di salah satu tipe atau arsitektur komputer tertentu. Sedangkan yang bisa dikategorikan dengan **Binary Packages** ini adalah semua packages yang ber-ekstensi ***.deb, *.rpm, *.tgz dan *.txz**, jadi jika menginstall sebuah aplikasi menggunakan repository maka itu berarti kita menginstall dari **Binary Packages** yang memang sudah disediakan untuk kebutuhan komputer kita. :)

  2. **Source Packages**, seperti pada namanya :D distribusi ini menyertakan file **source code** asli dari aplikasi-nya. Biasanya pihak pengembang pasti menyertakan atau menyediakan distribusi model ini untuk di download. Sedangkan untuk **end-user**, bisa menggunakan **source code** ini jika para pengembang tidak menyertakan **Binary Packages** untuk distribusi GNU/Linux yang digunakan :) Coba bayangkan jika teman-teman membuat sebuah aplikasi yang targetnya adalah Sistem Operasi GNU/Linux, installer model gimana yang akan teman-teman pilih dengan banyak-nya distribusi GNU/Linux ? Mau buat satu-persatu untuk tiap distribusi ? Ya pasti capek kan :D Cara paling gampang yaitu, sediakan-lah **source code** dari aplikasi teman-teman dan kemudian biarkan komunitas GNU/Linux sendiri yang membuatkan **binary packages** untuk aplikasi kita :D Lebih gampang kan ? :D

<!-- more -->
Nah kalau sudah tahu, sekarang bagaimana sih cara install file tersebut ? Cara-nya sih sebenarnya mudah, kita tinggal ekstrak file dengan ekstensi **tar.gz** atau **tar.bz2** tersebut kemudian jalankan perintah **./configure && make && make install** :) Eits....tapi apa betul caranya cuma seperti itu saja ? Emang betul sih caranya cuma seperti diatas, tapi kalau ingin berhasil dan sukses menjalankan perintah **./configure** dengan sukses ada beberapa langkah lagi yang harus diketahui :D Sebelum mulai melakukan installasi file **tar.gz** atau **tar.bz2**, keperluan dasar yang harus teman-teman sediakan di distribusi GNU/Linux yang teman-teman gunakan adalah **installah paket development** dahulu (teman-teman bisa mengacu ke distro yang teman-teman bagaimana cara menginstall paket development ini). Kalau sudah, mari kita ambil satu contoh aplikasi yang ber-ekstensi **tar.gz** atau **tar.bz2** yaitu [Geany IDE](http://www.geany.org/) :) Sekarang coba download-lah dahulu file source dari [Geany IDE](http://www.geany.org/) kemudian simpan pada direktori yang sudah teman-teman persiapkan. Jika sudah, langkah pertama yang harus dilakukan yaitu ekstrak-lah file **geany-0.18.1.tar.bz2** dengan perintah `tar -xjf geany-0.18.1.tar.bz2` seperti dibawah ini :

    martinus@martinusadyh:[/media/data/DOWNLOADS/geany]$ tar -xjf geany-0.18.1.tar.bz2 
    martinus@martinusadyh:[/media/data/DOWNLOADS/geany]$ 

**Jika mempunyai ekstensi tar.gz, ekstrak-lah dengan menggunakan perintah tar -zxf geany-0.18.1.tar.gz. Silahkan tambah opsi v jika ingin melihat proses ekstrak sedang berjalan**

<div>
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- 300x250, created 12/13/09 -->
<ins class="adsbygoogle"
     style="display:inline-block;width:300px;height:250px"
     data-ad-client="ca-pub-8822787298726866"
     data-ad-slot="0323780848"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
</div>

Hasil dari perintah diatas kita akan mendapatkan sebuah direktori dengan nama **geany-0.18.1**, sekarang masuk-lah kedalam direktori dengan mengetikkan perintah `cd geany-0.18.1` seperti dibawah ini :

    martinus@martinusadyh:[/media/data/DOWNLOADS/geany]$  ls
    geany-0.18.1.tar.bz2 geany-0.18.1
    martinus@martinusadyh:[/media/data/DOWNLOADS/geany]$  cd geany-0.18.1
    martinus@martinusadyh:[/media/data/DOWNLOADS/geany/geany-0.18.1]$   

Sebelum mulai mengetikkan perintah `./configure`, coba buka dan bacalah file **README dan INSTALL** untuk mengetahui kira-kira library apa saja yang dibutuhkan oleh [Geany](http://www.geany.org/) agar dapat di install dengan sukses pada komputer kita. Dari kedua file **README dan INSTALL** yang kita dapatkan dari [Geany](http://www.geany.org/), kebutuhan yang harus dipenuhi agar [Geany](http://www.geany.org/) bisa terinstall dengan sukses dapat dilihat pada file **README** pada bagian **Requirement** yang isinya kurang lebih seperti dibawah ini :
    
    Requirements
    ------------
    For compiling Geany yourself, you will need the GTK (>= 2.8.0) libraries
    and header files. You will also need its dependency libraries and header
    files, such as Pango, Glib and ATK. All these files are available at
    http://www.gtk.org.
    
    Furthermore you need, of course, a C compiler and the Make tool; a C++
    compiler is also needed for the required Scintilla library included. The
    GNU versions of these tools are recommended.

Seperti kita lihat, ternyata [Geany](http://www.geany.org/) membutuhkan library **GTK v2.8.0 keatas, Pango, Glib dan ATK** sebelum kita bisa mengetikkan perintah `./configure`. Jadi pastikan dahulu semua library tersebut sudah terinstall pada distribusi GNU/Linux yang teman-teman gunakan :D Setelah yakin semua library yang dibutuhkan sudah ter-install dengan baik, sekarang mari kita lihat opsi-opsi apa saja yang didukung oleh [Geany](http://www.geany.org/)  dengan mengetikkan perintah `./configure --help` seperti dibawah ini :

    martinus@martinusadyh:[/media/data/DOWNLOADS/geany/geany-0.18.1]$ ./configure --help
    `configure' configures this package to adapt to many kinds of systems.

    Usage: ./configure [OPTION]... [VAR=VALUE]...

    To assign environment variables (e.g., CC, CFLAGS...), specify them as
    VAR=VALUE.  See below for descriptions of some of the useful variables.

    Defaults for the options are specified in brackets.

    Configuration:
      -h, --help              display this help and exit
          --help=short        display options specific to this package
          --help=recursive    display the short help of all the included packages
      -V, --version           display version information and exit
      -q, --quiet, --silent   do not print `checking...' messages
          --cache-file=FILE   cache test results in FILE [disabled]
      -C, --config-cache      alias for `--cache-file=config.cache'
      -n, --no-create         do not create output files
        --srcdir=DIR        find the sources in DIR [configure dir or `..']

    Installation directories:
    --prefix=PREFIX         install architecture-independent files in PREFIX
                            [/usr/local]
    --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
                            [PREFIX]

    By default, `make install' will install all the files in
    `/usr/local/bin', `/usr/local/lib' etc.  You can specify
    an installation prefix other than `/usr/local' using `--prefix',
    for instance `--prefix=$HOME'.

    For better control, use the options below.

    Fine tuning of the installation directories:
      --bindir=DIR            user executables [EPREFIX/bin]
      --sbindir=DIR           system admin executables [EPREFIX/sbin]
      --libexecdir=DIR        program executables [EPREFIX/libexec]
      --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
      --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
      --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
      --libdir=DIR            object code libraries [EPREFIX/lib]
      --includedir=DIR        C header files [PREFIX/include]
      --oldincludedir=DIR     C header files for non-gcc [/usr/include]
      --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
      --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
      --infodir=DIR           info documentation [DATAROOTDIR/info]
      --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
      --mandir=DIR            man documentation [DATAROOTDIR/man]
      --docdir=DIR            documentation root [DATAROOTDIR/doc/PACKAGE]
      --htmldir=DIR           html documentation [DOCDIR]
      --dvidir=DIR            dvi documentation [DOCDIR]
      --pdfdir=DIR            pdf documentation [DOCDIR]
      --psdir=DIR             ps documentation [DOCDIR]
  
    Program names:
      --program-prefix=PREFIX            prepend PREFIX to installed program names
      --program-suffix=SUFFIX            append SUFFIX to installed program names
      --program-transform-name=PROGRAM   run sed PROGRAM on installed program names

    System types:
      --build=BUILD     configure for building on BUILD [guessed]
      --host=HOST       cross-compile to build programs to run on HOST [BUILD]

    Optional Features:
      --disable-option-checking  ignore unrecognized --enable/--with options
      --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
      --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
      --disable-dependency-tracking  speeds up one-time build
      --enable-dependency-tracking   do not reject slow dependency extractors
      --disable-nls           do not use Native Language Support
      --enable-static[=PKGS]  build static libraries [default=no]
      --enable-shared[=PKGS]  build shared libraries [default=yes]
      --enable-fast-install[=PKGS]
                              optimize for fast installation [default=yes]
      --disable-libtool-lock  avoid locking (might break parallel builds)
      --enable-binreloc       compile with binary relocation support
      --disable-deprecated    Disable deprecated GTK functions.
      --disable-plugins       compile without plugin support [default=no]
      --enable-gnu-regex      compile with included GNU regex library [default=no]
      --enable-socket         enable if you want to detect a running instance
                              [[default=yes]]
      --enable-vte            enable if you want virtual terminal support
                              [[default=yes]]
      --enable-the-force      enable if you are Luke Skywalker and the force is
                              with you [[default=no]]

    Optional Packages:
      --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
      --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
      --with-pic              try to use only PIC/non-PIC objects [default=use
                              both]
      --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
      --with-vte-module-path=PATH
                          Path to a loadable libvte [[default=None]]

    Some influential environment variables:
       CC          C compiler command
       CFLAGS      C compiler flags
       LDFLAGS     linker flags, e.g. -L if you have libraries in a
                   nonstandard directory 
       LIBS        libraries to pass to the linker, e.g. -l
       CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I if
                   you have headers in a nonstandard directory 
       CPP         C preprocessor
       CXX         C++ compiler command
       CXXFLAGS    C++ compiler flags
       CXXCPP      C++ preprocessor
       PKG_CONFIG  path to pkg-config utility
       GTK_CFLAGS  C compiler flags for GTK, overriding pkg-config
       GTK_LIBS    linker flags for GTK, overriding pkg-config
       GIO_CFLAGS  C compiler flags for GIO, overriding pkg-config
       GIO_LIBS    linker flags for GIO, overriding pkg-config

    Use these variables to override the choices made by `configure' or to help
    it to find libraries and programs with nonstandard names/locations.

    Report bugs to the package provider.
    martinus@martinusadyh:[/media/data/DOWNLOADS/geany/geany-0.18.1]$  

Waw... banyak banget yah, tapi disinilah enaknya kalau kita melakukan installasi melalui **source code**. Kita bisa bermain-main dengan opsi-opsi yang terdapat pada aplikasi yang ingin kita install :) Nah jika teman-teman hanya menjalankan perintah `./configure` tanpa diikuti dengan parameter dibelakangnya, maka berarti teman-teman menggunakan opsi standart yang disediakan oleh pengembang [Geany](http://www.geany.org/). Wah rugi dong kalau kita pakai opsi yang biasa-biasa saja :D Sedangkan opsi-opsi apa saja yang harus digunakan ini tergantung dengan teman-teman :D Jadi silahkan ber-eksperimen disini (silahkan dicoba-coba saja :) ) Sekarang bagaimana cara-nya untuk menggunakan opsi-opsi tambahan tersebut ? Cara-nya gampang koq, kita tinggal ketik `./configure [nama-opsi]` kemudian tekan **ENTER** seperti dibawah ini :

    martinus@martinusadyh:[/media/data/DOWNLOADS/geany/geany-0.18.1]$ ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --build=i486-slackware-linux 
    checking for a BSD-compatible install... /usr/bin/ginstall -c
    checking whether build environment is sane... yes
    checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
    checking for gawk... gawk
    checking whether make sets $(MAKE)... yes
    checking for style of include used by make... GNU
    checking for gcc... gcc
    checking whether the C compiler works... yes
    checking for C compiler default output file name... a.out
    checking for suffix of executables... 
    checking whether we are cross compiling... no
    checking for suffix of object files... o
    checking whether we are using the GNU C compiler... yes
    checking whether gcc accepts -g... yes
    checking for gcc option to accept ISO C89... none needed
    checking dependency style of gcc... gcc3
    checking how to run the C preprocessor... gcc -E
    checking for grep that handles long lines and -e... /usr/bin/grep
    checking for egrep... /usr/bin/grep -E
    checking for ANSI C header files... yes
    checking for sys/types.h... yes
    checking for sys/stat.h... yes
    checking for stdlib.h... yes
    checking for string.h... yes
    checking for memory.h... yes
    checking for strings.h... yes
    checking for inttypes.h... yes
    checking for stdint.h... yes
    checking for unistd.h... yes
    checking minix/config.h usability... no
    checking minix/config.h presence... no
    checking for minix/config.h... no
    checking whether it is safe to define __EXTENSIONS__... yes
    checking for gcc... (cached) gcc
    checking whether we are using the GNU C compiler... (cached) yes
    checking whether gcc accepts -g... (cached) yes
    checking for gcc option to accept ISO C89... (cached) none needed
    checking dependency style of gcc... (cached) gcc3
    checking for g++... g++
    checking whether we are using the GNU C++ compiler... yes
    checking whether g++ accepts -g... yes
    checking dependency style of g++... gcc3
    checking for g++... /usr/bin/g++
    checking whether ln -s works... yes
    checking whether NLS is requested... yes
    checking for intltool-update... /usr/bin/intltool-update
    checking for intltool-merge... /usr/bin/intltool-merge
    checking for intltool-extract... /usr/bin/intltool-extract
    checking for xgettext... /usr/bin/xgettext
    checking for msgmerge... /usr/bin/msgmerge
    checking for msgfmt... /usr/bin/msgfmt
    checking for gmsgfmt... /usr/bin/msgfmt
    checking for perl... /usr/bin/perl
    checking for perl >= 5.8.1... 5.10.0
    checking for XML::Parser... ok
    checking build system type... i486-slackware-linux-gnu
    checking host system type... i486-slackware-linux-gnu
    checking for a sed that does not truncate output... /usr/bin/sed
    checking for fgrep... /usr/bin/grep -F
    checking for ld used by gcc... /usr/i486-slackware-linux/bin/ld
    checking if the linker (/usr/i486-slackware-linux/bin/ld) is GNU ld... yes
    checking for BSD- or MS-compatible name lister (nm)... /usr/bin/nm -B
    checking the name lister (/usr/bin/nm -B) interface... BSD nm
    checking the maximum length of command line arguments... 1572864
    checking whether the shell understands some XSI constructs... yes
    checking whether the shell understands "+="... yes
    checking for /usr/i486-slackware-linux/bin/ld option to reload object files... -r
    checking for objdump... objdump
    checking how to recognize dependent libraries... pass_all
    checking for ar... ar
    checking for strip... strip
    checking for ranlib... ranlib
    checking command to parse /usr/bin/nm -B output from gcc object... ok
    checking for dlfcn.h... yes
    checking whether we are using the GNU C++ compiler... (cached) yes
    checking whether g++ accepts -g... (cached) yes
    checking dependency style of g++... (cached) gcc3
    checking how to run the C++ preprocessor... g++ -E
    checking for objdir... .libs
    checking if gcc supports -fno-rtti -fno-exceptions... no
    checking for gcc option to produce PIC... -fPIC -DPIC
    checking if gcc PIC flag -fPIC -DPIC works... yes
    checking if gcc static flag -static works... yes
    checking if gcc supports -c -o file.o... yes
    checking if gcc supports -c -o file.o... (cached) yes
    checking whether the gcc linker (/usr/i486-slackware-linux/bin/ld) supports shared libraries... yes
    checking whether -lc should be explicitly linked in... no
    checking dynamic linker characteristics... GNU/Linux ld.so
    checking how to hardcode library paths into programs... immediate
    checking whether stripping libraries is possible... yes
    checking if libtool supports shared libraries... yes
    checking whether to build shared libraries... yes
    checking whether to build static libraries... no
    checking for ld used by g++... /usr/i486-slackware-linux/bin/ld
    checking if the linker (/usr/i486-slackware-linux/bin/ld) is GNU ld... yes
    checking whether the g++ linker (/usr/i486-slackware-linux/bin/ld) supports shared libraries... yes
    checking for g++ option to produce PIC... -fPIC -DPIC
    checking if g++ PIC flag -fPIC -DPIC works... yes
    checking if g++ static flag -static works... yes
    checking if g++ supports -c -o file.o... yes
    checking if g++ supports -c -o file.o... (cached) yes
    checking whether the g++ linker (/usr/i486-slackware-linux/bin/ld) supports shared libraries... yes
    checking dynamic linker characteristics... GNU/Linux ld.so
    checking how to hardcode library paths into programs... immediate
    checking fcntl.h usability... yes
    checking fcntl.h presence... yes
    checking for fcntl.h... yes
    checking fnmatch.h usability... yes
    checking fnmatch.h presence... yes
    checking for fnmatch.h... yes
    checking glob.h usability... yes
    checking glob.h presence... yes
    checking for glob.h... yes
    checking regex.h usability... yes
    checking regex.h presence... yes
    checking for regex.h... yes
    checking for stdlib.h... (cached) yes
    checking sys/time.h usability... yes
    checking sys/time.h presence... yes
    checking for sys/time.h... yes
    checking for off_t... yes
    checking for size_t... yes
    checking whether struct tm is in sys/time.h or time.h... time.h
    checking for gethostname... yes
    checking for ftruncate... yes
    checking for fgetpos... yes
    checking for mkstemp... yes
    checking for regcomp... yes
    checking for strerror... yes
    checking for strstr... yes
    checking for git... /usr/bin/git
    checking for svn... /usr/bin/svn
    checking whether binary relocation support should be enabled... no
    checking for pkg-config... /usr/bin/pkg-config
    checking pkg-config is at least version 0.9.0... yes
    checking for GTK... yes
    checking for GIO... yes
    checking for library containing connect... none required
    checking whether the force is with you... no
    checking locale.h usability... yes
    checking locale.h presence... yes
    checking for locale.h... yes
    checking for LC_MESSAGES... yes
    checking libintl.h usability... yes
    checking libintl.h presence... yes
    checking for libintl.h... yes
    checking for ngettext in libc... yes
    checking for dgettext in libc... yes
    checking for bind_textdomain_codeset... yes
    checking for msgfmt... (cached) /usr/bin/msgfmt
    checking for dcgettext... yes
    checking if msgfmt accepts -c... yes
    checking for gmsgfmt... (cached) /usr/bin/msgfmt
    checking for xgettext... (cached) /usr/bin/xgettext
    checking for catalogs to be installed...  be bg ca cs de el en_GB es fi fr gl hu it ja ko lb nl pl pt pt_BR ro ru sl sv tr uk vi zh_CN zh_TW
    configure: creating ./config.status
    config.status: creating Makefile
    config.status: creating icons/Makefile
    config.status: creating icons/16x16/Makefile
    config.status: creating icons/48x48/Makefile
    config.status: creating icons/scalable/Makefile
    config.status: creating tagmanager/Makefile
    config.status: creating tagmanager/include/Makefile
    config.status: creating scintilla/Makefile
    config.status: creating scintilla/include/Makefile
    config.status: creating src/Makefile
    config.status: creating plugins/Makefile
    config.status: creating po/Makefile.in
    config.status: creating doc/Makefile
    config.status: creating doc/geany.1
    config.status: creating geany.spec
    config.status: creating geany.pc
    config.status: creating doc/Doxyfile
    config.status: creating config.h
    config.status: executing depfiles commands
    config.status: executing libtool commands
    config.status: executing default-1 commands
    config.status: executing po/stamp-it commands
    ----------------------------------------
    Install Geany in                   : /usr
    Using GTK version                  : 2.16.6
    Build with GTK printing support    : yes
    Build with plugin support          : yes
    Use virtual terminal support       : yes
    Use (UNIX domain) socket support   : yes
    
    Configuration is done OK.
    martinus@martinusadyh:[/media/data/DOWNLOADS/geany/geany-0.18.1]$

Jika proses `./configure` diatas telah selesai, sekarang kita bisa langsung menjalankan perintah `make && make install` dengan menggunakan akses **super user** atau **root** seperti dibawah ini :

    martinus@martinusadyh:[/media/data/DOWNLOADS/geany/geany-0.18.1]$ su -
    Password:
    martinus@martinusadyh:[/media/data/DOWNLOADS/geany/geany-0.18.1]# make && make install
    .................
    .................
    .................
    make[2]: Nothing to be done for `install-exec-am'.
    /bin/sh ./mkinstalldirs /tmp/id-slack/package-geany/usr/share/geany; \
    	/usr/bin/ginstall -c -m 644 ./data/c99.tags /tmp/id-slack/package-geany/usr/share/geany; \
    	/usr/bin/ginstall -c -m 644 ./data/php.tags /tmp/id-slack/package-geany/usr/share/geany; \
    	/usr/bin/ginstall -c -m 644 ./data/python.tags /tmp/id-slack/package-geany/usr/share/geany; \
    	/usr/bin/ginstall -c -m 644 ./data/pascal.tags /tmp/id-slack/package-geany/usr/share/geany; \
    	/usr/bin/ginstall -c -m 644 ./data/latex.tags /tmp/id-slack/package-geany/usr/share/geany; \
    	/usr/bin/ginstall -c -m 644 ./data/html_entities.tags /tmp/id-slack/package-geany/usr/share/geany; \
    	/usr/bin/ginstall -c -m 644 ./COPYING /tmp/id-slack/package-geany/usr/share/geany/GPL-2; \
    	for file in ./data/*; do \
    	  if test -f $file; then \
    	    /usr/bin/ginstall -c -m 644 $file /tmp/id-slack/package-geany/usr/share/geany/; \
    	  fi \
    	done
    mkdir -p -- /tmp/id-slack/package-geany/usr/share/geany
    test -z "/usr/share/applications" || /usr/bin/mkdir -p "/tmp/id-slack/package-geany/usr/share/applications"
     /usr/bin/ginstall -c -m 644 geany.desktop '/tmp/id-slack/package-geany/usr/share/applications'
    test -z "/usr/lib/pkgconfig" || /usr/bin/mkdir -p "/tmp/id-slack/package-geany/usr/lib/pkgconfig"
     /usr/bin/ginstall -c -m 644 geany.pc '/tmp/id-slack/package-geany/usr/lib/pkgconfig'
    make[2]: Leaving directory `/tmp/id-slack/geany-0.18.1'
    make[1]: Leaving directory `/tmp/id-slack/geany-0.18.1'
    martinus@martinusadyh:[/media/data/DOWNLOADS/geany/geany-0.18.1]# 
    
Nah selesai sudah proses installasi file **tar.gz** atau **tar.bz2** , dan sekarang kita sudah bisa menggunakan [Geany](http://www.geany.org/) untuk keperluan _membuat surat cinta_ :) Mudah bukan? Sebenarnya installasi dari source code tidak sesulit seperti yang dibayangkan, tetapi kita tetap perlu ketelitian tingkat tinggi untuk mengumpulkan library yang dibutuhkan :D Biasanya pula, kita udah terlanjur **blank mood** (baca malas) :D kalau ternyata library yang dibutuhkan itu banyak sekali :D (capek nyari library soalnya) Terlepas dari semua itu, proses installasi dari source membuat kita **sedikit lebih dalam** bermain-main dengan GNU/Linux :D 

Akhir kata, tulisan ini adalah murni asumsi dari pengalaman saya pribadi loh ya selama saya bermain-main dengan GNU/Linux. Jadi kalau misalkan teman-teman melihat ada yang salah, silahkan di kritik harusnya bagimana :D Maklum saya juga bukan programmer GNU C/C++ :D, saya juga sedang belajar menjadi **pembuat binary packages** yang benar :D Dan oh iya, buat teman-teman yang ingin tahu lebih dalam tentang semua proses dibalik layar sebelum kita bisa menjalankan perintah-perintah diatas, dibawah ini ada beberapa link dari wikipedia yang sudah saya kumpulkan untuk keperluan pribadi :D Jadi kalau kurang jelas, monggo dilihat referensi yang saya gunakan ya :D

Happy slacking all :)


**Link-link terkait :**

  1. [Geany IDE](http://www.geany.org/)
  2. [Installasi tar.gz dan tar.bz2 by Mbah Google](http://www.google.co.id/search?hl=id&client=firefox-a&hs=9iw&rls=org.mozilla:en-US:official&ei=9iKtS-WtO4K8rAfs5fymAQ&sa=X&oi=spell&resnum=0&ct=result&cd=1&ved=0CAUQBSgA&q=Instalasi+File+tar.gz+dan+tar.bz2&spell=1)
  3. [Wikipedia Autoconf](http://en.wikipedia.org/wiki/Autoconf)
  4. [Wikipedia Make (software)](http://en.wikipedia.org/wiki/Make_%28software%29)
  5. [Wikipedia Configure Script](http://en.wikipedia.org/wiki/Configure_script)
  6. [Wikipedia Autotools](http://en.wikipedia.org/wiki/Autotools)
  7. [Tutorial Automake](http://www.openismus.com/documents/linux/automake/automake.shtml)
  8. [Developing software with GNU](http://www.amath.washington.edu/~lf/tutorials/autoconf/toolsmanual_toc.html#TOC34)
  9. [Tutorial Make](http://www.eng.hawaii.edu/Tutor/Make/)
  10. [FreeBSD Port Overview](http://www.freebsd.org/doc/handbook/ports-overview.html)