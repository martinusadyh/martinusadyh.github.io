---
comments: true
date: 2010-12-09 19:35:22+00:00
layout: post
slug: mysqlworkbench-5-2-31-for-slackware
title: MySQLWorkbench 5.2.31 For Slackware
wordpress_id: 1178
categories:
- DataBase
- Slackware
tags:
- DataBase
- MySQL
- Slackware
---

Hari ini tidak sengaja iseng-iseng main ke project [MySQL WorkBench](http://wb.mysql.com/) dan ternyata ada update terbaru yaitu versi **5.2.31** yang announcement-nya bisa  teman-teman baca di halaman [MySQL Workbench 5.2.31 GA Available](http://wb.mysql.com/?p=861). Berbeda dari versi-versi sebelum-nya, pada versi ini ternyata MySQL Workbench tidak hanya mengusung tool **Data Modelling** saja melainkan menyediakan juga **Query (sebagai ganti dari MySQL Query Browser)** dan **Administration (sebagai ganti dari MySQL Administration)** (dulu ke 3 tool ini bisa disebut sebagai **MySQL GUI Tool**) 

Nah untuk teman-teman yang penasaran bagaimana tampilan dari [MySQL WorkBench](http://wb.mysql.com/) terbaru ini, silahkan lihat beberapa screenshot yang terdapat dibawah ini :
[![WorkspaceMySQLWB](http://farm6.static.flickr.com/5163/5247286226_04ee54b0cf.jpg)](http://www.flickr.com/photos/10243554@N02/5247286226/)  
**Tampilan Workspace MySQL Workbench**
<!-- more -->
[![QueryBrowser](http://farm6.static.flickr.com/5047/5247286224_a89b6bd447.jpg)](http://www.flickr.com/photos/10243554@N02/5247286224/)  
**Tampilan Query Browser MySQL Workbench**

[![ERModelling](http://farm6.static.flickr.com/5008/5247286220_02de0aaed0.jpg)](http://www.flickr.com/photos/10243554@N02/5247286220/)  
**Tampilan ER Modelling MySQL Workbench**

[![Administration](http://farm6.static.flickr.com/5001/5247286212_8cdbec2b3f.jpg)](http://www.flickr.com/photos/10243554@N02/5247286212/)  
**Tampilan Server Administration MySQL Workbench**

Nah untuk teman-teman pengguna Slackware yang ingin mencoba [MySQL WorkBench](http://wb.mysql.com/) terbaru ini, bisa menggunakan SlackBuild Script yang terdapat dibawah ini (simpan dengan nama **mysql-workbench-gpl.SlackBuild**):

    
    
    #!/bin/sh
    
    # Slackware build script for mysql-workbench-gpl
    
    # Copyright (c) 2009, Antonio Hernández Blas <hba.nihilismus@gmail.com>
    # All rights reserved.
    # Modified By : Martinus Ady H. <martinus@artivisi.com>
    #
    # Redistribution and use in source and binary forms, with or without
    # modification, are permitted provided that the following conditions are met:
    # 1.- Redistributions of source code must retain the above copyright
    #     notice, this list of conditions and the following disclaimer.
    #
    # THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
    # EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
    # WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    # DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
    # DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
    # (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    # LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
    # ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    
    PRGNAM=mysql-workbench-gpl
    VERSION=${VERSION:-5.2.31-src}
    ARCH=${ARCH:-i486}
    BUILD=${BUILD:-1}
    TAG=${TAG:-_SBo}
    
    CWD=$(pwd)
    TMP=${TMP:-/tmp/SBo}
    PKG=$TMP/package-$PRGNAM
    OUTPUT=${OUTPUT:-/tmp}
    
    if [ "$ARCH" = "i486" ]; then
      SLKCFLAGS="-O2 -march=i486 -mtune=i686"
      LIBDIRSUFFIX=""
    elif [ "$ARCH" = "i686" ]; then
      SLKCFLAGS="-O2 -march=i686 -mtune=i686"
      LIBDIRSUFFIX=""
    elif [ "$ARCH" = "x86_64" ]; then
      SLKCFLAGS="-O2 -fPIC"
      LIBDIRSUFFIX="64"
    fi
    
    set -e
    
    rm -rf $PKG
    mkdir -p $TMP $PKG $OUTPUT
    cd $TMP
    rm -rf $PRGNAM-$VERSION
    tar xvf $CWD/$PRGNAM-$VERSION.tar.gz
    cd $PRGNAM-$VERSION
    chown -R root:root .
    find . \
     \( -perm 777 -o -perm 775 -o -perm 711 -o -perm 555 -o -perm 511 \) \
     -exec chmod 755 {} \; -o \
     \( -perm 666 -o -perm 664 -o -perm 600 -o -perm 444 -o -perm 440 -o -perm 400 \) \
     -exec chmod 644 {} \;
    
    CFLAGS="$SLKCFLAGS" \
    CXXFLAGS="$SLKCFLAGS" \
    ./autogen.sh \
      --prefix=/usr \
      --libdir=/usr/lib${LIBDIRSUFFIX} \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --mandir=/usr/man \
      --docdir=/usr/doc/$PRGNAM-$VERSION \
      --build=$ARCH-slackware-linux \
      --disable-debug \
      --enable-shared=yes \
      --enable-static=no \
      --enable-python-modules \
      --enable-readline
    
    make
    make install DESTDIR=$PKG
    
    ( cd $PKG
      find . | xargs file | grep "executable" | grep ELF | cut -f 1 -d : | \
        xargs strip --strip-unneeded 2> /dev/null || true
      find . | xargs file | grep "shared object" | grep ELF | cut -f 1 -d : | \
        xargs strip --strip-unneeded 2> /dev/null
    )
    
    # There're not manpages
    if [ -d $PKG/usr/share/man ]; then
      mv $PKG/usr/share/man $PKG/usr
    fi
    
    if [ -d $PKG/usr/man ]; then
      ( cd $PKG/usr/man
        find . -type f -exec gzip -9 {} \;
        for i in $( find . -type l ) ; do ln -s $( readlink $i ).gz $i.gz ; rm $i ; done
      )
    fi
    
    mkdir -p $PKG/usr/doc/$PRGNAM-$VERSION
    cp -a \
      AUTHORS ChangeLog COPYING INSTALL NEWS README samples \
      $PKG/usr/doc/$PRGNAM-$VERSION
    cat $CWD/$PRGNAM.SlackBuild > $PKG/usr/doc/$PRGNAM-$VERSION/$PRGNAM.SlackBuild
    
    mkdir -p $PKG/install
    cat $CWD/slack-desc > $PKG/install/slack-desc
    cat $CWD/doinst.sh > $PKG/install/doinst.sh
    
    cd $PKG
    /sbin/makepkg -l y -c n $OUTPUT/$PRGNAM-$VERSION-$ARCH-$BUILD$TAG.${PKGTYPE:-tgz}
    



Simpan juga file **README** dibawah ini :

    
    
    MySQL Workbench (A visual database design tool developed by MySQL)
    
    MySQL Workbench is a cross-platform, visual database design tool
    developed by MySQL. It is the highly anticipated successor
    application of the DBDesigner4 project. 
    
    This package is the Community OSS Edition.
    



Simpan file **mysql-workbench-oss.info** dibawah ini :

    
    
    PRGNAM="mysql-workbench-oss"
    VERSION="5.1.18"
    HOMEPAGE="http://dev.mysql.com/workbench/"
    DOWNLOAD="http://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-oss-5.1.18.tar.gz/from/http://mirror.trouble-free.net/mysql_mirror/"
    MD5SUM="f136bac3e808cadda36321ac0e644399"
    DOWNLOAD_x86_64=""
    MD5SUM_x86_64=""
    MAINTAINER="Antonio Hernández Blas"
    EMAIL="hba.nihilismus@gmail.com"
    APPROVED=""
    



Simpan juga file **slack-desc** dibawah ini :

    
    
    # HOW TO EDIT THIS FILE:
    # The "handy ruler" below makes it easier to edit a package description.  Line
    # up the first '|' above the ':' following the base package name, and the '|'
    # on the right side marks the last column you can put a character in.  You must
    # make exactly 11 lines for the formatting to be correct.  It's also
    # customary to leave one space after the ':'.
    
                   |-----handy-ruler------------------------------------------------------|
    mysql-workbench-oss: MySQL Workbench (A visual database design tool developed by MySQL)
    mysql-workbench-oss:
    mysql-workbench-oss: MySQL Workbench is a cross-platform, visual database design tool
    mysql-workbench-oss: developed by MySQL. It is the highly anticipated successor
    mysql-workbench-oss: application of the DBDesigner4 project. 
    mysql-workbench-oss:
    mysql-workbench-oss: This package is the Community OSS Edition.
    mysql-workbench-oss:
    mysql-workbench-oss: Homepage: http://dev.mysql.com/workbench/
    mysql-workbench-oss:
    mysql-workbench-oss:
    



Dan yang terakhir, simpan file **doinst.sh** dibawah ini :

    
    
    
    if [ -x /usr/bin/update-desktop-database ]; then
      /usr/bin/update-desktop-database -q usr/share/applications >/dev/null 2>&1
    fi
    
    if [ -x /usr/bin/update-mime-database ]; then
      /usr/bin/update-mime-database usr/share/mime >/dev/null 2>&1
    fi
    
    if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
      if [ -x /usr/bin/gtk-update-icon-cache ]; then
        /usr/bin/gtk-update-icon-cache usr/share/icons/hicolor >/dev/null 2>&1
      fi  
    fi
    



Dan akhir kata, selamat menikmati sajian [MySQL WorkBench](http://wb.mysql.com/) yang berjalan di atas Slackware kita tercinta ini :)

