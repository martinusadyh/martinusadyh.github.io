---
comments: true
date: 2007-12-24 15:59:20+00:00
layout: post
slug: membuat-masterdetail-report-dengan-ireport
title: Membuat MasterDetail Report dengan iReport
wordpress_id: 22
categories:
- Java
- NetBeans
tags:
- cara menggunakan iReport
- ireport
---

Minggu kemarin, pada milis [netbeans-indonesia@yahoogroups.com](mailto:netbeans-indonesia@yahoogroups.com) terjadi diskusi yang cukup menarik tentang masalah Java+iReport+SubReport. Pertanyaan yang diajukan adalah sebagai berikut :


> 
Arie Linuxx wrote:
saya telah buat report dengan iReport, anggaplah saya
buat report dengan nama report1. dan didalam report1
itu terdapat subreport yg saya beri nama subreport1.

Pada saat saya ingin menampilkan dari java, terdapat
error ...
8<------ CUT ------>8

8<------ CUT ------>8
dan error nya adalah :
init:
deps-jar:
compile-single:
run-single:
net.sf.jasperreports.engine.JRException: Could not
load object from location : subreport1.jasper

Dimana yah salahnya... mungkin teman2 ada yg bisa
bantu...

Mkasih ya...




Nah setelah beberapa kali diskusi, ternyata mas Arie Linuxx sudah bisa menjalankan sub-reportnya dengan menggunakan solusi full path untuk parameter sub-reportnya seperti kata mas Arie Linuxx dibawah ini:


> 
Arie Linuxx wrote:
maaf mas.. ternyata udh bs...
di tab SubReport(Other) SubReport Expression Class tetep java.lang.String dan untuk Subreport Expression pke full path "G:/MyJava/Inventori/laporan/rptTransaksiDtl_back.jasper" dan sy compile netbeans lagi.. berhasill....

mkasih ya.. kawan2...

Kapan2 boleh tanya lagi ya...

Mkasih.............




Tetapi ada satu yang sedikit mengganjal yaitu mas Arie Linuxx menggunakan full path untuk parameter sub-reportnya. Yah memang berhasil sih dijalankan, tetapi bagaimana jadinya kalau dijalankan di lain komputer atau dilain Sistem Operasi ? Tentunya solusi full path bukan solusi yang bagus :D
<!-- more -->
Sekarang mari kita buat sebuah latihan tentang pembuatan Report Master Detail menggunakan iReport kemudian kita panggil dari program Java yang telah kita buat menggunakan IDE NetBeans. Sedangkan alat-alat yang perlu dipersiapkan untuk latihan kali ini adalah :
1. iReport 2.0.2
2. MySQL Server.
3. NetBeans 6.0 ( Sekalian coba-coba menggunakan NetBeans veri baru :D )
4. JDK 1.6.0 atau yang lebih baru.

Supaya lebih rapi (sekalian belajar nulis) pada latihan kali ini akan dibagi menjadi 4 bagian yaitu :
1. Membuat DataBase dan Table-tablenya.
2. Membuat New Project dari NetBeans.
3. Membuat Master Report dan Detail Report Menggunakan iReport.
4. Memanggil Master-Detail Report Dari Program Java.

Pada latihan kali ini setiap langkah-langkah yang dilakukan akan dijelaskan secara mendetail (sekaligus sebagai bahan bacaan bagi teman-teman yang belum pernah membuat Report Master-Detail menggunakan iReport), dan buat teman-teman yang mengalami masalah seperti Mas Arie Linuxxx mungkin dapat langsung melihat ke langkah nomor 4 yaitu "Memanggil Master-Detail Report Dari Program Java".





  1. **Membuat DataBase dan Table-tablenya.**

Sebagai contoh kasus, disini saya menggunakan hanya 2 table saja yaitu Table Kategori Barang ( T_KATEGORI ) dan Table Barang ( T_BARANG ) saja. Nah pada setiap barang yang terdapat pada T_BARANG pasti mempunyai kategori barang yang terdapat pada T_KATEGORI, sedangkan hubungan antar tablenya kurang lebih sebagai berikut :
[![DB_Design](http://farm3.static.flickr.com/2343/2133340402_9e4c775d24_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133340402/)

Sekarang mari kita buat table-table tersebut dengan cara membuat sebuah script *.sql yang isinya kurang lebih sebagai berikut :

    
    
    -- Database untuk latihan pembuatan report Master-Detail
    
    drop database if exists rptmasterdetail;
    create database rptmasterdetail;
    use rptmasterdetail;
    
    drop table if exists T_BARANG;
    drop table if exists T_KATEGORI;
    
    -- Bikin table Master
    create table T_KATEGORI(
    	kd_Kategori varchar(5) not null primary key,
    	nm_Kategori varchar(30) not null,
    	index kd_Kategori(kd_Kategori)
    ) type = innodb;
    
    -- Bikin table Detail
    create table T_BARANG(
    	id_Barang integer auto_increment primary key,
    	kd_Barang varchar(10) not null,
    	kd_Kategori varchar(5) not null,
    	nm_Barang varchar(50) not null,
    	index (kd_Kategori),
    	foreign key(kd_Kategori) references T_KATEGORI(kd_Kategori) on update cascade
    ) type = innodb;
    
    /* Proses Insert Data Table Master */
    insert into T_KATEGORI(kd_Kategori, nm_Kategori) values("HAAP", "Home Application");
    insert into T_KATEGORI(kd_Kategori, nm_Kategori) values("AUD", "Audio");
    insert into T_KATEGORI(kd_Kategori, nm_Kategori) values("VID", "Video");
    
    /* Proses Insert Data Table Detail */
    insert into T_BARANG(kd_Barang, kd_Kategori, nm_Barang) values("1", "AUD", "MP3 Player");
    insert into T_BARANG(kd_Barang, kd_Kategori, nm_Barang) values("2", "VID", "VCD Player");
    insert into T_BARANG(kd_Barang, kd_Kategori, nm_Barang) values("3", "HAAP", "Kulkas");
    insert into T_BARANG(kd_Barang, kd_Kategori, nm_Barang) values("4", "HAAP", "Rice Cooker");
    insert into T_BARANG(kd_Barang, kd_Kategori, nm_Barang) values("5", "AUD", "iPod");
    insert into T_BARANG(kd_Barang, kd_Kategori, nm_Barang) values("6", "HAAP", "Blender");
    insert into T_BARANG(kd_Barang, kd_Kategori, nm_Barang) values("7", "VID", "DVD Player");
    insert into T_BARANG(kd_Barang, kd_Kategori, nm_Barang) values("8", "AUD", "USB MP3 Player");
    insert into T_BARANG(kd_Barang, kd_Kategori, nm_Barang) values("9", "AUD", "MP4 Player");
    



Copy dan simpan script diatas dengan nama **RptMasterDetail.sql**, setelah tersimpan di komputer anda, sekarang jalankan perintah dibawah ini agar seluruh table dan database yang diperlukan siap untuk digunakan:

    
    
    [javamaniac@pemula:~/Desktop/MembuatRptMasterDetail]$ mysql -u root -p < RptMasterDetail.sql
    Enter password: [masukkan password root pada mysql anda]
    [javamaniac@pemula:~/Desktop/MembuatRptMasterDetail]$
    



Ok sekarang langkah pertama telah selesai dilakukan, sekarang DataBase dan table sudah siap untuk digunakan :) Mari lanjut pada langkah ke 2.




  2. **Membuat New Project dari NetBeans**

Setelah langkah pertama selesai, sekarang buatlah sebuah project baru dari NetBeans dengan cara sebagai berikut :

Buatlah New Project dan beri nama **RptMasterDetail** untuk isian **Project Name**, kemudian tekanlah tombol Finish. Setelah menekan tombol Finish, sekarang klik kanan root project yang terdapat pada Projects Inspector kemudian pilih **New > Folder**. Pada jendela New Folder isikan **Report** pada Folder Name seperti pada gambar dibawah ini:
[![BuatFolder](http://farm3.static.flickr.com/2407/2133340398_d56059091f_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133340398/)

Setelah proses diatas, maka sekarang struktur direktori Project kita adalah seperti gambar dibawah ini:
[![StrukturPrj](http://farm3.static.flickr.com/2224/2132607017_9b4c23680e_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2132607017/)

Fungsi dari direktori / Folder Report tersebut adalah sebagai tempat menyimpan report yang akan kita buat melalui iReport. Ok, sekarang lanjut ke langkah ke 3.




  3. **Membuat Master Report dan Detail Report Menggunakan iReport.**

Sebelum mulai membuat Master dan Detail Report-nya, jangan lupa buatlah dahulu **Connection/Data Source** yang mengarah ke database **rptmasterdetail** yang telah kita buat pada langkah pertama diatas. Pada proses pembuatan Master dan Detail Report ini, proses pembuatan Reportnya dimulai dari Detail Report dahulu baru kemudian membuat Master Reportnya.


    * **Proses Pembuatan Detail Report.**

Buatlah New Report dengan cara klik **File > New Document**, kemudian pada Report Name isikan **RptDetail** sedangkan pada Preset Sizes isikan **NOTE** dan pada Page Margin isikan **nilai 0 (nol) untuk Top, Bottom, Left dan Right** seperti gambar dibawah ini :
[![NewRptDetail](http://farm3.static.flickr.com/2395/2132579613_b9849682de_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2132579613/)

Setelah itu, simpanlah **RptDetail** ini pada direktori **Report/** yang telah dibuat pada langkah 2 diatas. Karena Detail Report ini akan digunakan untuk menampilkan data barang berdasarkan kode kategori, maka sekarang masukkanlah query yang akan mengambil data barang berdasarkan kode kategori yang diinginkan tersebut dan syntax sql untuk melakukan proses diatas adalah sebagai berikut :

    
    
    SELECT T_BARANG.kd_Barang, T_BARANG.nm_Barang FROM T_BARANG, T_KATEGORI WHERE T_BARANG.kd_Kategori = 'HAAP' GROUP BY T_BARANG.kd_Barang
    



Pada syntax sql diatas, kita membutuhkan 1 parameter supaya query ini berjalan dengan baik yaitu parameter kd_Kategori. Sekarang mari kita buat sebuah parameter di iReport yang berfungsi untuk menampung kd_Kategori tersebut dengan cara memilih menu **View > Parameters**, kemudian pada jendela Parameters tekanlah tombol New untuk menambahkan sebuah parameter baru. Setelah itu pada jendela **Add/Modify Parameters **isikanlah sebagai berikut :


      * Parameter Name **PRM_DETAIL_KDKATEGORI**


      * Parameter Class Type **java.lang.String**


      * Beri centang pada pilihan Use as a Prompt


seperti gambar dibawah ini:
[![PrmDetail](http://farm3.static.flickr.com/2078/2132579617_82284392eb_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2132579617/)

Setelah menambahkan parameter seperti diatas, sekarang masukkanlah query yang akan mengambil seluruh data barang berdasarkan kode kategori yang kita inginkan dengan cara pilihlah menu **Data > Report Query** kemudian isikan seperti gambar dibawah ini:
[![DetailRptQry](http://farm3.static.flickr.com/2116/2133348814_4f8e8c5c2b_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133348814/)

Seluruh konfigurasi untuk Detail Report telah selesai, sekarang design-lah tampilan Detail Reportnya seperti dibawah ini:
[![DesignDetailRpt](http://farm3.static.flickr.com/2017/2133340416_cb4df110e4_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133340416/)

Jika telah selesai, sekarang Compile-lah Detail Report-nya dengan cara memilih menu **Build > Compile** dan jika tidak ada kesalahan sekarang jalankanlah Detail Reportnya dengan menggunakan **Active Connection** yang bisa diakses di menu **Build > Execute (with active connection)**. Dan jika tidak ada kesalahan, maka tampilan Detail Report akan muncul seperti gambar dibawah ini:
[![RptDetailSukses](http://farm3.static.flickr.com/2186/2132607015_c36b4c47f8_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2132607015/)

Setelah memastikan bawha Detail Report sukses dijalankan, sekarang hilangkanlah tanda centang pada parameter **PRM_DETAIL_KDKATEGORI** seperti gambar dibawah ini:
[![DelCentangRptDetail](http://farm3.static.flickr.com/2010/2133340408_f26713f24e_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133340408/)

Setelah menghilangkan tanda centang, simpanlah Detail Reportnya kemudian Compile lagi dengan cara memilih **Build > Compile**.

Pembuatan detail report telah selesai, sekarang mari kita buat master reportnya :)



    * **Proses Pembuatan Master Report.**

Sekarang buatlah Master Reportnya dengan cara memilih menu **File > New Documents** kemudian pada Report Name isikan **RptMaster** kemudian tekan OK.

Setelah itu, simpanlah **RptMaster** ini pada direktori **Report/** yang telah dibuat pada langkah 2 diatas. Karena Master Report ini akan digunakan untuk menampilkan data kategori barang berdasarkan kode kategori yang diinputkan oleh user melalui program java yang kita buat, maka sekarang masukkanlah query yang akan mengambil data barang berdasarkan kode kategori tersebut dan syntax sql untuk melakukan proses diatas adalah sebagai berikut :

    
    
    SELECT * FROM `T_KATEGORI` T_KATEGORI WHERE kd_Kategori = 'VID'
    



Pada syntax sql diatas, kita membutuhkan 1 parameter supaya query ini berjalan dengan baik yaitu parameter **kd_Kategori**. Sekarang mari kita buat sebuah parameter di iReport yang berfungsi untuk menampung **kd_Kategori** tersebut dengan cara memilih menu **View > Parameters**, kemudian pada jendela Parameters tekanlah tombol New untuk menambahkan sebuah parameter baru. Setelah itu pada jendela **Add/Modify Parameters** isikanlah sebagai berikut :


      * Parameter Name **PRM_KD_KATEGORI**


      * Parameter Class Type **java.lang.String**


      * Beri centang pada pilihan Use as a Prompt


seperti gambar dibawah ini:
[![PrmMasterkdKat](http://farm3.static.flickr.com/2025/2132607009_481667b9f0_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2132607009/)

Setelah menambahkan parameter seperti diatas, sekarang masukkanlah query yang akan mengambil seluruh data kategori barang berdasarkan kode kategori yang kita inputkan dengan cara pilihlah menu **Data > Report Query** kemudian isikan seperti gambar dibawah ini:
[![QryMaster](http://farm3.static.flickr.com/2238/2132607011_d567e29323_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2132607011/)

Setelah itu, sekarang design-lah Master Report-nya seperti dibawah ini:
[![DesignMasterRpt](http://farm3.static.flickr.com/2264/2133348810_bfb25dd0f4_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133348810/)

Jika telah selesai sekarang coba jalankan dengan menggunakan **Active Connection**, dan jika tidak ada kesalahan maka Master Report akan tampil seperti gambar dibawah ini:
[![MasterRptOK1](http://farm3.static.flickr.com/2061/2132579611_0267095962_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2132579611/)

Setelah Master Report berjalan dengan baik, sekarang waktunya untuk mulai menambahkan Sub-Report atau Detail Report yang telah kita buat pada langkah sebelumnya kedalam Master Report. Untuk menambahkan Sub-Report, tekanlah tombol yang terdapat pada Toolbar seperti gambar dibawah ini:
[![AddSubRpt](http://farm3.static.flickr.com/2277/2133326486_2cc58f3da4.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133326486/)

Setelah menekan tombol Add SubReport, sekarang klik dan geretlah mouse kedalam detail area pada master report. Setelah selesai mengatur tempat dimana SubReport akan ditempatkan, maka secara otomatis akan muncul sebuah jendela pertanyaan yang menanyakan apakah kita ingin membuat report baru, menggunakan report yang sudah ada atau hanya membuat sebuah element subreport saja.

Pada jendela pertanyaan tersebut, pilihlah pilihan nomor 2 yaitu **Use an existing report**, kemudian tekanlah tombol **Browse** dan arahkan ke tempat dimana kita menyimpan Detail Report kita (RptDetail.jasper) seperti gambar dibawah ini:
[![AddSubRpt1](http://farm3.static.flickr.com/2357/2133326488_93a934e02c_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133326488/)

Setelah itu tekanlah tombol OK hingga tampilannya seperti dibawah ini:
[![AddSubRpt2](http://farm3.static.flickr.com/2233/2133326492_c7543bf91a_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133326492/)

Kemudian tekanlah tombol Next, kemudian pada jendela **Connection / DataSource parameters** pilihlah opsi **Use the same connection to fill the master ...** seperti gambar dibawah ini:
[![AddSubRpt3](http://farm3.static.flickr.com/2003/2133326496_bfd61c8b2e_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133326496/)

Pada jendela Subreport parameters, tekanlah Next karena parameter yang terdapat pada Detail Report akan otomatis terdeteksi. Setelah menekan tombol Next, maka jendela selanjutnya yang akan tampil adalah jendela **Subreport expression**. Pada jendela **SubReport expression** ini, pilihlah opsi yang pertama yaitu **Store the directory name in a parameter. ** seperti gambar dibawah ini:
[![AddSubRpt4](http://farm3.static.flickr.com/2229/2133326502_ed8efd60bf_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133326502/)

Setelah menekan tombol Finish, sekarang design-lah tampilan Master Report-nya hingga menjadi seperti gambar dibawah ini:
[![DesignMasterDetailRpt](http://farm3.static.flickr.com/2217/2133348808_955d3a0890_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133348808/)

Sebelum mulai menjalankan Master Reportnya, sekarang editlah dahulu **Default Value Expression** dari parameter **SUBREPORT_DIR** seperti gambar dibawah ini :
[![EditPrmSubRptDir1](http://farm3.static.flickr.com/2241/2133348820_da9489859e_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133348820/)

menjadi seperti gambar dibawah ini:
[![EditPrmSubRptDir2](http://farm3.static.flickr.com/2326/2133348824_b6ea39738c_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133348824/)

Setelah meng-edit parameter **SUBREPORT_DIR** menjadi seperti diatas, sekarang tambahkanlah sebuah parameter untuk Detail Report-nya. Parameter yang akan dikirim ke Detail Report ini adalah parameter kode kategori hasil dari proses query pada Master Report, mengapa kita perlu mengirimkan kode kategori ke Detail Report ? Karena Detail Report ini berfungsi untuk menampilkan data barang berdasarkan kode kategori yang telah ditampilkan di Master Report.

Karena pada proses pembuatan Detail Report diatas, kita sudah membuat sebuah parameter dengan nama **PRM_DETAIL_KDKATEGORI**. Maka sekarang tambahkanlah sebuah parameter yang akan diterima oleh Detail Report dengan cara klik kanan Sub-Report, kemudian pilihlah properties. Setelah jendela SubReport properties muncul, masuklah pada tab **Subreport (Other)** kemudian pada tab Subreport parameters isikanlah nilai seperti dibawah ini:
[![AddSubRptParam](http://farm3.static.flickr.com/2288/2133326498_a27f2af500_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133326498/)

Setelah menambahkan parameter untuk sub-reportnya, sekarang cobalah untuk menjalankannya dengan menggunakan **Active Connection**. Jika tidak ada langkah yang terlewati, seharusnya Master Detail Report anda akan tampil seperti gambar dibawah ini:
[![MasterDetailJadi](http://farm3.static.flickr.com/2026/2132579609_c999b9a505_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2132579609/)


Jika tampilan report yang ada dihadapan anda sudah seperti gambar diatas, sekarang waktunya untuk mulai memanggil report yang telah kita buat menggunakan iReport ini dari IDE NetBeans dan lanjut ke langkah ke 4 :)




  4. **Memanggil Master-Detail Report Dari Program Java.**

Sebelum melangkah ke tahapan selanjutnya, tambahkanlah dahulu library-library yang diperlukan untuk dapat menjalankan Report yang telah kita buat dengan iReport. Beberapa library yang dibutuhkan terlihat seperti gambar dibawah ini:
[![LibraryReport](http://farm3.static.flickr.com/2107/2132579605_2b80ced413_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2132579605/)
Note : Semua library tersebut, dapat diambil dari direktori lib/ tempat anda menginstal iReport.

Setelah menambahkan library-library yang dibutuhkan, sekarang buatlah sebuah JFrame baru dan tambahkanlah beberapa komponen sehingga nampak seperti gambar dibawah ini:
[![DesignFrame](http://farm3.static.flickr.com/2096/2133340418_d48882fb38_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133340418/)

Sedangkan untuk JComboBox, gantilah modelnya dengan cara klik kanan komponen JComboBox kemudian pada panel Properties pilihlah model. Setelah itu untuk isian Item, gantilah seluruh nilai default dengan AUD, HAAP dan VID hingga seperti gambar dibawah ini:
[![JComboBoxModel](http://farm3.static.flickr.com/2106/2132579603_92bee74593_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2132579603/)

Setelah mengganti model JComboBox, sekarang beri ActionEvent pada JButton yang berfungsi untuk menampilkan Reportnya dengan cara klik kanan pada JButton kemudian pilih Action > actionPerformed kemudian pastekan kode dibawah ini:

    
    
            this.setCursor(Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR));
    
            Properties systemProp = System.getProperties();
    
            // Ambil current dir
            String currentDir = systemProp.getProperty("user.dir");
    
            File dir = new File(currentDir);
            String reportName = "RptMaster.jrxml";
            String reportDirName = "Report";
    
            File fileRpt;
            String fullPath = "";
            if (dir.isDirectory()) {
                String[] isiDir = dir.list();
                for (int i = 0; i < isiDir.length; i++) {
                    fileRpt = new File(currentDir + File.separatorChar + isiDir[i] + File.separatorChar +
                            reportDirName + File.separatorChar + reportName);
    
                    if (fileRpt.isFile()) { // Cek apakah file RptMaster.jrxml ada
                        fullPath = fileRpt.toString();
                        System.out.println("Found Report File at : " + fullPath);
                    } // end if
                } // end for i
            } // end if
    
            // Ambil Direktori tempat file RptMaster.jrxml berada
            String[] subRptDir = fullPath.split(reportName);
            String reportDir = subRptDir[0];
            System.out.println("Report Directory at : " + reportDir);
    
            // Ambil Kode Kategori
            final String paramKdKategori = jComboBox1.getSelectedItem().toString();
            Connection con = null;
            try {
                String jdbcDriver = "com.mysql.jdbc.Driver";
                Class.forName(jdbcDriver);
                String url = "jdbc:mysql://localhost/rptmasterdetail";
                String user = "root";
                String pass = "rahasia";
    
                con = (Connection) DriverManager.getConnection(url, user, pass);
                Statement stm = (Statement) con.createStatement();
    
                // Persiapkan parameter untuk Report
                Map<string, Object> parameters = new HashMap<string, Object>();
                parameters.put("PRM_KD_KATEGORI", paramKdKategori);
                parameters.put("SUBREPORT_DIR", reportDir);
    
                try {
                    JasperReport JRpt = JasperCompileManager.compileReport(fullPath);
                    JasperPrint JPrint = JasperFillManager.fillReport(JRpt, parameters, con);
                    JasperViewer.viewReport(JPrint, false);
                } catch (Exception rptexcpt) {
                    System.out.println("Report Can't view because : " + rptexcpt);
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            this.setCursor(Cursor.getDefaultCursor());
    



Setelah menambahkan ActionEvent pada JButton, ada 1 langkah lagi yang harus dilakukan yaitu kopikan **file *.jrxml dan file *.jasper** yang terdapat pada direktori Report/ kedalam direkotri build/ dan dist/. Sedangkan cara untuk meng-kopikan secara otomatis yaitu dengan meng-edit file build.xml, untuk mengedit file build.xml bukalah menu Files Inspector kemudian klik kanan pada file build.xml seperti gambar dibawah ini:
[![EditBuildxml](http://farm3.static.flickr.com/2396/2133348818_fb5defb7a9_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2133348818/)

Setelah file build.xml terbuka, sekarang pastekanlah kode dibawah ini pada baris ke 68 :

    
    
    <target name="-post-compile">
            <mkdir dir="${build.dir}/Report"></mkdir>
            <copy todir="${build.dir}/Report">
                <fileset dir="Report/" includes="**/*.jrxml, **/*.jasper, **/*.gif"></fileset>
            </copy>
        </target>
    
        <target name="-post-jar">
            <mkdir dir="${dist.dir}/Report"></mkdir>
            <copy todir="${dist.dir}/Report">
                <fileset dir="Report/" includes="**/*.jrxml, **/*.jasper"></fileset>
            </copy>
        </target>
    



Setelah itu simpan kemudian coba jalankan dengan menekan tombol F6, dan jika tidak ada masalah maka Report yang telah kita buat akan ditampilkan dari program java kita seperti gambar dibawah ini:

[![hasilAkhirRpt](http://farm3.static.flickr.com/2163/2132607019_66bbb89eb1_m.jpg)  
Click to View Large Image](http://www.flickr.com/photos/10243554@N02/2132607019/)


Akhirnya berhasil juga memanggil Report yang mempunyai SubReport dari program Java yang kita buat dan yang lebih menyenangkan lagi kita sudah tidak perlu menyertakan full path dimana letak file Report berada.  :)

Resource :
- [Download sample project RptMasterDetail.zip](http://martin-personal-project.googlecode.com/files/RptMasterDetail.zip)
- [Download RptMasterDetail.sql](http://martin-personal-project.googlecode.com/files/RptMasterDetail.sql)
