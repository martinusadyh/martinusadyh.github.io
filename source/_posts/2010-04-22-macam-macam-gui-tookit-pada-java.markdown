---
comments: true
date: 2010-04-22 19:32:17+00:00
layout: post
slug: macam-macam-gui-tookit-pada-java
title: Macam-macam GUI Tookit Pada Java
wordpress_id: 575
categories:
- Java
- NetBeans
tags:
- AWT
- gui java
- java swing
- JavaGNOME
- macam-macam GUI
- macam-macam java
- QtJambi
- SWT
---

Ingin tahu apa saja sih [GUI Toolkit](http://en.wikipedia.org/wiki/Widget_toolkit) yang terdapat pada bahasa pemrograman Java ? Sudah pernah mencoba menggunakan IDE seperti NetBeans atau Eclipse ? Kalau sudah pernah menggunakan NetBeans atau Eclispe, berarti teman-teman secara tidak langsung pernah bersentuhan dengan 2 [GUI Toolkit](http://en.wikipedia.org/wiki/Widget_toolkit) di Java yang paling terkenal dan masing-masing mempunyai pendukung / pengguna yang sama-sama banyak-nya :) Sekarang yuk mari kita bahas satu persatu [GUI Toolkit](http://en.wikipedia.org/wiki/Widget_toolkit) yang terdapat pada bahasa pemrograman Java :) Sebelum lanjut, sebenarnya apa sih [GUI Toolkit](http://en.wikipedia.org/wiki/Widget_toolkit) itu ? GUI Toolkit yang bisa disebut Widget Toolkit atau [Widget](http://en.wikipedia.org/wiki/GUI_widget) Library ini sebenarnya adalah suatu kumpulan dari komponen yang mempunyai fungsi untuk merancang sebuah _User Interface_ atau tampilan form. Contoh nyata dari sebuah [Widget](http://en.wikipedia.org/wiki/GUI_widget) adalah Button, TextField, Label, Text Area dan lain-lain. Hm... sampai disini sudah dapat gambaran kan ?? :)

Untuk teman-teman yang pernah membangun aplikasi berbasiskan [Java Swing](http://en.wikipedia.org/wiki/Swing_%28Java%29), mungkin akan kaget karena ternyata selain [Java Swing](http://en.wikipedia.org/wiki/Swing_%28Java%29) di Java ada juga [GUI Toolkit](http://en.wikipedia.org/wiki/Widget_toolkit) yang lain loh, nah apa saja [GUI Toolkit](http://en.wikipedia.org/wiki/Widget_toolkit) tersebut ? Yuk mari kita bahas satu persatu dimulai dari yang standart (produk-nya Sun Microsystem yang sekarang sudah diakuisisi ama Oracle) sampai ke produk dari perusahaan lain maupun produk buatan komunitas.

Tertarik membaca lebih jauh ? Yuukkk.... :) (Perhatian, tulisan ini panjang banget jadi siapkan kopi, rokok dan baca sembari dengerin lagu Bang Iwan Fals pasti lebih mantap deh sepertinya :) )
<!-- more -->
Nah beberapa [GUI Toolkit](http://en.wikipedia.org/wiki/Widget_toolkit) yang saya ketahui sampai saat ini kurang lebih ada 4 (empat) yaitu :




  1. **AWT (Abstract Window Toolkit) - SUN Microsystem -> Oracle Product**
AWT (Abstract Window Toolkit) ini adalah [GUI Toolkit](http://en.wikipedia.org/wiki/Widget_toolkit) pertama pada bahasa pemrograman Java, sayang-nya AWT ini sangat-sangat kekurangan komponen yang biasa digunakan untuk membangun sebuah aplikasi desktop secara lengkap (komponen tabel saja tidak ada :( ) Terlepas dari kurang-nya komponen GUI yang terdapat pada AWT (Abstract Window Toolkit), aplikasi yang dibangun menggunakan AWT (Abstract Window Toolkit) akan tampak seperti aplikasi native. Maksudnya yaitu, jika aplikasi yang dibangun menggunakan AWT (Abstract Window Toolkit) ini dijalankan pada Sistem Operasi Windows. Maka aplikasi ini akan terlihat seperti aplikasi Windows pada umum-nya, dan begitu juga jika dijalankan pada Sistem Operasi Mac ataupun GNU/Linux. Kenapa ini bisa terjadi, karena AWT (Abstract Window Toolkit) ini benar-benar memanggil **native subrutin** untuk menggambar setiap komponen-nya ke layar. Tidak percaya ? Mari kita lihat tampilan ke 2 screenshot dibawah ini :






    
[![AWTWindows](http://farm5.static.flickr.com/4004/4510240873_c95ec2c2eb_m.jpg)](http://www.flickr.com/photos/10243554@N02/4510240873/)  
**Tampilan Aplikasi Berbasis AWT Di Ms Windows**

    
[![AWTExample](http://farm5.static.flickr.com/4065/4510240871_77ce569ce6_m.jpg)](http://www.flickr.com/photos/10243554@N02/4510240871/)  
**Tampilan Aplikasi Berbasis AWT Di GNU/Linux**




Sedangkan source-code yang digunakan pada tampilan form diatas adalah seperti dibawah ini :

``` java 

public class AwtFrame extends java.awt.Frame {
    private java.awt.CheckboxGroup checkBoxGroup;

    public AwtFrame() {
        checkBoxGroup = new java.awt.CheckboxGroup();
        
        initComponents();
    }

    private void initComponents() {
        panel1 = new java.awt.Panel();
        label1 = new java.awt.Label();
        txtKdBarang = new java.awt.TextField();
        label2 = new java.awt.Label();
        txtNmBarang = new java.awt.TextField();
        label3 = new java.awt.Label();
        checkBoxEceran = new java.awt.Checkbox();
        checkBoxPack = new java.awt.Checkbox();
        txtArea = new java.awt.TextArea();
        button1 = new java.awt.Button();
        button2 = new java.awt.Button();
        menuBar1 = new java.awt.MenuBar();
        menu1 = new java.awt.Menu();
        menuItem1 = new java.awt.MenuItem();
        menu2 = new java.awt.Menu();

        setMinimumSize(new java.awt.Dimension(500, 300));
        setTitle("AWT Form Example");
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                exitForm(evt);
            }
        });

        label1.setText("Kode Barang");
        label2.setText("Nama Barang");
        label3.setText("Kategori");

        checkBoxEceran.setCheckboxGroup(checkBoxGroup);
        checkBoxEceran.setLabel("Eceran");
        checkBoxEceran.setState(true);

        checkBoxPack.setCheckboxGroup(checkBoxGroup);
        checkBoxPack.setLabel("Pack");

        button1.setLabel("Tambah");
        button1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                button1ActionPerformed(evt);
            }
        });

        button2.setLabel("Clear");
        button2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                button2ActionPerformed(evt);
            }
        });

        add(panel1, java.awt.BorderLayout.CENTER);
        menu1.setLabel("File");
        menuItem1.setLabel("Exit");
        menuItem1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                menuItem1ActionPerformed(evt);
            }
        });
        menu1.add(menuItem1);
        menuBar1.add(menu1);
        menu2.setLabel("Edit");
        menuBar1.add(menu2);
        setMenuBar(menuBar1);
        pack();
    }// </editor-fold>

    /** Exit the Application */
    private void exitForm(java.awt.event.WindowEvent evt) {                          
        System.exit(0);
    }                         

    private void menuItem1ActionPerformed(java.awt.event.ActionEvent evt) {
        exitForm(new java.awt.event.WindowEvent(this, WIDTH));
    }

    private void clearField() {
        txtKdBarang.setText("");
        txtNmBarang.setText("");
    }
    
    private void button1ActionPerformed(java.awt.event.ActionEvent evt) {
        txtArea.append("\nKode Barang     = " + txtKdBarang.getText());
        txtArea.append("\nNama Barang    = " + txtNmBarang.getText());
        txtArea.append("\nKategori Barang = " + checkBoxGroup.getSelectedCheckbox().getLabel());
        clearField();
        txtKdBarang.requestFocusInWindow();
    }

    private void button2ActionPerformed(java.awt.event.ActionEvent evt) {
        clearField();
        txtArea.setText("");
    }

    // Variables declaration - do not modify
    private java.awt.Button button1;
    private java.awt.Button button2;
    private java.awt.Checkbox checkBoxEceran;
    private java.awt.Checkbox checkBoxPack;
    private java.awt.Label label1;
    private java.awt.Label label2;
    private java.awt.Label label3;
    private java.awt.Menu menu1;
    private java.awt.Menu menu2;
    private java.awt.MenuBar menuBar1;
    private java.awt.MenuItem menuItem1;
    private java.awt.Panel panel1;
    private java.awt.TextArea txtArea;
    private java.awt.TextField txtKdBarang;
    private java.awt.TextField txtNmBarang;
}
```

  2. **Java Swing - SUN Microsystem -> Oracle**
Nah ini dia GUI Toolkit yang mungkin paling banyak dikenal oleh teman-teman yang baru belajar **Pemrograman GUI di Java** dibandingkan dengan GUI Toolkit yang lain :) GUI Toolkit ini lebih banyak dikenal dikarenakan dukungan tutorialnya yang cukup banyak bertebaran di Internet, dan juga merupakan standart dari Java yang mana kita tidak perlu melakukan penambahan library lagi kalau ingin menggunakan GUI Toolkit ini. Selain itu, terdapat 2 IDE besar yang menggunakan GUI Toolkit Java Swing yaitu [NetBeans IDE](http://netbeans.org)(OpenSource) dan [IntelliJ IDEA](http://www.jetbrains.com/idea/) (mempunyai versi OpenSource dan Komersial) :)

Dibandingkan dengan pendahulu-nya yaitu **AWT (Abstract Window Toolkit)**, Swing mempunyai lebih banyak komponen pendukung untuk membangun sebuah aplikasi yang lengkap untuk keperluan desktop. Selain didukung dengan banyak-nya komponen, Swing ini benar-benar murni 100 % ditulis dengan bahasa pemrograman Java tanpa adanya sebuah **wrapper** untuk memanggil rutin-rutin **native code** via JNI (Java Native Interface). Seluruh komponen yang terdapat pada Swing, semuanya murni digambar sendiri menggunakan API (Application Programming Interface) 2D untuk memanggil rutin-rutin dasar penggambaran komponen-nya. Nah dengan model seperti ini, memungkinkan  sekali aplikasi yang dibangun menggunakan Swing tampak sama persis di berbagai macam Sistem Operasi.

Selain itu, Swing juga mempunyai kemampuan untuk berganti-ganti tampilan menggunakan LAF (Look And Feel) atau **themes** :D Sayang-nya, jika kita menginginkan tampilan GUI yang **native** (tampilan-nya sama seperti aplikasi-aplikasi lain pada sistem operasi target) Swing seperti-nya masih terasa kurang **smooth** terutama dukungan pada **font rendering**-nya :( . Untuk teman-teman yang penasaran bagaimana sih sebenarnya tampilan dari GUI Toolkit Swing ini ? Dibawah ini adalah screenshot Swing standart yang bisa kita gunakan tanpa perlu menambahkan library lagi :)

    
[![MetalLAF](http://farm5.static.flickr.com/4033/4525943279_149014303f_m.jpg)](http://www.flickr.com/photos/10243554@N02/4525943279/)  
**LAF Metal**

    
[![SystemLAF](http://farm5.static.flickr.com/4004/4525943291_28537e0a0f_m.jpg)](http://www.flickr.com/photos/10243554@N02/4525943291/)  
**LAF System (GTK)**

    
[![NimbusLAF](http://farm5.static.flickr.com/4017/4525943289_bbb2067da3_m.jpg)](http://www.flickr.com/photos/10243554@N02/4525943289/)  
**LAF Nimbus**

    
[![MotifLAF](http://farm5.static.flickr.com/4017/4525943283_69e4e88522_m.jpg)](http://www.flickr.com/photos/10243554@N02/4525943283/)  
**LAF Motif**

Sedangkan untuk source code-nya kurang lebih seperti dibawah ini :
    
``` java 
public class SwingForm extends javax.swing.JFrame {

    /** Creates new form SwingForm */
    public SwingForm() {
        initComponents();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">
    private void initComponents() {
        .....
    }// </editor-fold>

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {                                         
        // TODO add your handling code here:
    }                                        

    private void resetLaf() {
        SwingUtilities.updateComponentTreeUI(this);
    }
    
    private void jMenuItem1ActionPerformed(java.awt.event.ActionEvent evt) {
        try {
            UIManager.setLookAndFeel(UIManager.getCrossPlatformLookAndFeelClassName());
            resetLaf();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedLookAndFeelException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
            resetLaf();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedLookAndFeelException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void jMenuItem3ActionPerformed(java.awt.event.ActionEvent evt) {
        try {
            UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
            resetLaf();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedLookAndFeelException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void jMenuItem4ActionPerformed(java.awt.event.ActionEvent evt) {
        try {
            UIManager.setLookAndFeel("com.sun.java.swing.plaf.motif.MotifLookAndFeel");
            resetLaf();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedLookAndFeelException ex) {
            Logger.getLogger(SwingForm.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    .....
    .....
}
```

  3. **SWT (Standart Widget Tookit) - IBM Product -> Eclipse Foundation**
SWT (Standart Widget Toolkit) ini adalah sebuah GUI Toolkit yang dikeluaran oleh IBM sebagai alternatif dari AWT/Java Swing milik SUN Microsystem, yang membedakan antara SWT (Standart Widget Toolkit) dan AWT/Java Swing adalah SWT ini benar-benar mengakses native GUI library yang terdapat pada Sistem Operasi melalui JNI (Java Native Interface). Dengan model seperti ini, memungkinkan tampilan aplikasi yang dibangun menggunakan GUI Toolkit SWT menjadi sama persis dengan aplikasi native lain-nya. Kekurangan dari model pemanggilan native GUI library seperti ini adalah kita harus menyediakan library untuk tiap-tiap Sistem Operasi target aplikasi kita.

Sedangkan tampilan dari aplikasi yang menggunakan SWT (Standart Widget Toolkit) ini kurang lebih seperti gambar dibawah ini :
[![SWTExample](http://farm5.static.flickr.com/4010/4526717074_d172012ed5_m.jpg)](http://www.flickr.com/photos/10243554@N02/4526717074/)  
**Contoh Form SWT**

Sebelum mulai menggunakan GUI Toolkit SWT, kita harus mendownload dahulu library **swt.jar** yang sesuai dengan Sistem Operasi yang teman-teman gunakan dari [halaman project SWT](http://www.eclipse.org/swt/). Setelah selesai mendownload file **swt.jar**, tambahkan-lah file **swt.jar** tersebut kedalam **CLASSPATH**. Jika sudah, kita siap untuk mulai memasak :) Sedangkan potongan kode-nya untuk contoh form diatas adalah sebagai berikut :


``` java
    
/** This source code taken from :
 * http://www.eclipse.org/articles/article.php?file=Article-Understanding-Layouts/index.html
 * 
 * @author Martinus Ady H <mrt.itnewbies@gmail.com>
 */
public class Main {

    Text dogName;
    Combo dogBreed;
    Canvas dogPhoto;
    Image dogImage;
    List categories;
    Text ownerName;
    Text ownerPhone;

    public static void main(String[] args) {
        Display display = new Display();
        Shell shell = new Main().createShell(display);
        shell.open();
        while (!shell.isDisposed()) {
            if (!display.readAndDispatch()) {
                display.sleep();
            }
        }
    }

    public Shell createShell(final Display display) {
        final Shell shell = new Shell(display);
        shell.setText("SWT Form Example");
        GridLayout gridLayout = new GridLayout();
        gridLayout.numColumns = 3;
        shell.setLayout(gridLayout);

        new Label(shell, SWT.NONE).setText("Dog's Name:");

        dogName = new Text(shell, SWT.SINGLE | SWT.BORDER);
        GridData gridData = new GridData(GridData.FILL, GridData.CENTER, true, false);
        gridData.horizontalSpan = 2;
        dogName.setLayoutData(gridData);

        new Label(shell, SWT.NONE).setText("Breed:");

        dogBreed = new Combo(shell, SWT.NONE);
        dogBreed.setItems(new String[]{"Collie", "Pitbull", "Poodle",
                    "Scottie", "Black Lab"});
        dogBreed.setLayoutData(new GridData(GridData.FILL, GridData.CENTER, true, false));

        Label label = new Label(shell, SWT.NONE);
        label.setText("Categories");
        label.setLayoutData(new GridData(GridData.CENTER, GridData.CENTER, true, false));

        new Label(shell, SWT.NONE).setText("Photo:");
        dogPhoto = new Canvas(shell, SWT.BORDER);
        gridData = new GridData(GridData.FILL, GridData.FILL, true, true);
        gridData.widthHint = 80;
        gridData.heightHint = 80;
        gridData.verticalSpan = 3;
        dogPhoto.setLayoutData(gridData);
        dogPhoto.addPaintListener(new PaintListener() {
            public void paintControl(final PaintEvent event) {
                if (dogImage != null) {
                    event.gc.drawImage(dogImage, 0, 0);
                }
            }
        });

        categories = new List(shell, SWT.MULTI | SWT.BORDER | SWT.V_SCROLL);
        categories.setItems(new String[]{"Best of Breed", "Prettiest Female",
                    "Handsomest Male", "Best Dressed", "Fluffiest Ears",
                    "Most Colors", "Best Performer", "Loudest Bark",
                    "Best Behaved", "Prettiest Eyes", "Most Hair", "Longest Tail",
                    "Cutest Trick"});
        gridData = new GridData(GridData.FILL, GridData.FILL, true, true);
        gridData.verticalSpan = 4;
        int listHeight = categories.getItemHeight() * 12;
        Rectangle trim = categories.computeTrim(0, 0, 0, listHeight);
        gridData.heightHint = trim.height;
        categories.setLayoutData(gridData);

        Button browse = new Button(shell, SWT.PUSH);
        browse.setText("Browse...");
        gridData = new GridData(GridData.FILL, GridData.CENTER, true, false);
        gridData.horizontalIndent = 5;
        browse.setLayoutData(gridData);
        browse.addSelectionListener(new SelectionAdapter() {
            public void widgetSelected(SelectionEvent event) {
                String fileName = new FileDialog(shell).open();
                if (fileName != null) {
                    dogImage = new Image(display, fileName);
                }
            }
        });

        Button delete = new Button(shell, SWT.PUSH);
        delete.setText("Delete");
        gridData = new GridData(GridData.FILL, GridData.BEGINNING, true, false);
        gridData.horizontalIndent = 5;
        delete.setLayoutData(gridData);
        delete.addSelectionListener(new SelectionAdapter() {
            public void widgetSelected(SelectionEvent event) {
                if (dogImage != null) {
                    dogImage.dispose();
                    dogImage = null;
                    dogPhoto.redraw();
                }
            }
        });

        Group ownerInfo = new Group(shell, SWT.NONE);
        ownerInfo.setText("Owner Info");
        gridLayout = new GridLayout();
        gridLayout.numColumns = 2;
        ownerInfo.setLayout(gridLayout);
        gridData = new GridData(GridData.FILL, GridData.CENTER, true, false);
        gridData.horizontalSpan = 2;
        ownerInfo.setLayoutData(gridData);

        new Label(ownerInfo, SWT.NONE).setText("Name:");
        ownerName = new Text(ownerInfo, SWT.SINGLE | SWT.BORDER);
        ownerName.setLayoutData(new GridData(GridData.FILL, GridData.CENTER, true, false));

        new Label(ownerInfo, SWT.NONE).setText("Phone:");
        ownerPhone = new Text(ownerInfo, SWT.SINGLE | SWT.BORDER);
        ownerPhone.setLayoutData(new GridData(GridData.FILL, GridData.CENTER, true, false));

        Button enter = new Button(shell, SWT.PUSH);
        enter.setText("Enter");
        gridData = new GridData(GridData.END, GridData.CENTER, false, false);
        gridData.horizontalSpan = 3;
        enter.setLayoutData(gridData);
        enter.addSelectionListener(new SelectionAdapter() {
            public void widgetSelected(SelectionEvent event) {
                System.out.println("\nDog Name: " + dogName.getText());
                System.out.println("Dog Breed: " + dogBreed.getText());
                System.out.println("Owner Name: " + ownerName.getText());
                System.out.println("Owner Phone: " + ownerPhone.getText());
                System.out.println("Categories:");
                String cats[] = categories.getSelection();
                for (int i = 0; i > cats.length; i++) {
                    System.out.println("\t" + cats[i]);
                }
            }
        });

        shell.addDisposeListener(new DisposeListener() {
            public void widgetDisposed(DisposeEvent arg0) {
                if (dogImage != null) {
                    dogImage.dispose();
                    dogImage = null;
                }
            }
        });

        shell.pack();

        return shell;
    }
}
```

  4. **QtJambi - Trolltech -> Nokia Product -> Stopped and Taken By Community**
Pernah menggunakan Desktop Environment [KDE](http://en.wikipedia.org/wiki/KDE) ? Ingin membuat aplikasi yang tampilan-nya mirip dengan [KDE](http://en.wikipedia.org/wiki/KDE) ? Kalau teman-teman ingin membangun aplikasi yang tampilan-nya tampak seperti aplikasi yang terdapat pada **KDE** tapi masih ingin menggunakan bahasa java sebagai dasar-nya, maka [QtJambi](http://qtjambi.sourceforge.net/) adalah pilihan yang tepat untuk teman-teman. Karena [QtJambi](http://qtjambi.sourceforge.net/) ini merupakan binding Qt Framework dengan bahasa Java, tetapi sayang-nya proyek [QtJambi](http://qtjambi.sourceforge.net/) sudah tidak disupport oleh **Nokia** dan secara resmi [telah ditutup](http://qt.nokia.com/about/news/preview-of-final-qt-jambi-release-available) :( Untung-nya, awal tahun ini ada beberapa developer yang peduli dengan kelangsungan proyek ini dan akhir-nya membuat sebuah komunitas untuk melanjutkan pengembangan proyek [QtJambi](http://qtjambi.sourceforge.net/), sekarang teman-teman bisa melihat perkembangan proyek [QtJambi](http://qtjambi.sourceforge.net/) ini pada halaman [QtJambi Community](http://qtjambi.sourceforge.net/) :). Hm.. penasaran dengan tampilan aplikasi yang dibangun menggunakan [QtJambi](http://qtjambi.sourceforge.net/) ? Kalau iya, silahkan lihat screenshot dibawah ini :

[![DomBookmarksQtJambi](http://farm5.static.flickr.com/4026/4543689050_3ecbde9083.jpg)](http://www.flickr.com/photos/10243554@N02/4543689050/)  
**Contoh Aplikasi QtJambi**

Hmm... keren bukan ? :) Tetapi sama seperti SWT (Standart Widget Toolkit) yang sudah dibahas diatas, aplikasi yang dibangun menggunakan [QtJambi](http://qtjambi.sourceforge.net/) ini benar-benar mengakses **native library** yang terdapat pada Sistem Operasi. Meskipun masalah tersebut (baca library) sudah disediakan oleh [QtJambi](http://qtjambi.sourceforge.net/), tapi jika kita ingin men-distribusikan aplikasi ke client. Kita masih harus memasukkan **native library** tersebut ke dalam **CLASSPATH** aplikasi, agar aplikasi yang kita bangun bisa berjalan dengan sempurna. Tapi kalau masalah ini bisa teman-teman akomodasi, kenapa tidak dicoba kan ? :) Dan untuk teman-teman yang memang ingin mencoba membangun aplikasi menggunakan [QtJambi](http://qtjambi.sourceforge.net/), jangan lupa untuk menambahkan kebutuhan-kebutuhan dibawah ini kedalam **CLASSPATH** aplikasi yang teman-teman buat. Kebutuhan-kebutuhan tersebut yaitu :


    1. **qtjambi-x.x.x.jar**, dimana **x** adalah nomor versi library qtjambi


    2. **qtjambi-os-x.x.x.jar**, dimana **os** adalah sistem operasi target dan **x** adalah nomor versi dari library qtjambi



Sedangkan untuk contoh potongan kode dari aplikasi yang dibangun oleh [QtJambi](http://qtjambi.sourceforge.net/) ini adalah sebagai berikut :

``` java

/****************************************************************************
 **
 ** Copyright (C) 1992-2009 Nokia. All rights reserved.
 **
 ** This file is part of Qt Jambi.
 **
 ** ** $BEGIN_LICENSE$
** Commercial Usage
** Licensees holding valid Qt Commercial licenses may use this file in
** accordance with the Qt Commercial License Agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Nokia.
** 
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
** 
** In addition, as a special exception, Nokia gives you certain
** additional rights. These rights are described in the Nokia Qt LGPL
** Exception version 1.0, included in the file LGPL_EXCEPTION.txt in this
** package.
** 
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
** 
** If you are unsure which license is appropriate for your use, please
** contact the sales department at qt-sales@nokia.com.
** $END_LICENSE$

 **
 ** This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
 ** WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 **
 ****************************************************************************/

package com.trolltech.examples;

import java.util.*;

import com.trolltech.qt.core.*;
import com.trolltech.qt.core.Qt.ItemFlags;
import com.trolltech.qt.gui.*;
import com.trolltech.qt.xml.*;

@QtJambiExample(name = "Dom Bookmarks")
public class DomBookmarks extends QMainWindow {

    public static void main(String args[]) {
        QApplication.initialize(args);

        DomBookmarks domBookmarks = new DomBookmarks();
        domBookmarks.show();
        QApplication.exec();
    }

    private QMenu fileMenu;
    private QMenu helpMenu;
    private QAction openAct;
    private QAction saveAsAct;
    private QAction exitAct;
    private QAction aboutAct;
    private QAction aboutQtAct;
    private QAction aboutQtJambiAct;

    private XbelTree xbelTree;

    public DomBookmarks() {
        xbelTree = new XbelTree(this);
        setCentralWidget(xbelTree);

        createActions();
        createMenus();

        loadFile("classpath:com/trolltech/examples/frank.xbel");
        statusBar().showMessage(tr("Ready"));

        setWindowTitle(tr("DOM Bookmarks"));
        setWindowIcon(new QIcon("classpath:com/trolltech/images/qt-logo.png"));
        resize(480, 320);
    }

    private void loadFile(String fileName){
        QFile file = new QFile(fileName);
        if (!file.open(new QFile.OpenMode(QFile.OpenModeFlag.ReadOnly, QFile.OpenModeFlag.Text))) {
            QMessageBox.warning(this, tr("SAX Bookmarks"), String.format(tr("Cannot read file: %s"), fileName)
                    + " :\n" + file.errorString() + ".");
            return;
        }

        if (xbelTree.read(file))
            statusBar().showMessage(tr("File loaded"), 2000);

        file.dispose();
    }

    private void open() {
        String fileName = QFileDialog.getOpenFileName(this, tr("Open Bookmark File"), QDir
                .currentPath(), new QFileDialog.Filter(tr("XBEL Files (*.xbel *.xml)")));
        if (fileName.equals(""))
            return;

        loadFile(fileName);
    }

    private void saveAs() {
        String fileName = QFileDialog.getSaveFileName(this, tr("Save Bookmark File"), QDir
                .currentPath(), new QFileDialog.Filter(tr("XBEL Files (*.xbel *.xml)")));
        if (fileName.equals(""))
            return;

        QFile file = new QFile(fileName);
        if (!file.open(new QFile.OpenMode(QFile.OpenModeFlag.WriteOnly, QFile.OpenModeFlag.Text))) {
            QMessageBox.warning(this, tr("SAX Bookmarks"), String.format(tr("Cannot write file: %s"), fileName)
                    + " :\n" + file.errorString() + ".");
            return;
        }

        if (xbelTree.write(file))
            statusBar().showMessage(tr("File saved"), 2000);

        file.dispose();
    }

    private void about() {
        QMessageBox.about(this, tr("About DOM Bookmarks"),
                tr("The <b>DOM Bookmarks</b> example demonstrates how to "
                        + "use Qt's DOM classes to read and write XML " + "documents."));
    }

    private void createActions() {
        openAct = new QAction(tr("&Open...;"), this);
        openAct.setShortcut(tr("Ctrl+O"));
        openAct.triggered.connect(this, "open()");

        saveAsAct = new QAction(tr("&Save; As..."), this);
        saveAsAct.setShortcut(tr("Ctrl+S"));
        saveAsAct.triggered.connect(this, "saveAs()");

        exitAct = new QAction(tr("E&xit;"), this);
        exitAct.setShortcut(tr("Ctrl+Q"));
        exitAct.triggered.connect(this, "close()");

        aboutAct = new QAction(tr("&About;"), this);
        aboutAct.triggered.connect(this, "about()");

        aboutQtJambiAct = new QAction(tr("About &Qt; Jambi"), this);
        aboutQtJambiAct.triggered.connect(QApplication.instance(), "aboutQtJambi()");

        aboutQtAct = new QAction(tr("About Q&t;"), this);
        aboutQtAct.triggered.connect(QApplication.instance(), "aboutQt()");
    }

    private void createMenus() {
        fileMenu = menuBar().addMenu(tr("&File;"));
        fileMenu.addAction(openAct);
        fileMenu.addAction(saveAsAct);
        fileMenu.addAction(exitAct);

        menuBar().addSeparator();

        helpMenu = menuBar().addMenu(tr("&Help;"));
        helpMenu.addAction(aboutAct);
        helpMenu.addSeparator();
        helpMenu.addAction(aboutQtJambiAct);
        helpMenu.addAction(aboutQtAct);
    }

    private class XbelTree extends QTreeWidget {

        private QDomDocument domDocument = new QDomDocument();
        private Hashtable<QTreeWidgetItem, QDomElement> domElementForItem = new Hashtable<QTreeWidgetItem, QDomElement>();
        private QIcon folderIcon = new QIcon();
        private QIcon bookmarkIcon;

        private XbelTree(QWidget parent) {
            super(parent);
            Vector<string> labels = new Vector<string>();
            labels.add("Title");
            labels.add("Location");

            header().setResizeMode(QHeaderView.ResizeMode.Stretch);
            setHeaderLabels(labels);

            folderIcon.addPixmap(style().standardIcon(QStyle.StandardPixmap.SP_DirClosedIcon).pixmap(new QSize(24,24),
                    QIcon.Mode.Normal, QIcon.State.Off));

            folderIcon.addPixmap(style().standardIcon(QStyle.StandardPixmap.SP_DirOpenIcon).pixmap(new QSize(24,24),
                    QIcon.Mode.Normal, QIcon.State.On));

            bookmarkIcon = style().standardIcon(QStyle.StandardPixmap.SP_FileIcon);
        }

        private boolean read(QIODevice device) {
            QDomDocument.Result res = domDocument.setContent(device, true);
            if(!res.success){
                QMessageBox.information(window(), tr("DOM Bookmarks"),
                        String.format(tr("Parse error at line %s, column %s :"),  res.errorLine, res.errorColumn)
                        + "\n" + res.errorMessage);
                return false;
            }

            QDomElement root = domDocument.documentElement();

            if (!root.tagName().equals("xbel")) {
                QMessageBox.information(window(), tr("DOM Bookmarks"),
                        tr("The file is not an XBEL file."));
                return false;
            } else if (root.hasAttribute("version") && !root.attribute("version").equals("1.0")) {
                QMessageBox.information(window(), tr("DOM Bookmarks"),
                        tr("The file is not an XBEL version 1.0 " + "file."));
                return false;
            }

            clear();

            itemChanged.disconnect(this, "updateDomElement(QTreeWidgetItem, int)");

            QDomElement child = root.firstChildElement("folder");
            while (!child.isNull()) {
                parseFolderElement(child, null);
                child = child.nextSiblingElement("folder");
            }

            itemChanged.connect(this, "updateDomElement(QTreeWidgetItem, int)");

            return true;
        }

        private boolean write(QIODevice device) {
            final int IndentSize = 4;

            QTextStream out = new QTextStream(device);
            domDocument.save(out, IndentSize);
            return true;
        }

        private void updateDomElement(QTreeWidgetItem item, int column) {
            QDomElement element = domElementForItem.get(item);// .value(item);
            if (!element.isNull()) {
                if (column == 0) {
                    QDomElement oldTitleElement = element.firstChildElement("title");
                    QDomElement newTitleElement = domDocument.createElement("title");

                    QDomText newTitleText = domDocument.createTextNode(item.text(0));
                    newTitleElement.appendChild(newTitleText);

                    element.replaceChild(newTitleElement, oldTitleElement);
                } else {
                    if (element.tagName().equals("bookmark"))
                        element.setAttribute("href", item.text(1));
                }
            }
        }

        private void parseFolderElement(final QDomElement element, QTreeWidgetItem parentItem) {
            QTreeWidgetItem item = createItem(element, parentItem);

            String title = element.firstChildElement("title").text();
            if (title.equals(""))
                title = tr("Folder");

            item.setFlags(new ItemFlags(item.flags().value() | Qt.ItemFlag.ItemIsEditable.value()));

            item.setIcon(0, folderIcon);
            item.setText(0, title);

            boolean folded = (element.attribute("folded") != "no");
            item.setExpanded(!folded);

            QDomElement child = element.firstChildElement();
            while (!child.isNull()) {
                if (child.tagName().equals("folder")) {
                    parseFolderElement(child, item);
                } else if (child.tagName().equals("bookmark")) {
                    QTreeWidgetItem childItem = createItem(child, item);

                    title = child.firstChildElement("title").text();
                    if (title.equals(""))
                        title = tr("Folder");

                    childItem.setFlags(new ItemFlags(item.flags().value()
                            | Qt.ItemFlag.ItemIsEditable.value()));

                    childItem.setIcon(0, bookmarkIcon);
                    childItem.setText(0, title);
                    childItem.setText(1, child.attribute("href"));
                } else if (child.tagName().equals("separator")) {
                    QTreeWidgetItem childItem = createItem(child, item);
                    childItem.setFlags(new ItemFlags(item.flags().value()
                            & ~(Qt.ItemFlag.ItemIsSelectable.value() | Qt.ItemFlag.ItemIsEditable
                                    .value())));
                    childItem.setText(0, "------------------------------");
                }
                child = child.nextSiblingElement();
            }
        }

        private QTreeWidgetItem createItem(final QDomElement element, QTreeWidgetItem parentItem) {
            QTreeWidgetItem item;
            if (parentItem != null) {
                item = new QTreeWidgetItem(parentItem);
            } else {
                item = new QTreeWidgetItem(this);
            }
            domElementForItem.put(item, element);
            return item;
        }
    }
}
```

  5. **JavaGNOME - Community Product**
Kalau [QtJambi](http://qtjambi.sourceforge.net/) diatas ditujukan untuk teman-teman yang sudah akrab dengan API (Application Programming Interface) Qt Framework, berbeda dengan [JavaGNOME](http://java-gnome.sourceforge.net/) :) Proyek ini lebih dikhususkan untuk teman-teman pecinta GTK atau yang paling banyak dikenal yaitu GNOME :) Sama seperti GUI Toolkit SWT dan QTJambi, [JavaGNOME](http://java-gnome.sourceforge.net/) ini juga mengakses native library tetapi API yang digunakan adalah API dari GTK. Untuk teman-teman yang sudah terbiasa membangun aplikasi menggunakan Glade, maka teman-teman bisa men-design form-nya menggunakan Glade dan memanggil-nya menggunakan bahasa java melalui [JavaGNOME](http://java-gnome.sourceforge.net/) :) Nah ingin tahu tampilan aplikasi yang dibangun menggunakan [JavaGNOME](http://java-gnome.sourceforge.net/) ? Jika ya, silahkan cek screenshot dibawah ini :

[![ContohJavaGNOME](http://farm5.static.flickr.com/4064/4544062138_96bea1fe06.jpg)](http://www.flickr.com/photos/10243554@N02/4544062138/)  
**Contoh Menu JavaGNOME**

Hm.. bagaimana teman-teman ? GNOME banget kan tampilan-nya :D Nah jika teman-teman ingin coba-coba membangun aplikasi menggunakan [JavaGNOME](http://java-gnome.sourceforge.net/), maka teman-teman harus menambahkan 1 buah library yaitu **gtk-4.0.jar** pada project yang akan teman-teman buat dan 1 tambahkan file **libgtkjni-4.0.13.so** pada direktori **/usr/lib/jni** di sistem teman-teman maupun pada sistem target. Dan yang perlu teman-teman ingat yaitu **"PASTIKAN KEBUTUHAN SELURUH DEPENDENCIES BESERTA NOMOR VERSI LIBRARY YANG DIBUTUHKAN ITU SAMA"** jika tidak bisa dipastikan ada saja masalah-nya :D :) Nah kalau teman-teman ingin tahu bagaimana source code dari tampilan menu diatas, sekarang mari kita lihat kode dibawah ini :)

``` java
    
/*
 * java-gnome, a UI library for writing GTK and GNOME programs from Java!
 *
 * Copyright © 2007      Vreixo Formoso
 * Copyright © 2007-2010 Operational Dynamics Consulting, Pty Ltd
 *
 * The code in this file, and the program it is a part of, is made available
 * to you by its authors as open source software: you can redistribute it
 * and/or modify it under the terms of the GNU General Public License version
 * 2 ("GPL") as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GPL for more details.
 *
 * You should have received a copy of the GPL along with this program. If not,
 * see http://www.gnu.org/licenses/. The authors of this program may be
 * contacted through http://java-gnome.sourceforge.net/.
 */
package javagnomeapplication;

import org.gnome.gdk.Event;
import org.gnome.gtk.CheckMenuItem;
import org.gnome.gtk.Gtk;
import org.gnome.gtk.ImageMenuItem;
import org.gnome.gtk.Label;
import org.gnome.gtk.Menu;
import org.gnome.gtk.MenuBar;
import org.gnome.gtk.MenuItem;
import org.gnome.gtk.SeparatorMenuItem;
import org.gnome.gtk.Stock;
import org.gnome.gtk.VBox;
import org.gnome.gtk.Widget;
import org.gnome.gtk.Window;

/**
 * How to use {@link Menu} and related Widgets.
 *
 * @author Vreixo Formoso
 * @author Andrew Cowie
 */
public class ExampleSimpleMenu {

    public ExampleSimpleMenu() {
        final Window w;
        final VBox x;
        final Label l;
        final Menu fileMenu, editMenu, viewMenu;
        final MenuItem fileNew, fileMenuItem, editMenuItem, viewMenuItem;
        final MenuBar menuBar;

        /*
         * Begin with the standard VBox in a Window setup:
         */

        w = new Window();
        w.setTitle("JavaGNOME Example - <mrt.itnewbies@gmail.com>");
        x = new VBox(false, 3);
        w.add(x);

        l = new Label("Select an action in a menu");
        l.setWidthChars(30);
        l.setAlignment(0.0f, 0.5f);

        /*
         * Most applications will use several Menus in a MenuBar:
         */
        fileMenu = new Menu();
        editMenu = new Menu();
        viewMenu = new Menu();

        /*
         * Now you can add MenuItems to the "file" Menu.
         */
        fileNew = new MenuItem("_New");
        fileMenu.append(fileNew);

        /*
         * Usually you will want to connect to the MenuItem.Activate signal,
         * that is emitted when the user "activates" the menu by either
         * clicking it with the mouse or navigating to it with the keyboard
         * and pressing <enter>.
         */
        fileNew.connect(new MenuItem.Activate() {

            public void onActivate(MenuItem source) {
                l.setLabel("You have selected File->New menu.");
            }
        });

        /*
         * Given that in most cases you will connect to the MenuItem.Activate
         * signal on MenuItems, a convenience constructor is provided:
         */
        fileMenu.append(new MenuItem("_Save", new MenuItem.Activate() {

            public void onActivate(MenuItem source) {
                l.setLabel("You have selected File->Save.");
            }
        }));

        /*
         * A SeparatorMenuItem can be used to differentiate between unrelated
         * menu options; in practise, though, only use sparingly.
         */
        fileMenu.append(new SeparatorMenuItem());

        fileMenu.append(new ImageMenuItem(Stock.CLOSE, new MenuItem.Activate() {

            public void onActivate(MenuItem source) {
                l.setLabel("You have selected File->Close.");
            }
        }));
        fileMenu.append(new MenuItem("_Quit", new MenuItem.Activate() {

            public void onActivate(MenuItem source) {
                Gtk.mainQuit();
            }
        }));

        /*
         * And now add the items making up the "edit" Menu.
         */
        editMenu.append(new MenuItem("_Copy", new MenuItem.Activate() {

            public void onActivate(MenuItem source) {
                l.setLabel("You have selected Edit->Copy.");
            }
        }));
        editMenu.append(new MenuItem("_Paste", new MenuItem.Activate() {

            public void onActivate(MenuItem source) {
                l.setLabel("You have selected Edit->Paste.");
            }
        }));

        /*
         * CheckMenuItems hold a boolean state. One use is to allow users to
         * hide some parts of the GUI, as in this example which we put into
         * the "view" Menu:
         */
        viewMenu.append(new CheckMenuItem("Hide _text", new CheckMenuItem.Toggled() {

            public void onToggled(CheckMenuItem source) {
                if (source.getActive()) {
                    l.hide();
                } else {
                    l.show();
                }
            }
        }));

        /*
         * A MenuItem can have a "sub-menu", that will be expanded when the
         * user puts the mouse pointer over it. This is also used in creating
         * the elements for the top level MenuBar, but you can use it within
         * normal Menus as well. That said, submenus of Menus are considered
         * less "discoverable" because the user has to navigate through the
         * hierarchy to find out what options are available to them, rather
         * than seeing them at first glance.
         */
        fileMenuItem = new MenuItem("_File");
        fileMenuItem.setSubmenu(fileMenu);
        editMenuItem = new MenuItem("_Edit");
        editMenuItem.setSubmenu(editMenu);
        viewMenuItem = new MenuItem("_View");
        viewMenuItem.setSubmenu(viewMenu);

        /*
         * Finally, most applications make use of a MenuBar that is by
         * convention located at the top of the application Window. It
         * contains the top-level MenuItems.
         */
        menuBar = new MenuBar();
        menuBar.append(fileMenuItem);
        menuBar.append(editMenuItem);
        menuBar.append(viewMenuItem);

        /*
         * Finally, pack the Widgets into the VBox, and present:
         */
        x.packStart(menuBar, false, false, 0);
        x.packStart(l, false, false, 0);

        w.showAll();

        /*
         * And that's it! One last piece of house keeping, though: it is
         * always necessary to deal with the user closing (what is in this
         * case) the last Window in the application; otherwise the Java VM
         * will keep running even after the (sole) Window is closed - because
         * the main loop never returned.
         */
        w.connect(new Window.DeleteEvent() {

            public boolean onDeleteEvent(Widget source, Event event) {
                Gtk.mainQuit();
                return false;
            }
        });
    }

    public static void main(String[] args) {
        Gtk.init(args);

        new ExampleSimpleMenu();

        /*
         * Yes, you could have written all the Window creation code here in
         * main() but it is generally good practise to put that setup into a
         * constructor, as we have here.
         */

        Gtk.main();
    }
}

```
    






Fyuh... akhirnya selesai juga tulisan panjang lebar ini (halah kebanyakan paste source code :D :P) gpp buat refreshing koq :D , oh iya mungkin ditulisan ini teman-teman berkata **"walah koq lebih banyak source code-nya ?"** Yaps.. source code pada tulisan kali ini saya tulis semua tanpa ada yang dipotong, maksud hati sih biar kita tahu **style** dari masing-masing GUI Toolkit yang dibahas :) 

Dari semua GUI Toolkit yang dibahas diatas, setahu saya hanya Swing dan SWT saja yang merajai pasar Java Desktop, sedangkan AWT, QtJambi dan JavaGNOME pengguna-nya seperti-nya masih sedikit ataupun sudah berkurang (asumsi ini saya ambil dilihat dari banyak-nya aplikasi yang dibangun menggunakan GUI Toolkit diatas). Nah sekarang bagaimana pendapat teman-teman ? Apa masih ada GUI Toolkit untuk Java selain yang sudah dibahas disini ? Jika masih ada, boleh dong di share dan di review :) 


**Referensi-referensi terkait :**

  1. [Contoh Project Macam-macam GUI Toolkit di Java](http://code.google.com/p/martin-personal-project/source/browse/#svn/trunk/java/MacamMacamGUIToolkit)


  2. [Halaman Proyek SWT (Standart Widget Toolkit)](http://www.eclipse.org/swt/)

  3. [Penjelasan Bahwa QtJambi Sudah Tidak Dikembangkan Lagi](http://qt.nokia.com/about/news/preview-of-final-qt-jambi-release-available)

  4. [QtJambi Versi Komunitas (Berita terbaru tertanggal 22 Januari 2010)](http://qtjambi.sourceforge.net/)

  5. [Halaman Project Java GNOME](http://java-gnome.sourceforge.net/)

  6. [Penjelasan GUI Toolkit dari Wikipedia](http://en.wikipedia.org/wiki/Widget_toolkit)


  7. [Penjelasan Widget dari Wikipedia](http://en.wikipedia.org/wiki/GUI_widget)


  8. [Penjelasan Java Swing dari Wikipedia](http://en.wikipedia.org/wiki/Swing_%28Java%29)