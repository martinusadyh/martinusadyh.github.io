---
comments: true
date: 2009-10-05 18:00:05+00:00
layout: post
slug: mengenal-method-sethonorvisibility-dan-replace-pada-grouplayout
title: Mengenal Method setHonorVisibility() dan replace() pada GroupLayout
wordpress_id: 73
categories:
- Java
- NetBeans
---

Buat teman-teman pengguna NetBeans IDE, pasti sudah tahu fitur baru di NetBeans versi 6.7 kan. Yak, adanya penambahan integrasi dengan [Project Kenai](http://kenai.com/) :) Terus terang saya sendiri belum pernah pakai [Project Kenai](http://kenai.com/) , tapi kemarin iseng cobain fitur [Project Kenai](http://kenai.com/) di NetBeans IDE dan ternyata humm ada yang keren loh :) Mungkin buat yang belum tahu, coba deh lihat di status bar NetBeans versi 6.7.1, disana ada 1 tambahan icon yang tampilan-nya seperti gambar dibawah ini (tempat-nya ada di pojok kanan bawah):
[![ToolBarKenai](http://farm3.static.flickr.com/2625/3984646214_4f3785c631_o.png)  
Tampilan Icon Project Kenai Pada StatusBar NetBeans](http://www.flickr.com/photos/10243554@N02/3984646214/)

Tidak ada yang spesial dengan icon diatas, tapi sekarang coba klik 2 kali pada icon tersebut kemudian coba deh tekan tombol login tanpa memasukkan username dan password. Dan hasil-nya adalah seperti gambar dibawah ini :
[![Login](http://farm4.static.flickr.com/3531/3983879223_ed802dba53_o.png)  
Tampilan Awal Login Dialog](http://www.flickr.com/photos/10243554@N02/3983879223/)
[![ProsesLogin](http://farm3.static.flickr.com/2504/3984646204_e9a747932b_o.png)  
Ketika Tombol Login Di Tekan](http://www.flickr.com/photos/10243554@N02/3984646204/)
[![LoginFailed](http://farm3.static.flickr.com/2674/3984646166_7c84bb4f25_o.png)  
Login Failed, Pesan Kesalahan Berada Pada Posisi JProgressBar](http://www.flickr.com/photos/10243554@N02/3984646166/)

Hmm... ada yang aneh dari **UI** diatas ?? Klo menurut saya ada yang aneh, coba deh lihat lagi pada gambar dialog login dan proses login di atas. JToolBar-nya bisa muncul diantara label **No account on Kenai.com? Sign up now.** dan tombol **Login**. Kenapa aneh, setahu saya klo kita menggunakan **GroupLayout** secara standart dan kita ingin menyembunyikan komponen ditengah-tengah komponen yang lain dengan menggunakan method **setVisible()** hasil-nya pasti jelek :D Ok sekarang mari kita coba, bikinlah 1 project java kemudian tambahkanlah **JDialog** dan design seperti gambar dibawah ini :
[![DesignLogin](http://farm3.static.flickr.com/2467/3983879193_96563de50e_o.png)  
Design Login Dialog](http://www.flickr.com/photos/10243554@N02/3983879193/)
<!-- more -->
Nah setelah selesai men-design seperti gambar diatas, sekarang mari kita coba sembunyikan komponen **JProgressBar** dengan menggunakan method **setVisible(false);** Cara-nya yaitu, tambahkan method **setVisible()** pada konstruktor **JDialog** hingga konstruktor kita sekarang menjadi seperti kode dibawah ini :

    
    
        /** Creates new form LoginDialog */
        public LoginDialog(java.awt.Frame parent, boolean modal) {
            super(parent, modal);
            initComponents();
            jProgressBar1.setVisible(Boolean.FALSE);
        }
    



Sekarang coba jalankan, dan kita akan mendapatkan tampilan yang tidak kita ingin-kan seperti gambar dibawah ini :
[![DialogUggly](http://farm4.static.flickr.com/3485/3983879205_1e1c39686c_o.png)  
Tampilan Login Dialog Terlihat Uggly, karena space kosong Milik JProgressBar di Makan oleh JButton](http://www.flickr.com/photos/10243554@N02/3983879205/)

Nah tahu kan klo kita menggunakan **GroupLayout** dan menggunakan method **setVisible()** hasil-nya pasti akan kacau seperti diatas (Komponen dibawah-nya memakan space kosong komponen yang di sembunyikan). Kalau menggunakan **Layout** yang lain saya percaya, urusan seperti ini sangat mudah :) Tapi masak **Layout** secanggih **GroupLayout** tidak bisa ?

Akhirnya setelah baca-baca sebentar pada halaman manual **GroupLayout** akhirnya saya menemukan method **setHonorsVisibility()** dan dibawah ini adalah penjelasan untuk method **setHonorsVisibility()** yang saya dapat dari tutorial [GroupLayout](http://java.sun.com/docs/books/tutorial/uiswing/layout/group.html) :


> 
Another common operation in user interfaces is to dynamically change the visibility of components. Perhaps components are shown only as a user completes earlier portions of a form. To avoid components shuffling around in such a scenario, space should be taken up regardless of the visibility of the components. GroupLayout offers two ways to configure how invisible components are treated. The setHonorsVisibility(boolean) method globally sets how invisible components are handled. A value of true, the default, indicates invisible components are treated as if they are not there. On the other hand, a value of false provides space for invisible components, treating them as though they were visible. The setHonorsVisibility(Component,Boolean) method can be used to configure the behavior at the level of a specific component. To determine how visibility is handled, GroupLayout first checks if a value has been specified for the Component, if not, it checks the setting of the global property.




Penjelasan diatas sangat jelas sekali, jika kita ingin menyembunyikan sebuah komponen dan kita tidak ingin space komponen yang kita sembunyikan **dimakan** oleh komponen yang lain, maka kita harus menggunakan method **setHonorsVisibility(komponen, false);** pada komponen yang kita sembunyikan :) Ok sekarang mari kita rubah kode program kita diatas menjadi seperti dibawah ini :

    
    
        /** Creates new form LoginDialog */
        public LoginDialog(java.awt.Frame parent, boolean modal) {
            super(parent, modal);
            initComponents();
            jProgressBar1.setVisible(Boolean.FALSE);
    
            /* default layout yang digunakan JDialog adalah BorderLayout (cek
             * dengan memanggil langsung method getLayout()) , jadi
             * kita harus mengambil GroupLayout-nya dari ContentPane(). Bisa di cek
             * pada method initComponent() */
            GroupLayout gl = (GroupLayout) getContentPane().getLayout();
            gl.setHonorsVisibility(jProgressBar1, false);
        }
    



Simpan perubahan yang sudah dilakukan dan mari kita jalankan, hasil-nya sudah cukup bagus menjadi seperti gambar dibawah ini :
[![LoginDialogGood](http://farm4.static.flickr.com/3526/3984646012_243000daae_o.png)  
Hmm... sudah terlihat sedikit cantik bukan ?](http://www.flickr.com/photos/10243554@N02/3984646012/)

Ok sudah terlihat bagus, sekarang mari kita coba tampilkan **JProgressBar-nya** dan sebelumnya editlah dahulu 2 buah **JButton** menjadi **Login** dan **Cancel** kemudian pada tombol **Login** tambahkanlah kode seperti dibawah ini :

    
    
        private void btnLoginActionPerformed(java.awt.event.ActionEvent evt) {
            jProgressBar1.setVisible(true);
            jProgressBar1.setIndeterminate(true);
        }
    



Kemudian mari kita jalankan, dan kita akan mendapatkan tampilan seperti gambar dibawah ini :
[![dialog_result_visibility](http://farm3.static.flickr.com/2477/3984646226_c4216b51b1.jpg)  
Hasil Penggunaan Method setHonorsVisibility()](http://www.flickr.com/photos/10243554@N02/3984646226/)

Nah udah keren bukan sekarang **LoginDialog** kita :) Sekarang tinggal 1 lagi keanehan yang belum terpecah-kan pada Login Dialog di Project kenai-nya NetBeans yaitu pada gambar 2 dan gambar 3, ketika proses login gagal pesan kegagal tersebut ditampilkan juga pada posisi **JProgressBar-nya** wah gimana itu ?? Kembali lagi pada halaman tutorial GroupLayout yang ada [disini](http://java.sun.com/docs/books/tutorial/uiswing/layout/group.html) dan kita menemukan 1 method lagi yaitu **replace(existingComponent, newComponent);** berikut penjelasan-nya :


> 
replace(Component existingComponent, Component newComponent) replaces an existing component with a new one. One of the common operations needed for dynamic layouts is the ability to replace components like this. For example, perhaps a check box toggles between a component displaying a graph or a tree. GroupLayout makes this scenario simple with the replace() method. You can swap components without recreating all the groups.




Sekarang mari kita coba menerapkan method **replace()** tersebut pada kode kita, dan rubahlah konstruktor yang telah dibuat pada langkah diatas menjadi seperti dibawah ini :

    
    
        private GroupLayout gl;
    
        /** Creates new form LoginDialog */
        public LoginDialog(java.awt.Frame parent, boolean modal) {
            super(parent, modal);
            initComponents();
            jProgressBar1.setVisible(Boolean.FALSE);
    
            /* default layout yang digunakan JDialog adalah BorderLayout (cek
             * dengan memanggil langsung method getLayout()) , jadi
             * kita harus mengambil GroupLayout-nya dari ContentPane(). Bisa di cek
             * pada method initComponent() */
            gl = (GroupLayout) getContentPane().getLayout();
            gl.setHonorsVisibility(jProgressBar1, false);
        }
    



Setelah merubah konstruktor, sekarang tambahkanlah komponen **JLabel** melalui **Other Components** pada panel **Inspector** seperti gambar dibawah ini :
[![add_jlabel](http://farm3.static.flickr.com/2423/3984646220_e0f9f9a393_o.png)  
Tambahan JLabel untuk Pesan Error](http://www.flickr.com/photos/10243554@N02/3984646220/)

Kemudian rubahlah method **actionPerformed()** untuk tombol login menjadi seperti dibawah ini :

    
    
        private void btnLoginActionPerformed(java.awt.event.ActionEvent evt) {
            jProgressBar1.setVisible(true);
            jProgressBar1.setIndeterminate(true);
            /* Simulasi long running task menggunakan javax.swing.Timer :) */
            ActionListener actionListener = new ActionListener() {
                int i = 0;
                public void actionPerformed(ActionEvent e) {
                    System.out.println("i " + i);
                    if (i==10) {
                        gl.replace(jProgressBar1, lblError);
                    }
                    i++;
                }
            };
    
            Timer actionTimer = new Timer(1000, actionListener);
            actionTimer.start();
        }
    



Jika sudah selesai, sekarang coba jalankan dan kita akan mendapatkan hasil seperti dibawah ini :
[![Login1](http://farm4.static.flickr.com/3442/3983913907_8e99a97480_o.png)  
Tampilan Awal Login Dialog](http://www.flickr.com/photos/10243554@N02/3983913907/)

[![Login2](http://farm4.static.flickr.com/3435/3983913929_418c14b6c6_o.png)  
Tampilan Ketika Tombol Login di pencet ](http://www.flickr.com/photos/10243554@N02/3983913929/)

[![Login3](http://farm3.static.flickr.com/2600/3983913981_6b2bf3f239_o.png)  
Hasil Akhir](http://www.flickr.com/photos/10243554@N02/3983913981/)

Hurray .... sudah seperti milik NetBenas IDE, keren kan :)

**Link-link terkait : **
- [GroupLayout Tutorial](http://java.sun.com/docs/books/tutorial/uiswing/layout/group.html)
- [Contoh Project](http://martin-personal-project.googlecode.com/files/GroupLayout.tar.bz2)
- [SubVersion Mudah Dengan RabbitVCS](http://martinusadyh.web.id/2010/03/13/subversion-mudah-dengan-rabbitvcs/)
**Tulisan ini dibuat untuk menyukseskan [Lomba Blog Open Source](http://www.informatika.lipi.go.id/seminar/lombablog/) P2I-LIPI dan [Seminar Open Source](http://www.informatika.lipi.go.id/seminar/) P2I-LIPI 2009. **
