---
comments: true
date: 2009-10-31 20:05:50+00:00
layout: post
slug: background-image-in-jdesktoppane
title: Background Image in JDesktopPane
wordpress_id: 79
categories:
- Java
- NetBeans
---

Bingung bagaimana caranya menambahkan background image ke dalam [JDesktopPane](http://java.sun.com/javase/6/docs/api/javax/swing/JDesktopPane.html) di NetBeans IDE ? Nah kalau bingung, sekarang buatlah sebuah **project** dahulu di NetBeans IDE kemudian buatlah 1 buah **Java Class** dengan nama **JImageDesktopPane** (nama class terserah keinginan masing-masing :) ) kemudian pastekan kode dibawah ini :

    
    
    /*
     * To change this template, choose Tools | Templates
     * and open the template in the editor.
     */
    package jdesktoppanebackground;
    
    import java.awt.Graphics;
    import java.awt.Image;
    import javax.swing.JDesktopPane;
    
    /**
     *
     * @author Martinus Ady H <mrt.itnewbies@gmail.com>
     */
    public class JImageDesktopPane extends JDesktopPane {
    
        private Image image;
    
        public JImageDesktopPane() {
        }
    
        @Override
        protected void paintComponent(Graphics g) {
            try {
                image = new javax.swing.ImageIcon(getClass().getResource("netbeans6ns0.png")).getImage();
    
                if (g != null) {
                    g.drawImage(image,
                            (this.getSize().width - image.getWidth(null)) / 2,
                            (this.getSize().height - image.getHeight(null)) / 2,
                            null);
                }
            } catch (NullPointerException npe) {
                System.out.println("Can't find images !!");
            }
        }
    }
    



Baris paling penting diatas terdapat pada baris ke 25, karena pada baris ke 25 kita mencoba mengambil gambar yang ingin kita jadikan sebagai **Background Image** dan sedangkan method **paintComponent(Graphics g)** pada baris 23-37 ini kita gunakan jika kita ingin mengubah-ubah tampilan dari [JComponent](http://java.sun.com/javase/6/docs/api/javax/swing/JComponent.html) di [Java Swing](http://java.sun.com/docs/books/tutorial/uiswing/) :)

Nah jika sudah selesai, sekarang simpan gambar dibawah ini dengan nama **netbeans6ns0.png** pada direktori project
[![netbeans6ns0](http://farm3.static.flickr.com/2625/4061136331_1fa9b451b0_o.png)  
Save Image As Gambar Ini](http://www.flickr.com/photos/10243554@N02/4061136331/)
<!-- more -->
Jika sudah selesai, maka harusnya tampilan pada pallete **Project** akan nampak seperti dibawah ini :
[![PalleteProject](http://farm3.static.flickr.com/2471/4061878816_dd5ffe253c_o.png)  
Tampilan Pallete Project Setelah Penambahan Image](http://www.flickr.com/photos/10243554@N02/4061878816/)

Sekarang lakukan proses kompilasi dahulu terhadap file yang sudah dibuat, dan jika sudah sekarang tambahkanlah sebuah [JFrame](http://java.sun.com/javase/6/docs/api/javax/swing/JFrame.html) dan sebuah [JMenuBar](http://java.sun.com/javase/6/docs/api/javax/swing/JMenuBar.html) hingga tampilan-nya menjadi seperti dibawah ini :
[![JFrame_with_MenuBar](http://farm3.static.flickr.com/2785/4061878810_29f4bf5a23.jpg)  
JFrame dengan JMenuBar](http://www.flickr.com/photos/10243554@N02/4061878810/)

Setelah itu, sekarang mari kita tambahkan class **JImageDesktopPane** ke dalam [JFrame](http://java.sun.com/javase/6/docs/api/javax/swing/JFrame.html) dengan cara **DRAG and DROP** pada class **JImageDesktopPane** kedalam [JFrame](http://java.sun.com/javase/6/docs/api/javax/swing/JFrame.html) dan atur seperti gambar dibawah ini :
[![Drag_N_Drop](http://farm3.static.flickr.com/2799/4061878800_9302c7b894.jpg)  
Lakukan Proses Drag and Drop Kedalam JFrame](http://www.flickr.com/photos/10243554@N02/4061878800/)

Jika sudah, pada [JMenuBar](http://java.sun.com/javase/6/docs/api/javax/swing/JMenuBar.html) klik kanan **Menu Edit** kemudian tambahkan-lah [JMenuItem](http://java.sun.com/javase/6/docs/api/javax/swing/JMenuItem.html) kemudian beri **Action** seperti berikut :

    
    
        private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {
            try {
                JInternalFrame iFrame = new JInternalFrame("Internal Frame");
                jImageDesktopPane1.add(iFrame);
                iFrame.setClosable(true);
                iFrame.setVisible(true);
                iFrame.setSelected(true);
                iFrame.setSize(200, 200);
            } catch (PropertyVetoException ex) {
                Logger.getLogger(MainForm.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    



Sekarang coba lakukan proses **Clean Build** kemudian tekan tombol **F6** untuk melihat hasilnya, dan jika tidak ada kesalahan maka kita akan melihat tampilan seperti dibawah ini :








[![JDesktopPane_With_Background](http://farm3.static.flickr.com/2551/4061878808_420688c059.jpg)  
Tampilann Awal](http://www.flickr.com/photos/10243554@N02/4061878808/)

[![JDesktopPaneAction_With_iFrame](http://farm4.static.flickr.com/3502/4061878804_eb7baea6a1.jpg)  
Tampilan Ketika Menambahkan JInternalFrame](http://www.flickr.com/photos/10243554@N02/4061878804/)






Mudah bukan :)

**Link-link terkait : **
- [Java Swing Tutorial](http://java.sun.com/docs/books/tutorial/uiswing/)
- [JDesktopPane API](http://java.sun.com/javase/6/docs/api/javax/swing/JDesktopPane.html)
- [JComponent API](http://java.sun.com/javase/6/docs/api/javax/swing/JComponent.html)
- [Contoh Project JDesktopPane Background](http://martin-personal-project.googlecode.com/files/JDesktopPaneBackground.zip)
- [Source code Project JDesktopPane Background](http://code.google.com/p/martin-personal-project/source/browse/#svn/trunk/java/JDesktopPaneBackground)
- [SubVersion Mudah Dengan RabbitVCS](http://martinusadyh.web.id/2010/03/13/subversion-mudah-dengan-rabbitvcs/)
