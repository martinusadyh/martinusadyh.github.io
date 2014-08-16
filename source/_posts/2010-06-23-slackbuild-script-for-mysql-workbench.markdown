---
comments: true
date: 2010-06-23 16:58:54+00:00
layout: post
slug: slackbuild-script-for-mysql-workbench
title: SlackBuild Script For MySQL WorkBench
wordpress_id: 925
categories:
- DataBase
- Slackware
tags:
- DataBase
- MySQL
- Slackware
---

Dikarenakan ada beberapa permintaan SlackBuild Script untuk MySQL Workbench dan ternyata situs aslinya [MySQL Workbench SlackBuild Script](http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/) menghilang tanpa jejak :( Buat teman-teman yang ingin melakukan kompilasi dan installasi MySQL Workbench untuk Slackware 13.1, silahkan coba gunakan SlackBuild script MySQL Workbench dibawah ini yang telah saya gunakan di Slackware 13.0 dan berjalan tanpa ada masalah.

**Note: Script-script dibawah ini murni saya ambil dari situs http://hba.ath.cx/projects/slackbuilds/testing/mysql-workbench-oss-5.1.18/ dan saya re-posting disini karena ketika tulisan ini dibuat, situs aslinya sedang tidak bisa diakses.**

Copy dan paste kode dibawah ini, kemudian simpan dengan nama **README**

    
    
    MySQL Workbench (A visual database design tool developed by MySQL)
    
    MySQL Workbench is a cross-platform, visual database design tool
    developed by MySQL. It is the highly anticipated successor
    application of the DBDesigner4 project. 
    
    This package is the Community OSS Edition.
    


**README File**

Copy dan paste kode dibawah ini, kemudian simpan dengan nama **doinst.sh**

    
    
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
    


**doinst.sh**
<!-- more -->
Sedangkan untuk SlackBuild scriptnya sendiri adalah kode dibawah ini, copy dan paste kode dibawah in kemudian simpan dengan nama **mysql-workbench-oss.SlackBuild**

    
    
    #!/bin/sh
    
    # Slackware build script for mysql-workbench-oss
    
    # Copyright (c) 2009, Antonio Hernández Blas <hba.nihilismus@gmail.com>
    # All rights reserved.
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
    
    PRGNAM=mysql-workbench-oss
    VERSION=${VERSION:-5.1.18}
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
    


**mysql-workbench-oss.SlackBuild**

Sedangkan untuk info-nya, kopi paste kode dibawah ini kemudian simpan dengan nama **mysql-workbench-oss.info**

    
    
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
    


**mysql-workbench-oss.info**

Dan file terakhir yang diperlukan adalah file **slack-desc**, kopi paste kode dibawah ini kemudian simpan dengan nama **slack-desc**

    
    
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
    


**slack-desc**

Catatan: Sebelum menginstall MySQL Workbench di Slackware 13.1, pastikan dahulu GNOME Slackbuild sudah terinstall di sistem. 

**Link-link terkait :**




  1. [Installing MySQL WorkBench di Slackware 13.0](http://martinusadyh.web.id/2009/10/07/installing-mysql-workbench-di-slackware-130/)


