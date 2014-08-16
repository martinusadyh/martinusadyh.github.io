---
comments: true
date: 2009-07-03 12:40:05+00:00
layout: post
slug: swing-component-focus-handler-using-keystroke-editor
title: Swing Component Focus Handler Using KeyStroke Editor
wordpress_id: 60
categories:
- Java
- NetBeans
---

Buat teman-teman yang sering membangun aplikasi menggunakan GUI Toolkit Swing pasti sudah tahu bagaimana caranya menambahkan focus handler pada komponen Swing. Sebagai contohnya, kita ingin menambahkan focus pada JTextField agar ketika kita menekan **ENTER** maka focus akan berpindah ke komponen yang lain. Nah biasanya, langkah yang kita lakukan adalah sebagai berikut :
1. Klik kanan pada **JTextField** kemudian memilih **Event > Key > Key Pressed** seperti gambar dibawah ini :
[![AddKeyPressed](http://farm3.static.flickr.com/2599/3684434574_7c77b75d3e.jpg)  
Menambahkan Focus Handler Secara Manual](http://www.flickr.com/photos/10243554@N02/3684434574/)
2. Setelah itu kita tambahkan handler untuk mendeteksi penekanan tombol **ENTER** kemudian secara manual memindahkan focus ke komponen yang lain seperti kode dibawah ini:

    
    
        private void jTextField1KeyPressed(java.awt.event.KeyEvent evt) {
            if (evt.getKeyChar() == KeyEvent.VK_ENTER) {
                /* Pindahkan focus ke jTextField2 */
                jTextField2.requestFocusInWindow();
            }
        }
    


<!-- more -->
Nah sekarang bayangkan bagaimana jika ada beberapa komponen lain yang harus kita tambahkan focusnya dengan cara seperti diatas ?? Tentunya pasti capek, karena kita harus mengetikkan kode yang sama berulang-ulang :) Dengan membuat sebuah custom komponen sendiri dan memanfaatkan fasilitas **KeyStroke Editor** yang terdapat pada NetBeans IDE, sekarang kita bisa menambahkan focus handler dengan mudah seperti gambar dibawah ini :
[![ChooseNextComponent](http://farm3.static.flickr.com/2620/3684434576_27052c9d33.jpg)  
Memilih komponen selanjutnya yang harus menerima focus](http://www.flickr.com/photos/10243554@N02/3684434576/)

[![AddFocusHandler](http://farm3.static.flickr.com/2434/3684434572_85d27b3d96.jpg)  
Menambahkan focus handler menggunakan KeyStroke Editor NetBeans](http://www.flickr.com/photos/10243554@N02/3684434572/)

[![HasilAkhirPropertiesPallete](http://farm3.static.flickr.com/2457/3684434578_259cfa1eb1_o.png)  
Hasil akhir yang terlihat pada Pallete Properties NetBeans](http://www.flickr.com/photos/10243554@N02/3684434578/)

dan kode yang ditambahkan oleh NetBeans adalah seperti berikut :

    
    
            mTextField1.setText("mTextField1");
            mTextField1.setNextComponent(jTextField2);
            mTextField1.setNextComponentHandler(javax.swing.KeyStroke.getKeyStroke(java.awt.event.KeyEvent.VK_ENTER, 0));
    



Hm... lebih mudah bukan ?? Karena kita sudah tidak perlu melakukan proses ketik-mengetik lagi :) Dan sekarang, bagaimana caranya membuat agar custom komponen kita seperti diatas ?? Caranya sangat mudah, yaitu kita tinggal meng-**extends** komponen Swing yang ingin kita gunakan dan tambahkan 2 buah property seperti kode dibawah ini :

    
    
    /**
     *
     * @author martin
     */
    public class MTextField extends javax.swing.JTextField implements Serializable {
    
        ....
        ....
        private KeyStroke nextComponentHandler;
        private Component nextComponent;
    	....
    	....
    



Setelah menambahkan 2 buah property seperti diatas, sekarang tambahkan method getter dan setter untuk menerima inputan dari user dan agar terlihat dari **Pallete Properties** milik NetBeans seperti dibawah ini:

    
    
        public Component getNextComponent() {
            return nextComponent;
        }
    
        public void setNextComponent(Component nextComponent) {
            this.nextComponent = nextComponent;
        }
    
        public KeyStroke getNextComponentHandler() {
            return nextComponentHandler;
        }
    
        public void setNextComponentHandler(KeyStroke nextComponentHandler) {
            this.nextComponentHandler = nextComponentHandler;
        }
    



Sekarang buatlah sebuah **protected class** yang meng-**implements**-kan **KeyListener** dan menangkap aksi **keyPressed** yang terjadi seperti kode dibawah ini:

    
    
        ////////////////////////////////////////////////////////////////////////////
        // NextComponentHandler ini digunakan untuk memindahkan focus sekarang ke
        // komponen selanjutnya berdasarkan KeyStroke yang diberikan oleh client
        // melalui method setNextComponentHandler();
        ///////////////////////////////////////////////////////////////////////////
        protected class NextComponentHandler implements KeyListener {
            public void keyTyped(KeyEvent e) { }
    
            public void keyReleased(KeyEvent e) { }
    
            public void keyPressed(KeyEvent e) {
                if (nextComponentHandler != null && nextComponent != null) {
                    if (e.getKeyCode() == nextComponentHandler.getKeyCode()) {
                        nextComponent.requestFocusInWindow();
                    }
                }
            }
        }
    



Langkah terakhir yang harus kita lakukan yaitu menambahkan class **NextComponentHandler** ini pada custom komponen kita dengan cara menambahkannya pada **constructor** komponen kita seperti kode dibawah ini:

    
    
    	......
    	......
        public MTextField(Document doc, String text, int columns) {
            super(doc, text, columns);
            addActionHandler();
        }
    
    	......
    	......
    
        private void addActionHandler() {
            addKeyListener(new NextComponentHandler());
        }
    



Setelah selesai, sekarang coba lakukan proses **build** agar kita mendapatkan file ***.jar** dari custom komponen kita kemudian tambahkanlah ke **NetBeans Pallete** dan coba gunakan. Asyik bukan ?? :)

**Related Link**:
- [Source Lengkap MTextField](http://code.google.com/p/martinswingutil/source/browse/trunk/MartinSwingUtil/src/component/id/web/martinusadyh/text/MTextField.java)
- [Sample NetBeans Project Focus](http://martinswingutil.googlecode.com/files/SampleProjectFocus.zip)
- [Membuat dan Menambahkan Swing Custom Component Ke NetBeans Pallete](http://martinusadyh.web.id/2009/05/25/membuat-dan-menambahkan-swing-custom-component-ke-netbeans-pallete/)
