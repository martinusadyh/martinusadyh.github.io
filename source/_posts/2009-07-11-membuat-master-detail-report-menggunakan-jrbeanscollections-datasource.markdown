---
comments: true
date: 2009-07-11 22:35:37+00:00
layout: post
slug: membuat-master-detail-report-menggunakan-jrbeanscollections-datasource
title: Membuat Master Detail Report Menggunakan JRBeansCollections DataSource
wordpress_id: 61
categories:
- Java
- NetBeans
---

Banyak sekali pertanyaan dari teman-teman tentang bagaimana cara membuat report dengan menggunakan JRBeansCollection sebagai datasource-nya, sebenarnya konsepnya tidak jauh berbeda dari pembuatan report dengan menggunakan JDBC sebagai datasourcenya. Pada latihan kali ini, sekarang mari kita coba bagaimana sih membuat report menggunakan JRBeansCollection sebagai datasourcenya :) Untuk teman-teman yang belum tahu bagaimana membuat report dengan menggunakan JDBC DataSource, silahkan baca dahulu tulisan tentang [Membuat Master Detail Report dengan iReport](http://martinusadyh.web.id/2007/12/24/membuat-masterdetail-report-dengan-ireport/), dan buat teman-teman yang sudah tidak sabar bagaimana membuat Report dengan menggunakan JRBeansCollections mari langsung kita mulai saja.

Sebelum memulai latihan kali ini, persiapkanlah dahulu perlengkapan yang akan digunakan yaitu :
1. [iReport 3.0.0](http://sourceforge.net/projects/ireport/files/)
2. [NetBeans IDE 6.7](http://www.netbeans.org/downloads/index.html)
3. [MySQL 5.0.67](http://dev.mysql.com/downloads/)
4. [JDK 1.6.0_13](http://java.sun.com/javase/downloads/?intcmp=1281)

Setelah semua perlengkan selesai, pada tulisan kali ini akan dibagi menjadi beberapa bagian yaitu :
1. Download Sample Project RptMasterDetail.zip dan RptMasterDetail.sql
2. Modifikasi Report RptMaster.jrxml dan RptDetail.jrxml
3. Menggunakan JRBeansCollections Sebagai DataSource






  1. ** Download Sample Project RptMasterDetail.zip dan RptMasterDetail.sql**
Sebagai langkah awal, mari kita download dahulu aplikasi RptMasterDetail.zip dan Database schema RptMasterDetail.sql dari tutorial [Membuat Master Detail Report dengan iReport](http://martinusadyh.web.id/2007/12/24/membuat-masterdetail-report-dengan-ireport/) dengan cara sebagai berikut :

    
    
    [martin@opensolarisbox:~/jrbeans]$ wget -c http://martinusadyh.web.id/download/RptMasterDetail.zip
    --00:49:53--  http://martinusadyh.web.id/download/RptMasterDetail.zip
               => `RptMasterDetail.zip'
    Resolving martinusadyh.web.id... 208.87.243.66
    Connecting to martinusadyh.web.id|208.87.243.66|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 31,118 (30K) [application/zip]
    
    100%[========================================================================================================================================>] 31,118        21.80K/s
    
    00:49:55 (21.75 KB/s) - `RptMasterDetail.zip' saved [31118/31118]
    
    [martin@opensolarisbox:~/jrbeans]$ wget -c http://martinusadyh.web.id/download/RptMasterDetail.sql
    --00:50:03--  http://martinusadyh.web.id/download/RptMasterDetail.sql
               => `RptMasterDetail.sql'
    Resolving martinusadyh.web.id... 208.87.243.66
    Connecting to martinusadyh.web.id|208.87.243.66|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 1,824 (1.8K) [text/x-sql]
    
    100%[========================================================================================================================================>] 1,824          6.93K/s
    
    00:50:03 (6.92 KB/s) - `RptMasterDetail.sql' saved [1824/1824]
    
    [martin@opensolarisbox:~/jrbeans]$
    



Setelah proses download selesai, sekarang restore database schema RptMasterDetail.sql kedalam MySQL dengan cara sebagai berikut :

    
    
    [martin@opensolarisbox:~/jrbeans]$ mysql -u root -p < RptMasterDetail.sql
    Enter password:
    [martin@opensolarisbox:~/jrbeans]$
    



Proses konfigurasi database telah selesai, sekarang kita coba melakukan modifikasi report yang menggunakan JDBC DataSource agar menggunakan JRBeansCollections sebagai datasourcenya :)





  2. ** Modifikasi Report RptMaster.jrxml dan RptDetail.jrxml**
Ekstrak-lah file **RptMasterDetail.zip** dengan perintah **unzip namafile.zip** seperti dibawah ini :

    
    
    [martin@opensolarisbox:~/jrbeans]$ unzip RptMasterDetail.zip
    Archive:  RptMasterDetail.zip
      inflating: RptMasterDetail/src/rptmasterdetail/FormReport.java
      inflating: RptMasterDetail/src/rptmasterdetail/FormReport.form
      inflating: RptMasterDetail/src/rptmasterdetail/Main.java
      inflating: RptMasterDetail/nbproject/private/private.xml
      inflating: RptMasterDetail/nbproject/private/private.properties
      inflating: RptMasterDetail/nbproject/project.properties
      inflating: RptMasterDetail/nbproject/project.xml
      inflating: RptMasterDetail/nbproject/build-impl.xml
      inflating: RptMasterDetail/nbproject/genfiles.properties
      inflating: RptMasterDetail/Report/RptDetail.jasper
      inflating: RptMasterDetail/Report/RptMaster.jrxml
      inflating: RptMasterDetail/Report/RptDetail.jrxml
     extracting: RptMasterDetail/Report/netbeans_logo.gif
      inflating: RptMasterDetail/Report/RptMaster.jasper
      inflating: RptMasterDetail/manifest.mf
      inflating: RptMasterDetail/build.xml
    [martin@opensolarisbox:~/jrbeans]$
    



kemudian bukalah file **RptMaster.jrxml** dan **RptDetail.jrxml** yang terdapat pada direktori **RptMasterDetail/Report/** pada iReport seperti gambar dibawah ini :
[![open_report](http://farm3.static.flickr.com/2501/3710388729_04419d9f2b.jpg)](http://www.flickr.com/photos/10243554@N02/3710388729/)

Sekarang coba jalankan report tersebut dari iReport dengan menggunakan **Active Connection** (buatlah dahulu datasourcenya dengan menggunakan JDBC Connection dan arahkan databasenya ke **rptmasterdetail**) hingga tampilannya menjadi seperti gambar dibawah ini :
[![run_report](http://farm3.static.flickr.com/2477/3710388735_ca41f41b87.jpg)](http://www.flickr.com/photos/10243554@N02/3710388735/)
**Note: Usahakan report berjalan dengan sukses sampai langkah ini, jika belum berjalan dengan benar silahkan cek ulang lagi mungkin ada konfigurasi yang terlewati.**

Setelah berhasil menjalankan report dengan **JDBC Connection** sekarang saatnya untuk merubah report kita agar menggunakan **JRBeanCollection** sebagai datasourcenya, nah agar report kita menggunakan **JRBeanCollection** kita harus melakukan beberapa modifikasi yang harus dilakukan yaitu :
<!-- more -->


    1. ** Modifikasi Pada File RptMaster.jxml**


      * **Hapus Synxtax Query**

Bukalah file **RptMaster.jrxml** kemudian pilih menu **Data > Report Query** kemudian hapuslah query **SELECT * FROM `T_KATEGORI` T_KATEGORI WHERE kd_Kategori = $P{PRM_KD_KATEGORI}** hingga tampilannya menjadi seperti gambar dibawah ini :
[![delete_report_qry_on_master](http://farm4.static.flickr.com/3418/3710388741_bfbc30b808.jpg)  
Proses query ini akan diganti dari kode Java kita](http://www.flickr.com/photos/10243554@N02/3710388741/)


      * **Hapus Parameter PRM_KD_KATEGORI**

Untuk menghapus parameter **PRM_KD_KATEGORI** pilihlah menu **View > Parameter** kemudian hapuslah parameter tersebut hingga menjadi seperti gambar dibawah ini :
[![delete_parameter_master](http://farm4.static.flickr.com/3517/3710388747_b59b76b2a7.jpg)  
PRM_KD_KATEGORI sudah tidak diperlukan lagi jika menggunakan JRBeanCollectionDataSource](http://www.flickr.com/photos/10243554@N02/3710388747/)


      * **Buat Parameter Untuk Menampung Detail Report**

Buatlah sebuah parameter dengan tipe **java.util.Collection** untuk menampung data detail report dengan cara memilih menu **View > Parameter** kemudian pada jendela Parameters tekanlah tombol New untuk menambahkan sebuah parameter baru. Setelah itu pada jendela Add/Modify Parameters isikanlah sebagai berikut :


        * Parameter Name **PRM_DETAIL_VALUE**


        * Parameter Class Type **java.util.Collection**


seperti gambar dibawah ini :
[![add_parameter_detail](http://farm3.static.flickr.com/2636/3710388759_e9da9ceb99.jpg)  
Parameter ini digunakan untuk menampung detail report](http://www.flickr.com/photos/10243554@N02/3710388759/)


      * **Ganti Connection/Data Source Expression**

Klik kanan pada **Sub Report** kemudian pilihlah Properties, pada dialog yang terbuka pilihlah tab **Subreport** kemudian gantilah **Connection/Data Source Expression**-nya menjadi seperti gambar dibawah ini:
[![data_source_expression](http://farm3.static.flickr.com/2615/3710388765_f616b53891.jpg)  
Mengganti Data Source Agar Menggunakan JRBeanCollectionDataSource](http://www.flickr.com/photos/10243554@N02/3710388765/)


      * **Hapus Sub Report Parameter**

Hapuslah juga **Sub Report Paremeter** dengan cara klik kanan pada **Sub Report** kemudian pilih Properties, pada dialog yang terbuka pilihlah tab **Sub Report (Other)** kemudian hapuslah parameter **PRM_DETAIL_KDKATEGORI** hingga menjadi seperti gambar dibawah ini:
[![delete_sub_report_parameter](http://farm3.static.flickr.com/2516/3711226760_219d993dbd.jpg)  
Hapus Subreport Parameter](http://www.flickr.com/photos/10243554@N02/3711226760/)


      * **Ganti Parameter Class Type Pada Parameter SUBREPOT_DIR**

Gantilah **Parameter Class Type** pada parameter **$P{SUBREPORT_DIR}** dengan cara memilih menu **View > Parameters** kemudian pilihlah parameter **SUBREPORT_DIR** lalu tekan tombol **Modify**. Setelah jendela **Add/Modify Parameter** tampil, sekarang gantilah **Parameter Class Type** dari **java.lang.String** ke **java.io.InputStream** seperti gambar dibawah ini :
[![Modify_sub_report_dir](http://farm3.static.flickr.com/2671/3715117579_f3229cc716.jpg)  
Ganti Parameter Class Type](http://www.flickr.com/photos/10243554@N02/3715117579/)


      * **Ganti Subreport Expression Class**

Setelah melakukan langkah diatas, kita juga harus memodifikasi **Subreport Expression Class** agar Detail Report kita bisa diakses dari Master Report. Caranya yaitu klik kanan pada **Sub Report** kemudian pilih Properties, pada dialog yang terbuka pilihlah tab **Sub Report (Other)** kemudian ganti **Subreport Expression Class** dari **java.lang.String** ke **java.io.InputStream** kemudian hapuslah kalimat **+ "RptDetail.jasper"** menjadi seperti gambar dibawah ini :
[![modify_subreport_expression_class](http://farm4.static.flickr.com/3420/3715117589_f6a9d70223.jpg)  
Ganti Subreport Expression Class](http://www.flickr.com/photos/10243554@N02/3715117589/)

Proses modifikasi file **RptMaster.jrxml** sudah selesai, sekarang mari kita lanjutkan dengan memodifikasi file **RptDetail.jrxml**





    2. ** Modifikasi Pada File RptDetail.jrxml**


      * **Hapus Syntax Query**

Bukalah file **RptDetail.jrxml** kemudian pilih menu **Data > Report Query** kemudian hapuslah query **SELECT T_BARANG.kd_Barang, T_BARANG.nm_Barang FROM T_BARANG, T_KATEGORI WHERE T_BARANG.kd_Kategori = $P{PRM_DETAIL_KDKATEGORI} GROUP BY T_BARANG.kd_Barang** hingga menjadi seperti gambar dibawah ini:
[![delete_qry_rpt_detail](http://farm3.static.flickr.com/2443/3711226762_68c7ce70dc.jpg)](http://www.flickr.com/photos/10243554@N02/3711226762/)


      * **Hapus Parameter PRM_DETAIL_KDKATEGORI**

Untuk menghapus parameter **PRM_KD_KATEGORI** pilihlah menu **View > Parameter** kemudian hapuslah parameter tersebut hingga menjadi seperti gambar dibawah ini :
[![delete_prm_detail](http://farm3.static.flickr.com/2510/3711226766_1abcb685c3.jpg)](http://www.flickr.com/photos/10243554@N02/3711226766/)




Akhirnya selesai juga proses modifikasi file **RptMaster.jrxml** dan **RptDetail.jrxml**, sekarang mari kita buat sebuah project untuk memanggil report yang sudah menggunakan JRBeansCollectionsDataSource :)





  3. ** Menggunakan JRBeansCollections Sebagai DataSource**
Langkah selanjutnya yaitu adalah buatlah sebuah project dengan nama **porting-report-beans-collection** kemudian buatlah beberapa **package** yaitu **portingreportbeanscollection.domain**, **portingreportbeanscollection.report**, **portingreportbeanscollection.service**, **portingreportbeanscollection.service.impl** seperti gambar dibawah ini :
[![struktur_project](http://farm3.static.flickr.com/2638/3711226768_a52503b2e1_o.png)](http://www.flickr.com/photos/10243554@N02/3711226768/)

Sekarang kopikan file **RptMaster.jrxml** dan **RptDetail.jrxml** yang terdapat pada direktori **RptMasterDetail/Report/** kedalam packages **portingreportbeanscollection.report** hingga tampilannya menjadi seperti gambar dibawah ini :
[![kopi_report_ke_packages](http://farm3.static.flickr.com/2608/3711226772_a4a3af763f_o.png)](http://www.flickr.com/photos/10243554@N02/3711226772/)

Sekarang buatlah 2 buah **Domain Class** pada packages **portingreportbeanscollection.domain** yaitu **Barang** dan **Kategori** seperti dibawah ini :

    
    
    /*
     * To change this template, choose Tools | Templates
     * and open the template in the editor.
     */
    package portingreportbeanscollection.domain;
    
    /**
     *
     * @author martin
     */
    public class Barang {
    
        private Integer idBarang;
        private String kd_Barang;
        private String kodeKategori;
        private String nm_Barang;
    	// Generate Getter and Setter via ALT+INSERT
    }
    




    
    
    /*
     * To change this template, choose Tools | Templates
     * and open the template in the editor.
     */
    
    package portingreportbeanscollection.domain;
    
    import java.util.List;
    
    /**
     *
     * @author martin
     */
    public class Kategori {
    
        private String kd_Kategori;
        private String nm_Kategori;
        private List<barang> listBarang;
    	// Generate Getter and Setter via ALT+INSERT
    }
    



Buatlah sebuah **Interface** pada packages **portingreportbeanscollection.service** dengan nama **IMaster** dengan isi seperti dibawah ini :

    
    
    /*
     * To change this template, choose Tools | Templates
     * and open the template in the editor.
     */
    
    package portingreportbeanscollection.service;
    
    import portingreportbeanscollection.domain.Kategori;
    
    /**
     *
     * @author martin
     */
    public interface IMaster {
    
        public Kategori findKategoriByKode(String prmKodeKategori);
    
    }
    



Setelah selesai membuat **Interface**, sekarang buatlah sebuah **Implementation** dari **Interface** yang telah kita buat pada packages **portingreportbeanscollection.service.impl** seperti dibawah ini :

    
    
    /*
     * To change this template, choose Tools | Templates
     * and open the template in the editor.
     */
    package portingreportbeanscollection.service.impl;
    
    import java.sql.Connection;
    import java.sql.PreparedStatement;
    import java.sql.ResultSet;
    import java.sql.SQLException;
    import java.util.ArrayList;
    import java.util.List;
    import java.util.logging.Level;
    import java.util.logging.Logger;
    import portingreportbeanscollection.domain.Barang;
    import portingreportbeanscollection.domain.Kategori;
    import portingreportbeanscollection.service.IMaster;
    
    /**
     *
     * @author martin
     */
    public class IMasterImpl implements IMaster {
    
        private Connection connection;
        private PreparedStatement sqlSearchKategoriByKode;
        private final String qrySearchKategoriByKode =
                "select * from T_BARANG, T_KATEGORI where " +
                "T_KATEGORI.kd_Kategori = T_BARANG.kd_Kategori " +
                "AND T_KATEGORI.kd_Kategori = ?";
    
        public IMasterImpl(Connection connection) {
            try {
                this.connection = connection;
                sqlSearchKategoriByKode = this.connection.prepareStatement(qrySearchKategoriByKode);
            } catch (SQLException ex) {
                Logger.getLogger(IMasterImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    
        public Kategori findKategoriByKode(String prmKodeKategori) {
            Kategori resultKategori = new Kategori();
            try {
                sqlSearchKategoriByKode.setString(1, prmKodeKategori);
                ResultSet rs = sqlSearchKategoriByKode.executeQuery();
                List<barang> listBarang = new ArrayList<barang>();
    
                while (rs.next()) {
                    resultKategori.setKd_Kategori(rs.getString("kd_Kategori"));
                    resultKategori.setNm_Kategori(rs.getString("nm_Kategori"));
    
                    /* Ambil object barang */
                    Barang b = new Barang();
                    b.setIdBarang(rs.getInt("id_Barang"));
                    b.setKd_Barang(rs.getString("kd_Barang"));
                    b.setNm_Barang(rs.getString("nm_Barang"));
                    b.setKodeKategori(rs.getString("kd_Kategori"));
    
                    /* Masukkan ke dalam list of barang */
                    listBarang.add(b);
                }
    
                /* Tambahkan list of barang ke dalam object kategori */
                resultKategori.setListBarang(listBarang);
            } catch (SQLException ex) {
                Logger.getLogger(IMasterImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
            return resultKategori;
        }
    }
    



Setelah semua selesai, sekarang tambahkanlah dahulu library **MySQL JDBC Driver** dan beberapa library untuk jasper report sehingga hasil akhir dari struktur project kita terlihat seperti gambar dibawah ini :
[![struktur_prj_akhir](http://farm4.static.flickr.com/3447/3710434395_30d2970fcf.jpg)](http://www.flickr.com/photos/10243554@N02/3710434395/)




Ok sekarang setelah semua persiapan dan konfigurasi telah selesai, sekarang mari kita modifikasi file **Main.java** hingga menjadi seperti dibawah ini :

    
    
    /*
     * To change this template, choose Tools | Templates
     * and open the template in the editor.
     */
    package portingreportbeanscollection;
    
    import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
    import java.sql.SQLException;
    import java.util.ArrayList;
    import java.util.HashMap;
    import java.util.List;
    import java.util.Map;
    import java.util.logging.Level;
    import java.util.logging.Logger;
    import net.sf.jasperreports.engine.JRException;
    import net.sf.jasperreports.engine.JasperCompileManager;
    import net.sf.jasperreports.engine.JasperFillManager;
    import net.sf.jasperreports.engine.JasperPrint;
    import net.sf.jasperreports.engine.JasperReport;
    import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
    import net.sf.jasperreports.view.JasperViewer;
    import portingreportbeanscollection.domain.Barang;
    import portingreportbeanscollection.domain.Kategori;
    import portingreportbeanscollection.service.IMaster;
    import portingreportbeanscollection.service.impl.IMasterImpl;
    
    /**
     *
     * @author martin
     */
    public class Main {
    
        /**
         * @param args the command line arguments
         */
        public static void main(String[] args) {
            try {
                MysqlDataSource dataSource = new MysqlDataSource();
                dataSource.setServerName("localhost");
                dataSource.setDatabaseName("rptmasterdetail");
                dataSource.setUser("root");
                dataSource.setPassword("admin");
    
                final IMaster imaster = new IMasterImpl(dataSource.getConnection());
                Kategori k = imaster.findKategoriByKode("HAAP");
                if (k != null) {
                    System.out.println("Kode : " + k.getKd_Kategori());
                    System.out.println("Nama : " + k.getNm_Kategori());
                    System.out.println("JmlBrg: " + k.getListBarang().size());
                    for (Barang b : k.getListBarang()) {
                        System.out.println("ID : " + b.getIdBarang() + " KODE : " + b.getKd_Barang() + " NAME : " + b.getNm_Barang());
                    }
    
                    List<kategori> listKategori = new ArrayList<kategori>();
                    listKategori.add(k);
    
                    /* Sudah mendapat object Kategori beserta data barangnya,
                     * sekarang siapkan parameter untuk reportnya */
                    Map<string, Object> parameter = new HashMap<string, Object>();
    
                    /* Sekarang tidak perlu lagi mencari report path, report bisa
                     * dicemplungin ke dalam jar sekalian ^_^ */
                    parameter.put("SUBREPORT_DIR",
                            Main.class.getResourceAsStream(
                            "/portingreportbeanscollection/report/RptDetail.jasper"));
    
                    /* Mengisi detail report */
                    parameter.put("PRM_DETAIL_VALUE", k.getListBarang());
    
                    /* Proses compilasi report */
                    JasperReport jp = JasperCompileManager.compileReport(
                        Main.class.getResourceAsStream(
                        "/portingreportbeanscollection/report/RptMaster.jrxml"));
    
                    /* Proses pengisian report dengan data */
                    JasperPrint jasperPrint = JasperFillManager.fillReport(jp, parameter,
                        new JRBeanCollectionDataSource(listKategori));
    
                    /* Sudah semua? Maka tampilkan :) */
                    JasperViewer.viewReport(jasperPrint);
                }
            } catch (JRException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    



Nah sekarang kalau sudah, mari kita tambahkan **custom ant task** yang fungsinya melakukan proses kompilasi report ketika kita mengcompile source code java kita dan menghapus file-file *.java, bak dan jasper ketika kita melakukan proses clean di NetBeans IDE. Untuk mengkonfigurasi NetBeans agar dapat melakukan proses otomatis seperti diatas, langkah yang harus kita lakukan adalah bukalah file **build.xml** kemudian tambahkanlah baris dibawah ini pada file **build.xml**:

    
    
        <path id="report.classpath">
            <fileset dir="/export/home/martin/MASTER_APP/iReport-3.0.0/lib" includes="**/*.jar"></fileset>
            <pathelement location="Report"></pathelement>
        </path>
    
        <taskdef classname="net.sf.jasperreports.ant.JRAntCompileTask" name="jrc">
            <classpath refid="report.classpath"></classpath>
        </taskdef>
    
        <target name="-post-clean">
            <delete verbose="true">
                <fileset dir="./src/portingreportbeanscollection/report/" includes="**/*.jasper"></fileset>
                <fileset dir="./src/portingreportbeanscollection/report/" includes="**/*.bak"></fileset>
                <fileset dir="./src/portingreportbeanscollection/report/" includes="**/*.java"></fileset>
            </delete>
        </target>
    
        <target name="-pre-compile">
             <jrc tempdir="./src/portingreportbeanscollection/report/" srcdir="./src/portingreportbeanscollection/report/" keepjava="false" destdir="./src/portingreportbeanscollection/report/" xmlvalidation="true">
                     <include name="**/*.jrxml"></include>
            </jrc>
        </target>
    



Dan jika kita melakukan proses **Clean and Build** di NetBeans IDE, maka tampilan outputnya akan tampak seperti dibawah ini :

    
    
    init:
    deps-clean:
    Deleting directory /export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/build
    Deleting directory /export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/dist
    Deleting /export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/src/portingreportbeanscollection/report/RptDetail.jasper
    Deleting /export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/src/portingreportbeanscollection/report/RptMaster.jasper
    clean:
    init:
    deps-jar:
    Created dir: /export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/build/classes
    Compiling 2 report design files.
    File : /export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/src/portingreportbeanscollection/report/RptDetail.jrxml ... OK.
    File : /export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/src/portingreportbeanscollection/report/RptMaster.jrxml ... OK.
    Created dir: /export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/build/empty
    Compiling 5 source files to /export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/build/classes
    Copying 4 files to /export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/build/classes
    compile:
    Created dir: /export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/dist
    Building jar: /export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/dist/porting-report-beans-collection.jar
    Copy libraries to /export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/dist/lib.
    To run this application from the command line without Ant, try:
    java -jar "/export/home/martin/OSS/GOOGLE_CODE/martin-personal-project/java/porting-report/porting-report-beans-collection/dist/porting-report-beans-collection.jar"
    jar:
    BUILD SUCCESSFUL (total time: 6 seconds)
    



Jika sudah selesai, sekarang coba jalankan dengan menekan tombol **F6** pada NetBeans IDE. Dan jika tidak ada pesan error maka harusnya report akan tampil seperti gambar dibawah ini :
[![result_report](http://farm3.static.flickr.com/2475/3710472719_4bab61a537.jpg)  
Hasil Akhir Report Menggunakan JRBeanCollection Sebagai Data Source](http://www.flickr.com/photos/10243554@N02/3710472719/)

Nah mudah bukan ?? **Point of View** yang ingin disampaikan pada tulisan kali ini adalah :
- Jika ingin menggunakan JRBeanCollection sebagai data source-nya, pastikan dahulu report sudah berjalan dengan baik menggunakan JDBC data source.
- Usahakan nama **field** pada report **(*.jrxml)** harus sama dengan nama **Domain Class** yang kita buat.
- Jika sudah menggunakan JRBeanCollection, apapun persistence layernya harusnya sudah tidak begitu bermasalah. Karena yang kita kirimkan ke dalam Jasper Report sudah berbentuk **List Of Domain Object**, jadi usahakan agar kita bisa menampilkan data terlebih dahulu (via **System.out.println()**) baru kemudian kirimkan hasilnya ke jasper report.

**Link-link terkait :**
- [Membuat Master Detail Report dengan iReport](http://martinusadyh.web.id/2007/12/24/membuat-masterdetail-report-dengan-ireport/)
- [Download Sample Project MasterDetailRptJRBeansCollections.zip](http://martin-personal-project.googlecode.com/files/porting-report-beans-collection.zip)
- [Subversion access Sample Project MasterDetailRptJRBeansCollections](http://code.google.com/p/martin-personal-project/source/browse/#svn/trunk/java/porting-report)
