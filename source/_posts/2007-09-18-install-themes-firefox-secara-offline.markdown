---
comments: true
date: 2007-09-18 15:59:49+00:00
layout: post
slug: install-themes-firefox-secara-offline
title: Install Themes Firefox Secara Offline
wordpress_id: 6
categories:
- Slackware
---

Pingin tahu gimana cara install themes firefox secara offline ?? Ini ada artikel [disini](http://www.pcbypaul.com/linux/firefox_theme.html), yang memberitahu caranya :)
Ternyata sangat mudah sekali, tinggal copy paste kode dibawah ini kemudian simpan dengan ekstensi *.html

    
    
    
    <script type="text/javascript">
    function installTheme(where) {
    var file = '';
    if (where == 'local') {
    file = 'file:///' + escape(document.getElementById('filename').value.replace(/\/g,'/'));
    } else {
    file = document.getElementById('url').value;
    }
    InstallTrigger.installChrome(InstallTrigger.SKIN, file, getName(file));
    }
    function getName(raw) {
    var grabFileStart = raw.lastIndexOf('/');
    var grabFileEnd = raw.lastIndexOf('.');
    if (grabFileStart >= grabFileEnd) {
    return 'Invalid file name';
    } else {
    return raw.substring(grabFileStart + 1,grabFileEnd);
    }
    }
    function installThemeNow(file) {
    InstallTrigger.installChrome(InstallTrigger.SKIN, file, getName(file));
    return true;
    }
    </script>
    <table width="80%" border="0" align="center" bgcolor="#a52a2a" cellpadding="0" cellspacing="2">
    <tbody>
    <tr>
    <td bgcolor="#f5f4ed">
    <p align="center"><span class="style2">Install Firefox .JAR theme from Harddisk
    
    </span>
    <form>
    <input type="file" id="filename"></input>
    <input type="button" onclick="installTheme('local');" value="Install"></input></form></td>
    </tr>
    </tbody></table>
    


Setelah disimpan, buka pakai firefox kemudian ambil themes yang ingin diinstal dengan cara klik tombol browse setelah itu tekan instal. Ing..eng.. themes firefox sudah terinstal :)
