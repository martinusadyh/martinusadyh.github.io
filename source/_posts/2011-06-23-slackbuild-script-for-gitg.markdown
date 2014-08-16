---
comments: true
date: 2011-06-23 17:01:38+00:00
layout: post
slug: slackbuild-script-for-gitg
title: SlackBuild Script For Gitg
wordpress_id: 1379
categories:
- Project Management
- Slackware
tags:
- Git
- Slackware
- version control
---

Karena mencari di SlackBuild ternyata tidak ada, maka saya posting kesini aja sekalian :) Nah untuk teman-teman yang ingin menginstall aplikasi [gitg](http://trac.novowork.com/git) bisa menggunakan SlackBuild script yang sudah saya siapkan dan sebelum menggunakan-nya, pastikan bahwa kita sudah menginstall [gtksourceview](http://projects.gnome.org/gtksourceview/) dahulu yang SlackBuild script-nya bisa di download di [sini](http://slackbuilds.org/repository/13.37/libraries/gtksourceview/)

Untuk sementara ini, dependencies yang baru saya temukan baru [gtksourceview](http://projects.gnome.org/gtksourceview/) di Slackware64 + GSB 3.0.0. Bagi teman-teman yang tidak menggunakan GNOME sebagai Desktop Manager-nya, jika mengetahui ada dependencies yang kurang tolong di infokan disini sekalian biar saya bisa update file `slack-required` dengan info dependencies yang terbaru :)
<!-- more -->
Dan dibawah ini adalah file SlackBuild utama dari gitg yang saya gunakan, silahkan di copy paste :)

    
    
    #!/bin/sh
    
    # Slackware build script for gitg
    
    # Copyright 2008-2009  Martinus Ady H <martinus@artivisi.com>
    # All rights reserved.
    #
    # Redistribution and use of this script, with or without modification, is
    # permitted provided that the following conditions are met:
    #
    # 1. Redistributions of this script must retain the above copyright
    #    notice, this list of conditions and the following disclaimer.
    #
    # THIS SOFTWARE IS PROVIDED BY THE AUTHOR ''AS IS'' AND ANY EXPRESS OR IMPLIED
    # WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
    # MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
    # EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    # SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
    # PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
    # OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
    # WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
    # OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
    # ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    
    PRGNAM=gitg
    VERSION=0.0.8
    ARCH=${ARCH:-x86_64}
    BUILD=${BUILD:-2}
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
    
    rm -rf $TMP/$PRGNAM-$VERSION $PKG
    mkdir -p $TMP $PKG $OUTPUT 
    cd $TMP
    tar xvf $CWD/$PRGNAM-$VERSION.tar.bz2
    cd $PRGNAM-$VERSION
    chown -R root:root .
    chmod -R u+w,go+r-w,a-s .
    
    # Your application will probably need different configure flags;
    # these are provided as an example only. 
    # Be sure to build only shared libraries unless there's some need for
    # static.
    CFLAGS="$SLKCFLAGS" \
    CXXFLAGS="$SLKCFLAGS" \
    ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --build=$ARCH-slackware-linux \
      2>&1 | tee $PKGLOG/configure-$PKGNAM-$VERSION.log     # Log configure process.
    
    # Compile the application and install it into the $PKG directory
    make 2>&1 | tee $PKGLOG/make-$PKGNAM-$VERSION.log       # Log make process.
    make install DESTDIR=$PKG 2>&1 | tee $PKGLOG/make-install-$PKGNAM-$VERSION.log # Log make install process.
    
    # Creating symlink for executable makensis
    mkdir -p $PKG/usr/bin
    ( cd $PKG/usr/bin ; ln -sf ../lib${LIBDIRSUFFIX}/nsis-2.46/makensis makensis )
    
    ( cd $PKG
      find . | xargs file | grep "executable" | grep ELF | cut -f 1 -d : | \
        xargs strip --strip-unneeded 2> /dev/null || true
      find . | xargs file | grep "shared object" | grep ELF | cut -f 1 -d : | \
        xargs strip --strip-unneeded 2> /dev/null || true
    )
    
    # Compress man pages if they exist
    if [ -d $PKG/usr/man ] ; then
        ( cd $PKG/usr/man
            find . -type f -exec gzip -9 {} \;
            for i in $(find . -type 1) ; do ln -s $( readlink $i ).gz $i.gz ; rm $i; done
        ) 
    fi
    
    mkdir -p $PKG/usr/doc/$PRGNAM-$VERSION
    cp -a \
      AUTHORS COPYING ChangeLog INSTALL README \
      $PKG/usr/doc/$PRGNAM-$VERSION
    cat $CWD/$PRGNAM.SlackBuild > $PKG/usr/doc/$PRGNAM-$VERSION/$PRGNAM.SlackBuild
    
    mkdir -p $PKG/install
    cat $CWD/slack-desc > $PKG/install/slack-desc
    
    cd $PKG
    /sbin/makepkg -l y -c n $OUTPUT/$PRGNAM-$VERSION-$ARCH-$BUILD$TAG.${PKGTYPE:-tgz}
    



Jika mau file lengkap-nya (sekalian beserta file `slack-desc, slack-required, gitg.info` dan `README`), silahkan merujuk langsung ke repository [https://github.com/martinusadyh/martin-slackbuild/tree/development](https://github.com/martinusadyh/martin-slackbuild/tree/development) 

Dan dibawah ini adalah hasil dari aplikasi gitg yang sudah berjalan pada Slackware64 + GSB 3.0.0 di laptop yang saya gunakan :)
[caption id="attachment_1382" align="alignleft" width="150" caption="Gitg"][![Gitg](http://martinusadyh.web.id/wp-content/uploads/2011/06/Gitg-150x150.png)](http://martinusadyh.web.id/wp-content/uploads/2011/06/Gitg.png)[/caption]

