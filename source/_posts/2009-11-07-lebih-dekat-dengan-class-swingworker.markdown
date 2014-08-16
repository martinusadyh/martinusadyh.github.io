---
comments: true
date: 2009-11-07 12:02:04+00:00
layout: post
slug: lebih-dekat-dengan-class-swingworker
title: "Lebih Dekat Dengan Class SwingWorker"
wordpress_id: 81
categories:
- Java
- NetBeans
tags:
- SwingWorker
---

Beberapa minggu terakhir ini, saya mendapatkan 2 pertanyaan tentang **Bagaimana sih agar progress bar bisa berjalan pada saat proses Query ?** dan **Bagaimana sih cara membuat sebuah login dialog yang menampilkan progress bar ?** Nah karena 2 pertanyaan tersebut saling berkaitan menurut saya (sama-sama ingin menjalankan Progress Bar pada saat aplikasi sedang menjalankan **tugas/proses** yang lain) maka akan saya jawab bersama-sama pada tulisan ini :) . Nah sebelum kita masuk ke penjelasan lebih detail, kita harus tahu dahulu dong kenapa kita tidak bisa secara langsung menjalankan progress bar di saat kita melakukan proses yang lain ? Ada yang tahu kenapa ? Ini karena semua **"Event Handling"** yang terdapat pada Java Swing dijalankan oleh Thread yang bernama **Event Dispatch Thread (EDT) ** Waks.. Thread ? Yaps betul Thread :)

Agar aplikasi yang kita bangun di Java Swing tidak terlihat nge-**"freeze"** (tidak responsif/nge-hang), maka kita juga perlu tahu beberapa Thread yang terdapat di Java Swing. Thread-thread tersebut yaitu :




  1. **Initial Thread**
Thread ini bertugas untuk menjalankan method **main** dari aplikasi Swing kita dan thread ini bertugas untuk menampilkan GUI (Graphical User Interface) yang sudah kita bangun diatas Swing ke layar. Setelah GUI (Graphical User Interface) tampil, maka kerja dari thread ini telah selesai dan akan dilanjutkan oleh **Event Dispatch Thread**.



  2. **Event Dispatch Thread**
Setiap aplikasi berbasis Java Swing hanya dapat mempunyai 1 Event Dispacth Thread (EDT) saja. Setiap respon dari penekanan tombol, menu item, update tampilan komponen akan dijalankan oleh thread ini. Dan semua proses tersebut **_biasanya_** tidak membutuhkan waktu yang lama. Jadi, segala proses yang dijalankan pada thread ini harus selesai secepat mungkin agar aplikasi kita tidak terlihat nge-**"freeze"** (tidak responsif/nge-hang) .



  3. **Worker Thread**
Worker thread atau biasanya disebut dengan **background thread** ini berfungsi untuk menjalankan proses yang lama seperti pembacaan direktori pada file system atau proses query ke database. Gunakan thread ini untuk melakukan operasi atau proses yang kita tidak bisa menentukan kapan kira-kira proses tersebut selesai.

<!-- more -->
Nah sekarang yang jadi pertanyaan yaitu apa hubungan-nya antara thread-thread diatas dengan class SwingWorker ? Ok untuk menjawab pertanyaan ini sekarang buatlah sebuah project di NetBeans IDE, kemudian buatlah sebuah JFrame dan design-lah JFrame tersebut seperti gambar dibawah ini :

{% img center /images/blog-images/Java_NetBeans/LebihDekatDenganClassSwingWorker/DesignJFrame.png Design JFrame %}

Kemudian pada tombol **Tampilkan Angka** tambahkan kode seperti dibawah ini :

``` java
private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {
    jTextArea1.setText("");
    // jalankan progress bar
    jProgressBar1.setIndeterminate(true);
    for (int i=1; i<=5000;i++) {
        // Tampilkan angka satu persatu pada text area
        jTextArea1.append("Angka ke " + i + "\n");
    }
    // stop progress bar
    jProgressBar1.setIndeterminate(false);
    jTextArea1.append("\nDone ...");
}
```

Setelah selesai, sekarang coba jalankan aplikasi-nya kemudian tekanlah tombol **Tampilkan Angka** dan jika tidak ada kesalahan maka kita akan mendapatkan tampilan seperti 2 gambar dibawah ini:

{% img center /images/blog-images/Java_NetBeans/LebihDekatDenganClassSwingWorker/TampilanFrameFreeze.png Tampilan Frame Nge-Freeze %}

{% img center /images/blog-images/Java_NetBeans/LebihDekatDenganClassSwingWorker/SetelahProsesLooping.png Setelah Proses Looping %}

Pada tampilan diatas, kita bisa melihat bahwa GUI (Graphical User Interface) kita seakan-akan nge-**freeze** beberapa detik baru kemudian normal kembali dengan tiba-tiba menampilkan angka pada JTextArea. Hmmm koq aneh, padahal **yang kita inginkan yaitu ketika proses perulangan berlangsung progress bar-nya berjalan dan angka akan ditampilkan satu persatu pada text area**. Kenapa bisa seperti itu ?? Jawaban-nya adalah, karena kita melakukan proses perulangan dan meng-update tampilan (GUI) **di dalam 1 thread yaitu Event Dispatch Thread (EDT)**. Sedangkan proses diatas, dapat kita gambarkan sebagai berikut :

{% img center /images/blog-images/Java_NetBeans/LebihDekatDenganClassSwingWorker/FlowEDT.jpg Flow EDT Ketika Penekanan Tombol, EDT Tidak Bisa Mengupdate Komponen %}

**Note: Gambar diambil dan dimodifikasi dari [http://java.sun.com/developer/technicalArticles/javase/swingworker/](http://java.sun.com/developer/technicalArticles/javase/swingworker/)**

Dari gambar flow EDT diatas, pada **titik A** itulah saat kita melakukan proses penekanan tombol **Tampilkan Angka**. Nah selama proses perulangan kita juga ingin meng-update tampilan dengan menampilkan angka satu persatu ke text area. Karena proses perulangan belum selesai, maka intruksi `jTextArea1.append("Angka ke " + i + "\n");` ini tidak dapat dilakukan. Intruksi `jTextArea1.append("Angka ke " + i + "\n");` ini baru berjalan ketika EDT sudah mencapai pada **titik B**.

Nah sekarang bagaimana caranya agar ketika kita melakukan per-ulangan, tampilan pada GUI juga ikut terupdate ? Solusi-nya yaitu dengan menggunakan **Background Thread** atau **pada thread yang terpisah** dari **Event Dispatch Thread (EDT)**. Tujuan ini yaitu agar **Event Dispatch Thread (EDT)** dapat terus mengupdate GUI. Dan proses menjalankan **Background Thread** tersebut dapat kita jalankan ketika **Event Dispatch Thread (EDT)** berada pada **Titik A** atau ketika kita menekan tombol **Tampilkan Angka**. Dan proses ini dapat kita gambarkan seperti dibawah ini :

{% img center /images/blog-images/Java_NetBeans/LebihDekatDenganClassSwingWorker/MemisahkanEDT.jpg Memisahkan EDT dengan Menggunakan Background Thread %}

**Note: Gambar diambil dan dimodifikasi dari [http://java.sun.com/developer/technicalArticles/javase/swingworker/](http://java.sun.com/developer/technicalArticles/javase/swingworker/)**

### Mengenal SwingWorker Sebagai Solusi Background Thread


Untuk membuat sebuah **Background Thread** menggunakan class **SwingWorker** caranya sangat sederhana sekali yaitu buatlah sebuah class yang meng-extends class **SwingWorker** dan override-lah 1 buah method yaitu method **doInBackground()** seperti dibawah ini :

``` java
public class CobaWorker extends SwingWorker<T,V> {
    @Override
    protected <T> doInBackground() throws Exception {
        ...
    }
}
```

Dimana `T` merupakan **return type** dari method `doInBackground` dan `V` adalah tipe yang akan digunakan oleh method `publish` dan `process` jika kita menggunakan method tersebut pada **Background Thread** kita. Sedangkan pada `SwingWorker` sendiri terdapat 3 thread yang mempengaruhi siklus kehidupan dari `SwingWorker` yaitu :

  * **Current Thread**
Method **SwingWorker.execute** dipanggil dari thread ini. Thread ini mempunyai tugas untuk menjalankan **"Worker Thread"** saja.

  * **Worker Thread**
Method **SwingWorker.doInBackground** ini dipanggil dari thread ini. Dan disini seharusnya semua **Background Process** dilakukan.

  * **Event Dispatch Thread**
Semua aktifitas yang berkaitan dengan Java Swing dilakukan pada thread ini, thread ini juga akan memanggil method `SwingWorker.done()` dan `SwingWorker.process()`

Sedangkan untuk penggunaan standart-nya, kita sebenarnya hanya perlu meng-override method `doInBackground` saja. Dan jika proses yang dikerjakan oleh method `doInBackground` telah selesai maka method `SwingWorker.done()` akan dijalankan :)

### Implementasi SwingWorker

Nah sekarang setelah mengetahui **Basic Thread** di Java Swing dan sedikit mengenal tentang **SwingWorker** terus sekarang bagaimana cara penggunaan-nya ? Sama seperti diatas, cara penggunaan-nya sangat sederhana sekali. Kopi-lah dahulu latihan pertama yang sudah kita buat di-awal kemudian gantilah nama filenya dengan **WithBackgroundThread.java** kemudian tambahkan-lah sebuah **private class** dengan nama **WorkerLookup** seperti dibawah ini :

``` java
private class WorkerLoop extends SwingWorker<String, Void> {

    @Override
    protected void done() {
        try {
            if (get() != null) {
                jTextArea1.append(get());
            }
            // stop progress bar
            jProgressBar1.setIndeterminate(false);
        } catch (InterruptedException ex) {
            Logger.getLogger(WithBackgroundThread.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ExecutionException ex) {
            Logger.getLogger(WithBackgroundThread.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected String doInBackground() throws Exception {
        for (int i = 1; i <= 5000; i++) {
            // Tampilkan angka satu persatu pada text area
            jTextArea1.append("Angka ke " + i + "\n");
        }

        return "\nDone ...";
    }
}
``` 

**Penjelasan kode diatas yaitu** :

  * Pada baris 102, kita membuat sebuah class dengan nama **WorkerLoop** yang meng-extends SwingWorker dengan parameter <string, Void>. Dimana **String** ini digunakan untuk menjelaskan tipe data apa yang akan dikembalikan oleh method **doInBackground**, karena pada class **WorkerLoop** ini tidak meng-override method **proces** maka kita bisa menggunakan tipe `Void` saja :)

  * Pada baris 120 inilah proses yang dijalankan pada **Background Thread** dilakukan, dan setelah method **doInBackground** ini selesai dijalankan maka kita akan mengirimkan pesan bertipe String ke method **done()**

  * Pada baris 105-117 ini kita gunakan untuk mengupdate GUI yang menandakan bahwa **Background Process** telah selesai dilakukan, dan kita dapat mengambil nilai yang dikirmkan oleh method **doInBackground** dengan menggunakan method **get()**


Setelah pembuatan **WorkerLoop** selesai, sekarang deklarasikan class **WorkerLoop** tersebut seperti dibawah ini:

``` java    
public class WithBackgroundThread extends javax.swing.JFrame {

    // Deklarasikan WorkerLoop
    private WorkerLoop workerLoop;

    /** Creates new form OnEdtThread */
    public WithBackgroundThread() {
        initComponents();
    }
    ...
}
```

Kemudian langkah terakhir yaitu editlah kode yang terdapat pada tombol **Tampilkan Angka** hingga menjadi seperti dibawah ini :

``` java
private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {
    jTextArea1.setText("");
    // jalankan progress bar
    jProgressBar1.setIndeterminate(true);
    workerLoop = new WorkerLoop();
    workerLoop.execute();
}
```

Sekarang coba jalankan dan tekanlah tombol **Tampilkan Angka**, seharusnya sekarang GUI kita sudah tidak nge-**freeze** ketika sedang melakukan perulangan dan progress bar-nya pun sudah bisa jalan dengan baik :) Mudah bukan ? Tapi yang perlu kita perhatikan ketika membangun aplikasi yang menggunakan Thread yaitu adalah **berhati-hati**lah dalam menggunakan-nya, karena sekali saja aplikasi terjadi kesalahan maka proses **debugging-nya** susah sekali :D

Dan dibawah ini adalah halaman-halaman referensi yang saya gunakan dan mohon maaf kalau ada salah kata/penyampaian :) :D

**Link-link terkait : **

  * [SwingWorker API JDK 1.6](http://java.sun.com/javase/6/docs/api/javax/swing/SwingWorker.html)
  * [Tutorial Concurrency di Java Swing](http://java.sun.com/docs/books/tutorial/uiswing/concurrency/index.html)
  * [Improve Application Performance With SwingWorker in Java SE 6](http://java.sun.com/developer/technicalArticles/javase/swingworker/)
  * [Penjelasan Tentang Thread (WIKI)](http://en.wikipedia.org/wiki/Thread_%28computer_science%29)
  * [Milis NetBeans Indonesia](mailto:netbeans-indonesia@yahoogroups.com)
  * [Sample Project](http://code.google.com/p/martin-personal-project/source/browse/#svn/trunk/java/MengenalSwingWorker)
  * [SubVersion Mudah Dengan RabbitVCS](http://martinusadyh.web.id/2010/03/13/subversion-mudah-dengan-rabbitvcs/)