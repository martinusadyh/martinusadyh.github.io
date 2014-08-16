---
comments: true
date: 2007-10-12 13:36:52+00:00
layout: post
slug: reporting-dengan-netbeans
title: Reporting dengan NetBeans
wordpress_id: 16
categories:
- Java
- NetBeans
---

Kemaren dulu ada pertanyaan di milis [netbeans-indonesia@yahoogroups](mailto:netbeans-indonesia@yahoogroups.com/) tentang masalah Report di Netbeans. Inti kasusnya adalah seperti berikut:



> Aplikasi beserta report-nya jalan dengan sukses pada komputer si programmer, tapi ketika si programmer memindahkan aplikasi-nya ke komputer lain reportnya tidak mau jalan atau tidak mau tampil.



OK sekarang mari kita coba membuat sebuah latihan tentang reporting menggunakan iReport dan NetBeans IDE dan peralatan-peralatan yang perlu dipersiapkan adalah sebagai berikut :
- NetBeans 5.5
- iReport 1.3.1
- MySQL Server (atau bisa juga database server yang lain)
- JDK 1.6
<!-- more -->
Setelah peralatan telah siap, mari kita buat latihannya dan langkah-langkahnya adalah sebagai berikut:




  1. Bikinlah sebuah **New Project** dan berilah nama **ReportingInNetBeans**.


  2. Pada project inspector, klik kanan root project kemudian pilih **New > JFrame Form** kemudian pada jendela **New JFrame** isikan **Frame Report** pada Class Name, dan pada kolom isian **Package** pilihlah **reportinginnetbeans**. Setelah itu tambahkanlah beberapa komponen pada JFrame tersebut sehingga tampilannya menjadi seperti gambar dibawah ini:
[![jframe_report](http://farm3.static.flickr.com/2400/1552396744_5a2d333a5d_m.jpg)  
Click to large](http://farm3.static.flickr.com/2400/1552396744_b8af4ff8d3_o.png)



  3. Setelah mengatur tampilan JFrame seperti pada gambar diatas, sekarang tekanlah tombol **SHIFT+F11** agar NetBeans membuatkan sebuah direktori distribusi untuk kita yaitu direktori **dist**. Setelah itu, masuklah pada files inspector kemudian buatlah sebuah direktori yaitu direktori **Report** dibawah direktori **dist** yang berfungsi untuk menampung seluruh file template yang kita desain pada iReport dan tampilan dari langkah ke 3 ini terlihat seperti gambar dibawah ini:
[![direktori_dist_report](http://farm3.static.flickr.com/2109/1551445979_cb4d4244d7_m.jpg)  
Click to large](http://farm3.static.flickr.com/2109/1551445979_2192e69e45_o.png)



  4. Setelah membuat sebuah direktori **Report** sekarang waktunya untuk mengkonfigurasi file **build-impl.xml** agar ketika kita melakukan proses **Clean** direktori **Report** ini tidak ikut terhapus. Sekarang bukalah file **build-impl.xml** yang terdapat pada direktori **nbproject** seperti gambar dibawah ini:
   [![build-impl-xml](http://farm3.static.flickr.com/2057/1551618185_0573964701_m.jpg)  
Click to large](http://farm3.static.flickr.com/2057/1551618185_1bb2142e8e_o.png)
   Setelah file **build-impl.xml** terbuka, sekarang carilah **CLEANUP SECTION** seperti dibawah ini:
   
    
    
       
        <target depends="init" unless="no.deps" name="deps-clean"></target>
        <target depends="init" name="-do-clean">
            <delete dir="${build.dir}"></delete>
            <delete dir="${dist.dir}"></delete>
        </target>
        <target name="-post-clean">
            
            
        </target>
        <target depends="init,deps-clean,-do-clean,-post-clean" name="clean" description="Clean build products."></target>
       



	Setelah itu editlah baris 534 sehingga hasilnya menjadi seperti dibawah ini:
	
    
    
    	
        <target depends="init" unless="no.deps" name="deps-clean"></target>
        <target depends="init" name="-do-clean">
            <delete dir="${build.dir}"></delete>
            <delete file="${dist.jar}"></delete>
            <delete dir="${dist.javadoc.dir}"></delete>
        </target>
        <target name="-post-clean">
            
            
        </target>
        <target depends="init,deps-clean,-do-clean,-post-clean" name="clean" description="Clean build products."></target>
    	



Setelah melakukan proses pengeditan seperti diatas simpanlah file konfigurasinya dan tutuplah NetBeans-nya agar mengurangi resource CPU :D dan sekarang waktunya untuk membuat contoh report melalui iReport. :)



  5. Sebelum mulai menggunakan iReport, aturlah dahulu **Data Source** yang akan digunakan dengan cara pilih **Data > Connections/Data Source** dan aturlah koneksinya menjadi seperti gambar dibawah ini:
[![SettingKoneksiIreport](http://farm3.static.flickr.com/2214/1551445975_c3e2916914_m.jpg)  
Click to large](http://farm3.static.flickr.com/2214/1551445975_589df1f276_o.png)



  6. Setelah selesai mengkonfigurasi Data Source, sekarang buatlah report baru dengan cara menekan **File > New Document**. Setelah **template** report muncul, sekarang tentukanlah **Report Query** yang akan digunakan untuk report ini. Untuk menentukan **Report Query** yang akan digunakan tekanlah **Data > Report Query** dan masukkanlah statement SQL sehingga tampilannya menjadi seperti dibawah ini:
[![Qry_iReport](http://farm3.static.flickr.com/2021/1551445965_9b275b3dbd_m.jpg)  
Click to large](http://farm3.static.flickr.com/2021/1551445965_860d8d36ff_o.png)



  7. Setelah menentukan **Report Query**, sekarang design-lah report-nya hingga menjadi seperti gambar dibawah ini:
[![report_template](http://farm3.static.flickr.com/2043/1552396758_948e8a36cd_m.jpg)  
Click to large](http://farm3.static.flickr.com/2043/1552396758_0e705795b5_o.png)

kemudian simpanlah dengan nama **Mahasiswa_Report.jrxml** pada direktori **Report** yang telah dibuat pada langkah ke 3 hingga struktur direktori project NetBeans kita menjadi seperti gambar dibawah ini:
[![gambar_dir_prj_Nb](http://farm3.static.flickr.com/2330/1552396716_2f48799044_m.jpg)  
Click to large](http://farm3.static.flickr.com/2330/1552396716_7e1d4ccd95_o.png)



  8. Setelah melakukan proses penyimpanan, sekarang coba jalankan report-nya dengan menggunakan active connection dengan cara tekan menu **Build > Execute (with active connection)** dan jika tidak ada masalah maka report yang telah anda design akan tampak seperti gambar dibawah ini:
[![Report_Jadi](http://farm3.static.flickr.com/2126/1551445967_0536e5e733_m.jpg)  
Click to large](http://farm3.static.flickr.com/2126/1551445967_0a74197c32_o.png)



  9. Report telah jadi, sekarang coba bukalah project **ReportingInNetBeans** kemudian pada tombol yang berfungsi untuk menampilkan reportnya berikanlah evet dengan cara klik kanan kemudian pilih **Events > Action > actionPerformed** kemudian pastekanlah kode dibawah ini:

    
    
    // TODO add your handling code here:
            jButton1.setCursor(Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR));
            Connection con = null;
            try {
                String jdbcDriver = "com.mysql.jdbc.Driver";
                Class.forName(jdbcDriver);
    
                String url = "jdbc:mysql://localhost/latihanibatis";
                String user = "root";
                String pass = "rahasia";
    
                con = DriverManager.getConnection(url, user, pass);
                Statement stm = con.createStatement();
    
                try {
                    Map<string, Object> prs = new HashMap<string, Object>();
                    JasperReport JRpt = JasperCompileManager.compileReport("./dist/Report/Mahasiswa_Report.jrxml");
                    JasperPrint JPrint = JasperFillManager.fillReport(JRpt, prs, con);
                    JasperViewer.viewReport(JPrint, false);
                } catch (Exception rptexcpt) {
                    System.out.println("Report Can't view because : " + rptexcpt);
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            jButton1.setCursor(Cursor.getDefaultCursor());
    


Setelah itu, coba tekanlah tombol F6 untuk menjalankan projectnya dan jika tidak ada masalah maka report yang telah anda design di iReport akan tampil jika tombol yang berfungsi menampilkan reportnya ditekan :)



  10. Report sudah jalan dengan sangat sempurna di NetBeans, sekarang bagaimana jika kita ingin mencoba aplikasi ini pada komputer lain yang hanya mempunyai JRE saja ? Untuk menjawab pertanyaan ini, sekarang tekanlah tombol **SHIFT+F11** agar netbeans membuatkan file *.jar untuk aplikasi kita. Setelah proses CLEAN and BUILD selesai, sekarang cobalah kopikan direktori **dist/** ke komputer yang lain dan coba jalankan. Berhubung saya dirumah tidak mempunyai 2 komputer, maka saya kopikan ke user yang lain dan hasilnya seperti berikut :
Ini tampilan di user anton ( Anggap saja di PC Lain :D )
[![Report_di_PC_LAIN](http://farm3.static.flickr.com/2176/1551445971_11b8de7bd2_m.jpg)  
Click to large](http://farm3.static.flickr.com/2176/1551445971_616727c010_o.png)

Ini tampilan di user javamaniac ( Anggap saja di PC Lokal )
[![RptDiPCLokal](http://farm3.static.flickr.com/2194/1551445973_181d0d0993_m.jpg)  
Click to large](http://farm3.static.flickr.com/2194/1551445973_217805f17e_o.png)



Silahkan dicoba dikomputer lain kalau tidak percaya, reportnya pasti akan jalan dengan sempurna seperti pada waktu  kita jalankan dari NetBeans IDE :)

Resource :
- [Sample Project ReportingInNetBeans.zip](http://martin-personal-project.googlecode.com/files/ReportingInNetBeans.zip)
- [Mahasiswa.sql](http://martin-personal-project.googlecode.com/files/Mahasiswa.sql)
