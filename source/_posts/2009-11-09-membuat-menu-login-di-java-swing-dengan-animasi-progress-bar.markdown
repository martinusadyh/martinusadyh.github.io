---
comments: true
date: 2009-11-09 12:02:04+00:00
layout: post
slug: membuat-menu-login-di-java-swing-dengan-animasi-progress-bar
title: Membuat Menu Login Di Java Swing dengan Animasi Progress Bar
wordpress_id: 82
categories:
- Java
- NetBeans
tags:
- login java
- membuat login dengan java
---

Setelah kita mengerti tentang **Thread-thread** dasar yang terdapat pada Java Swing dan mengetahui bagaimana cara menggunakan **Background Thread** dengan **SwingWorker** (pembahasan tentang SwingWorker bisa dilihat pada tulisan [Lebih Dekat Dengan Class SwingWorker](http://martinusadyh.web.id/2009/11/07/lebih-dekat-dengan-class-swingworker/)), sekarang mari kita coba membuat sebuah **Project** yang menggunakan Menu Login yang proses otentikasinya kita lakukan langsung ke database :)

Sebelum memulai latihan kali ini, ada beberapa hal yang harus dipersiapkan terlebih dahulu yaitu :

  * Inisialisasi Master Data Pada DataBase
  * Pembuatan Project Menu Login
  * Hasil Akhir

Pada tulisan kali ini saya tidak akan memberikan penjelasan source code dari baris ke baris seperti pada tulisan-tulisan sebelumnya, tetapi sebagai gantinya penjelasan dapat dilihat pada komentar yang terdapat pada source code yang bersangkutan supaya lebih mudah di ingat-ingat nantinya :)
<!-- more -->

### Inisialisasi Master Data Pada DataBase

Sebelum mulai membuat sebuah **Project** buatlah dahulu database dan tabel yang akan kita akses dari aplikasi Java, untuk membuat sebuah database dan tabel yang akan kita gunakan secara otomatis simpanlah **schema** database dibawah ini dengan nama **MenuLoginSchema.sql** :

``` sql
-- DataBase Schema Untuk Contoh MenuLogin

CREATE DATABASE `menulogin`;

USE `menulogin`;

--
-- Table structure for table `T_USER`
--
DROP TABLE IF EXISTS `T_USER`;
CREATE TABLE `T_USER` (
  `id` int auto_increment not null,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `T_USER`
--
INSERT INTO `T_USER` (`username`,`password`) VALUES 
('martin', 'menulogin'), ('ahmad','ganteng'),('slackware','linux');
```
**Note: DataBase yang digunakan pada tulisan ini yaitu MySQL**

Setelah file **MenuLoginSchema.sql** tersimpan pada komputer, sekarang bukalah terminal atau command prompt kemudian masuklah kedalam direktori tempat dimana kita menyimpan file **MenuLoginSchema.sql** tersebut kemudian jalankanlah perintah seperti dibawah ini :

    
    
    martinus@martinusadyh:~/Downloads$ mysql -u root -padmin < MenuLoginSchema.sql
    



Jika tidak ada pesan error, maka seharusnya kita akan mempunyai 1 database dengan nama **menulogin** dan 1  tabel dengan nama **T_USER** beserta isinya seperti dibawah ini :

    
    
    mysql> show tables;
    +---------------------+
    | Tables_in_menulogin |
    +---------------------+
    | T_USER              | 
    +---------------------+
    1 row in set (0.00 sec)
    
    mysql> select * from T_USER;
    +----+-----------+-----------+
    | id | username  | password  |
    +----+-----------+-----------+
    |  1 | martin    | menulogin | 
    |  2 | ahmad     | ganteng   | 
    |  3 | slackware | linux     | 
    +----+-----------+-----------+
    3 rows in set (0.00 sec)
    
    mysql> 

Jika tampilan pada terminal atau command prompt kita sudah seperti diatas, maka proses Inisialisasi bisa dikatan sudah selesai dan kita siap untuk membuat sebuah **Project** :)

### Pembuatan Project Menu Login

Sekarang buatlah sebuah **Project** dengan nama **MenuLogin** dari NetBeans IDE, kemudian buatlah **Domain** classnya terlebih dahulu pada packages **domain** dengan nama **UserApp** yang isinya adalah sebagai berikut :

``` java
public class UserApp {
    private Integer id;
    private String userName;
    private String password;

    // Generate Getter n Setter
}
```

**Note: Klik [UserApp.java](http://code.google.com/p/martin-personal-project/source/browse/trunk/java/MenuLogin/src/id/web/martinusadyh/menulogin/domain/UserApp.java) untuk melihat source code lengkap**

Urusan dengan **Domain Class** sudah selesai, sekarang mari kita buatkan **Service** layer-nya dengan membuat sebuah packages **service** kemudian buatlah sebuah **java interface** dengan nama **LoginService** seperti dibawah ini :

``` java
public interface LoginService {
    /** Method ini akan mengecek apakah <code>username</code> dengan <code>password</code>
     * ada atau tidak di database
     * @param username user yang ingin di cek di database
     * @param password password untuk user
     * @return UserApp null jika tidak ditemukan
     */
    public UserApp login(String username, String password);
}
```
**Note: Klik [LoginService.java](http://code.google.com/p/martin-personal-project/source/browse/trunk/java/MenuLogin/src/id/web/martinusadyh/menulogin/service/LoginService.java) untuk melihat source code lengkap**

Sebelum membuat implementasi dari **LoginService** diatas, tambahkanlah dahulu library **MySQL JDBC Driver** kedalam **Project** hingga tampilan **Node Libraries** kita menjadi seperti gambar dibawah ini :

{% img center /images/blog-images/Java_NetBeans/MembuatMenuLoginDiJavaSwingdenganAnimasiProgressBar/AddJDBCDriver.png Adding JDBC Driver %}

Tetap pada packages **service** sekarang buatlah implementasi dari **LoginService** diatas dengan nama **LoginServiceImpl** yang isinya kurang lebih seperti dibawah ini :

``` java
public class LoginServiceImpl implements LoginService {

    private Connection connection;
    private PreparedStatement findUserByUserAndPassword;
    private final String QRY_LOGIN = "select * from T_USER where" +
            " T_USER.username = ? and T_USER.password = ?";

    public LoginServiceImpl(Connection connection) {
        try {
            this.connection = connection;
            findUserByUserAndPassword = this.connection.prepareStatement(QRY_LOGIN);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public UserApp login(String username, String password) {
        try {
            /* Lakukan pencarian berdasarkan username dan password */
            findUserByUserAndPassword.setString(1, username);
            findUserByUserAndPassword.setString(2, password);

            /* Ambil resultset-nya */
            ResultSet rs = findUserByUserAndPassword.executeQuery();
            while (rs.next()) {
                UserApp userApp = new UserApp();
                userApp.setId(rs.getInt("id"));
                userApp.setUserName(rs.getString("username"));
                userApp.setPassword(rs.getString("password"));
                
                return userApp;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
}
```

**Note: Klik [LoginServiceImpl.java](http://code.google.com/p/martin-personal-project/source/browse/trunk/java/MenuLogin/src/id/web/martinusadyh/menulogin/service/LoginServiceImpl.java) untuk melihat source code lengkap**

Hmm.. urusan **domain** dan **service** layer sudah beres, sekarang waktu yang paling menyenangkan yaitu membuat **UI** layer-nya :) Ok, sekarang mari kita buat sebuah **Login Dialog** dengan menggunakan class JDialog dan simpanlah pada packages **ui**. Setelah itu, design-lah **Login Dialog** tersebut hingga seperti gambar dibawah ini :

{% img center /images/blog-images/Java_NetBeans/MembuatMenuLoginDiJavaSwingdenganAnimasiProgressBar/DesignLoginDialog.png Design Login Dialog %}

Sekarang tambahkan sebuah label untuk pesan error dengan cara masuk ke menu **Inspector** dan pada node **Other Components** tambahkanlah sebuah `JLabel` seperti gambar dibawah ini:

{% img center /images/blog-images/Java_NetBeans/MembuatMenuLoginDiJavaSwingdenganAnimasiProgressBar/AddErrorLabel.png Menambahkan Error Label %}

Setelah selesai men-design **Login Dialog**, sekarang masuklah ke mode **Source** dan tambahkan 1 buah variabel bertipe boolean dan 1 buah method yaitu **showDialog()** tidak lupa hilangkan juga method **main**. Dan hasil akhir yang kita dapatkan kurang lebih isinya seperti dibawah ini :

``` java
public class LoginDialog extends javax.swing.JDialog {

    private boolean notLogin = true;
    private GroupLayout gl;
    
    /** Creates new form LoginDialog */
    public LoginDialog(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        
        /* Mendeteksi penekanan icon close, jika di close keluar dari aplikasi */
        addWindowListener(new java.awt.event.WindowAdapter() {

            @Override
            public void windowClosing(java.awt.event.WindowEvent e) {
                System.exit(0);
            }
        });
                
        jProgressBar1.setVisible(false);

        /* Membuat space progress bar tidak di *wrap* oleh button */
        gl = (GroupLayout) getContentPane().getLayout();
        gl.setHonorsVisibility(jProgressBar1, false);

        /* Beri fokus ke txtUsername ketika dialog tampil */
        txtUserName.requestFocusInWindow();

        /* Posisikan dialog seakan-akan berada di tengah-2x layar */
        setLocationRelativeTo(null);
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">                          
    private void initComponents() { 
         ....
    }
    // </editor-fold>                        
    
    public boolean showDialog() {
        setVisible(true);
        return notLogin;
    }

    // Variables declaration - do not modify  
    ...                   
    // End of variables declaration                   
}
```

Tetap pada packages yang sama yaitu packages **ui** sekarang buatlah sebuah **Menu Utama** dengan menggunakan class JFrame dan simpanlah dengan nama **MainForm**. Sedangkan pada **MainForm** ini, tambahkanlah sebuah JMenuBar dan tambahkanlah 3 JMenuItem pada **File** atau **jMenu1** hingga tampilannya seperti gambar dibawah ini :

{% img center /images/blog-images/Java_NetBeans/MembuatMenuLoginDiJavaSwingdenganAnimasiProgressBar/DesignMainForm.png Design Main Form Dengan Menu Login dan Logout %}

Setelah semua selesai, sekarang editlah file **Main.java** menjadi seperti dibawah ini :

``` java
public class Main {

    private static MainForm mainForm;
    private static LoginService loginService;

    public static MainForm getMainForm() {
        return mainForm;
    }

    public static LoginService getLoginService() {
        return loginService;
    }

    /** Method ini akan menginisialisassi Form Utama kemudian akan melakukan
     * proses <code>loop</code> untuk menampilkan login dialog sampai nilai
     * notLogin = FALSE baru menampilkan Menu Utama */
    public static void initLogin() {
        if (mainForm == null) mainForm = new MainForm();
        boolean notLogin = Boolean.TRUE;
        while (notLogin) {
            notLogin = new LoginDialog().showDialog();
        }
        mainForm = new MainForm();
        mainForm.setVisible(true);
    }
    
    /** Method ini akan menginisialisasi object koneksi ke database yang akan 
     * digunakan di seluruh aplikasi. */
    private static void initDataBaseConnection() {
        try {
            MysqlDataSource dataSource = new MysqlDataSource();
            /* Setting koneksi ke database */
            dataSource.setUser("root");
            dataSource.setPassword("admin");
            dataSource.setDatabaseName("menulogin");
            dataSource.setServerName("localhost");
            dataSource.setPortNumber(3306);
            
            loginService = new LoginServiceImpl(dataSource.getConnection());
        } catch (SQLException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        initDataBaseConnection();
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                } catch (InstantiationException ex) {
                    Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IllegalAccessException ex) {
                    Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                } catch (UnsupportedLookAndFeelException ex) {
                    Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
                }
                initLogin();
            }
        });
    }
}
```

Dengan kode yang sudah kita tulis, aplikasi harusnya  sudah bisa berjalan tanpa mengalami kesalahan sama sekali. Tapi sayangnya kita belum mengimplementasikan proses login yang sebenarnya, untuk mengimplementasikan proses login yang sebenarnya sekarang tambahkanlah sebuah private class dengan nama **WorkerLogin** pada **LoginDialog** yang isinya kurang lebih seperti dibawah ini :

``` java
private class WorkerLogin extends SwingWorker<UserApp, Void> {

    @Override
    protected void done() {
        try {
            if (get() != null) {
                notLogin = false;
                closeLoginDialog();
            } else {
                gl.replace(jProgressBar1, lblError);
                txtUserName.requestFocusInWindow();
                txtUserName.selectAll();
            }
            btnLogin.setEnabled(true);
            jProgressBar1.setIndeterminate(false);
            jProgressBar1.setVisible(false);
        } catch (InterruptedException ex) {
            Logger.getLogger(LoginDialog.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ExecutionException ex) {
            Logger.getLogger(LoginDialog.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected UserApp doInBackground() throws Exception {
        /* Hilangkan ini jika digunakan pada production */
        Thread.sleep(1000);
        return Main.getLoginService().login(txtUserName.getText(),
                String.valueOf(txtPassword.getPassword()));
    }
}
```

Dan tambahkan method **closeLoginDialog()** dibawah method **showDialog()** seperti dibawah ini :

``` java
private void closeLoginDialog() {
    this.dispose();
}
```

Setelah selesai membuat sebuah **WorkerLogin** sekarang deklarasikanlah class **WorkerLogin** agar menjadi class variabel dan modifikasilah konstruktor dari **LoginDialog** hingga menjadi seperti dibawah ini :

``` java
...
private WorkerLogin workerLogin;

/** Creates new form LoginDialog */
public LoginDialog() {
    super(Main.getMainForm(), Boolean.TRUE);
    initComponents();
    ...
}
```

Agar proses login berjalan ketika kita menekan tombol **Login**, sekarang berilah **Action Listener** pada tombol **Login** dengan cara klik kanan kemudian pilihlah menu **Event > Action > actionPerformed[btnLoginActionPerformed]** dan pastekan kode seperti dibawah ini :

``` java
private void btnLoginActionPerformed(java.awt.event.ActionEvent evt) {                                         
    /* Cek dahulu apakah workerLogin masih berjalan, kalau masih jalan
     * cancel dan set ke null */
    if (workerLogin != null && !workerLogin.isDone()) {
        workerLogin.cancel(true);
        workerLogin = null;
    }

    //TODO: cek untuk mengembalikan state lblError ke Progress Bar, 
    // bagaimana cara mengecek apakah lblError sudah ditambahkan atau belum ?
    try {
        gl.replace(lblError, jProgressBar1);
    } catch (java.lang.IllegalArgumentException ae) {
        // Do nothing here
    }

    workerLogin = new WorkerLogin();
    workerLogin.execute();

    /* Disable tombol LOGIN, tampilkan dan jalankan PROGRESS BAR */
    btnLogin.setEnabled(false);
    jProgressBar1.setVisible(true);
    jProgressBar1.setIndeterminate(true);
}
```
Sedangkan untuk tombol **Cancel**-nya, berikan **Action Listener** seperti kode dibawah ini :

``` java
private void btnCancelActionPerformed(java.awt.event.ActionEvent evt) {                                          
    System.exit(0);
}
```

Konfigurasi pada **Login Dialog** sepenuhnya sudah selesai, sekarang mari kita modifikasi file **MainForm** agar ketika menu **Logout** ditekan, maka akan menampilkan **Login Dialog**. Sekarang berilah **Action Event** pada menu **Logout** dengan cara klik kanan pada menu Logout kemudian pilihlah menu **Event > Action > actionPerformed[jMenuItem2ActionPerformed]** dan pastekan kode seperti dibawah ini :

``` java
private void jMenuItem2ActionPerformed(java.awt.event.ActionEvent evt) {                                           
    /* Tutup form utama */
    this.dispose();

    /* Tampilkan LoginDialog-nya */
    Main.initLogin();
}
```

Sampai disini semua proses pembuatan **Project Menu Login** telah selesai, dan tampilan struktur **Project** kita kurang lebih seperti gambar dibawah ini :

{% img center /images/blog-images/Java_NetBeans/MembuatMenuLoginDiJavaSwingdenganAnimasiProgressBar/StrukturProjectMenuLogin.png Struktur Project Menu Login %}

### Hasil Akhir

Jika sudah selesai, sekarang mari kita jalankan **Project Menu Login** tersebut dengan menekan tombol **F6** dan jika tidak ada kesalahan maka kita akan mendapatkan tampilan dari **Login Dialog** seperti gambar-gambar dibawah ini :

{% img center /images/blog-images/Java_NetBeans/MembuatMenuLoginDiJavaSwingdenganAnimasiProgressBar/LoginDialog.png Tampilan Awal Login Dialog %}

{% img center /images/blog-images/Java_NetBeans/MembuatMenuLoginDiJavaSwingdenganAnimasiProgressBar/ProsesLogin.png Proses Pengecekan Username dan Password ke DataBase %}

{% img center /images/blog-images/Java_NetBeans/MembuatMenuLoginDiJavaSwingdenganAnimasiProgressBar/LoginSalah.png Tampilan Ketika Proses Login Gagal %}

{% img center /images/blog-images/Java_NetBeans/MembuatMenuLoginDiJavaSwingdenganAnimasiProgressBar/LoginSukses.png Menu Utama DiTampilkan Ketika Login Sukses %}

Akhirnya selesai juga latihannya, bagaimana menurut teman-teman ?? Kalau ada yang bingung dengan penjelasan diatas, jangan sungkan-sungkan untuk tanya yah. Mari kita bahas bareng-bareng, sapa tau ada cara yang lebih baik dan elegan dari cara yang saya jelaskan disini :) :D

Akhir kata, happy coding all :)

**Link-link terkait:**

  * [Lebih Dekat Dengan Class SwingWorker](http://martinusadyh.web.id/2009/11/07/lebih-dekat-dengan-class-swingworker/)
  * [Download MenuLogin.zip](http://martin-personal-project.googlecode.com/files/MenuLogin.zip)
  * [Source Code Lengkap Project Menu Login](http://code.google.com/p/martin-personal-project/source/browse/#svn/trunk/java/MenuLogin)
  * [Milis NetBeans Indonesia](mailto:netbeans-indonesia@yahoogroups.com)
  * [SubVersion Mudah Dengan RabbitVCS](http://martinusadyh.web.id/2010/03/13/subversion-mudah-dengan-rabbitvcs/)