---
comments: true
date: 2011-07-10 10:20:31+00:00
layout: post
slug: jcombobox-with-database
title: JComboBox with DataBase
wordpress_id: 1451
categories:
- Java
- NetBeans
tags:
- DataBase
- Java
- java swing
- JComboBox
- MySQL
- NetBeans
- project
---

{% img left https://lh4.googleusercontent.com/-6tfMKUeM7-g/VCoT5SqQkAI/AAAAAAAACyA/ql_iDIIGfWA/s800/netbeans-stamp-69-70.png %} Minggu kemarin di milis [netbeans-indonesia@yahoogroups.com](mailto:netbeans-indonesia@yahoogroups.com) ada pertanyaan tentang bagaimana mengisi JComboBox dari DataBase yang kutipan pertanyaan-nya kurang lebih seperti berikut :


> 
> From: baj***@yahoo.com Fakhrurozi M Nur 
> To: netbeans-indonesia@yahoogroups.com netbeans-indonesia@yahoogroups.com 
> Date: Tue, 5 Jul 2011 00:18:56 +0700 
> Subject: [netbeans-indonesia] [TANYA] meload kode pada JComboBox tanpa harus me restart aplikasi 
>  
> mas-mas saya mau tanya,,,
> mas untuk meload noInduk_Siswa di JComboBox dari database trus Di JTextField muncul otomatis nama_Siswa gimana ya? tanpa harus me restart aplikasi,
> disini bisa meload noInduk_Siswa dari database dengan JComboBox tapi untuk JTextField tidak mau muncul Di bawah ini source code :
> 
>     
>     private void comboIndukPendaftaranPopupMenuWillBecomeVisible(javax.swing.event.PopupMenuEvent evt) {
>     	// TODO add your handling code here:
>     	comboIndukPendaftaran.removeAllItems();
>     	Statement statement = null;
>     	ResultSet result = null;
>     	try {
>     		statement = DataBaseSkripsi.getConnection().createStatement();
>     		result = statement.executeQuery("SELECT NO_INDUKPENDAFTARAN FROM PENDAFTARAN");
>     		while(result.next()) {
>     			String kode = result.getString("NO_INDUKPENDAFTARAN");
>     			comboIndukPendaftaran.addItem(kode);
>     			txtNama.setText(result.getString("NAMA"));
>     		}
>     	} catch (SQLException e) {
>     	}finally{
>     		if(result!=null) {
>     			try {
>     				result.close();
>     			} catch (SQLException ex) {
>     			}
>     		}
>     	} 
>     	
>     	if(statement!=null) {
>     		try {
>     			statement.close();
>     		} catch (SQLException ex) {
>     		}
>     	}
>     }
> 


Sebenarnya caranya sangat mudah sekali dan gampang, dan tulisan kali ini saya khususkan untuk menjawab pertanyaan Fakhrurozi M Nur sekalian sebagai arsip jika dikemudian hari ada pertanyaan yang serupa :) Ok masih tertarik mengikuti tutorial-nya ? Jika iya, mari kita persiapkan dulu alat-alat yang diperlukan :)

<!-- more -->

Untuk tutorial kali ini, kita akan menggunakan mode koneksi JDBC biasa tanpa framework tambahan dan database-nya akan menggunakan MySQL. Sebelum mulai lebih lanjut, persiapkan dahulu database yang akan digunakan. Pada tulisan kali ini, kita akan menggunakan database yang terdapat pada tulisan [Paging On JTable](http://martinusadyh.web.id/2011/01/31/paging-on-jtable/). Persiapkan dulu database-nya seperti pada tutorial tersebut, kemudian setelah selesai sekarang buatlah 1 buah project untuk latihan dengan nama project **JComboBoxDB** dan buatlah juga 2 buah package yaitu `jcomboboxdb.domain` dan `jcomboboxdb.service` seperti gambar dibawah ini :

{% imgcap https://lh3.googleusercontent.com/-rAYxCrIYix8/VCoTY1rdpVI/AAAAAAAACxw/HQ61DH29Ovk/s800/StrukturPackage.png Struktur Package %}

Setelah selesai, tambahkan dulu library **MySQL JDBC Driver** dengan cara klik kanan pada node **Libraries** kemudian pilih **Add Library > MySQL JDBC Driver** dan harusnya tampilan pada struktur project kita kali ini akan tampak menjadi seperti gambar dibawah ini :

{% imgcap https://lh3.googleusercontent.com/-VAtD10xJXNo/VCoTY5T1gNI/AAAAAAAACxs/YeXv8yT-0EA/s800/StrukturProject.png Tampilan struktur project setelah penambahan library MySQL JDBC Driver %}

Sekarang tambahkanlah sebuah **domain class** pada package `jcomboboxdb.domain` dengan cara klik kanan package `jcomboboxdb.domain` kemudian pilih **New Java Class** dan beri nama class `WPComment` yang isinya kurang lebih seperti dibawah ini :

``` java
public class WPComment {
    
    private Integer commentID;
    private String commentAuthor;
    private Date commentDate;
    private String commentContent;
        
    // gunakan alt+insert dan pilih Getter and Setter untuk membuat getter dan 
    // setter untuk semua variable diatas
    
    /* Tambahkan ini supaya ID tampil pada JComboBox 
     * Catatan : Gunakan alt+insert kemudian pilih <b>toString()</b> untuk 
     * membuat method dibawah ini.
     */
    @Override
    public String toString() {
        return commentID.toString();
    }
}
```

Setelah selesai membuat sebuah domain class, sekarang pada package `jcomboboxdb.service` buatlah 1 buah `interface` dengan nama `DBService` dan implementasinya dengan nama `DBServiceImpl` yang terlihat seperti gambar dibawah ini :

{% imgcap https://lh5.googleusercontent.com/-WmuEL_-8clQ/VCoTXW01SuI/AAAAAAAACxc/00tN6zEQSvE/s800/IsiPackageService.png Isi package service ini hanya 1 buah interface yaitu DBService dan 1 buah java class biasa yaitu DBServiceImpl %}

Dan isi dari `interface DBService` adalah kurang lebih seperti berikut :

``` java    
public interface DBService {
    
    public List<wpcomment> findAllComment();
    
}
```
Sedangkan isi dari `DBServiceImpl` adalah kurang lebih seperti berikut ini :

``` java
public class DBServiceImpl implements DBService {
    
    private final String FIND_ALL_QRY = "select * from wp_comments";
    
    private PreparedStatement preparedFindAll;

    private Connection connection;

    public DBServiceImpl(Connection connection) throws SQLException {
        this.connection = connection;
        preparedFindAll = connection.prepareStatement(FIND_ALL_QRY);
    }
    
    @Override
    public List<wpcomment> findAllComment() {
        try {
            List<wpcomment> listWP = new ArrayList<wpcomment>();
            ResultSet rs = preparedFindAll.executeQuery();
            while (rs.next()) {
                WPComment comment = new WPComment();
                comment.setCommentID(rs.getInt("comment_ID"));
                comment.setCommentAuthor(rs.getString("comment_author"));
                comment.setCommentDate(rs.getDate("comment_date"));
                comment.setCommentContent(rs.getString("comment_content"));
                listWP.add(comment);
            }
            return listWP;
        } catch (SQLException ex) {
            Logger.getLogger(DBServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }    
}
```

Jika sudah, sekarang waktunya untuk melakukan inisialisasi database dan service. Untuk melakukan ini, sekarang editlah file `Main.java` yang terdapat pada package `jcomboboxdb` menjadi seperti ini :

``` java
public class Main {
    
    private static DBService dBService;

    public static DBService getdBService() {
        return dBService;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) throws SQLException {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setUser("root");
        dataSource.setPassword("admin");
        dataSource.setDatabaseName("table_paging");
        dataSource.setServerName("localhost");
        dataSource.setPortNumber(3306);
        
        dBService = new DBServiceImpl(dataSource.getConnection());
    }
}
```

Sampai disini proses inisialisasi database sudah berhasil dilakukan, dan sekarang kita tinggal memanggil-nya dari sisi UI. Untuk melakukan hal tersebut, sekarang buatlah sebuah **Form** dari `JFrame` dengan nama `MainForm` yang berisi `JComboBox, JLabel, JTextField` dan `JButton` kemudian design-lah menjadi  seperti gambar dibawah ini :

{% imgcap https://lh3.googleusercontent.com/-ZZUq9iVUVRo/VCoTXROfGCI/AAAAAAAACxY/1akshJ9e79U/s400/DesignJFrame.png Design JFrame %}

Untuk mengambil data dari database dan memasukkan-nya ke dalam `JComboBox` kita harus masuk ke dalam mode **Source** dan buatlah sebuah private class dengan nama `ComboBoxListener` dahulu untuk mendeteksi proses seleksi yang terjadi pada `JComboBox` seperti dibawah ini :

``` java    
...
...
private class ComboBoxListener implements ActionListener {

    @Override
    public void actionPerformed(ActionEvent e) {
        WPComment wPComment = (WPComment) cmbID.getSelectedItem();
        txtAuthor.setText(wPComment.getCommentAuthor());
    }
    
}

// Variables declaration - do not modify                     
private javax.swing.JButton btnClose;
private javax.swing.JComboBox cmbID;
...
...
```

Setelah selesai membuat sebuah private class yang berfungsi untuk melakukan pendeteksian pada `JComboBox`, sekarang modifikasi-lah `constructor MainForm` tambahkan 1 method yaitu `loadDB()` seperti potongan kode dibawah ini :

``` java
public class MainForm extends javax.swing.JFrame {

    /** Creates new form MainForm */
    public MainForm() {
        initComponents();
        loadDB();
        cmbID.addActionListener(new ComboBoxListener());
        setLocationRelativeTo(null);
    }
    
    private void loadDB() {
        // clear JComboBox
        cmbID.removeAllItems();
        
        List<wpcomment> listWP = Main.getdBService().findAllComment();
        for (WPComment wp : listWP) {
            cmbID.addItem(wp);
        }
    }
    ...
    ...
```

Dan langkah terakhir yang harus kita lakukan yaitu, editlah file `Main.java` agar memanggil `MainForm`  dan sekalian kita konfigurasikan agar menggunakan `SystemLookAndFeel` seperti dibawah ini :

``` java
public static void main(String args[]) throws SQLException {
    ...
    ...
    ...

    java.awt.EventQueue.invokeLater(new Runnable() {

        public void run() {
            try {
                UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
            } catch (ClassNotFoundException ex) {
            } catch (InstantiationException ex) {
            } catch (IllegalAccessException ex) {
            } catch (UnsupportedLookAndFeelException ex) {
            }
            new MainForm().setVisible(true);
        }
    });
}
...
```

Dan sekarang, mari kita coba jalankan. Jika tidak ada masalah, harusnya kita akan melihat tampilan seperti gambar dibawah ini :

{% imgcap https://lh5.googleusercontent.com/-797GVqqVQtk/VCoTXZH9ItI/AAAAAAAACxg/Gxnx4AK-PB4/s400/HasilAkhir.png %}

**Hasil akhir, disini kita bisa melihat bahwa `JComboBox` sudah terisi data yang berasal dari database :)**

Apakah hasilnya benar ? Ok mari kita cek di database dengan menjalankan perintah `select comment_ID,comment_author from wp_comments limit 10;` seperti dibawah ini :

```
mysql> select comment_ID,comment_author from wp_comments limit 10;
+------------+----------------+
| comment_ID | comment_author |
+------------+----------------+
|          2 | dewa eheem     |
|          3 | Martinus Ady H |
|          4 | oim            |
|          5 | oim            |
|          6 | Zarathustra    |
|          7 | Martinus Ady H |
|          8 | chris          |
|          9 | Martinus Ady H |
|         10 | arry           |
|         11 | wahyu          |
+------------+----------------+
10 rows in set (0.00 sec)

mysql> 
```


Mudah bukan ? :) Jika masih bingung atau ada pertanyaan, silahkan ditanyakan di kolom komentar ya :)

**Referensi-referensi terkait :**




  1. [Macam-macam GUI Toolkit pada Java](http://martinusadyh.web.id/2010/04/23/macam-macam-gui-tookit-pada-java/)


  2. [Swing Component Focus Handler Using KeyStroke Editor](http://martinusadyh.web.id/2009/07/03/swing-component-focus-handler-using-keystroke-editor/)


  3. [Mengenal Method setHonorVisibility dan replace pada GroupLayout](http://martinusadyh.web.id/2009/10/05/mengenal-method-sethonorvisibility-dan-replace-pada-grouplayout/)


  4. [Cara checkout contoh aplikasi martin-personal-project](http://martinusadyh.web.id/2010/03/11/cara-checkout-contoh-aplikasi-martin-personal-project/)


  5. [DropDownButton di Java Swing](http://martinusadyh.web.id/2008/09/09/dropdownbutton-di-java-swing/)


  6. [Playing with Calendar Class](http://martinusadyh.web.id/2007/10/06/playing-with-calendar-class/)


  7. [Playing with JTable and JCheckBox](http://martinusadyh.web.id/2009/09/04/playing-with-jtable-and-jcheckbox/)


  8. [Membuat dan menambahkan Swing Custom Component ke NetBeans Pallete](http://martinusadyh.web.id/2009/05/25/membuat-dan-menambahkan-swing-custom-component-ke-netbeans-pallete/)


  9. [Membuat menu login dengan animasi progress bar](http://martinusadyh.web.id/2009/11/09/membuat-menu-login-di-java-swing-dengan-animasi-progress-bar/)



