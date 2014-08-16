---
comments: true
date: 2009-04-19 08:18:45+00:00
layout: post
slug: playing-multimedia-file-in-opensolaris-200811-with-mplayer
title: Playing Multimedia File in OpenSolaris 2008.11 with MPlayer
wordpress_id: 54
categories:
- OpenSolaris
---

Wah akhirnya setelah beberapa lama ga bisa nonton koleksi video clip yang mempunyai ekstensi *.avi, akhirnya sekarang bisa juga :) Cara ini saya dapat dari entri blog-nya om Roman Strobl yang bisa dilihat [disini](http://blogs.sun.com/observatory/entry/compiling_mplayer_on_opensolaris_this) Langkah pertama yang harus dilakukan yaitu install dulu packages **SUNWgcc, SUNWgmake, SUNWxorg-headers, SUNWGtk dan SUNWsfwhea** (packages **SUNWsfwhea** ini buat apaan yah ??) dengan cara seperti dibawah ini :

    
    
    [martin@opensolarisbox:~]$ pfexec pkg install SUNWgmake SUNWxorg-headers SUNWGtk SUNWsfwhea
    DOWNLOAD                                    PKGS       FILES     XFER (MB)
    Completed                                    6/6     933/933     2.36/2.36
    
    PHASE                                        ACTIONS
    Install Phase                              1137/1137
    PHASE                                          ITEMS
    Reading Existing Index                           9/9
    Indexing Packages                                6/6
    [martin@opensolarisbox:~]$
    


Nah setelah selesai menginstall packages-packages yang dibutuhkan, sekarang mari kita download source code dari MPlayer tapi sebelumnya buat dahulu tempat penyimpanan file source code MPlayer-nya kemudian download dengan perintah **wget** seperti dibawah ini :

    
    
    [martin@opensolarisbox:~]$ mkdir Download/MPlayer
    [martin@opensolarisbox:~]$ cd Download/MPlayer
    [martin@opensolarisbox:~/Download/MPlayer]$ wget -c http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.0rc2.tar.bz2
    --14:21:55--  http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.0rc2.tar.bz2
               => `MPlayer-1.0rc2.tar.bz2'
    Resolving www.mplayerhq.hu... 193.225.187.202, 199.125.85.41, 216.14.112.110, ...
    Connecting to www.mplayerhq.hu|193.225.187.202|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 9,338,201 (8.9M) [application/x-tar]
    
        [                                                                                     <=>                          ] 234,087        2.86K/
    
    15:10:53 (3.96 KB/s) - `MPlayer-1.0rc2.tar.bz2' saved [234087]
    
    [martin@opensolarisbox:~/Download/MPlayer]$
    



Nah setelah proses download selesai, sekarang coba ekstrak dengan perintah **tar xjvf nama_file.tar.bz2** seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/Download/MPlayer]$ tar xjvf MPlayer-1.0rc2.tar.bz2
    ....
    ....
    MPlayer-1.0rc2/libavformat/daud.c
    MPlayer-1.0rc2/libavformat/flic.c
    MPlayer-1.0rc2/libavformat/mpegenc.c
    MPlayer-1.0rc2/libavformat/mpc.c
    MPlayer-1.0rc2/libavformat/framehook.h
    MPlayer-1.0rc2/libavformat/mpegtsenc.c
    MPlayer-1.0rc2/libavformat/segafilm.c
    MPlayer-1.0rc2/libavformat/nutenc.c
    MPlayer-1.0rc2/libavformat/tiertexseq.c
    MPlayer-1.0rc2/libavformat/allformats.c
    MPlayer-1.0rc2/libavformat/gif.c
    MPlayer-1.0rc2/libavformat/v4l.c
    MPlayer-1.0rc2/libavformat/file.c
    MPlayer-1.0rc2/libavformat/gifdec.c
    MPlayer-1.0rc2/libavformat/nutdec.c
    MPlayer-1.0rc2/libavformat/idcin.c
    MPlayer-1.0rc2/libavformat/voc.c
    MPlayer-1.0rc2/libavformat/aviobuf.c
    MPlayer-1.0rc2/libavformat/voc.h
    MPlayer-1.0rc2/libavformat/wav.c
    MPlayer-1.0rc2/libpostproc/
    MPlayer-1.0rc2/libpostproc/postprocess_template.c
    MPlayer-1.0rc2/libpostproc/postprocess.c
    MPlayer-1.0rc2/libpostproc/postprocess_internal.h
    MPlayer-1.0rc2/libpostproc/postprocess_altivec_template.c
    MPlayer-1.0rc2/libpostproc/postprocess.h
    MPlayer-1.0rc2/libpostproc/Makefile
    [martin@opensolarisbox:~/Download/MPlayer]$
    


<!-- more -->
Setelah proses ekstrak selesai, sekarang masuk ke dalam direktori MPlayer-1.0rc2 dengan menggunakan perintah **cd MPlayer-1.0rc2** kemudian rename file **configure** bawaan dari MPlayer menjadi **configure.orig** karena file **configure** bawaan MPlayer tidak berjalan di OpenSolaris. Nah setelah selesai, sekarang download file configure yang udah di siapkan ama om Roman Strobl [disini](http://blogs.sun.com/observatory/resource/configure) dengan perintah wget seperti dibawah ini:

    
    
    [martin@opensolarisbox:~/Download/MPlayer]$ cd MPlayer-1.0rc2
    [martin@opensolarisbox:~/Download/MPlayer/MPlayer-1.0rc2]$ mv configure configure.orig
    [martin@opensolarisbox:~/Download/MPlayer/MPlayer-1.0rc2]$ wget -c http://blogs.sun.com/observatory/resource/configure
    --13:25:54--  http://blogs.sun.com/observatory/resource/configure
               => `configure'
    Resolving blogs.sun.com... 72.5.124.56
    Connecting to blogs.sun.com|72.5.124.56|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: unspecified [text/plain]
    
        [                                                                                     <=>                          ] 234,087        2.86K/s
    
    13:26:53 (3.96 KB/s) - `configure' saved [234087]
    
    [martin@opensolarisbox:~/Download/MPlayer/MPlayer-1.0rc2]$
    



Setelah proses download file configure selesai, sekarang beri hak akses execute dengan menjalankan perintah **chmod +x configure** kemudian jalankan perintah **configure --prefix=/opt/MPlayer --enable-gui && gmake** (File MPlayer akan kita install pada direktori /opt/MPlayer, kalau ingin menginstall selain di direktori /opt/ silahkan ganti nilai dari prefix ke direktori yang diinginkan) untuk memulai proses configure dan make sekaligus seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/Download/MPlayer/MPlayer-1.0rc2]$ chmod +x configure
    [martin@opensolarisbox:~/Download/MPlayer/MPlayer-1.0rc2]$ ./configure --prefix=/opt/MPlayer --enable-gui && gmake
    Detected operating system: SunOS
    Detected host architecture: i386
    Checking for cc version ... 3.4.3, ok
    Checking for host cc ... cc
    Checking for cross compilation ... no
    Checking for CPU vendor ... GenuineIntel (6:13:8)
    Checking for CPU type ...  Intel(R) Pentium(R) M processor 1.73GHz
    Checking for kernel support of mmx ... yes
    Checking for kernel support of mmxext ... yes
    Checking for kernel support of sse ... yes
    Checking for kernel support of sse2 ... yes
    Checking for kernel support of cmov ... yes
    Checking for mtrr support ... yes
    Checking for GCC & CPU optimization abilities ... pentium-m
    Checking for assembler support of -pipe option ... yes
    Checking for compiler support of named assembler arguments ... yes
    Checking for assembler (/usr/sfw/bin/gas 2.15) ... ok
    Checking for .align is a power of two ... no
    Checking for -lposix ... no
    Checking for -lm ... yes
    Checking for langinfo ... yes
    Checking for language ... using en (man pages: en )
    Checking for enable sighandler ... yes
    Checking for runtime cpudetection ... no
    Checking for restrict keyword ... __restrict
    Checking for __builtin_expect ... yes
    Checking for kstat ... yes
    Checking for posix4 ... yes
    Checking for lrintf ... yes
    Checking for mkstemp ... yes
    Checking for nanosleep ... yes
    Checking for socklib ... yes (using -lsocket -lnsl)
    Checking for inet_pton() ... yes (using -lsocket -lnsl)
    Checking for network ... yes
    Checking for inttypes.h (required) ... yes
    Checking for int_fastXY_t in inttypes.h ... yes
    Checking for word size ... 32
    Checking for malloc.h ... yes
    Checking for memalign() ... yes
    Checking for alloca.h ... yes
    Checking for mman.h ... yes
    Checking for dynamic loader ... yes
    Checking for dynamic a/v plugins support ... no
    Checking for pthread ... yes (using )
    Checking for w32threads ... no (using pthread instead)
    Checking for rpath ... no
    Checking for iconv ... yes
    Checking for soundcard.h ... no
    Checking for sys/dvdio.h ... no
    Checking for sys/cdio.h ... yes
    Checking for linux/cdrom.h ... no
    Checking for dvd.h ... no
    Checking for userspace SCSI headers (Solaris) ... yes
    Checking for termcap ... yes (using -ltermcap)
    Checking for termios ... yes (sys/termios.h)
    Checking for shm ... yes
    Checking for strsep() ... yes
    Checking for vsscanf() ... yes
    Checking for swab() ... yes
    Checking for POSIX select() ... yes
    Checking for gettimeofday() ... yes
    Checking for glob() ... yes
    Checking for setenv() ... yes
    Checking for sysi86() ... yes
    Checking for sys/sysinfo.h ... yes
    Checking for pkg-config ... yes
    Checking for Samba support (libsmbclient) ... yes
    Checking for tdfxfb ... no
    Checking for s3fb ... no
    Checking for tdfxvid ... no
    Checking for xvr100 ... no
    Checking for tga ... yes
    Checking for md5sum support ... yes
    Checking for bl ... no
    Checking for DirectFB ... no
    Checking for X11 headers presence ... yes (using /usr/X11/include)
    Checking for X11 ... yes
    Checking for DPMS ... yes (using Xdpms 4)
    Checking for Xv ... yes
    Checking for XvMC ... no
    Checking for Xinerama ... yes
    Checking for Xxf86vm ... yes
    Checking for XF86keysym ... yes
    Checking for DGA ... no
    Checking for 3dfx ... no
    Checking for OpenGL ... yes
    Checking for VIDIX ... yes (internal)
    Checking for /dev/mga_vid ... no
    Checking for xmga ... no
    Checking for GGI ... no
    Checking for GGI extension: libggiwmh ... no
    Checking for AA ... no
    Checking for CACA ... no
    Checking for SVGAlib ... no
    Checking for FBDev ... no
    Checking for DVB ... no
    Checking for DVB HEAD ... no
    Checking for zr ... no
    Checking for PNG support ... yes
    Checking for JPEG support ... yes
    Checking for PNM support ... yes
    Checking for GIF support ... no
    Checking for VESA support ... no
    Checking for SDL ... yes (using sdl-config)
    Checking for NAS ... no
    Checking for DXR2 ... no
    Checking for DXR3/H+ ... no
    Checking for IVTV TV-Out ... no
    Checking for V4L2 MPEG Decoder ... no
    Checking for OSS Audio ... no
    Checking for aRts ... no
    Checking for EsounD ... yes
    Checking for esd_get_latency() ... yes
    Checking for Polyp ... no
    Checking for JACK ... no
    Checking for OpenAL ... no
    Checking for ALSA audio ... no
    Checking for Sun audio ... no
    Checking for Sun mediaLib ... no
    Checking for VCD support ... yes
    Checking for dvdread ... yes (internal)
    Checking for internal libdvdcss ... yes
    Checking for cdparanoia ... no
    Checking for libcdio ... no
    Checking for bitmap font support ... yes
    Checking for freetype >= 2.0.9 ... yes
    Checking for fontconfig ... yes
    Checking for SSA/ASS support ... yes
    Checking for fribidi with charsets ... no
    Checking for ENCA ... no
    Checking for zlib ... yes
    Checking for RTC ... no
    Checking for liblzo2 support ... no
    Checking for mad support ... no
    Checking for Twolame ... no
    Checking for Toolame ... no
    Checking for OggVorbis support ... yes (internal Tremor)
    Checking for libspeex (version >= 1.1 required) ... yes
    Checking for OggTheora support ... yes
    Checking for internal mp3lib support ... yes
    Checking for internal liba52 support ... yes
    Checking for libdca support ... no
    Checking for internal libmpeg2 support ... yes
    Checking for libmpcdec (musepack, version >= 1.2.1 required) ... no
    Checking for FAAC (AAC encoder) support ... no (in libavcodec: )
    Checking for FAAD2 (AAC) support ... yes (internal floating-point)
    Checking for LADSPA plugin support ... no
    Checking for Win32 codecs ... yes (using /opt/MPlayer/lib/codecs)
    Checking for XAnim codecs ... yes (using /opt/MPlayer/lib/codecs)
    Checking for RealPlayer codecs ... no (dynamic loader support needed)
    Checking for QuickTime codecs ... yes
    Checking for Nemesi Streaming Media libraries ... no
    Checking for LIVE555 Streaming Media libraries ... no
    Checking for FFmpeg libavutil ... yes (static)
    Checking for FFmpeg libavcodec ... yes (static)
    Checking for FFmpeg libavformat ... yes (static)
    Checking for FFmpeg libpostproc ... yes (static)
    Checking for libamr narrowband ... no
    Checking for libamr wideband ... no
    Checking for libdv-0.9.5+ ... no
    Checking for XviD ... no
    Checking for x264 ... no (in libavcodec: no)
    Checking for libnut ... no
    Checking for libmp3lame (for mencoder) ... no
    Checking for mencoder ... yes
    Checking for fastmemcpy ... yes
    Checking for UniquE RAR File Library ... yes
    Checking for TV interface ... yes
    Checking for Video 4 Linux TV interface ... no
    Checking for Video 4 Linux 2 TV interface ... no
    Checking for TV teletext interface ... no
    Checking for Radio interface ... no
    Checking for Capture for Radio interface ... no
    Checking for Video 4 Linux 2 Radio interface ... no
    Checking for Video 4 Linux Radio interface ... no
    Checking for Video 4 Linux 2 MPEG PVR interface ... no
    Checking for audio select() ... yes
    Checking for ftp ... yes
    
    Checking for vstream client ... no
    Checking for byte order ... little-endian
    Checking for OSD menu ... no
    Checking for Subtitles sorting ... yes
    Checking for XMMS inputplugin support ... no
    Checking for inet6 ... yes
    Checking for gethostbyname2 ... no
    Checking for GUI ... yes
    Checking for XShape extension ... yes
    Checking for GTK+ version ... 2.14.3
    Checking for glib version ... 2.18.0
    Checking for automatic gdb attach ... no
    Checking for compiler support for noexecstack ... no
    Checking for joystick ... no
    Checking for lirc ... no
    Checking for lircc ... no
    Checking for color console output ... no
    Checking for DVD support (libdvdnav) ... no
    Creating config.mak
    Creating config.h
    
    Config files successfully generated by ./configure --prefix=/opt/MPlayer --enable-gui !
    
      Install prefix: /opt/MPlayer
      Data directory: /opt/MPlayer/share/mplayer
      Config direct.: /opt/MPlayer/etc/mplayer
    
      Byte order: little-endian
      Optimizing for: pentium-m
    
      Languages:
        Messages/GUI: en
        Manual pages: en
    
      Enabled optional drivers:
        Input: ftp tv libdvdcss(internal) dvdread(internal) vcd smb network
        Codecs: libavcodec qtx xanim win32 faad2 libmpeg2 liba52 mp3lib libtheora speex tremor(internal)
        Audio output: esd sdl mpegpes(file)
        Video output: sdl pnm jpeg png mpegpes(file) xvidix cvidix opengl xv x11 xover md5sum tga
        Audio filters:
      Disabled optional drivers:
        Input: dvdnav vstream pvr radio tv-teletext tv-v4l2 tv-v4l1 live555 nemesi cddb cdda dvb
        Codecs: x264 xvid libdv libamr_wb libamr_nb real faac musepack libdca toolame twolame libmad liblzo gif
        Audio output: sun alsa openal jack polyp arts oss v4l2 ivtv dxr2 nas
        Video output: v4l2 ivtv dxr3 dxr2 vesa gif89a zr zr2 fbdev svga caca aa ggi xmga mga winvidix 3dfx dga xvmc dfbmga directfb bl xvr100 tdfx_vid s3fb tdfxfb
        Audio filters: ladspa
    
    'config.h' and 'config.mak' contain your configuration options.
    Note: If you alter theses files (for instance CFLAGS) MPlayer may no longer
          compile *** DO NOT REPORT BUGS if you tweak these files ***
    
    'make' will now compile MPlayer and 'make install' will install it.
    Note: On non-Linux systems you might need to use 'gmake' instead of 'make'.
    
    Please check mtrr settings at /proc/mtrr (see DOCS/HTML/en/video.html#mtrr)
    
    Check configure.log if you wonder why an autodetection failed (make sure
    development headers/packages are installed).
    
    NOTE: The --enable-* parameters unconditionally force options on, completely
    skipping autodetection. This behavior is unlike what you may be used to from
    autoconf-based configure scripts that can decide to override you. This greater
    level of control comes at a price. You may have to provide the correct compiler
    and linker flags yourself.
    If you used one of these options (except --enable-gui and similar ones that
    turn on internal features) and experience a compilation or linking failure,
    make sure you have passed the necessary compiler/linker flags to configure.
    
    If you suspect a bug, please read DOCS/HTML/en/bugreports.html.
    ...........
    ...........
    ...........
    muxer_avi.c: In function `write_avi_chunk':
    muxer_avi.c:136: warning: passing arg 2 of `stream_write_buffer' from incompatible pointer type
    muxer_avi.c:137: warning: passing arg 2 of `stream_write_buffer' from incompatible pointer type
    muxer_avi.c: In function `avifile_odml_new_riff':
    muxer_avi.c:182: warning: passing arg 2 of `stream_write_buffer' from incompatible pointer type
    muxer_avi.c: In function `write_avi_list':
    muxer_avi.c:258: warning: passing arg 2 of `stream_write_buffer' from incompatible pointer type
    muxer_avi.c:259: warning: passing arg 2 of `stream_write_buffer' from incompatible pointer type
    muxer_avi.c:260: warning: passing arg 2 of `stream_write_buffer' from incompatible pointer type
    muxer_avi.c: In function `avifile_write_header':
    muxer_avi.c:308: warning: passing arg 2 of `stream_write_buffer' from incompatible pointer type
    muxer_avi.c:313: warning: passing arg 2 of `stream_write_buffer' from incompatible pointer type
    muxer_avi.c:326: warning: passing arg 2 of `stream_write_buffer' from incompatible pointer type
    muxer_avi.c:463: warning: passing arg 2 of `stream_write_buffer' from incompatible pointer type
    muxer_avi.c:471: warning: passing arg 2 of `stream_write_buffer' from incompatible pointer type
    muxer_avi.c:542: warning: long int format, different type arg (arg 5)
    muxer_avi.c:542: warning: long int format, different type arg (arg 6)
    muxer_avi.c: In function `avifile_odml_write_index':
    muxer_avi.c:623: warning: passing arg 2 of `stream_write_buffer' from incompatible pointer type
    muxer_avi.c:629: warning: passing arg 2 of `stream_write_buffer' from incompatible pointer type
    cc -I../libavcodec -I../libavformat -Wdisabled-optimization -Wdeclaration-after-statement -I. -I.. -I../libavutil -Wall -Wno-switch -Wpointer-arith -Wredundant-decls -O4 -march=pentium-m -mtune=pentium-m -pipe -ffast-math -fomit-frame-pointer -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DHAVE_CONFIG_H -I/usr/X11/include -I/usr/include/SDL  -D_REENTRANT   -I/usr/include/freetype2 -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/X11/include -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng12     -c -o muxer_mpeg.o muxer_mpeg.c
    muxer_mpeg.c: In function `parse_mpeg12_video':
    muxer_mpeg.c:1768: warning: wint_t format, int arg (arg 4)
    cc -I../libavcodec -I../libavformat -Wdisabled-optimization -Wdeclaration-after-statement -I. -I.. -I../libavutil -Wall -Wno-switch -Wpointer-arith -Wredundant-decls -O4 -march=pentium-m -mtune=pentium-m -pipe -ffast-math -fomit-frame-pointer -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DHAVE_CONFIG_H -I/usr/X11/include -I/usr/include/SDL  -D_REENTRANT   -I/usr/include/freetype2 -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/X11/include -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng12     -c -o muxer_rawaudio.o muxer_rawaudio.c
    cc -I../libavcodec -I../libavformat -Wdisabled-optimization -Wdeclaration-after-statement -I. -I.. -I../libavutil -Wall -Wno-switch -Wpointer-arith -Wredundant-decls -O4 -march=pentium-m -mtune=pentium-m -pipe -ffast-math -fomit-frame-pointer -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DHAVE_CONFIG_H -I/usr/X11/include -I/usr/include/SDL  -D_REENTRANT   -I/usr/include/freetype2 -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/X11/include -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng12     -c -o muxer_rawvideo.o muxer_rawvideo.c
    cc -I../libavcodec -I../libavformat -Wdisabled-optimization -Wdeclaration-after-statement -I. -I.. -I../libavutil -Wall -Wno-switch -Wpointer-arith -Wredundant-decls -O4 -march=pentium-m -mtune=pentium-m -pipe -ffast-math -fomit-frame-pointer -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DHAVE_CONFIG_H -I/usr/X11/include -I/usr/include/SDL  -D_REENTRANT   -I/usr/include/freetype2 -D_REENTRANT -D_POSIX_PTHREAD_SEMANTICS -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/pango-1.0 -I/usr/X11/include -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/freetype2 -I/usr/include/libpng12     -c -o muxer_lavf.o muxer_lavf.c
    ar r libmpmux.a muxer.o muxer_avi.o muxer_mpeg.o muxer_rawaudio.o muxer_rawvideo.o muxer_lavf.o
    ar: creating libmpmux.a
    ranlib libmpmux.a
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libmpdemux'
    cc -o mencoder mencoder.o mp_msg-mencoder.o parser-mecmd.o xvid_vbr.o asxparser.o codec-cfg.o cpudetect.o edl.o find_sub.o get_path.o m_config.o m_option.o m_struct.o mpcommon.o parser-cfg.o playtree.o playtreeparser.o spudec.o sub_cc.o subreader.o vobsub.o unrarlib.o libmpcodecs/libmpencoders.a libmpdemux/libmpmux.a libmpcodecs/libmpcodecs.a libaf/libaf.a libmpdemux/libmpdemux.a stream/stream.a libswscale/libswscale.a libvo/libosd.a libavformat/libavformat.a libavcodec/libavcodec.a libavutil/libavutil.a libpostproc/libpostproc.a loader/libloader.a mp3lib/libmp3.a liba52/liba52.a libmpeg2/libmpeg2.a libfaad2/libfaad2.a tremor/libvorbisidec.a dvdread/libdvdread.a libdvdcss/libdvdcss.a libass/libass.a osdep/libosdep.a  -L/lib -L/usr/X11/lib -L/usr/lib  -lkstat -lposix4 -lsocket -lnsl  -ltermcap -lsmbclient -lpng -lz -ljpeg -L/lib -lfreetype -lfontconfig  -lz -lspeex  -ltheora -logg       -lm
    [martin@opensolarisbox:~/Download/MPlayer/MPlayer-1.0rc2]$
    


Waaah proses **configure && gmake** berhasil dan ga ada error :) , ok sekarang ganti hak akses ke root kemudian jalankan perintah **gmake install** seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/Download/MPlayer/MPlayer-1.0rc2]$ su
    Password:
    [martin@opensolarisbox:~/Download/MPlayer/MPlayer-1.0rc2]# gmake install
    ginstall -d /opt/MPlayer/bin
    ginstall -d /opt/MPlayer/share/mplayer
    ginstall -d /opt/MPlayer/share/man/man1
    ginstall -d /opt/MPlayer/etc/mplayer
    if test -f /opt/MPlayer/etc/mplayer/codecs.conf ; then mv -f /opt/MPlayer/etc/mplayer/codecs.conf /opt/MPlayer/etc/mplayer/codecs.conf.old ; fi
    gmake -C libvo libvo.a
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libvo'
    gmake[1]: `libvo.a' is up to date.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libvo'
    gmake -C libao2
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libao2'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libao2'
    gmake -C input
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/input'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/input'
    gmake -C vidix
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/vidix'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/vidix'
    gmake -C gui
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/gui'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/gui'
    gmake -C libmpcodecs
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libmpcodecs'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libmpcodecs'
    gmake -C libaf
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libaf'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libaf'
    gmake -C libmpdemux libmpdemux.a
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libmpdemux'
    gmake[1]: `libmpdemux.a' is up to date.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libmpdemux'
    gmake -C stream
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/stream'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/stream'
    gmake -C libswscale
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libswscale'
    gmake[1]: Nothing to be done for `all'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libswscale'
    gmake -C libvo libosd.a
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libvo'
    gmake[1]: `libosd.a' is up to date.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libvo'
    gmake -C libavformat
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libavformat'
    gmake[1]: Nothing to be done for `all'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libavformat'
    gmake -C libavcodec
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libavcodec'
    gmake[1]: Nothing to be done for `all'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libavcodec'
    gmake -C libavutil
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libavutil'
    gmake[1]: Nothing to be done for `all'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libavutil'
    gmake -C loader
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/loader'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/loader'
    gmake -C mp3lib
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/mp3lib'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/mp3lib'
    gmake -C liba52
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/liba52'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/liba52'
    gmake -C libmpeg2
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libmpeg2'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libmpeg2'
    gmake -C libfaad2
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libfaad2'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libfaad2'
    gmake -C dvdread
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/dvdread'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/dvdread'
    gmake -C libdvdcss
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libdvdcss'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libdvdcss'
    gmake -C libass
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libass'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libass'
    gmake -C osdep
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/osdep'
    gmake[1]: Nothing to be done for `libs'.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/osdep'
    ginstall -m 755 -s mplayer /opt/MPlayer/bin
    for i in en ; do \
    		if test "$i" = en ; then \
    			ginstall -c -m 644 DOCS/man/en/mplayer.1 /opt/MPlayer/share/man/man1/ ; \
    		else \
    			ginstall -d /opt/MPlayer/share/man/$i/man1 ; \
    			ginstall -c -m 644 DOCS/man/$i/mplayer.1 /opt/MPlayer/share/man/$i/man1/ ; \
    		fi ; \
    	done
    gmake -C libmpdemux libmpmux.a
    gmake[1]: Entering directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libmpdemux'
    gmake[1]: `libmpmux.a' is up to date.
    gmake[1]: Leaving directory `/export/home/martin/Download/MPlayer/MPlayer-1.0rc2/libmpdemux'
    ginstall -m 755 -s mencoder /opt/MPlayer/bin
    for i in en ; do \
    		if test "$i" = en ; then \
    			cd /opt/MPlayer/share/man/man1 && ln -sf mplayer.1 mencoder.1 ; \
    		else \
    			cd /opt/MPlayer/share/man/$i/man1 && ln -sf mplayer.1 mencoder.1 ; \
    		fi ; \
    	done
    ln -sf mplayer /opt/MPlayer/bin/gmplayer
    ginstall -d /opt/MPlayer/share/mplayer/skins
    *** Download skin(s) at http://www.mplayerhq.hu/design7/dload.html
    *** for GUI, and extract to /opt/MPlayer/share/mplayer/skins/
    ginstall -d /opt/MPlayer/share/pixmaps
    ginstall -m 644 etc/mplayer.xpm /opt/MPlayer/share/pixmaps/
    ginstall -d /opt/MPlayer/share/applications
    ginstall -m 644 etc/mplayer.desktop /opt/MPlayer/share/applications/
    [martin@opensolarisbox:~/Download/MPlayer/MPlayer-1.0rc2]#
    



Nah proses installasi MPlayer sudah berjalan dengan sukses :) , sekarang silahkan download skins untuk MPlayer kemudian ekstrak kedalam direktori **/opt/MPlayer/share/mplayer/skins/** seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/Download/MPlayer]# cp ICY/* /opt/MPlayer/share/mplayer/skins/default/
    [martin@opensolarisbox:~/Download/MPlayer]# ls /opt/MPlayer/share/mplayer/skins/default/
    about.png         font.fnt          fspause.png       mute.png          play.png          skin.png          symbols.fnt
    audio.png         font.png          fsplay.png        next.png          preferences.png   slider2.png       symbols.png
    back.png          forward.png       fsstop.png        open.png          prev.png          slider.png        url.png
    dvd.png           fsback.png        fullscreen.png    pause.png         README            stop.png          vcd.png
    equalizer.png     fsforward.png     main.png          playbar.png       seek.png          sub.png           VERSION
    exit.png          fsfullscreen.png  minimize.png      playlist.png      skin              subtitles.png     volume.png
    [martin@opensolarisbox:~/Download/MPlayer]#
    



Nah setelah semua selesai, akhirnya saya bisa nonton video clipnya Epica lagi :D :) Coolcas tenan euy :D
[![Screenshot-1](http://farm4.static.flickr.com/3398/3455230760_5c320405ec.jpg)  
Tampilan Setelah Proses Installasi](http://www.flickr.com/photos/10243554@N02/3455230760/)

[![Screenshot-2](http://farm4.static.flickr.com/3336/3455230762_331766aab6.jpg)  
Hmm... akhirnya bisa nonton lagi nih video clipnya si cakep Simone Simsons :) ](http://www.flickr.com/photos/10243554@N02/3455230762/)

**Referensi-referensi :**
- [Compiling MPlayer on OpenSolaris](http://blogs.sun.com/observatory/entry/compiling_mplayer_on_opensolaris)
- [Compiling MPlayer on OpenSolaris, this time with a GUI](http://blogs.sun.com/observatory/entry/compiling_mplayer_on_opensolaris_this)
