---
comments: true
date: 2007-10-06 13:33:28+00:00
layout: post
slug: playing-with-calendar-class
title: Playing with Calendar Class
wordpress_id: 13
categories:
- Java
---

Pernah merasa kebingungan atau kesulitan ketika ingin melakukan manipulasi tanggal seperti penambahan hari, minggu, bulan dan tahun di Java terutama pada aplikasi Desktop berbasis Java Swing ? Kalau iya mari kita bikin sebuah project latihan untuk melakukan proses penambahan hari, minggu, bulan dah tahun sesuai dengan keinginan kita sendiri :)

Ok, sekarang marilah kita mulai latihannya dan peralatan yang digunakan pada latihan ini adalah :
1. NetBeans IDE 5.5
2. Library JXDatePicker yang bisa didapat dari project SwingX [disini.](http://swinglabs.org/index.jsp)
3. JDK 1.6.0_01

<!-- more -->

Setelah semua peratan latihan telah siap, sekarang buatlah sebuah **New Project** pada NetBeans seperti pada langkah-langkah dibawah ini:




  1. Klik New Project kemudian beri nama project-nya LatihanTanggal.


  2. Sebelum dapat menggunakan komponen JXDatePicker, tambahkanlah dahulu library SwingX pada NetBeans. Sedangkan bagaimana cara menambahkan library SwingX kedalam NetBeans dapat dilihat [disini.](http://wiki.java.net/bin/view/Javadesktop/SwingXIDE)


  3. Klik kanan root node pada palete Project, kemudian pilih **New > JFrame** kemudian tambahkanlah beberapa komponen didalam JFrame tersebut yaitu :


    * 2 komponen JXDatePicker dan beri nama currDate dan resultDate.


    * 1 komponen JTextField dan beri nama txtTambah


    * 1 komponen JComboBox dan beri nama cmbWaktu


    * 1 komponen JButton dan beri nama btnProses


    * 4 buah komponen JLabel


   Aturlah komponen-komponen diatas seperti gambar dibawah ini:
   [![jframe](http://farm3.static.flickr.com/2114/1496217891_0b55f51841_m.jpg)](http://farm3.static.flickr.com/2114/1496217891_a0bf37d40a_o.png)  
Click to Large Image
   


  4. Setelah mengatur tampilan seperti tampilan diatas, sekarang tambahkanlah event pada btnProses dengan cara klik kanan btnProses kemudian pilih **Event > Action > actionPerformed** Setelah itu pastekan kode dibawah ini :
   
    
    
       // TODO add your handling code here:
            try {
                final Date hariIni     = currDate.getDate();
                final int jmlTambah    = Integer.parseInt(txtTambah.getText());
                final String kategoriWaktu = cmbWaktu.getSelectedItem().toString();
    
                if (jmlTambah <= 0) {
                    txtTambah.requestFocusInWindow();
                } else {
                    final Calendar tempCal = Calendar.getInstance();
                    tempCal.setTime(hariIni);
    
                    if (kategoriWaktu.equals("HARI")) {
                        tempCal.add(Calendar.DATE, jmlTambah);
                    } else if (kategoriWaktu.equals("MINGGU")) {
                        tempCal.add(Calendar.DAY_OF_WEEK_IN_MONTH, jmlTambah);
                    } else if (kategoriWaktu.equals("BULAN")) {
                        tempCal.add(Calendar.MONTH, jmlTambah);
                    } else if (kategoriWaktu.equals("TAHUN")) {
                        tempCal.add(Calendar.YEAR, jmlTambah);
                    }
    
                    int dayResult = tempCal.get(Calendar.DATE);
                    int blnResult = tempCal.get(Calendar.MONTH);
                    int thnResult = tempCal.get(Calendar.YEAR);
    
                    final Date result = new Date();
    
                    result.setDate(dayResult);
                    result.setMonth(blnResult);
                    result.setYear(thnResult-1900);
    
                    resultDate.setDate(result);
                }
            } catch (NumberFormatException nfe) {
                JOptionPane.showMessageDialog(null, "Kolom Ingin Ditambah Harus Diisi !!!");
                txtTambah.requestFocusInWindow();
            }
       


   Penjelasan kode diatas adalah sebagai berikut :
   
   
    1. Pada baris ke 3 sampai ke 5 pertama-tama kita ambil semua parameter untuk proses penambahan tanggal ini, parameter-parameter tersebut yaitu tanggal hari ini, jumlah angka dan keterangan waktu yang ingin kita tambahkan.

   
    2. Sedangkan pada baris ke 7, kita memberikan kriteria jika kolom isian 'Ingin Ditambah' tidak diisi atau nilainya kurang dari nol, maka berikan pesan error dengan mengembalikan focus ke kolom isian 'Ingin Ditambah'

   
    3. Proses inti sebenarnya terdapat pada baris ke 10 sampai baris ke 25, pertama-tama pada baris 10 kita membuat sebuah variabel baru yaitu tempCal yang bertipe Calendar. Dan agar waktunya sesuai dengan parameter, maka kita set waktu pada variabel tempCal menggunakan waktu yang terdapat pada currDate.

   
    4. Sedangkan pada baris ke 13 sampai baris ke 21 ini, kita mendeteksi waktu yang ingin ditambahkan yaitu **"HARI", "MINGGU", "BULAN" atau "TAHUN"**. Daripada kita menghitung satu persatu jumlah hari, jumlah bulan dan lain sebagainya secara manual, tidak ada salahnya kalau kita coba-coba lihat ke JavaDoc tentang class Calendar siapa tahu sudah terdapat sebuah method yang berfungsi untuk menangani hal ini. Pada JavaDoc di class Calendar ada keterangan untuk field manipulation yang kurang lebih seperti berikut :
     

> 
**Field Manipulation**
The calendar fields can be changed using three methods: set(), add(), and roll().

set(f, value) changes calendar field f to value. In addition, it sets an internal member variable to indicate that calendar field f has been changed. Although calendar field f is changed immediately, the calendar's time value in milliseconds is not recomputed until the next call to get(), getTime(), getTimeInMillis(), add(), or roll() is made. Thus, multiple calls to set() do not trigger multiple, unnecessary computations. As a result of changing a calendar field using set(), other calendar fields may also change, depending on the calendar field, the calendar field value, and the calendar system. In addition, get(f) will not necessarily return value set by the call to the set method after the calendar fields have been recomputed. The specifics are determined by the concrete calendar class.

Example: Consider a GregorianCalendar originally set to August 31, 1999. Calling set(Calendar.MONTH, Calendar.SEPTEMBER) sets the date to September 31, 1999. This is a temporary internal representation that resolves to October 1, 1999 if getTime()is then called. However, a call to set(Calendar.DAY_OF_MONTH, 30) before the call to getTime() sets the date to September 30, 1999, since no recomputation occurs after set() itself.

add(f, delta) adds delta to field f. This is equivalent to calling set(f, get(f) + delta) with two adjustments:

    Add rule 1. The value of field f after the call minus the value of field f before the call is delta, modulo any overflow that has occurred in field f. Overflow occurs when a field value exceeds its range and, as a result, the next larger field is incremented or decremented and the field value is adjusted back into its range.

    Add rule 2. If a smaller field is expected to be invariant, but it is impossible for it to be equal to its prior value because of changes in its minimum or maximum after field f is changed or other constraints, such as time zone offset changes, then its value is adjusted to be as close as possible to its expected value. A smaller field represents a smaller unit of time. HOUR is a smaller field than DAY_OF_MONTH. No adjustment is made to smaller fields that are not expected to be invariant. The calendar system determines what fields are expected to be invariant.

In addition, unlike set(), add() forces an immediate recomputation of the calendar's milliseconds and all fields.




     Hmm.. ternyata untuk memanipulasi tanggalan kita bisa menggunakan method add pada class Calendar, sekarang kita lihat lebih detail pada method add pada JavaDoc yaitu sebagai berikut :


> 
     **add**

public abstract void add(int field,  int amount)

    Adds or subtracts the specified amount of time to the given calendar field, based on the calendar's rules. For example, to subtract 5 days from the current time of the calendar, you can achieve it by calling:

    add(Calendar.DAY_OF_MONTH, -5).

    Parameters:
        field - the calendar field.
        amount - the amount of date or time to be added to the field.

    See Also:
        roll(int,int), set(int,int)
     



     Nah berhubung sekarang kita sudah tahu bagaimana cara menambahkan tanggalannya :) , sekarang mari kita tambahkan baris kode yang menambah tanggal hari ini dengan parameter yang telah ditentukan yaitu **"HARI", "MINGGU", "BULAN" dan "TAHUN"** dan kode untuk menangani hal tersebut terdapat pada baris ke 14, 16, 18 dan 20. 

     
    5. Karena pada komponen JXDatePicker untuk manipulasi tanggalnya hanya dapat menggunakan method  **setDate(Date date);** maka pada baris 22 sampai baris 25 kita ambil satu persatu variabel hari, bulan dan tahun dari class Calendar yang telah diproses :) dan kita tampung pada **int**

     
    6. Pada baris ke 27 kita buat 1 buah variabel lagi bertipe Date dan kita manipulasi hari, bulan dan tahun pada variabel date ini dengan menggunakan method **setDate, setMonth dan setYear**. 

     
    7. Dan pada akhirnya pada baris ke 33 kita manipulasi tanggal pada komponen JXDatePicker dengan variabel date yang telah kita buat pada baris ke 27 untuk ditampilkan :)
     

     
    8. Sedangkan block **try { ... } catch ** berfungsi untuk menangkap kesalahan parsing dari JTextField yang bertipe **String** ke **int**
     

     



  5. Setelah semuanya selesai, sekarang coba jalankan projectnya dengan menekan tombol **F6** dan jika tidak ada error maka hasilnya akan seperti gambar dibawah ini:
[![Tampilan_GTKNimbus](http://farm3.static.flickr.com/2292/1496217881_a863b62d2f_m.jpg)](http://farm3.static.flickr.com/2292/1496217881_b00ac459d1_o.png)  
Click to Large Image




Bagaimana asyik bukan ?? ternyata me-manipulasi tanggal di Java tidak begitu sulit :) and your comments are very-very appreciated.

Resource :
- [Download sample project PlayingCalendar.zip](http://martin-personal-project.googlecode.com/files/PlayingCalendar.zip) (~ 1.1 MB)
- [API Class Calendar at JavaDoc](http://java.sun.com/javase/6/docs/api/java/util/Calendar.html)
- [SwingX Project at SwingLabs](http://swinglabs.org/index.jsp)
