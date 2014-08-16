---
comments: true
date: 2011-09-09 12:50:09+00:00
layout: post
slug: batch-rename-with-shell-script
title: Batch Rename with Shell Script
wordpress_id: 1509
categories:
- Shell Script
- Slackware
tags:
- Bash
- Batch Rename
- Script
- Shell
- Shell Script
- Slackware
---

Kemarin di tempat saya bekerja ada kejadian bagaimana caranya me-rename nama file yang mempunyai akhiran **"S"** menjadi **"R"**, masalahnya adalah semua file tersebut tidak mempunyai pattern yang sama kecuali 3 huruf di depan dan 1 huruf dibelakang yaitu huruf **"S"** yang harus dirubah menjadi **"R"** :D Contoh nama file yang akan direname kurang lebih seperti terlihat dibawah ini :
```
martinus@artivisi:[~]$ ls
EDW980012011S   EDW980T22011S
EDW980G32011S   EDWSUBS42011S
martinus@artivisi:[~]$
```

Pada kasus diatas, kita tidak bisa secara langsung melakukan kegiatan **find and replace** biasa. Karena ternyata huruf **"S"** juga terdapat ditengah-tengah nama file tersebut seperti terlihat pada tampilan diatas :( Setelah bertanya ke paman [Google](http://google.com/) sebentar, akhirnya saya menemukan pattern untuk menghapus karakter terakhir dari sebuah string menggunakan command `sed`. Dan pattern tersebut adalah `sed 's/\(.*\)./\1/'` :D akhirnya setelah dikombinasikan dengan sedikit kemampuan di shell script jadilah script yang isinya adalah sebagai berikut :

```bash    
#!/bin/sh

ls EDW* > file.txt

find_file() {
   cat file.txt | sort | cut -d " " -f1
}

for f in $(find_file) ; do
   echo "Original filename $f"
   # tampung nama file yang baru (remove last character)
   newfilename=`echo $f | sed 's/\(.*\)./\1/'`
   echo "After delete last character $newfilename"
   r=R
   newfile1=$newfilename$r
   echo "New filename is $newfile1"
   mv $f $newfile1
done
```

Simpan script diatas dengan nama terserah (misalkan `batch_rename.sh`), kemudian beri akses execute dan jalankan. Jika tidak ada error, harusnya jika dijalankan akan merename semua file menjadi seperti dibawah ini :
```
martinus@artivisi:[~]$ ls
EDW980012011R   EDW980T22011R
EDW980G32011R   EDWSUBS42011R
martinus@artivisi:[~]$
```

Untuk penjelasan `sed` dan `regex`-nya, saya masih belum bisa menjelaskan :D Maklum saya juga masih belajar :D Semoga script diatas bisa berguna juga buat teman-teman yang mempunyai masalah yang sama :)
