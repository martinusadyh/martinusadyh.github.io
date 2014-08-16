---
comments: true
date: 2009-11-21 21:21:15+00:00
layout: post
slug: membangun-file-server-dengan-samba-di-slackware
title: Membangun File Server dengan Samba di Slackware
wordpress_id: 85
categories:
- Slackware
---

Untuk membangun sebuah **File Server** menggunakan [SAMBA](http://www.samba.org) di Slackware sebenarnya tidak begitu susah, sama seperti kalau kita menggunakan distribusi GNU/Linux yang lain :) Nah untungnya lagi, packages [SAMBA](http://www.samba.org) sudah terinstall secara default pada Slackware yang kita gunakan dan kita hanya perlu melakukan sedikit konfigurasi agar [SAMBA](http://www.samba.org) dapat berjalan :)

Hal pertama yang perlu kita lakukan agar service [SAMBA](http://www.samba.org) kita dapat berjalan yaitu melakukan konfigurasi terhadap file **smb.conf** yang terletak pada direktori **/etc/samba**. Karena di Slackware tidak menyertakan file **smb.conf** melainkan file **smb.conf-sample** maka kopikan-lah dahulu file **smb.conf-sample** menjadi **smb.conf** seperti dibawah ini :

    
    
    root@martinusadyh:/etc/samba# cp smb.conf-sample smb.conf
    root@martinusadyh:/etc/samba# ls
    private/  smb.conf  smb.conf-sample
    root@martinusadyh:/etc/samba#
    



Sekarang edit-lah file **smb.conf** diatas menjadi seperti dibawah ini:

    
    
    [global]
    	workgroup = SLACKWARE_FILESERVER
    	server string = %h server (Samba, Slackware)
    	map to guest = Bad User
    	obey pam restrictions = Yes
    	passdb backend = tdbsam
    	pam password change = Yes
    	passwd program = /usr/bin/passwd %u
    	passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
    	unix password sync = Yes
    	socket options = TCP_NODELAY
    	syslog = 0
    	log file = /var/log/samba/log.%m
    	max log size = 1000
    	dns proxy = No
    	usershare allow guests = Yes
    
    [PublicShare]
    	comment = Slackware File Server
    	path = /home/sharing/data
    	read only = No
    	create mask = 0777
    	directory mask = 0777
    	guest ok = Yes
    


<!-- more -->
Setelah melakukan pengeditan pada file **/etc/samba/smb.conf** sekarang mari kita buat sebuah direktori sharing pada mesin Slackware kita. Karena pada file **/etc/samba/smb.conf** kita memasukkan properti **path = /home/sharing/data** sebagai direktori yang ingin di sharing, maka sekarang mari kita buat direktori-nya seperti berikut :

    
    
    root@martinusadyh:/etc/samba# mkdir -p /home/sharing/data
    root@martinusadyh:/etc/samba# ls -l /home
    total 4
    drwx--x--x 26 anton    users 1112 2009-11-13 19:25 anton/
    drwxr-xr-x  2 root     root    48 2009-06-07 03:37 ftp/
    drwx--x--x 95 martinus users 3432 2009-11-22 03:00 martinus/
    drwxr-xr-x  3 root     root    72 2009-11-22 03:42 sharing/
    root@martinusadyh:/etc/samba#
    



Agar direktori **/home/sharing** bisa diakses secara **r/w (read/write)** oleh semua orang/user, maka kita perlu menambahkan hak akses **777** pada direktori **/home/sharing** beserta sub direktori-nya. Dan hal ini bisa dilakukan dengan mengetikkan perintah **chmod -R 777 /home/sharing** seperti dibawah ini :

    
    
    root@martinusadyh:/etc/samba# chmod -R 777 /home/sharing/
    


**Note: Opsi -R ini maksudnya adalah perubahan hak akses akan dilakukan secara rekursif. Jadi jika kita mempunyai direktori dan sub-direktori lagi didalam /home/sharing, maka secara otomatis hak aksesnya akan ikut berubah.**

Nah setelah melakukan perintah diatas, sekarang mari kita cek dengan perintah **ls -l** seperti dibawah ini :

    
    
    root@martinusadyh:/etc/samba# ls -l /home
    total 4
    drwx--x--x 26 anton    users 1112 2009-11-13 19:25 anton/
    drwxr-xr-x  2 root     root    48 2009-06-07 03:37 ftp/
    drwx--x--x 95 martinus users 3432 2009-11-22 03:00 martinus/
    drwxrwxrwx  3 root     root    72 2009-11-22 03:42 sharing/
    root@martinusadyh:/etc/samba# ls -l /home/sharing/
    total 0
    drwxrwxrwx 2 root root 48 2009-11-22 03:42 data/
    root@martinusadyh:/etc/samba#
    



Konfigurasi direktori untuk sharing sekarang telah selesai, sekarang mari kita jalankan service [SAMBA](http://www.samba.org/)-nya :) . Tapi sebelum menjalankan service [SAMBA](http://www.samba.org/) sebaiknya kita cek dahulu apakah ada yang salah atau tidak dari file **/etc/samba/smb.conf** yang sudah kita lakukan pada tahap sebelumnya. Untuk mengecek konfigurasi file **/etc/samba/smb.conf** kita dapat menggunakan perintah **testparm** seperti dibawah ini :

    
    
    root@martinusadyh:/etc/samba# testparm
    Load smb config files from /etc/samba/smb.conf
    Processing section "[PublicShare]"
    Loaded services file OK.
    WARNING: You have some share names that are longer than 12 characters.
    These may not be accessible to some older clients.
    (Eg. Windows9x, WindowsMe, and smbclient prior to Samba 3.0.)
    Server role: ROLE_STANDALONE
    Press enter to see a dump of your service definitions
    
    [global]
    	workgroup = SLACKWARE_FILESERVER
    	server string = %h server (Samba, Slackware)
    	map to guest = Bad User
    	obey pam restrictions = Yes
    	passdb backend = tdbsam
    	pam password change = Yes
    	passwd program = /usr/bin/passwd %u
    	passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
    	unix password sync = Yes
    	syslog = 0
    	log file = /var/log/samba/log.%m
    	max log size = 1000
    	dns proxy = No
    	usershare allow guests = Yes
    
    [PublicShare]
    	comment = Slackware File Server
    	path = /home/sharing/data
    	read only = No
    	create mask = 0777
    	directory mask = 0777
    	guest ok = Yes
    root@martinusadyh:/etc/samba#
    



Hmmm... terlihat dari hasil **testparm** bahwa konfigurasi [SAMBA](http://www.samba.org/) tidak ada kesalahan, sekarang mari kita **enable**-kan service [SAMBA](http://www.samba.org/) dengan mengetikkan **chmod +x /etc/rc.d/rc.samba** dan menjalankannya dengan mengetikkan perintah **/etc/rc.d/rc.samba start** seperti dibawah ini :

    
    
    root@martinusadyh:/etc/samba# chmod +x /etc/rc.d/rc.samba
    root@martinusadyh:/etc/samba# /etc/rc.d/rc.samba start
    Starting Samba:  /usr/sbin/smbd -D
                     /usr/sbin/nmbd -D
    root@martinusadyh:/etc/samba#
    



Sekarang mari kita cek pada komputer lain, apakah [SAMBA](http://www.samba.org/) kita sudah berjalan atau belum dengan mengetikkan perintah **smbclient -L [ip_samba_server]** seperti dibawah ini :

    
    
    joybrker@joybroker-laptop:~$ smbclient -L 10.42.43.12
    Enter joybrker's password:
    Domain=[SLACKWARE_FILESERVER] OS=[Unix] Server=[Samba 3.2.13]
    
    	Sharename       Type      Comment
    	---------       ----      -------
    	PublicShare     Disk      Slackware File Server
    	IPC$            IPC       IPC Service (martinusadyh server (Samba, Slackware))
    Domain=[SLACKWARE_FILESERVER] OS=[Unix] Server=[Samba 3.2.13]
    
    	Server               Comment
    	---------            -------
    
    	Workgroup            Master
    	---------            -------
    	SLACKWARE_FILES
    joybrker@joybroker-laptop:~$
    


**Jika ada isian password, tekan enter saja**

Hore server [SAMBA](http://www.samba.org/) sudah berjalan, sekarang mari kita coba untuk **connect** ke server [SAMBA](http://www.samba.org/) kita dengan mengetikkan perintah **smbclient //[ip_server_samba]/[nama_share]/** seperti dibawah ini :

    
    
    joybrker@joybroker-laptop:~$ smbclient //10.42.43.12/PublicShare
    Enter joybrker's password:
    Domain=[SLACKWARE_FILESERVER] OS=[Unix] Server=[Samba 3.2.13]
    smb: \>
    


**Untuk isian password, tekan enter saja**

Prompt **smb: \>** ini menandakan bahwa kita sudah berhasil **connect dan login** ke server [SAMBA](http://www.samba.org/) kita, sekarang mari kita tes dengan membuat sebuah direktori pada server [SAMBA](http://www.samba.org/) kita seperti dibawah ini :

    
    
    smb: \> mkdir direktoriBaru
    smb: \> ls
      .                                   D        0  Sun Nov 22 04:17:57 2009
      ..                                  D        0  Sun Nov 22 03:42:24 2009
      direktoriBaru                       D        0  Sun Nov 22 04:17:57 2009
    
    		36239 blocks of size 524288. 9957 blocks available
    smb: \>
    


**Jika kita masih ingin bermain-main di **prompt samba** silahkan ketik **help** dan enter :) **

Nah mudah bukan konfigurasi **File Server** dengan [SAMBA](http://www.samba.org/) di Slackware ?? :) Sebagai bahan pertimbangan saja, jika kita tidak mau repot-repot melakukan proses konfigurasi secara manual seperti diatas kita bisa menggunakan beberapa alat bantu yang berbasis GUI atau Web yang salah satunya yaitu [SWAT](http://www.samba.org/samba/docs/man/Samba-HOWTO-Collection/SWAT.html) :)

Happy Slacking All :)

**Link-link terkait: **
- [Artikel Samba dari Makasar Slackers](http://makassar-slackers.org/samba)
- [SAMBA Project](http://www.samba.org/)
- [SWAT Manual Page](http://www.samba.org/samba/docs/man/Samba-HOWTO-Collection/SWAT.html)
- [Samba HOWTO Collection](http://www.samba.org/samba/docs/man/Samba-HOWTO-Collection/)
- [Tutorial SAMBA untuk CentOS](http://www.centos.org/docs/5/html/Deployment_Guide-en-US/ch-samba.html)
