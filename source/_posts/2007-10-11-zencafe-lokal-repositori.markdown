---
comments: true
date: 2007-10-11 13:15:02+00:00
layout: post
slug: zencafe-lokal-repositori
title: Zencafe Lokal Repositori
wordpress_id: 15
categories:
- Shell Script
- Slackware
---

Kemaren waktu baca-baca di [forum.linux.or.id](http://forum.linux.or.id/viewtopic.php?t=10771), ada yang tanya bagaimana caranya membuat repositori lokal di Zencafe. Setelah semalaman bongkar-bongkar script **netpkg** akhirnya saya berhasil meng-edit script **netpkg** agar dapat digunakan untuk keperluan lokal repositori, jadi tidak perlu download-download lagi untuk proses instalasi programnya :)

Tahapan-tahapan yang perlu dilakukan untuk dapat menggunakan repositori secara lokal di Zencafe atau Zenwalk disini saya bagi menjadi 3 bagian yaitu :
<!-- more -->




  1. ** Pembuatan CD yang berisi kumpulan packages-packages **

Proses pembuatan CD ini berfungsi untuk mempermudah penyebaran repositori dari Zencafe :) (pernah dengar DVD Repositori-nya ubuntu kan ? Nah kita akan buat seperti itu) Untuk pembuatan CD Repositori ini tidak ada aturan-aturan khusus, tetapi yang perlu diperhatikan disini adalah file **PACKAGES.TXT** dan **PACKAGES.TXT.gz**

Ok, sekarang kita langsung saja ke langkah-langkah pembuatannya:


    * Buatlah sebuah direktori untuk menampung packages-packages yang akan dijadikan sebagai repositori, sebagai contoh disini buatlah sebuah direktori **OfflinePackages** dan masukkanlah package-package yang ingin anda jadikan sebagai repositori kedalam direktori **OfflinePackages** hingga struktur direktorinya menjadi seperti dibawah ini:

    
    
    operatore[OfflinePackages]$ pwd
    /home/operatore/DATA_OPERATORE/Martinus/OfflinePackages
    operatore[OfflinePackages]$ ls -l
    total 0
    drwxr-xr-x 2 operatore users 216 2007-10-09 22:05 xap
    operatore[OfflinePackages]$ ls -l xap/
    total 16600
    -rw-r--r-- 1 root      root   107027 2007-06-20 02:09 bc-1.06-i486-46.1.tgz
    -rw-r--r-- 1 operatore users 4190618 2007-04-07 20:47 blogbridge-5.0.1.tgz
    -rwxr-xr-x 1 operatore users 4960683 2007-02-06 01:51 k3b-1.0rc5-i486-1kjz.tgz
    -rw-r--r-- 1 operatore users 7710157 2007-06-23 12:33 pidgin-2.0.0-i486-1zc1.tgz
    operatore[OfflinePackages]$
    


Note: Anda dapat mengkategorikan packages-packages yang anda masukkan berdasarkan direktori-direktori standart Slackware, bisa juga tidak (tidak mengikuti aturan)



    * Setelah selesai, sekarang buatlah sebuah file bernama PACKAGES.TXT (ingat semuanya ditulis dalam huruf besar, tidak boleh tidak). File PACKAGES.TXT ini berfungsi sebagai **metadata** yang digunakan oleh **netpkg** untuk mendaftar packages-packages yang tersedia. Sedangkan isi dari file PACKAGES.TXT ini mempunyai aturan sebagai berikut:


> 
PACKAGE NAME:  **Nama packages**
PACKAGE LOCATION:  **Lokasi packages**
PACKAGE SIZE (compressed): **Ukuran packages dalam mode kompresi** K
PACKAGE SIZE (uncompressed):  **Ukuran packages sebenarnya** K
PACKAGE REQUIRED: **Dependencies packages yang diperlukan jika ada**
PACKAGE CONFLICTS: ***Maap kurang tahu***
PACKAGE SUGGESTS:  ***Maap kurang tahu***
PACKAGE DESCRIPTION: **Descripsi packages, taruh dibawah baris ini**




Sedangkan contoh isi file PACKAGES.TXT punya saya adalah sebagai berikut :

    
    
    PACKAGE NAME:  bc-1.06-i486-46.1.tgz
    PACKAGE LOCATION:  ./xap
    PACKAGE SIZE (compressed):  ? K
    PACKAGE SIZE (uncompressed):  ? K
    PACKAGE REQUIRED:
    PACKAGE CONFLICTS:
    PACKAGE SUGGESTS:
    PACKAGE DESCRIPTION:
    bc: bc
    bc:
    bc: This is sample configuration file for GNU/Linux Zencafe
    bc: tutorial offline repository. Please use with your own risk
    bc: and don't complain to me if your data or your file is broken
    bc:
    bc:
    bc:
    
    PACKAGE NAME:  blogbridge-5.0.1.tgz
    PACKAGE LOCATION:  ./xap
    PACKAGE SIZE (compressed):  ? K
    PACKAGE SIZE (uncompressed):  ? K
    PACKAGE REQUIRED:
    PACKAGE CONFLICTS:
    PACKAGE SUGGESTS:
    PACKAGE DESCRIPTION:
    blogbridge: blogbridge
    blogbridge:
    blogbridge: This is sample configuration file for GNU/Linux Zencafe
    blogbridge: tutorial offline repository. Please use with your own risk
    blogbridge: and don't complain to me if your data or your file is broken
    blogbridge:
    blogbridge:
    blogbridge:
    
    PACKAGE NAME:  k3b-1.0rc5-i486-1kjz.tgz
    PACKAGE LOCATION:  ./xap
    PACKAGE SIZE (compressed):  ? K
    PACKAGE SIZE (uncompressed):  ? K
    PACKAGE REQUIRED:
    PACKAGE CONFLICTS:
    PACKAGE SUGGESTS:
    PACKAGE DESCRIPTION:
    k3b: k3b
    k3b:
    k3b: This is sample configuration file for GNU/Linux Zencafe
    k3b: tutorial offline repository. Please use with your own risk
    k3b: and don't complain to me if your data or your file is broken
    k3b:
    k3b:
    k3b:
    
    PACKAGE NAME:  pidgin-2.0.0-i486-1zc1.tgz
    PACKAGE LOCATION:  ./xap
    PACKAGE SIZE (compressed):  ? K
    PACKAGE SIZE (uncompressed):  ? K
    PACKAGE REQUIRED:
    PACKAGE CONFLICTS:
    PACKAGE SUGGESTS:
    PACKAGE DESCRIPTION:
    pidgin: pidgin
    pidgin:
    pidgin: This is sample configuration file for GNU/Linux Zencafe
    pidgin: tutorial offline repository. Please use with your own risk
    pidgin: and don't complain to me if your data or your file is broken
    pidgin:
    pidgin:
    pidgin:
    


_Untuk deskripsi package, bisa diambil di file **slack-desc** di setiap packages yang dimasukkan (Maap belum menemukan bagaimana cara meng-otomatisasi pembuatan file PACKAGES.TXT ini) _



    * Setelah itu simpanlah file PACKAGES.TXT diatas pada direktori **OfflinePackages** hingga struktur direktori OfflinePackages menjadi seperti dibawah ini:

    
    
    operatore[OfflinePackages]$ pwd
    /home/operatore/DATA_OPERATORE/Martinus/OfflinePackages
    operatore[OfflinePackages]$ ls -l
    total 4
    -rw-r--r-- 1 operatore users 1827 2007-10-10 23:59 PACKAGES.TXT
    drwxr-xr-x 2 operatore users  216 2007-10-09 22:05 xap
    operatore[OfflinePackages]$
    





    * Setelah proses pembuatan file PACKAGES.TXT selesai, sekarang buatlah file PACKAGES.TXT.gz dengan cara seperti dibawah ini:

    
    
    operatore[OfflinePackages]$ ls
    PACKAGES.TXT  xap
    operatore[OfflinePackages]$ cp PACKAGES.TXT PACKAGES.TXT.1
    operatore[OfflinePackages]$ gzip -9 PACKAGES.TXT
    operatore[OfflinePackages]$ mv PACKAGES.TXT.1 PACKAGES.TXT
    operatore[OfflinePackages]$ ls -l
    total 8
    -rw-r--r-- 1 operatore users 1827 2007-10-11 00:59 PACKAGES.TXT
    -rw-r--r-- 1 operatore users  427 2007-10-10 23:59 PACKAGES.TXT.gz
    drwxr-xr-x 2 operatore users  216 2007-10-09 22:05 xap
    operatore[OfflinePackages]$
    





    * Proses pembuatan CD repositori sudah hampir selesai, sekarang kita tinggal membuat file *.iso-nya kemudian mem-burningnya untuk kemudian disebarkan ke teman-teman atau kolega anda :) Untuk membuat sebuah file *.iso, sekarang keluarlah dari direktori OfflinePackages dengan mengetikkan **cd ..** kemudian buatlah file iso dengan menjalankanlah perintah **mkisofs -V ZC_OfflineRepository -J -r -o /home/operatore/DATA_OPERATORE/Martinus/Repos.iso /home/operatore/DATA_OPERATORE/Martinus/OfflinePackages/** seperti dibawah ini:

    
    
    operatore[OfflinePackages]$ cd ..
    operatore[Martinus]$ mkisofs -V ZC_OfflineRepository -J -r -o /home/operatore/DATA_OPERATORE/Martinus/Repos.iso /home/operatore/DATA_OPERATORE/Martinus/OfflinePackages/
     59.08% done, estimate finish Thu Oct 11 01:08:02 2007
    Total translation table size: 0
    Total rockridge attributes bytes: 928
    Total directory bytes: 2048
    Path table size(bytes): 22
    Max brk space used 21000
    8473 extents written (16 MB)
    operatore[Martinus]$
    





Nah sekarang file *.iso yang berisi kumpulan-kumpulan repository sudah siap untuk di burning ke dalam CD Blank atau CD kosong  dan siap untuk di distribusikan :)  Sekarang mari kita lanjutkan ke proses berikutnya yaitu meng-konfigurasi agar **netpkg** dapat digunakan untuk keperluan offline :)



  2. ** Konfigurasi netpkg untuk keperluan offline**

Secara default, **netpkg** tidak di desain untuk dapat digunakan secara offline. Tetapi berhubung banyaknya teman-teman yang bertanya bagaimana agar netpkg bisa digunakan layaknya synaptic-nya ubuntu, maka sekarang mari kita mulai bermain-main dengan netpkg :)

Langkah-langkah yang perlu dilakukan agar netpkg dapat digunakan secara offline adalah :


    * ** Konfigurasi pada file /etc/netpkg.conf **
Untuk konfigurasi penggunaan repositori secara offline, penulisan pada file /etc/netpkg.conf ini saya menggunakan aturan sebagai berikut:

    
    
    Internet_mirror = file:///mnt/cdrom
    



Untuk teman-teman yang tidak ingin terikat, bisa mengganti PATH-nya terserah keinginan sendiri asalkan harus menyertakan **Internet_mirror = file:///**



    * ** Konfigurasi pada file /usr/libexec/netpkg-functions**
Setelah konfigurasi pada file **/etc/netpkg.conf** selesai dilakukan, sekarang kita lakukan konfigurasi pada file **/usr/libexec/netpkg-functions** hingga menjadi seperti dibawah ini:

    
    
    #!/bin/bash
    
    # Copyright Jean-Philippe Guillemin <jp.guillemin@free.fr>. This program is free software; you can redistribute
    # it and/or modify it under the terms of the GNU General Public License as published by
    # the Free Software Foundation; either version 2 of the License, or (at your option)
    # any later version. Please take a look at http://www.gnu.org/copyleft/gpl.htm
    #
    # Netpkg is a tool for easily install or upgrade packages via the network. With Netpkg,
    # you can make a minimal installation of Zenwalk Linux and install/upgrade just the
    # packages you need most.
    #
    # Edited By Martinus Ady H <mrt.itnewbies@gmail.com>, for local repository usage.
    # Places this file in /usr/libexec/, before you do this please backup your
    # old netpkg-functions :)
    #
    # ATTENTION...ATTENTION...ATTENTION...ATTENTION...
    # Please Read careffuly !!!
    # Please usage with your own risk and do not complain to me if your system
    # broken because this script.
    #
    ################### Netpkg functions #####################
    
    # version="3.6"
    
    # fetch the packages list for available packages
    getpkglist(){
      cat $buffer/mainlist | sort | cut -d " " -f1
    }
    
    # fetch the packages list for package named $1
    findpackagebyname(){
      cut -d " " -f2 $buffer/pkglistfile | sed -n "s/^\($1-[^\-]*-[^\-]*-[^\-]*\.tgz\)$/\1/p"
    }
    
    # Get the category for package $1
    findcategorybypackage(){
      sed -n "s/^\([^ \t]*\)[ \t]*$1[ \t]*$/\1/p" $buffer/pkglistfile
    }
    
    # Build a list of installed packages
    getlocalpkglist(){
    	ls $packagelogs | sed -n "s/^\(.*-[^\-]*-[^\-]*-[^\-]*\)$/\1\.tgz/p"  2>/dev/null > $buffer/localpkglist
    }
    
    # The main list <available> | <installed>
    getmainlist(){
    	rm -f $buffer/mainlist
    	listbuilder -a $buffer/pkglistfile -i $buffer/localpkglist | sort > $buffer/mainlist
    	selector="$(cat $buffer/last_selector)"
    	selector="${selector:=a}"
    	vfilter -${selector} -f $buffer/mainlist > $buffer/Ileftlist
    }
    
    # Download and process the meta file
    getmeta(){
    
    	mirror="$(cat $buffer/last_mirror)"
    	echo "Cleaning cache"
    	rm -f $buffer/descfile
    	rm -f $buffer/pkglistfile
    	rm -f $buffer/PACKAGES.TXT*
    
    	echo "Connecting to mirror"
    
    	# if mirror in local filesystem, use copy other than wget, because wget not
    	# supported file:/// protocol
    	if [ "$(echo $mirror | egrep 'file:///')" ] ; then
    		# prepare one variabel to use offline repository
    		martinrepo=`cat $buffer/last_mirror | awk -F:// '{ print $2 }'`
    		echo "Offline mirror detected, switch to other process for getting offline packages metadata"
    		echo "Checking offline repository metadata ......"
    
    		if [ -f $martinrepo/PACKAGES.TXT ] ; then
    			echo "Pointing repository from $martinrepo"
    			cp $martinrepo/PACKAGES.TXT $buffer/PACKAGES.TXT
    		else
    			echo -en '\E[31m'"\033[1mMetadata not found in $mirror ..\033[0m\n"
    			echo -en '\E[31m'"\033[1mPlease mounting first offline repository, then reconfigure your /etc/netpkg.conf\033[0m\n"
    			echo -en '\E[31m'"\033[1mand running netpkg again. Quiting ... \033[0m\n"
    			exit 1;
    		fi # end if
    	else
    		neterror=$($WGET -O $buffer/PACKAGES.TXT.gz $mirror/PACKAGES.TXT.gz 2>&1 | grep -E "failed:|Not Found")
    
    		if [ "$neterror" ] ; then
    			neterror=$($WGET -O $buffer/PACKAGES.TXT $mirror/PACKAGES.TXT 2>&1 | grep -E "failed:|Not Found")
    			if [ "$neterror" ] ; then
    				echo "Unable to connect to $mirror, please check the network or choose another mirror"
    				return 1
    			fi
    		else
    			echo "Uncompressing meta information"
    			if ! gunzip -f $buffer/PACKAGES.TXT.gz 2>/dev/null ; then
    				echo "Unable to extract meta information, please check the network or choose another mirror"
    				return 1
    			fi # end if
    		fi # end else
    	fi # end else
    
    	echo "Computing packages dependencies"
    	if [ "$dependencies" = "yes" ] ; then
    		sed -n '
    		/^PACKAGE NAME:.*/{
    			N;N;N;N
    			s/,/ /g
    			s/^PACKAGE NAME:[ \t]*\(.*\)-[^-]*-[^-]*-[^-]*\.tgz[ \t]*\n.*\nPACKAGE SIZE (compressed):[ \t]*\(.*\)\nPACKAGE SIZE (uncompressed):[ \t]*\(.*\)\nPACKAGE REQUIRED:[ \t]*\(.*\)/\1:\4/p
    		}' \
    		$buffer/PACKAGES.TXT > $buffer/depfile
    	fi
    
    	echo "Computing packages descriptions"
    	sed -n '
    	/^PACKAGE NAME:.*/{
    		N;N;N;N;N;N;N;N
    		s/^PACKAGE NAME:[ \t]*\(.*\)-[^-]*-[^-]*-[^-]*\.tgz[ \t]*\n.*\nPACKAGE SIZE (compressed):[ \t]*\(.*\)\nPACKAGE SIZE (uncompressed):[ \t]*\(.*\)\nPACKAGE REQUIRED:[ \t]*\(.*\)\n.*\n.*\n.*\n[^ \t]*:[ \t]*\(.*\)/\1: Description :  \5\n\1: Compressed :  \2\n\1: Uncompressed :  \3\n\1: Dependencies :  \4/p
    	}' $buffer/PACKAGES.TXT > $buffer/descfile
    
    	echo "Creating packages list"
    	sed -n '
    	/^PACKAGE NAME:.*/{
    		N
    		s/^PACKAGE NAME:[ \t]*\(.*\.tgz\)[ \t]*\nPACKAGE LOCATION:[ \t]*\(\.\/\)\?\(.*\)/\3 \1/p
    	}' $buffer/PACKAGES.TXT > $buffer/pkglistfile
    
    	echo "Getting local packages list"
    	getlocalpkglist
    
    	echo "Computing packages status"
    	getmainlist
    
    	# Generating a report
    	echo "Synchronization with $mirror successful"
    }
    
    # take a look at local packages list to see which version of the $1 package installed
    checkinstalled(){
    	sed -n "s/^\($1-[^\-]*-[^\-]*-[^\-]*\.tgz\)$/\1/p" $buffer/localpkglist
    }
    
    # Download ($category $package)
    download(){
    
    	mirror="$(cat $buffer/last_mirror)"
    
    	# change mirror into local
    	if [ "$(echo $mirror | egrep 'file:///')" ] ; then
    		martinrepo=`cat $buffer/last_mirror | awk -F:// '{ print $2 }'`
    		mirror=$martinrepo
    	fi
    
    	if [[ -e $local/$1/$2 && "$(gzip -tv $local/$1/$2 2>&1 | egrep -e OK$)" ]]; then
    		echo "Nothing to do, $2 is already in local cache"
    		return
    	else
    		mkdir -p $local/$1 2>/dev/null
    		rm -f $local/$1/$2 2>/dev/null
    
    		# Detect if mirror in local filesystem
    		if [ ! "$( echo "$mirror" | egrep -e "ftp:.*|http:.*" )" ] ; then
    			echo "Copying $2"
    			cp $mirror/$1/$2  $local/$1/$2
    			echo "'$local/$1/$2' (saved)"
    		else
    			echo "Downloading $2"
    
    			# we need to get an encoded URL if any
    			url=$($WGET -O- -q $mirror/$1/ \
    			| grep ".*\.tgz<\/[a|A]>" \
    			| grep "$2" \
    			| sed -e "s/^.*<\(a\|A\) \(href\|HREF\)=\"\(.*\.tgz\)\">.*/\3/")
    
    			# check if we have got an absolute URL :(
    			if [ $( echo "$url" | egrep -e "ftp:.*|http:.*" ) ]; then
    				$WGET -c -O $local/$1/$2 $url
    			else
    				$WGET -c -O $local/$1/$2 $mirror/$1/$url
    			fi # end if
    		fi # end if
    	fi # end if
    }
    
    # Checks for configuration files to update.
    checkdotnew() {
    	actionlist="differences yes no remove"
    	echo "Checking for configuration files to update..."
    	dotnewlist="$(find /etc -name "*.new")"
    	if [ "$dotnewlist" ] ; then
    		for file in $dotnewlist ; do
    			origfile="$(echo $file|sed -e 's/.new//')"
    			[ "$(echo $untouchable | grep $origfile)" ] && continue
    			echo "Should we move $file to $origfile ?"
    			select action in $actionlist ; do
    			case $action in
    				differences)
    					if [ -e $origfile ] ; then
    						diff -dU 1 $origfile $file | most
    					else
    						echo "$file is the only one, no $origfile yet"
    					fi
    					;;
    				yes)
    					mv -fi $file $origfile
    					break
    					;;
    				no)
    					break
    					;;
    				remove)
    					rm -i $file
    					break
    					;;
    				esac
    			done
    		done
    	else
    		echo "No \".new\" configuration files on the system"
    	fi
    }
    
    # Choose a download location from mirrors available in config file
    choosemirror(){
    
      echo "Please choose a mirror :"
      select newmirror in $mirrors_list ;do
        [ "$newmirror" ] && mirror="$newmirror"
        break
      done
    
      # Entry format checking NB: Edited n added file:/// protocol for local
      # repository. Use with your own risk :)
      if [ ! "$(echo $mirror | egrep 'http://|ftp://|file:///')" ] ; then
        [ "$mirror" ] && echo -en '\E[31m'"\033[1mBad syntax in url to mirror $mirror\033[0m"
      else
        echo "$mirror" > $buffer/last_mirror
        mirrorhash="$(echo "$mirror" | md5sum | cut -d " " -f 1)"
        mkdir -p $buffer
      fi
      echo ""
      echo -en '\E[36m'"\033[1mFrom now current mirror is : $mirror\033[0m"
      echo ""
    
      # Refresh meta information database
      getmeta
    
    }
    
    # prompt for action (install / upgrade / reinstall / download) for a list of packages ($1) #########################
    promptaction(){
    echo
    
    # this variable will track for packages installed as dependecies
    processedlist=''
    
    for pattern in $1; do
    
    	netpkglist="$(getpkglist | grep "$pattern")"
    	if [ ! "$netpkglist" ] ; then
    		echo "Package ~ $pattern : not found"
    		continue
    	fi
    	for package in $netpkglist ; do
    
    	# If we find the package in this list then it is already processed
        [ "$(echo "$processedlist" | grep "$package")" ] && continue
    
        # We need to find the category for $package
        category=$(findcategorybypackage $package)
    
        # the software name
        softname=${package%-*}; softname=${softname%-*}; softname=${softname%-*}
    
        # take a look in pkgtool logs to see if we have got it installed
        installedpkg="$(checkinstalled $softname)"
    
        if [ -e $packagelogs/${package%%.tgz} ]; then
        	echo "[I][$category] Found installed $package on the repository"
        	actionname="reinstall"
        elif [ "$installedpkg" ]; then
        	if [ "$(vfilter -u -f $buffer/mainlist -q $package)" ]; then
        		echo -en '\E[31m'"\033[1m[U][$category]\033[0m"
        		echo -n " Found updated "
        		echo -en '\E[31m'"\033[1m$package\033[0m"
        		echo " on the repository : $installedpkg is installed"
    
        	elif [ "$(vfilter -d -f $buffer/mainlist -q $package)" ]; then
        		echo -en '\E[32m'"\033[1m[D][$category]\033[0m"
        		echo -n " Found downgraded "
        		echo -en '\E[32m'"\033[1m$package\033[0m"
        		echo " on the repository : $installedpkg is installed"
        	fi
    
        	actionname="upgrade"
        else
        	echo -en '\E[36m'"\033[1m[N][$category]\033[0m"
        	echo -n " Found "
        	echo -en '\E[36m'"\033[1m$package\033[0m"
        	echo " on the repository : not installed"
        	actionname="install"
        fi
        actionlist="$actionname download skip"
        echo " what should I do ?"
    
        select action in $actionlist ; do
        case $action in
        	"install" | "reinstall" | "upgrade" )
        	PROMPT=1
        		autoinstall $package
        		PROMPT=0
        		break
        		;;
        	download)
        		download $category $package
        		break
        		;;
        	skip)
        		echo "Skipping package [$category]$package"
        		echo
        		break
        	esac
        done
       done
      done
    }
    
    # Check deps , then Install / Reinstall / Upgrade a list of packages
    # The full and exact package name MUST be provided
    autoinstall() {
    
      foundblacky="0"
    
    if [ "$1" ]; then
    
      finallist=''
    
      # We need an up to date list of installed packages
      getlocalpkglist
    
      for package in $1 ; do
    
        # the software name
        softname=${package%-*}; softname=${softname%-*}; softname=${softname%-*}
    
        # This package has now been processed
        processedlist="${processedlist} $package"
    
        # take a look in the blacklist
        for blacky in $blacklist ; do
          if [ "$blacky" = "$softname" ]; then
            echo "$package is blacklisted : skipping"
            foundblacky="1"
            break
          fi
        done
        if [ "$foundblacky" = "1" ] ; then
          foundblacky="0"
          continue
        fi
    
        finallist="${finallist} $package"
    
        [ ! "$dependencies" = "yes" ] && continue
    
        deps="$(grep "^$softname:.*$" $buffer/depfile | cut -s -d ":" -f 2-)"
        [ ! "$deps" ] && continue
    
        for dep in $deps ; do
    
          # We need to find package for $dep ($dep is the short name)
          deppackage="$(sed -n "s/^.*[ \t]\($dep-[^\-]*-[^\-]*-[^\-]*.tgz\)[ \t]*$/\1/p" $buffer/pkglistfile)"
          [ ! "$deppackage" ] && continue
    
          # If it is already in the list, then skip
          [ "$(echo $finallist | grep "$deppackage" )" ] && continue
    
          # Do we have it installed ? then skip
          [ -e $packagelogs/${deppackage%%.tgz} ] && continue
    
          # Is it a downgrade ? then skip
          [ "$(vfilter -d -f $buffer/mainlist -q $deppackage)" ] && continue
    
          # This package has now been processed
          processedlist="${processedlist} $deppackage"
    
          # take a look in the blacklist
          for blacky in $blacklist ; do
            if [ "$blacky" = "$dep" ]; then
              foundblacky="1"
              break
            fi
          done
          if [ "$foundblacky" = "1" ] ; then
            foundblacky="0"
            continue
          fi
    
          if [ "$PROMPT" = "1" ] ; then
            echo "$deppackage is required by $package : do you want to install this dependency package ?"
            select action in yes skip ; do
              case $action in
                yes)
                  finallist="${finallist} $deppackage"
                  break
                  ;;
                skip)
                  break
              esac
            done
            continue
          fi
          finallist="${finallist} $deppackage"
        done
      done
    
      for package in $finallist ; do
    
        # We need to find the category for $package
        category=$(findcategorybypackage $package)
    
        # the software name
        softname=${package%-*}; softname=${softname%-*}; softname=${softname%-*}
    
        # take a look in pkgtool logs to see if we have got it installed
        installedpkg="$(checkinstalled $softname)"
    
        # download the package if needed
        download $category $package
    
        # check package integrity
        if [ ! "$(gzip -tv $local/$category/$package 2>&1 | egrep -e OK$)" ]; then
          echo "$package is corrupted, please checkout another mirror : skipping"
          rm -f $local/$category/$package 2>/dev/null
          continue
        fi
    
        if [ -e $packagelogs/${package%%.tgz} ]; then
          echo -n "Reinstalling"
          echo -e '\E[36m'"\033[1m [$category]$package\033[0m"
          upgradepkg --reinstall $local/$category/$package
        elif [ "$(vfilter -u -f $buffer/mainlist -q $package)" ]; then
          echo -n "Upgrading"
          echo -e '\E[31m'"\033[1m [$category]$package\033[0m"
          upgradepkg $local/$category/$package
        elif [ "$(vfilter -d -f $buffer/mainlist -q $package)" ]; then
          echo -n "Downgrading"
          echo -e '\E[32m'"\033[1m [$category]$package\033[0m"
          upgradepkg $local/$category/$package
        else
          echo -n "Installing"
          echo -e '\E[36m'"\033[1m [$category]$package\033[0m"
          installpkg $local/$category/$package
        fi
    
        # remove package if we don nott want to keep it
        if [ ! "$keepit" = "yes" ]; then
          rm -f $local/$category/$package 2>/dev/null
        fi
    
        # We need an up to date list of installed packages
        getlocalpkglist
    
      done
    fi
    }
    
    # getall ###############################################
    getall() {
      echo "Connecting to the packages repository..."
      echo
      for package in $(getpkglist) ; do
    
        if [ "$package" ]; then
    
          # We need to find the category for $package
          category=$(findcategorybypackage $package)
    
          download $category $package
    
        fi
      done
    }
    
    # upgrade the whole system ###############################################
    upgradeall() {
    
      foundblacky="0"
    
    echo "You are about to upgrade the whole system : are you sure ?"
    select action in "yes" "abort" ; do
      case $action in
        yes)
    
          echo "Connecting to the packages repository..."
          echo
          for package in $(getpkglist) ; do
    
            if [ "$package" ]; then
    
              # We need to find the category for $package
              category=$(findcategorybypackage $package)
              # the software name
              softname=${package%-*}; softname=${softname%-*}; softname=${softname%-*}
              # take a look in pkgtool logs to see if we have got it installed
              installedpkg="$(checkinstalled $softname)"
    
              if [ -e $packagelogs/${package%%.tgz} ]; then
                echo "Found [$category]$package on the repository : already installed : skipping"
                continue
    
              elif [ -n "$installedpkg" ]; then
    
                # take a look in the blacklist
                for blacky in $blacklist ; do
                  if [ "$blacky" = "$softname" ]; then
                    echo "Found [$category]$package on the repository : blacklisted : skipping"
                    foundblacky="1"
                    break
                  fi
                done
                if [ "$foundblacky" = "1" ] ; then
                  foundblacky="0"
                  continue
                fi
    
                if [ "$(vfilter -u -f $buffer/mainlist -q $package)" ]; then
                # If we reached this point then this package needs to be upgraded
                  echo -n "Found "
                  echo -en '\E[31m'"\033[1m[$category]$package\033[0m"
                  echo " on the repository : $installedpkg is installed : upgrading"
    
                  autoinstall $package
    
                fi
              else
                echo "Found [$category]$package on the repository : not installed : skipping"
              fi
            fi
          done
    
        break
        ;;
      abort)
        exit 0
      esac
    done
    }
    
    # list packages from repository #########################
    listall() {
    
      netpkglist="$(getpkglist)"
    
      [ ! "$netpkglist" ] && echo -e '\E[31m'"\033[1mFound no package on $mirror\033[0m"
    
      for package in $netpkglist ; do
    
        # We need to find the category for $package
        category=$(findcategorybypackage $package)
    
        # the software name
        softname=${package%-*}; softname=${softname%-*}; softname=${softname%-*}
    
        # take a look in pkgtool logs to see if we have got it installed
        installedpkg="$(checkinstalled $softname)"
    
        if [ -e $packagelogs/${package%%.tgz} ]; then
          if [ -n "$(echo "$1" | grep 'I')" ]; then
            echo "[I][$category] Found installed $package on the repository"
          fi
        elif [ -n "$installedpkg" ]; then
          if [ -n "$(echo "$1" | grep 'U')" ]; then
            if [ "$(vfilter -u -f $buffer/mainlist -q $package)" ]; then
              echo -en '\E[31m'"\033[1m[U][$category]\033[0m"
              echo -n " Found updated "
              echo -en '\E[31m'"\033[1m$package\033[0m"
              echo " on the repository : $installedpkg is installed"
            fi
          fi
          if [ -n "$(echo "$1" | grep 'D')" ]; then
            if [ "$(vfilter -d -f $buffer/mainlist -q $package)" ]; then
              echo -en '\E[32m'"\033[1m[D][$category]\033[0m"
              echo -n " Found downgraded "
              echo -en '\E[32m'"\033[1m$package\033[0m"
              echo " on the repository : $installedpkg is installed"
            fi
          fi
        else
          if [ -n "$(echo "$1" | grep 'N')" ]; then
            echo -en '\E[36m'"\033[1m[N][$category]\033[0m"
            echo -n " Found "
            echo -en '\E[36m'"\033[1m$package\033[0m"
            echo " on the repository : not installed"
          fi
        fi
      done
    }
    




Setelah melakukan pengeditan pada file /usr/libexec/netpkg-functions selesai, simpanlah hasil editan tersebut kemudian sekarang waktunya untuk mulai menggunakan repositori lokal bikinan sendiri :)




  3. ** Menggunakan lokal repositori bikinan sendiri **

Hmm... semuanya sudah siap rasanya, sekarang untuk mengetesnya masukkanlah CD repositori yang telah dilakukan pada langkah diatas ke dalam cdrom. Jika file iso-nya belum diburning, buatlah dahulu mount-point pada direktori /mnt dengan mengetikkan perintah**mkdir /mnt/cdrom** kemudian jalankanlah perintah **mount -t iso9660 -o loop Repos.iso /mnt/cdrom** seperti dibawah ini agar Zencafe membaca isi file Repo.iso layaknya membaca dari CDROM:

    
    
    root[Martinus]# mkdir /mnt/cdrom
    root[Martinus]# mount -t iso9660 -o loop Repos.iso /mnt/cdrom
    root[Martinus]# ls /mnt/cdrom
    PACKAGES.TXT  PACKAGES.TXT.gz  xap
    root[Martinus]#
    



Setelah melakukan proses seperti diatas, sekarang jalankanlah **netpkg mirror** untuk memilih mirror lokal yang telah anda konfigurasi pada file **/etc/netpkg.conf** ( untuk lokal mirror ditandai dengan file:///path/mirror/) seperti dibawah ini:

    
    
    root[Martinus]# netpkg mirror
    Please choose a mirror :
     1) http://slackware.linux.or.id/pub/zencafe/i486/zencafe-1.0
     2) http://distro.ibiblio.org/pub/linux/distributions/zenwalk/i486/current
     3) http://zen-repo.meticul.eu/i486/current
     4) http://mirror.meleeweb.net/pub/linux/zenwalk/i486/current
     5) http://ftp.nux.ipb.pt/pub/dists/zenwalk/i486/current
     6) http://ftp.sh.cvut.cz/MIRRORS/zenwalk/i486/current
     7) file:///mnt/cdrom
     8) http://linuxpackages.telecoms.bg/Zenwalk
     9) http://mirrors.unixsol.org/linuxpackages//Zenwalk
    10) http://linuxpackages.inode.at/Zenwalk
    11) http://www.software-mirror.com/linuxpackages/Zenwalk
    12) http://ftp.scarlet.be/pub/linuxpackages/Zenwalk
    13) ftp://ftp.slackware.hu/linuxpackages/Zenwalk
    14) http://slackware.mirrors.tds.net/pub/slackware/slackware-current/slackware
    15) http://www.tuxgames.net/zenwalk
    16) http://users.zenwalk.org/packages
    #? 7
    
    From now current mirror is : file:///mnt/cdrom
    Cleaning cache
    Connecting to mirror
    Offline mirror detected, switch to other process for getting offline packages metadata
    Checking offline repository metadata ......
    Pointing repository from /mnt/cdrom
    Computing packages dependencies
    Computing packages descriptions
    Creating packages list
    Getting local packages list
    Computing packages status
    Synchronization with file:///mnt/cdrom successful
    Cleaning temporary files and saving meta information
    root[Martinus]#
    



Ok proses sinkronisasi antara mirror lokal yang ada di CDROM dan **netpkg** telah berhasil dilakukan, sekarang mari kita cek packages-packages apa saja yang terdapat pada mirror lokal ini dengan cara mengetikkan perintah **netpkg list** seperti gambar dibawah ini:

    
    
    root[Martinus]# netpkg list
    [N][xap] Found bc-1.06-i486-46.1.tgz on the repository : not installed
    [N][xap] Found k3b-1.0rc5-i486-1kjz.tgz on the repository : not installed
    [I][xap] Found installed pidgin-2.0.0-i486-1zc1.tgz on the repository
    Cleaning temporary files and saving meta information
    root[Martinus]#
    



Hurray.. semua packages yang terdapat pada file *.iso telah dikenali, sekarang mari kita coba instal salah satu packages dari repositori lokal yang telah kita buat dengan mengetikkan perintah **netpkg nama_packages.tgz** seperti dibawah ini:

    
    
    root[Martinus]# netpkg bc-1.06-i486-46.1.tgz
    
    [N][xap] Found bc-1.06-i486-46.1.tgz on the repository : not installed
     what should I do ?
    1) install
    2) download
    3) skip
    #? 1
    Nothing to do, bc-1.06-i486-46.1.tgz is already in local cache
    Installing [xap]bc-1.06-i486-46.1.tgz
    Installing package bc-1.06-i486-46.1...
    PACKAGE DESCRIPTION:
    bc: bc is an arbitrary precision calculator language.
    bc:
    bc: It allows one to write and execute simple or complex programs
    bc: to do calculations using arbitrary precision real numbers.
    bc:
    bc:
    
    Cleaning temporary files and saving meta information
    root[Martinus]#
    



Mari kita cek, apakah packages **bc** tersebut benar-benar telah terinstal pada sitem kita dengan mengetikkan perintah **ls /var/log/packages** dan untuk pembuktian kita coba jalankan perintah bc tersebut seperti dibawah ini:

    
    
    root[Martinus]# ls /var/log/packages | grep bc
    bc-1.06-i486-46.1
    glibc-2.3.6-i486-2z40
    libcroco-0.6.1-i486-1z28
    root[Martinus]# bc
    bc 1.06
    Copyright 1991-1994, 1997, 1998, 2000 Free Software Foundation, Inc.
    This is free software with ABSOLUTELY NO WARRANTY.
    For details type `warranty'.
    
    (interrupt) use quit to exit.
    quit
    root[Martinus]#
    






Ihuiiiiiiii.... sukses sekarang kita dapat menggunakan repositori lokal seperti layaknya teman-teman komunitas ubuntu :)

Referensi:
- [Download netpkg_repos_lokal.tar.bz2](http://martinusadyh.web.id/download/netpkg_lokal_repo.tar.bz2)
- [Manual Page Bash](http://www.gnu.org/software/bash/manual/bashref.html#SEC_Contents)
- [Manual Page AWK](http://www.gnu.org/manual/gawk/html_node/index.html)
- [Manual Page Grep](http://www.gnu.org/software/grep/doc/grep_toc.html)


    
    
    # ATTENTION...ATTENTION...ATTENTION...ATTENTION...
    # Please Read careffuly !!!
    # Please usage with your own risk and do not complain to me if your system broken because this script.
    # This feature maybe available by default in GNU/Linux Zencafe next release ??
    # but if you wanna use this script  in Zencafe 1.0 or Zencafe 1.2, you can download the
    # netpkg_repos_lokal.tar.bz2 and uncompress the file in to your local directory then put netpkg-functions
    # in your /usr/libexec/ directory.
    #
    # Note: Please backup first your old netpkg-functions
    
