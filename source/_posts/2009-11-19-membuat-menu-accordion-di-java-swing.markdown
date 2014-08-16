---
comments: true
date: 2009-11-19 19:44:54+00:00
layout: post
slug: membuat-menu-accordion-di-java-swing
title: Membuat Menu Accordion Di Java Swing
wordpress_id: 84
categories:
- Java
- NetBeans
tags:
- java swing
---

Akhir-nya kesampaian juga menulis tentang **Menu Accordion Di Java Swing** ini :) Soalnya dulu bingung menu yang saya buat ini namanya apaan :malu: , nah buat teman-teman ada yang belum tahu apa itu **Menu Accordion ** mungkin bisa coba baca-baca artikel [Mengenal Menu Accordion](http://en.wikipedia.org/wiki/Accordion_%28GUI%29) dahulu :) Nah jika sudah tahu tentang apa itu **Menu Accordion** sekarang mari kita lihat contoh beberapa aplikasi dan **library** yang menggunakan atau menyertakan **Menu Accordion**


### Contoh Aplikasi Yang Menggunakan Menu Accordion


**OpenOffice.org Impress**
OpenOffice.org Impress menyertakan model menu dengan tipe **Accordion** yang dapat kita lihat seperti gambar dibawah ini :
[![AccordionInOOoImpress](http://farm3.static.flickr.com/2689/4109213701_af19d8aa80.jpg)  
OOo Impress Accordion Menu In Action](http://www.flickr.com/photos/10243554@N02/4109213701/)

**Plazma ERP**
[Plazma ERP](http://plazma.sourceforge.net/frameaction.php?lng=en&page=index) adalah sebuah aplikasi ERP yang dibangun dengan menggunakan Java dan SWT sebagai solusi GUI Toolkit-nya :) , menurut saya [Plazma ERP](http://plazma.sourceforge.net/frameaction.php?lng=en&page=index) mempunyai UI yang sangat elegan dan cantik ditambah lagi dengan **Menu Accordion**-nya yang tampak seperti gambar dibawah ini :
[![AccordionInPlazmaERP](http://farm3.static.flickr.com/2733/4109213705_f7811e51f1.jpg)  
Plazma ERP Accordion Menu In Action](http://www.flickr.com/photos/10243554@N02/4109213705/)
<!-- more -->


### Library Java Swing Yang Mempunyai Komponen Menu Accordion


**l2fprod-common**
Sedangkan library di Java yang menyediakan solusi komponen **Menu Accordion** adalah [l2fprod-common](http://www.l2fprod.com/common/) dengan komponen yang bernama [JOutlookBar](http://www.java2s.com/Open-Source/Java/Swing/L2FProd-Common/src/com/l2fprod/common/swing/JOutlookBar.java.htm) yang dapat dilihat seperti gambar dibawah ini :
[![AccordionInl2fprod](http://farm3.static.flickr.com/2627/4109213707_c9271f9326.jpg)  
JOutlookBar with Accordion Menu In Action](http://www.flickr.com/photos/10243554@N02/4109213707/)

Hmm.. asyik bukan sudah terdapat komponen yang siap pakai di Java Swing untuk solusi menu Accordion :) tapi sayangnya ketika saya mencoba pindah dari satu menu ke menu yang lain, tampil seperti **scrollbar** pada komponen [JOutlookBar](http://www.java2s.com/Open-Source/Java/Swing/L2FProd-Common/src/com/l2fprod/common/swing/JOutlookBar.java.htm) milik [l2fprod](http://www.l2fprod.com/common/) seperti gambar dibawah ini :( :
[![UglySwitchInl2fprod](http://farm3.static.flickr.com/2596/4109213709_ddcaba4c2c.jpg)  
Tampilan ScrollBar di JOutlookBar](http://www.flickr.com/photos/10243554@N02/4109213709/)

Hm... karena belum menemukan komponen yang sesuai dengan keinginan, maka akhirnya mari kita bikin sendiri komponen **Menu Accordion** yang terinspirasi dari beberapa **Menu Accordion** yang telah kita lihat diatas :) Nah untuk memulai latihan kali ini, ada beberapa bagian yang harus kita lewati yaitu :




  1. Pembuatan Project


  2. Pembuatan dan Pemasangan Event Menu Accordion


  3. Pemasangan Menu Accordion Ke MainForm dan Hasil Akhir






### Pembuatan Project


Sekarang buatlah 1 buah project java sederhana dengan menggunakan NetBeans IDE kemudian tambahkanlah sebuah **JFrame** dan **JPanel** kemudian berilah nama **MainForm** untuk **JFrame** dan **AccordionPanel** untuk **JPanel**-nya seperti gambar dibawah ini :
[![struktur_prj_awal](http://farm3.static.flickr.com/2705/4117873366_bf4f7c17bf.jpg)  
Struktur Project Awal](http://www.flickr.com/photos/10243554@N02/4117873366/)

Nah sampai tahapan ini, proses pembuatan project telah selesai dilakukan dan sekarang mari kita fokuskan bagaimana membuat sebuah **Accordion Menu** pada tahap selanjutnya :)




### Pembuatan dan Pemasangan Event Menu Accordion


Sekarang bukalah file **AccordionPanel** sehingga muncul pada GUI Designer NetBeans IDE, jika sudah sekarang pasang **BoxLayout** pada **AccordionPanel** tersebut dengan cara klik kanan pada **AccordionPanel** kemudian pilih **Set Layout > Box Layout**. Setelah memasang **Box Layout** sebagai **Layout** utama yang digunakan oleh **AccordionPanel**, sekarang masuklah pada **Box Layout Properties** dengan cara memilih menu **Window > Navigating > Inspector** hingga tampilannya menjadi seperti gambar dibawah ini :
[![TampilanInspectorAccordionPanel](http://farm3.static.flickr.com/2709/4117142707_727cb4c98f_o.png)  
Tampilan Inspector AccordionPanel](http://www.flickr.com/photos/10243554@N02/4117142707/)

Sekarang ekspand-lah komponen **JPanel** tersebut hingga muncul tulisan **Box Layout**, lakukan klik kanan pada **Box Layout** kemudian pilihlah properties. Pada **Box Layout Properties** dan gantilah **Line Axis** menjadi **Y Axis** seperti gambar dibawah ini :
[![MenggantiPropertiBoxLayout](http://farm3.static.flickr.com/2732/4117142703_d6a2ef2ee3.jpg)  
Mengganti Properti BoxLayout](http://www.flickr.com/photos/10243554@N02/4117142703/)

Tujuan mengganti **Line Axis** ke **Y Axis** pada **Box Layout** ini adalah agar komponen yang akan kita tambahkan ke dalam **AccordionPanel** ini akan turun ke bawah setiap ada penambahan komponen baru, bukan ke samping :) Proses **layouting** untuk dasar dari **Menu Accordion** telah selesai, sekarang buatlah 1 buah Java Class dengan nama **MTaskButton** yang meng-extends class [JToggleButton](http://java.sun.com/j2se/1.4.2/docs/api/javax/swing/JToggleButton.html) yang isinya kurang lebih sebagai berikut :

    
    
    public class MTaskButton extends javax.swing.JToggleButton {
    
        private JComponent  parentComp;
        private boolean     resizeComponent = false;
    
        /** Buat agar panjang komponen ini sama panjangnya dengan parentComponen
         * jika ditambahkan pada Container dengan BoxLayout */
        @Override public int getWidth() {
            if (resizeComponent && parentComp != null) {
                super.setSize(parentComp.getWidth(), super.getHeight());
            }
    
            return super.getWidth();
        }
    
        public JComponent getParentComp() {
            return parentComp;
        }
    
        public void setParentComp(JComponent parentComp) {
            this.parentComp = parentComp;
        }
    
        public boolean isResizeComponent() {
            return resizeComponent;
        }
    
        public void setResizeComponent(boolean resizeComponent) {
            this.resizeComponent = resizeComponent;
        }
    }
    


Tujuan membuat sebuah class baru yang meng-extends [JToggleButton](http://java.sun.com/j2se/1.4.2/docs/api/javax/swing/JToggleButton.html) adalah sebagai berikut :
- Agar menu yang dibuat mempunyai efek **Pressed** ketika user memilih salah satu menu.
- Kita perlu meng-override method **getWidth()** agar **Button** yang kita pasang pada **Container** dengan **BoxLayout** mempunyai panjang yang sama dengan **component parent**-nya. Jika kita menggunakan [JToggleButton](http://java.sun.com/j2se/1.4.2/docs/api/javax/swing/JToggleButton.html) biasa, maka jika kita tambahkan pada **AccordionPanel** hasilnya akan menjadi seperti gambar dibawah ini :
[![TampilanDefaultJToggleButton](http://farm3.static.flickr.com/2759/4117207971_2c50ff7612_o.png)  
Tampilan Default JToggleButton Pada BoxLayout](http://www.flickr.com/photos/10243554@N02/4117207971/)

Jika sudah, sekarang lakukan dahulu proses **Clean & Build** kemudian **drag n drop**-lah class **MTaskButton** ke dalam **AccordionPanel** kemudian pada **MTaskButton** properties, modifikasilah properti **parentComp** dan **resizeComponent** menjadi seperti gambar dibawah ini :
[![ModifikasiPropertiMTaskButton](http://farm3.static.flickr.com/2595/4117207949_098dbbace0.jpg)  
Modifikasi Properties Pada MTaskButton](http://www.flickr.com/photos/10243554@N02/4117207949/)

Setelah selesai melakukan proses modifikasi properties pada **MTaskButton**, sekarang tambahkanlah 1 buah [JList](http://java.sun.com/j2se/1.4.2/docs/api/javax/swing/JList.html) dan 2 buah **MTaskButton** lagi dengan konfigurasi untuk **MTaskButton** sama seperti diatas. Dan hasil dari penambahan komponen yang baru saja dilakukan akan menghasilkan tampilan seperti gambar dibawah ini :
[![PenambahanKomponen](http://farm3.static.flickr.com/2775/4117248707_554d37abdf_o.png)  
Hasil Penambahan JScrollPane dan 2 Buah MTaskButton](http://www.flickr.com/photos/10243554@N02/4117248707/)

Hm.. hasilnya koq jadi jelek yah, ok sekarang masuklah pada menu **Inspector** kemudian carilah komponen [JScrollPane](http://java.sun.com/j2se/1.4.2/docs/api/javax/swing/JScrollPane.html) kemudian klik kanan dan modifikasilah properti **AlignmentX** dari **0.5** ke **0.0** seperti gambar dibawah ini:
[![ModifikasiPropertiScrollPane](http://farm3.static.flickr.com/2801/4117248703_b82e28c49d.jpg)  
Modifikasi Properti JScrollPane](http://www.flickr.com/photos/10243554@N02/4117248703/)

Dan hasil dari pengeditan properti [JScrollPane](http://java.sun.com/j2se/1.4.2/docs/api/javax/swing/JScrollPane.html) diatas adalah seperti pada gambar dibawah ini :
[![HasilPengeditanPropertiScrollPane](http://farm3.static.flickr.com/2729/4117248697_a230c2d920_o.png)  
Hasil Pengeditan Properti JScrollPane](http://www.flickr.com/photos/10243554@N02/4117248697/)

Jika sudah, sekarang tambahkanlah 1 buah [JList](http://java.sun.com/j2se/1.4.2/docs/api/javax/swing/JList.html) dan 1 buah [JTree](http://java.sun.com/j2se/1.4.2/docs/api/javax/swing/JTree.html) pada node **Other Component** di jendela **Inspector** dan design-lah menu **AccordionPanel** seperti gambar dibawah ini :








[![DesignList1](http://farm3.static.flickr.com/2696/4117327689_2e1288f3bb_m.jpg)  
Design List 1](http://www.flickr.com/photos/10243554@N02/4117327689/)


[![DesignList2](http://farm3.static.flickr.com/2629/4117327691_033c80dfce_m.jpg)  
Design List 2](http://www.flickr.com/photos/10243554@N02/4117327691/)





**Note: Untuk konfigurasi list dan jtree sama dengan konfigurasi list sebelumnya**

Tambahkanlah dahulu sebuah **ButtonGroup** untuk menampung 3 buah **MTaskButton** pada node **Other Component** di jendela **Inspector** seperti gambar dibawah ini :
[![AddButtonGroup](http://farm3.static.flickr.com/2582/4117327685_db54d8e3b0.jpg)  
Menambahkan ButtonGroup Pada MTaskButton](http://www.flickr.com/photos/10243554@N02/4117327685/)

Setelah urusan dengan komponen selesai, sekarang buatlah sebuah method dahulu yang berfungsi untuk me-**reset** menu accordion kita dengan nama **recreateLayout()** seperti dibawah ini :

    
    
        /** Fungsi method ini hanyalah untuk menghapus seluruh komponen yang telah
         * ditambahkan kemudian memasang <code>BoxLayout</code> dengan Axis Y AXIS */
        private void recreateLayout() {
            this.removeAll();
            this.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 0, 0, 0));
            this.setLayout(new javax.swing.BoxLayout(this, javax.swing.BoxLayout.Y_AXIS));
        }
    



Inti dari **Menu Accordion** ini sebenarnya terdapat pada setiap **action** yang terjadi pada ketiga button **MTaskButton**, sedangkan **action** yang perlu ditambahkan pada **mTaskButton1, mTaskButton2** dan **mTaskButton3** ini adalah seperti berikut :

    
    
        private void mTaskButton1ActionPerformed(java.awt.event.ActionEvent evt) {
            recreateLayout();
            add(mTaskButton1);
            add(jScrollPane1);
            add(mTaskButton2);
            add(mTaskButton3);
            revalidate();
        }
    
        private void mTaskButton2ActionPerformed(java.awt.event.ActionEvent evt) {
            recreateLayout();
            add(mTaskButton1);
            add(mTaskButton2);
            add(jScrollPane2);
            add(mTaskButton3);
            revalidate();
        }
    
        private void mTaskButton3ActionPerformed(java.awt.event.ActionEvent evt) {
            recreateLayout();
            add(mTaskButton1);
            add(mTaskButton2);
            add(mTaskButton3);
            add(jScrollPane3);
            revalidate();
        }
    



Hooohoho.... udah tahu trik-nya kan :D nah kalau sudah tahu sekarang jalankan dahulu proses **Clean n Build** baru kita pasang pada MainForm :)




### Pemasangan Menu Accordion Ke MainForm dan Hasil Akhir


Untuk memasang **Menu Accordion** yang sudah jadi kedalam **MainForm** tidak susah koq, kita cuma perlu **drag n drop** file **AccordionPanel** kedalam **MainForm** dan taaada menu accordion sudah masuk kedalam MainForm :) Dan sekarang, coba design-lah **MainForm** menjadi seperti gambar dibawah ini :
[![DesignMainForm](http://farm3.static.flickr.com/2712/4118162868_e23591ed0c.jpg)  
Design MainForm](http://www.flickr.com/photos/10243554@N02/4118162868/)

Dan jika sudah, sekarang coba jalankan dengan menekan tombol **F6** jika tidak ada pesan error maka seharusnya akan tampil seperti gambar dibawah ini :









[![GTKLAF1](http://farm3.static.flickr.com/2757/4118162872_2f15842db3.jpg)  
Tampilan Dengan LAF GTK](http://www.flickr.com/photos/10243554@N02/4118162872/)




[![GTKLAF2](http://farm3.static.flickr.com/2564/4118162874_26108da4e0.jpg)  
Tampilan Dengan LAF GTK](http://www.flickr.com/photos/10243554@N02/4118162874/)








[![SwingLAF1](http://farm3.static.flickr.com/2794/4118162876_14f9367622.jpg)  
Tampilan Dengan Metal LAF](http://www.flickr.com/photos/10243554@N02/4118162876/)




[![SwingLAF2](http://farm3.static.flickr.com/2800/4118162880_1d4591ab09.jpg)  
Tampilan Dengan Metal LAF](http://www.flickr.com/photos/10243554@N02/4118162880/)






Bagaimana teman-teman susah ? Hm... dengan sedetail penjelasan diatas masih susah ?? Klo iya, silahkan tanya saja, sebelum bertanya dilarang :D Dan Mungkin langkah yang saya ambil ini **kurang** elegan, tapi hmm.. lumayan juga lah kalau menurut saya :) Kalau ada teman-teman yang tahu komponen yang bagus dan lebih sederhana, boleh donk di **share** :)

**Link-link terkait :**
- [Deskripsi Menu Accordion (WIKI)](http://en.wikipedia.org/wiki/Accordion_%28GUI%29)
- [Plazma ERP](http://plazma.sourceforge.net/frameaction.php?lng=en&page=index)
- [Komponen-komponen l2fprod](http://www.l2fprod.com/common/)
- [Demo Menu Accordion in Java Swing](http://martin-personal-project.googlecode.com/files/SwingAccordionMenu.zip)
- [Source Code Menu Accordion](http://code.google.com/p/martin-personal-project/source/browse/#svn/trunk/java/SwingAccordionMenu)
- [Milis NetBeans Indonesia](mailto:netbeans-indonesia@yahoogroups.com)
- [More tutorial about Java Swing](http://martinusadyh.web.id/category/netbeans/)
- [SubVersion Mudah Dengan RabbitVCS](http://martinusadyh.web.id/2010/03/13/subversion-mudah-dengan-rabbitvcs/)
