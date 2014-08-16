---
comments: true
date: 2009-11-23 14:05:09+00:00
layout: post
slug: adding-extra-icon-in-dia
title: Adding Extra Icon In DIA
wordpress_id: 86
categories:
- Other
- Shell Script
- Slackware
---

Buat teman-teman yang senang menggambar diagram mungkin sudah tidak asing lagi kan dengan yang namanya [Visio](http://office.microsoft.com/en-us/visio/FX100487861033.aspx) kalau di Microsoft Windows, nah di lingkungan GNU/Linux kita bisa menggunakan aplikasi yang namanya [DIA Diagram](http://www.gnome.org/projects/dia/) sebagai pengganti [Visio](http://office.microsoft.com/en-us/visio/FX100487861033.aspx). Cuman sayangnya, kalau kita menggunakan DIA Diagram ada 1 hal yang rasanya masih **kurang** yaitu tampilan icon-nya masih kelihatan **jadul-jadul** banget :(

Nah apasih yang ngebikin [Visio](http://office.microsoft.com/en-us/visio/FX100487861033.aspx) spesial dimata saya yaitu, kalau kita menggambar topologi jaringan icon-nya bisa keren-keren seperti gambar dibawah ini :
[![Contoh Gambar Visio](http://knowledgehub.zeus.com/media/visio-example.png)  
Contoh Gambar Topologi Jaringan dari Visio](http://knowledgehub.zeus.com/articles/2006/12/19/zxtm_visio_stencils)

Nah sekarang coba bandingin dengan hasil gambar yang dihasilkan oleh [DIA Diagram](http://www.gnome.org/projects/dia/) yang tampilannya seperti dibawah ini :
[![Contoh Gambar DIA Diagram](http://davidnewall.com/papers/new-network.png)  
Contoh Gambar Topologi Jaringan dari DIA Diagram](http://davidnewall.com/papers/convert.html)
<!-- more -->
Nah kelihatan beda-nya kan, tapi jangan kuatir dahulu. Karena hasil dari hasil browsing sana dan tanya sini semalam membuahkan sebuah hasil :) Agar icon yang terdapat di [DIA Diagram](http://www.gnome.org/projects/dia/) kelihatan keren, saya menemukan sebuah project yang mempunyai kumpulan icon yang tidak kalah keren dengan Visio yaitu [Project gnomeDIAIcons](http://gnomediaicons.sourceforge.net/index.html). Nah icon-icon yang akan kita dapatkan dari [Project gnomeDIAIcons](http://gnomediaicons.sourceforge.net/index.html) ini tampilan-nya adalah seperti gambar dibawah ini :








[![Network Icon](http://gnomediaicons.sourceforge.net/web/images/all_icons.jpg)  
Network Icon](http://gnomediaicons.sourceforge.net/screenshots.html)

[![DataBase Icon](http://gnomediaicons.sourceforge.net/web/images/database_icons.png)  
DataBase Icon](http://gnomediaicons.sourceforge.net/screenshots.html)






Keren bukan ? :) Sedangkan cara installnya juga sangat-sangat mudah. Yang pertama yaitu, download dahulu packages [rib-network-v0.1.tar.gz](http://gnomediaicons.sourceforge.net/files/rib-network-v0.1.tar.gz) kemudian ekstrak-lah kedalam direktori **/usr/share/dia** Dan anda akan mendapatkan **shape** keren diatas :)

Nah buat teman-teman **Slackers** yang tidak mau sistem-nya kotor, dibawah ini saya sertakan juga file SlackBuild-nya sekalian :)

    
    
    #!/bin/sh
    # Copyright 2009  Martinus Ady H. <mrt.itnewbies@gmail.com>
    # All rights reserved.
    #
    # Redistribution and use of this script, with or without modification, is
    # permitted provided that the following conditions are met:
    #
    # 1. Redistributions of this script must retain the above copyright
    #    notice, this list of conditions and the following disclaimer.
    #
    #  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
    #  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
    #  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
    #  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    #  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
    #  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
    #  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
    #  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
    #  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
    #  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
    
    PKGNAM=rib-network           # Packages Name
    VERSION=v0.1                 # Packages Version
    ARCH=${ARCH:-i486}           # Architecture
    BUILD=${BUILD:-1}            # Build Number
    TAG=${TAG:-_mrt}             # Package'ers initial
    CWD=$(pwd)                   # Current Dir
    TMP=${TMP:-/tmp/id-slack}     # For consistency's sake, use this
    PKG=$TMP/package-$PKGNAM
    DIA_HOME=$PKG-$VERSION/usr/share/dia
    PKGLOG=$TMP/package-$PKGNAM-log # Installation log
    OUTPUT=${OUTPUT:-/tmp}         # Drop the package in /tmp
    
    REQUIRED_PACKAGES="dia"
    
    # Function to check installed packages on /var/log/packages
    function check_installed() {
    	ls -1 /var/log/packages | grep "^${1}-[^-]*-[^-]*-[^-]*$" >/dev/null 2>&1
        return $?
    }
    
    for REQ in $REQUIRED_PACKAGES; do
    	check_installed "$REQ" || {
    		echo "${0##*/}: Required package '$REQ' not installed."
    		exit 1
    	}
    done
    
    # Remove old directory from previous build
    rm -rf $TMP/$PKGNAM $PKG-$VERSION
    
    # Make new directory
    mkdir -p $TMP $PKG-$VERSION $OUTPUT
    
    # Remove ekstrak packages in current dir
    rm -rf $PKGNAM-$VERSION
    
    cd $TMP || exit 1
    
    # Creating temporary live filesystem
    mkdir -p $DIA_HOME
    
    tar -zxvf $CWD/$PKGNAM-$VERSION.tar.gz -C $DIA_HOME || exit 1
    cd $PKG-$VERSION
    chown -R root:root .
    chmod -R u+w,go+r-w,a-s .
    
    mkdir -p $PKG-$VERSION/install
    cat $CWD/slack-desc > $PKG-$VERSION/install/slack-desc
    
    cd $PKG-$VERSION
    /sbin/makepkg -l y -c n $OUTPUT/$PKGNAM-$VERSION-$ARCH-$BUILD$TAG.tgz
    
    echo "Package result at -> " $OUTPUT/$PKGNAM-$VERSION-$ARCH-$BUILD$TAG.txz
    echo "Package creation done."
    echo ""
    echo "Indonesian Slackware Community"
    echo "http://slackware.linux.or.id/"
    echo ""
    



Sebelum menjalankan file SlackBuild diatas, teman-teman harus sudah meng-install [DIA Diagram](http://www.gnome.org/projects/dia/) khusus Slackware yang dapat didownload dari [SlackBuild](http://slackbuilds.org/repository/13.0/graphics/dia/). Nah apa jadinya jika teman-teman belum meng-install [DIA Diagram](http://www.gnome.org/projects/dia/) kemudian menjalankan SlackBuild diatas ? Hasilnya adalah seperti dibawah ini :

    
    
    root@martinusadyh:/home/martinus/SLACKBUILDS/gnome-dia-icon# ./gnomeDIAIcons.SlackBuild
    gnomeDIAIcons.SlackBuild: Required package 'dia' not installed.
    root@martinusadyh:/home/martinus/SLACKBUILDS/gnome-dia-icon#
    


**Note: Hehee... penambahan dependencies checking sederhana di file SlackBuild :)**

Nah jika teman-teman sudah berhasil meng-install packages [DIA Diagram](http://www.gnome.org/projects/dia/) dan [gnomeDIAIcons](http://gnomediaicons.sourceforge.net/index.html), maka kita akan dapat menggambar topologi jaringan sekeren punya [Visio](http://office.microsoft.com/en-us/visio/FX100487861033.aspx) dan contohnya adalah seperti gambar dibawah ini :
[![Contoh Gambar DIA Diagram dengan gnomeDIAIcons](http://jamesmcdonald.id.au/blog/wp-content/uploads/2008/09/dmz.png)  
Contoh Gambar Topologi Jaringan dari DIA Diagram dengan gnomeDIAIcons](http://jamesmcdonald.id.au/gnu-linux/dia-has-some-cool-new-network-icons)

Dengan bantuan dari [Project gnomeDIAIcons](http://gnomediaicons.sourceforge.net/index.html), sekarang kita sudah bisa menggambar diagram dengan keren dan hasilnya pun ga kalah bagus dengan milik [Visio](http://office.microsoft.com/en-us/visio/FX100487861033.aspx) :) Gimana teman-teman ? Masih merasa butuh [Visio](http://office.microsoft.com/en-us/visio/FX100487861033.aspx)  ??

Happy Slacking :)

**Link-link terkait :**
- [Project DIA Diagram](http://www.gnome.org/projects/dia/)
- [Project gnomeDIAIcons](http://gnomediaicons.sourceforge.net/index.html)
- [Dia Has Some Cool New Network Icons](http://jamesmcdonald.id.au/gnu-linux/dia-has-some-cool-new-network-icons)
- [New Network Icons Schema To Gnome Dia](http://thiagoribeiro.wordpress.com/2008/08/18/new-network-icons-schema-to-gnome-dia/)
