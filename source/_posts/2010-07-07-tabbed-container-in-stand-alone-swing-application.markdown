---
comments: true
date: 2010-07-07 20:40:36+00:00
layout: post
slug: tabbed-container-in-stand-alone-swing-application
title: Tabbed Container In Stand Alone Swing Application
wordpress_id: 941
categories:
- Java
- NetBeans
tags:
- Java
- java swing
- NetBeans
- project
- TabbedContainer
---

Buat teman-teman yang sudah tahu teknik ini, mungkin tulisan ini bisa dikatakan ketinggalan jaman :D Sebenarnya apa sih maksud tulisan ini ? Tulisan ini cuma ingin menunjukkan pada teman-teman yang belum tahu bagaimana sih **menggunakan Tabbed Pane milik NetBeans (TabbedContainer) pada Aplikasi Swing** kita :) Kenapa saya bilang tulisan ini ketinggalan jaman ? Karena ternyata, sudah ada yang pernah melakukan hal serupa sejak tahun 2004 lalu :( ( NetBeans versi 4.0, detail artikel bisa dibaca [disini](http://www.javalobby.org/java/forums/t13337.html?start=0) ). Kenapa saya posting lagi disini, karena cari tutorialnya ternyata susah juga :D . Jadi harapan saya agar, semoga teman-teman yang belum tahu bisa dengan mudah mencoba dan tidak perlu berlama-lama bermain dengan paman [Google](http://google.com) :) Ok sudah siap?? Kalau iya, mari kita lanjutkan :)

Seperti teman-teman ketahui bersama, class **JTabbedPane** pada Swing mempunyai sedikit sekali fitur dan juga **JTabbedPane** hanya mempunyai 2 buah mode tampilan yaitu **SCROLL_TAB_LAYOUT** dan **WRAP_TAB_LAYOUT** yang bisa kita konfigurasi melalui metode `setTabLayoutPolicy()` (**WRAP_TAB_LAYOUT** merupakan konfigurasi standart dari **JTabbedPane** jadi tidak perlu dikonfigurasi lagi agar tampilan tab menjadi mode _"wrapping"_) Nah sekarang yang menjadi pertanyaan saya yaitu, apakah teman-teman pernah membuat sebuah aplikasi yang mempunyai jumlah tab yang banyak (anggap saja sampai 10 atau 20 tab lebih) dalam 1 form ? Bagaimanakah tampilan tab teman-teman ? Kemudian bagaimana navigasi antar tab ? Dengan menggunakan **JTabedPane** yang hanya membawa 2 buah mode tampilan akan terasa sangat kurang dan proses navigasi menjadi "susah". Jika menggunakan tampilan **WRAP_TAB_LAYOUT** navigasi antar tab memang mudah, tapi dari tampilan akan terlihat sedikit **"kurang pas dimata"**. Sedangkan jika kita menggunakan tampilan **SCROLL_TAB_LAYOUT**, dari sisi tampilan bagus (tidak berubah) tapi dari sisi navigasi terasa sangat susah :( (Bayangkan jika kita ingin pindah secara cepat dari tab 20 ke tab 1, dengan menggunakan tampilan **SCROLL_TAB_LAYOUT** kita harus melakukan klik 1-1 dari tab 20 sampai tab 1 tampil. Hm.. bukan proses yang menyenangkan saya rasa :D ). Untuk menjelaskan ilustrasi saya diatas, mari kita sama-sama melihat screenshot tampilan **JTabbedPane** dalam 2 mode yaitu **SCROLL_TAB_LAYOUT** dan **WRAP_TAB_LAYOUT** dibawah ini :

[![StandartTabbedPane](http://farm5.static.flickr.com/4075/4771484937_26627527f4.jpg)](http://www.flickr.com/photos/10243554@N02/4771484937/)  
**Tampilan WRAP_TAB_LAYOUT (atas) dan SCROLL_TAB_LAYOUT (bawah)**
<!-- more -->
Nah setelah melihat tampilan standart dari **JTabbedPane** diatas, sekarang mari kita bandingkan apa yang ditawarkan oleh **TabbedContainer** atau NetBeans TabbedPane :) Untuk masalah tampilan **TabbedContainer** membawa lebih banyak mode (tipe) yaitu **TabbedContainer.TYPE_EDITOR, TabbedContainer.TYPE_TOOLBAR, TabbedContainer.TYPE_SLIDING** dan **TabbedContainer.TYPE_VIEW** yang bisa kita lihat pada gambar dibawah ini :







    
[![TabbedContainer_Editor](http://farm5.static.flickr.com/4076/4772179700_2745404a6f.jpg)](http://www.flickr.com/photos/10243554@N02/4772179700/)  
**Type Editor**

    
[![TabbedContainerToolBar](http://farm5.static.flickr.com/4080/4772179688_152c18467c.jpg)](http://www.flickr.com/photos/10243554@N02/4772179688/)  
**Type ToolBar**





    
[![TabbedContainerSliding](http://farm5.static.flickr.com/4082/4772179682_1312019e72.jpg)](http://www.flickr.com/photos/10243554@N02/4772179682/)  
**Type Sliding**

    
[![TabbedContainerView](http://farm5.static.flickr.com/4078/4772179698_522286e726.jpg)](http://www.flickr.com/photos/10243554@N02/4772179698/)  
**Type View**




Waaw... lebih mantap bukan ? Selain dengan tampilan lebih banyak kita juga dapat bonus yaitu adanya tombol **"close"** yang secara otomatis terdapat pada setiap panel yang kita tambahkan ke dalam **TabbedContainer** :) 

Ok-ok cukup sudah preview-nya :) Sekarang bagaimana agar aplikasi Swing kita bisa mempunyai tab seperti diatas ? Caranya sangat mudah yaitu, silahkan ambil library-library dibawah ini pada direktori **$NETBEANS_HOME/platform/modules** (dimana **$NETBEANS_HOME** adalah tempat dimana NetBeans di install) :




  1. org-netbeans-swing-tabcontrol.jar


  2. org-openide-awt.jar


  3. org-openide-util-lookup.jar


  4. org-openide-util.jar


  5. org-openide-windows.jar



Setelah mengamankan ke 5 library diatas, sekarang buatlah sebuah project baru dengan nama **TabbedContainer** kemudian tambahkan library tersebut. Setelah menambahkan ke 5 library diatas pada project yang telah kita buat, sekarang tambahkanlah komponen **TabbedContainer** yang terdapat pada library **org-netbeans-swing-tabcontrol.jar** ke NetBeans Pallete dengan mengikuti tulisan [Menambahkan Komponen Ke NetBeans Pallete](http://martinusadyh.web.id/2009/05/25/membuat-dan-menambahkan-swing-custom-component-ke-netbeans-pallete/) hingga tampilan NetBeans Pallete kita menjadi seperti gambar dibawah ini :

[![TampilanPallete](http://farm5.static.flickr.com/4073/4772236888_8bb5256ca9.jpg)](http://www.flickr.com/photos/10243554@N02/4772236888/)  
**Tampilan Komponen TabbedContainer Pada NetBeans Pallete**

Jika sudah, sekarang buatlah 1 buah **JFrame** dan pasanglah komponen **TabbedContainer** yang baru ditambahkan tersebut ke dalam **JFrame**. Nah yang perlu diperhatikan disini adalah **TabbedContainer ini menggunakan konsep DataModel seperti JTable dengan TableModelnya**, jadi sebelum menampilkan tab kita harus mengkonfigurasi dahulu **DataModel** untuk **TabbedContainer** ini. Sedangkan model yang terdapat pada **TabbedContainer** ini ada 2 yaitu :




  1. TabDataModel dan


  2. DefaultTabDataModel


Karena saya bingung bagaimana cara menggunakan **TabDataModel**, maka pada tulisan ini kita akan menggunakan **DefaultTabDataModel** saja ya :D

Nah didalam DataModel (**DefaultTabDataModel** atau **TabDataModel**) ini, kita bisa menambahkan sebuah **TabData** yang dapat kita isi dengan komponen yang akan ditampilkan pada tab melalui constructor `TabData(Object userObject, Icon i, String caption, String tooltip)`. Setelah **TabData** terisi dengan komponen yang ingin kita tampilkan, maka kita dapat menambahkan-nya kedalam **DefaultTabDataModel** melalui method `addTab(int index, TabData tabData)` seperti contoh dibawah ini :

    
    
            DefaultTabDataModel tabDataModel = new DefaultTabDataModel();
            tabDataModel.addTab(0, new TabData(new MyPanel(), null,  "First Tab", "First Tab"));
    



Proses inisialisasi model telah selesai sampai disini dan siap untuk digunakan, sekarang mari kita tambahkan model yang sudah berisi **TabData** beserta komponen kita kedalam **TabbedContainer** sekalian menentukan mode yang akan digunakan dengan cara seperti dibawah ini :

    
    
        ....
        TabbedContainer tabbedContainer1 = new TabbedContainer(tabDataModel, TabbedContainer.TYPE_EDITOR);
        ....
    



Diatas kita sudah mengetahui bagaimana cara menggunakan **DefaultTabDataModel, TabData** dan memasangnya kedalam **TabbedContainer**, sekarang bagaimana implementasi-nya pada project yang telah dibuat sebelumnya ? Sama seperti pada langkah yang sudah dijelaskan diatas, sekarang buatlah sebuah variabel global untuk **DefaultTabDataModel** dan inisialisasi-lah pada constructor JFrame tepat diatas method `initComponent()` dan tambahkanlah sebuah **TabData** seperti dibawah ini :

    
    
    public class TabbedContainerFrame extends javax.swing.JFrame {
    
        private DefaultTabDataModel tabDataModel;
    
        /** Creates new form TabbedContainerFrame */
        public TabbedContainerFrame() {
            tabDataModel = new DefaultTabDataModel();
            tabDataModel.addTab(0, new TabData(new MyPanel(), null,
                    "First Tab", "First Tab"));
            initComponents();
            setLocationRelativeTo(null);
        }
    }
    



Jika sudah sekarang masuk-lah pada mode **design** kemudian klik kanan pada komponen **TabbedContainer** dan pilih **Customize Code** dan edit constructor **TabbedContainer** seperti gambar dibawah ini :

[![CustomizeCode](http://farm5.static.flickr.com/4115/4771744319_4b22bd532a.jpg)](http://www.flickr.com/photos/10243554@N02/4771744319/)  
**Tampilan Customize Code**

Sekarang coba jalankanlah project-nya dengan menekan tombol **F6** dan jika tidak ada error yang terjadi maka seharusnya kita akan melihat tampilan seperti gambar dibawah ini :

[![Sukses](http://farm5.static.flickr.com/4115/4771781065_4907357738.jpg)](http://www.flickr.com/photos/10243554@N02/4771781065/)  
**Sukses Menjalankan TabbedContainer**

Hore sudah jadi :) Tapi eits... tunggu dulu ini belum selesai :D Sekarang bagaimana jika kita ingin menggunakan **System Look And Feel** dan tampilan-nya akan sebagus NetBeans ? Ok sekarang mari kita coba tambahkan kode untuk memasang **System Look And Feel** pada method **Main** hingga menjadi seperti dibawah ini :

    
    
        public static void main(String[] args) {
            java.awt.EventQueue.invokeLater(new Runnable() {
                public void run() {
                    try {
                        UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (InstantiationException ex) {
                        Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (IllegalAccessException ex) {
                        Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (UnsupportedLookAndFeelException ex) {
                        Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                    }
    
                    new TabbedContainerFrame().setVisible(true);
                }
            });
        }
    



Dan hasilnya adalah seperti gambar dibawah ini :
[![TampilanLAFKacau](http://farm5.static.flickr.com/4121/4771781069_2b7d0e28d2.jpg)](http://www.flickr.com/photos/10243554@N02/4771781069/)  
**Tampilan Look And Feel Yang Kacau**



> 
Tampilan TabbedContainer jadi kacau seperti ini terjadi ketika menggunakan Look And Feel GTK dan Nimbus, sedangkan pada Windows Look And Feel tampilan tidak mengalami perubahan yang signifikan alias baik-baik saja !!




Berdasarkan [JavaDoc LookAndFeel NetBeans](http://bits.netbeans.org/dev/javadoc/org-netbeans-swing-plaf/org/netbeans/swing/plaf/package-summary.html), seluruh proses _"rendering"_ pada NetBeans dan NetBeans Platform terdapat pada package **org.netbeans.swing.plaf**. Dan jika ingin tampilan yang sesuai dengan Look And Feel yang berjalan, kita harus memanggil method `org.netbeans.swing.plaf.Startup.run()` pada saat startup. Sekarang carilah library **org-netbeans-swing-plaf.jar** pada direktori **$NETBEANS_HOME/platform/modules** dan tambahkanlah pada project, setelah itu sekarang modifikasilah method **Main** menjadi seperti dibawah ini :

    
    
        public static void main(String[] args) {
            java.awt.EventQueue.invokeLater(new Runnable() {
                public void run() {
                    try {
                        UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (InstantiationException ex) {
                        Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (IllegalAccessException ex) {
                        Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (UnsupportedLookAndFeelException ex) {
                        Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                    }
    
                    Startup.run(null, 1, null);
                    new TabbedContainerFrame().setVisible(true);
                }
            });
        }
    



Dan sekarang coba jalankan lagi projectnya dengan menekan tombol **F6** dan bagaimana hasilnya ??? :) 



> 
Penambahan kode pada baris 16 diatas jangan dilakukan jika menggunakan Windows LookAndFeel, penggunaan 1 baris kode diatas pada Windows Look And Feel akan menyebabkan tampilan tabcontrol menjadi kacau !!!




Fyuh.. akhirnya selesai juga tulisan-nya :) dan semoga bisa membantu teman-teman yang masih merasa penasaran bagaimana menggunakan **TabbedContainer** ini pada aplikasi Swingnya !! **Sekedar catatan saja, penggunaan `Startup.run()` masih belum dicoba di Nimbus LAF hasilnya memuaskan atau tidak. Dan untuk penggunaan beda OS mungkin bisa di bedakan jika LookAndFeel yang dipakai adalah GTK maka panggil method `Startup.run()`, jika tidak maka abaikan :D**

Semua bahan-bahan yang saya jadikan sebagai referensi dan hasil percobaan bisa teman-teman lihat pada link-link dibawah dan akhir kata selamat ber-eksperimen teman-teman dan mohon maaf klo ada yang salah dengan pembahasan-nya (jika ada salah, mari direvisi bersama-sama) :) 

Happy Hacking Guys !! :)

**Link-link terkait :**




  1. [TabbedContainer API](http://bits.netbeans.org/dev/javadoc/org-netbeans-swing-tabcontrol/org/netbeans/swing/tabcontrol/TabbedContainer.html)


  2. [TabData API](http://bits.nbextras.org/dev/javadoc/org-netbeans-swing-tabcontrol/org/netbeans/swing/tabcontrol/TabData.html)


  3. [TabDataModel API](http://bits.nbextras.org/dev/javadoc/org-netbeans-swing-tabcontrol/org/netbeans/swing/tabcontrol/TabDataModel.html)


  4. [DefaultTabDataModel API](http://bits.nbextras.org/dev/javadoc/org-netbeans-swing-tabcontrol/org/netbeans/swing/tabcontrol/DefaultTabDataModel.html)


  5. [Package org.netbeans.swing.plaf Description](http://bits.netbeans.org/dev/javadoc/org-netbeans-swing-plaf/org/netbeans/swing/plaf/package-summary.html)


  6. [NetBeans Architecture Answers for Look & Feel Customization Library module](http://bits.netbeans.org/dev/javadoc/org-netbeans-swing-plaf/architecture-summary.html)


  7. [TabContainer better JTabbedPane (JavaLobby Forum)](http://www.javalobby.org/java/forums/t13337.html?start=15)


  8. [Menambahkan Komponen Ke NetBeans Pallete](http://martinusadyh.web.id/2009/05/25/membuat-dan-menambahkan-swing-custom-component-ke-netbeans-pallete/)


  9. [Cara Checkout Contoh Aplikasi Martin Personal Project](http://martinusadyh.web.id/2010/03/11/cara-checkout-contoh-aplikasi-martin-personal-project/)


  10. [Source Code TabbedContainer Project](http://code.google.com/p/martin-personal-project/source/browse/#svn/trunk/java/TabbedContainer)


  11. [Project TabbedContainer.zip



