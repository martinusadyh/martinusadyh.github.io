---
comments: true
date: 2010-06-26 18:23:28+00:00
layout: post
slug: string-manipulation-dengan-commonslang
title: String Manipulation Dengan CommonsLang
wordpress_id: 935
categories:
- Java
- NetBeans
tags:
- jasper report
- Java
- NetBeans
---

Sering melakukan manipulasi terhadap [String](http://java.sun.com/javase/6/docs/api/java/lang/String.html) di Java ? Pernah merasa bahwa method-method yang terdapat pada class [String](http://java.sun.com/javase/6/docs/api/java/lang/String.html) standart masih kurang ? Sering kena NPE (NullPointerEexception) ketika melakukan manipulasi ?? Jika iya, mungkin teman-teman perlu melihat class **StringUtils** yang terdapat pada library [Apache Commons Lang](http://commons.apache.org/lang/) untuk keperluan manipulasi class [String](http://java.sun.com/javase/6/docs/api/java/lang/String.html) pada Java :) Nah dibawah ini adalah beberapa method yang sering saya gunakan (untuk daftar lengkap, silahkan cek pada [JavaDoc StringUtils](http://commons.apache.org/lang/api-release/org/apache/commons/lang/StringUtils.html)) pada class **StringUtils** :




  1. **LeftPad**, method untuk membuat String menjadi rata kiri.


  2. **RightPad**, method untuk membuat String menjadi rata kanan.


  3. **Center**, method untuk membuat String menjadi rata tengah.


  4. **isAlphanumeric**, method untuk mengecek apakah string berisi alpha numeric atau bukan.



Method-method diatas adalah method-method yang sering saya gunakan, sedangkan bagaimana detail dari method-method tersebut ? Mari kita lihat cara penggunaan-nya seperti dibawah ini :
<!-- more -->



  1. **LeftPad**, method ini digunakan untuk kebutuhan menampilkan String agar menjadi rata kiri. Dan class **StringUtils** ini mempunyai 3 macam method yaitu `leftPad(String str, int len), leftPad(String str, int len, String strPad)` dan `leftPad(String str, int len, char charPad)`. Sedangkan cara penggunaan-nya juga sangat gampang sekali yaitu seperti dibawah ini :

    
    
            String jumlahBayar = "25000";
            String leftPadNormal = StringUtils.leftPad(jumlahBayar, 10);
            String leftPadWithZero = StringUtils.leftPad(jumlahBayar, 10, '0');
            String leftPadWithZero1 = StringUtils.leftPad(jumlahBayar, 10, "0");
            System.out.println("output [" + leftPadNormal + "] len [" + leftPadNormal.length() + "]");
            System.out.println("output [" + leftPadWithZero + "] len [" + leftPadWithZero.length() + "]");
            System.out.println("output [" + leftPadWithZero1 + "] len [" + leftPadWithZero1.length() + "]");
    



dan potongan kode diatas akan menghasilkan tampilan seperti dibawah ini :

    
    
    output [     25000] len [10]
    output [0000025000] len [10]
    output [0000025000] len [10]
    






  2. **RightPad**, method ini digunakan untuk kebutuhan menampilkan String agar menjadi rata kanan, sama seperti method LeftPad class **StringUtils** ini juga menyediakan 3 macam method yaitu `rightPad(String str, int len), rightPad(String str, int len, String strPad)` dan `rightPad(String str, int len, char charPad)`. Sedangkan cara penggunaan-nya juga sangat gampang sekali yaitu seperti dibawah ini :

    
    
            String jumlahBayar = "25000";
            String rightPadNormal = StringUtils.rightPad(jumlahBayar, 10);
            String rightPadWithZero = StringUtils.rightPad(jumlahBayar, 10, '0');
            String rightPadWithZero1 = StringUtils.rightPad(jumlahBayar, 10, "0");
            System.out.println("output [" + rightPadNormal + "] len [" + rightPadNormal.length() + "]");
            System.out.println("output [" + rightPadWithZero + "] len [" + rightPadWithZero.length() + "]");
            System.out.println("output [" + rightPadWithZero1 + "] len [" + rightPadWithZero1.length() + "]");
    



dan potongan kode diatas akan menghasilkan tampilan seperti dibawah ini :

    
    
    output [25000     ] len [10]
    output [2500000000] len [10]
    output [2500000000] len [10]
    






  3. **Center**, method ini digunakan untuk kebutuhan menampilkan String agar menjadi rata tengah, sama seperti method LeftPad dan method RightPad class **StringUtils** ini juga menyediakan 3 macam method yaitu `center(String str, int len), center(String str, int len, String strPad)` dan `center(String str, int len, char charPad)`. Sedangkan cara penggunaan-nya juga sangat gampang sekali yaitu seperti dibawah ini :

    
    
            String jumlahBayar = "25000";
            String centerMaxLength = StringUtils.center(jumlahBayar, 10);
            String centerMaxLengthPadZero = StringUtils.center(jumlahBayar, 10, '0');
            String centerMaxLengthPadZero1 = StringUtils.center(jumlahBayar, 10, "0");
            System.out.println("output [" + centerMaxLength + "] len [" + centerMaxLength.length() + "]");
            System.out.println("output [" + centerMaxLengthPadZero + "] len [" + centerMaxLengthPadZero.length() + "]");
            System.out.println("output [" + centerMaxLengthPadZero1 + "] len [" + centerMaxLengthPadZero1.length() + "]");
    



dan potongan kode diatas akan menghasilkan tampilan seperti dibawah ini :

    
    
    output [  25000   ] len [10]
    output [0025000000] len [10]
    output [0025000000] len [10]
    






  4. **isAlphanumeric**, method ini digunakan untuk mengecek apakah String yang ingin di cek merupakan alpha numeric atau bukan. Contoh penggunaan-nya adalah seperti dibawah ini :

    
    
            System.out.println("null     = " + StringUtils.isAlphanumeric(null));
            System.out.println("123      = " + StringUtils.isAlphanumeric("123"));
            System.out.println(",.!@^$#% = " + StringUtils.isAlphanumeric(",.!@^$#%"));
            System.out.println("\"\"      = " + StringUtils.isAlphanumeric(""));
    



dan potongan kode diatas akan menghasilkan tampilan seperti dibawah ini :

    
    
    null     = false
    123      = true
    ,.!@^$#% = false
    ""       = true
    






Sebenarnya class **StringUtils** ini masih mempunyai banyak method yang lain (dapat teman-teman baca di [JavaDoc StringUtils](http://commons.apache.org/lang/api-release/org/apache/commons/lang/StringUtils.html)), tetapi yang paling sering saya gunakan dalam kegiatan sehari-hari adalah 4 method diatas :) Jika teman-teman sering bermain-main dengan [ISO 8583](http://en.wikipedia.org/wiki/ISO_8583) atau pembuatan laporan yang masih mengandalkan **Direct Printing**, sepertinya teman-teman perlu mencoba class **StringUtils** ini :)

Tertarik untuk mencoba ....?

**Link-link terkait :**




  1. [Halaman Project Apache Commons](http://commons.apache.org/)


  2. [Halaman Project Apache Commons Lang](http://commons.apache.org/lang/)


  3. [JavaDoc StringUtils](http://commons.apache.org/lang/api-release/org/apache/commons/lang/StringUtils.html)



