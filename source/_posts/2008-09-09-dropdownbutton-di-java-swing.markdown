---
comments: true
date: 2008-09-09 16:31:01+00:00
layout: post
slug: dropdownbutton-di-java-swing
title: DropDownButton di Java Swing
wordpress_id: 31
categories:
- Java
- NetBeans
---

Wuuuuuuuuuuuah udah lama ga ngisi blog maklum sekarang udah ga kerja di warnet lagi :( , berhubung sekarang sudah dapat akses internet and udah dapat kerja lagi ditempat ["idaman"](http://artivisi.com/) :) Sekarang kegiatan nge-blogging bakalan jalan lancar lagi :)

Untuk teman-teman yang senang bermain di [Java Swing](http://java.sun.com/docs/books/tutorial/uiswing/TOC.html), mungkin pernah punya keinginan untuk membuat atau mencari sebuah button yang mempunyai karakteristik seperti button milik [NetBeans](http://netbeans.org) dibawah ini :
[![NB_DropDownBtn](http://farm4.static.flickr.com/3128/2840294036_d482509750_o.png)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2840294036/)
<!-- more -->
Jika teman-teman mempunyai keinginan tersebut tetapi belum tahu bagaimana caranya atau belum menemukannya, mungkin tulisan sederhana saya ini bisa sedikit membantu permasalahan teman-teman :) Komponen ini saya beri nama **MDropDownButton** (eh bener ga ya namanya dropdown button ? :malu: ) dan tampilan dari **MDropDownButton** tersebut adalah seperti ini :
[![MDropDownBtn](http://farm4.static.flickr.com/3136/2840295730_7de782fe64_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2840295730/)

**MDropDownButton** diatas merupakan subclass dari **JToggleButton** (supaya tampilan button-nya tidak jauh berbeda di semua LAF yang sudah di support oleh [Java Swing](http://java.sun.com/docs/books/tutorial/uiswing/TOC.html)) dan menggunakan **JPopupMenu** untuk menu drop down-nya, dan jika teman-teman ingin menggunakan komponen tersebut di project-nya silahkan kopi paste kode **MDropDownButton.java** dibawah ini :

    
    
    /*
     * MDropDownButton.java
     *
     * Created on Jun 25, 2008, 1:41:42 AM
     *
     * Copyright (c) 2008 Martinus Ady H <mrt.itnewbies@gmail.com>.
     * All rights reserved.
     *
     * Redistribution and use in source and binary forms, with or without
     * modification, are permitted provided that the following conditions are met:
     *
     *  o Redistributions of source code must retain the above copyright notice,
     *    this list of conditions and the following disclaimer.
     *
     *  o Redistributions in binary form must reproduce the above copyright notice,
     *    this list of conditions and the following disclaimer in the documentation
     *    and/or other materials provided with the distribution.
     *
     *  o The name of the author may not be used to endorse or promote products
     *    derived from this software without specific prior written permission.
     *
     * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
     * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
     * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
     * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
     * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
     * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
     * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
     * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
     * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
     * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
     * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
     */
    package id.web.martinusadyh.button;
    
    import java.awt.Point;
    import java.awt.event.MouseEvent;
    import java.awt.event.MouseListener;
    import javax.swing.Icon;
    import javax.swing.JPopupMenu;
    import javax.swing.SwingConstants;
    import javax.swing.event.PopupMenuEvent;
    import javax.swing.event.PopupMenuListener;
    
    /** MDropDownButton provide standart button with add feature drop down.
     * @author javamaniac <mrt.itnewbies@gmail.com>
     */
    public class MDropDownButton extends javax.swing.JToggleButton
            implements MouseListener {
    
        private javax.swing.JLabel      lblIcon;
        private javax.swing.JLabel      btnLabel;
        private javax.swing.JPopupMenu  popUpMenu;
        private Icon                    disabledIcon;
        private Icon                    enabledIcon;
    
        public MDropDownButton() {
            this(null, null);
        }
    
        public MDropDownButton(javax.swing.JPopupMenu popUpMenu) {
            this(null, null, popUpMenu);
        }
    
        public MDropDownButton(String text, Icon icon) {
            this(text, icon, null);
        }
    
        public MDropDownButton(String text, Icon icon,
                javax.swing.JPopupMenu popUpMenu) {
            super();
            this.popUpMenu = popUpMenu;
    
            initLayout();
            setText(text);
            setIcon(icon);
            setComponentPopupMenu(popUpMenu);
        }
    
        @Override
        public void setDisabledIcon(Icon disabledIcon) {
            this.disabledIcon = disabledIcon;
        }
    
        @Override
        public void setEnabled(boolean enabledState) {
            lblIcon.setEnabled(enabledState);
            btnLabel.setEnabled(enabledState);
            super.setEnabled(enabledState);
        }
    
        @Override
        public boolean isEnabled() {
            return super.isEnabled();
        }
    
        /** Override method setText from parent, this method will put text in JLabel
         * then add to this button via <code>JLabel.setText(newText)</code>.
         * @param text  text for this button */
        @Override
        public void setText(String text) {
            btnLabel.setText(text);
        }
    
        /** Override method setIcon from parent, this method will put Icon in JLabel
         * then add to this button via <code>JLabel.setIcon(newIcon)</code>.
         * @param icon  icon for this button */
        @Override
        public void setIcon(Icon icon) {
            this.enabledIcon = icon;
            btnLabel.setIcon(enabledIcon);
        }
    
        @Override
        public void setComponentPopupMenu(JPopupMenu popup) {
            this.popUpMenu = popup;
        }
    
        /** Method initLayout ini berfungsi untuk mengatur tampilan dari
         * MDropDownButton. MDropDownButton ini menggunakan layout GridBagLayout dan
         * menggunakan 2 buah component JLabel sebagai tampilannya. JLabel pertama
         * digunakan untuk menampilkan text dan icon yang biasa terdapat pada button
         * standart java, sedangkan JLabel yang kedua digunakan untuk menampung icon
         * expand. Tampilan MDropDownButton ini kurang lebih adalah sebagai berikut :
         * <code>
         *  +-----------------+
         *  | (Icon) (Text) V |
         *  +-----------------+
         * </code>
         */
        protected void initLayout() {
            lblIcon     = new javax.swing.JLabel();
            btnLabel    = new javax.swing.JLabel();
    
            lblIcon.setName("lblIcon");
            btnLabel.setName("btnLabel");
            lblIcon.setIcon(new javax.swing.ImageIcon(getClass().getResource("/id/web/martinusadyh/images/popuparrow.gif"))); // NOI18N
    
            //removeAll();
            setLayout(new java.awt.GridBagLayout());
            java.awt.GridBagConstraints gridBagConstraints;
    
            // Set Position for btnLabel
            gridBagConstraints = new java.awt.GridBagConstraints();
            gridBagConstraints.gridx = 0;
            gridBagConstraints.gridy = 0;
            gridBagConstraints.weightx = 1.0;
            gridBagConstraints.insets = new java.awt.Insets(0, 1, 0, 1);
            add(btnLabel, gridBagConstraints);
    
            // Set Position for lblIcon
            gridBagConstraints = new java.awt.GridBagConstraints();
            gridBagConstraints.gridx = 1;
            gridBagConstraints.gridy = 0;
            gridBagConstraints.fill = java.awt.GridBagConstraints.VERTICAL;
            gridBagConstraints.weighty = 1.0;
            add(lblIcon, gridBagConstraints);
    
            setMargin(new java.awt.Insets(2, 0, 2, 0));
    
            setFocusPainted(false);
            setHorizontalAlignment(CENTER);
            lblIcon.addMouseListener(this);
        }
    
        public void mouseClicked(MouseEvent e) {
            if (popUpMenu != null && this.isEnabled()) {
                Point pt = getLocationOnScreen();
                pt.translate(0, getHeight());
                popUpMenu.setLocation(pt);
                popUpMenu.show(this, 0, getHeight());
                setSelected(true);
    
                // Make this button unselected if popUpMenu close
                popUpMenu.addPopupMenuListener(new PopupMenuListener() {
                    public void popupMenuWillBecomeInvisible(PopupMenuEvent e) {
                        setSelected(false);
                    }
    
                    public void popupMenuCanceled(PopupMenuEvent e){}
                    public void popupMenuWillBecomeVisible(PopupMenuEvent e){}
                });
            }
        }
    
        public void mousePressed(MouseEvent e) { }
        public void mouseReleased(MouseEvent e) { }
        public void mouseEntered(MouseEvent e) { }
        public void mouseExited(MouseEvent e) { }
    }
    }
    



Penjelasan kode diatas adalah sebagai berikut :




  1. 
Agar **MDropDownButton** ini mempunyai efek selected ketika menampilkan menu drop down-nya, maka membuat subclass dari **JToggleButton** merupakan pilihan yang cocok dan ini bisa dilihat pada baris ke 48. Mengapa menggunakan **JToggleButton** ? Karena kalau kita menggunakan **JButton**, ketika user menekan button tersebut maka efek selected-nya hanya tampil sekejap.




  2. 
Pada baris 51-55 kita mempersiapkan beberapa komponen yang kita perlukan untuk tampilan **MDropDownButton** tersebut, salah satunya yaitu **JPopupMenu**.




  3. 
Sedangkan pada baris 57-78 ini berfungsi agar class **MDropDownButton** ini dapat digunakan tanpa melalui IDE, maksud-nya yaitu agar kita dapat langsung menambahkan **MDropDownButton** ini langsung dengan cara sebagai berikut :

    
    
    ....
    JPopupMenu popUpMenu = new JPopupMenu();
    ImageIcon iconKu = new ImageIcon("icon.gif");
    popUpMenu.add(new JMenuItem("Menu Item 1"));
    popupMenu.add(new JMenuItem("Menu Item 2"));
    
    // Kalau ingin Button-nya tidak ada text-nya + no icon
    MDropDownButton dropButton = new MDropDownButton(popupMenu);
    
    // Kalau penggunaan spt ini, sama saja kayak JButton biasa :D
    MDropDownButton dropButton = new MDropDownButton("Print", iconKu);
    
    // Pakai Icon button , text dan Popupmenu
    MDropDownButton dropButton = new MDropDownButton("Print", iconKu,
    	popupMenu);
    





  4. 
 Pada baris 80-112 ini berfungsi agar button ini dapat di set enabled / disabled :D



  5. 
Pada baris 115 ini berfungsi untuk menambahkan **JPopupMenu** yang akan ditampilkan, method ini meg-overide dari **JToggleButton**.



  6. 
Pada baris 131-164 ini adalah method yang berfungsi untuk mengatur penempatan 2 buah **JLabel** saja, selain itu pada method ini juga dipasang event **MouseListener** pada **lblIcon** agar ketika pengguna menekan **lblIcon** tersebut (icon expand-nya) maka popup menu akan ditampilkan :)



  7. 
Sedangkan pada method pada baris 166-184 ini befungsi untuk menampilkan **popupMenu** yang telah ditambahkan dan menampilkan-nya pada posisi tepat dibawah lokasi **MDropDownButton** ditampilkan dilayar.



  8. 
Sedangkan pada baris 186-189 ini tidak digunakan, karena yang dibutuhkan cuman method **mouseClicked** ajah :)




Asyik bukan bisa bikin button sendiri, button mau-mau kita :) Saran dan kritik dari teman-teman saya tunggu juga loh, ayo rame-rame bikin custom component di [Java Swing](http://java.sun.com/docs/books/tutorial/uiswing/TOC.html) sapa tahu nanti dilirik ama [SwingX](http://swinglabs.org/) terus dimasukin ke API-nya cool kan :P (halah ngimpi mode ON)
