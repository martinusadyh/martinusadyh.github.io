---
comments: true
date: 2008-10-01 20:19:30+00:00
layout: post
slug: bypass-print-dialog-at-jasper-report
title: ByPass Print Dialog at Jasper Report
wordpress_id: 33
categories:
- Java
- NetBeans
tags:
- jasper report
---

Buat teman-teman yang belum tahu bagaimana cara-nya mencetak laporan tanpa mengeluarkan print dialog di Jasper Report, mungkin tulisan ini bisa sedikit membantu teman-teman yang sedang kebingungan :) . Ok sebelum mulai latihannya, ada beberapa perlengkapan yang harus kita persiapkan dan perlengkapan yang digunakan pada tulisan kali ini yaitu :
1. [JDK 1.6_06](https://cds.sun.com/is-bin/INTERSHOP.enfinity/WFS/CDS-CDS_Developer-Site/en_US/-/USD/ViewProductDetail-Start?ProductRef=jdk-6u7-oth-JPR@CDS-CDS_Developer)
2. [NetBeans IDE 6.1](http://netbeans.org)
3. [Jasper Report 3.0.0](http://sourceforge.net/project/showfiles.php?group_id=36382&package_id=28579&release_id=600358)
4. [MySQL 5.0.51a](http://www.mysql.com/)

Pada tulisan kali ini, kita akan mencoba menambahkan fasilitas by pass print dialog ini di aplikasi yang sudah pernah dibuat pada tutorial [Membuat Master Detail Report](http://martinusadyh.web.id/2007/12/24/membuat-masterdetail-report-dengan-ireport/) kemarin.
<!-- more -->

Untuk teman-teman yang belum tahu bagaimana cara membuat report, silahkan baca dahulu tutorial [kemarin](http://martinusadyh.web.id/2007/12/24/membuat-masterdetail-report-dengan-ireport/). Dan untuk teman-teman yang sudah tahu, sekarang download-lah NetBeans Project dari tutorial kemarin [disini](http://martinusadyh.web.id/download/RptMasterDetail.zip). Setelah proses download selesai, sekarang ekstrak dan bukalah dari [NetBeans IDE](http://netbeans.org)

Karena library jasper report tidak ikut di sertakan pada tutorial kemarin, maka ketika teman-teman membuka NetBeans Project dari tutorial kemarin akan mengeluarkan pesan error seperti gambar dibawah ini :
[![Resolve](http://farm4.static.flickr.com/3291/2904764405_96f2b97cc5.jpg)  
Dialog Error Reference Problem](http://www.flickr.com/photos/10243554@N02/2904764405/)

Agar tidak terdapat masalah pada proses penambahan library yang akan teman-teman lakukan, sekarang editlah dahulu file **project.properties** yang terdapat pada direktori **_NamaProject/nbproject/project.properties_**. Carilah baris seperti dibawah ini :

    
    
    excludes=
    file.reference.commons-beanutils-1.7.jar=library/commons-beanutils-1.7.jar
    file.reference.commons-collections-2.1.jar=library/commons-collections-2.1.jar
    file.reference.commons-digester-1.7.jar=library/commons-digester-1.7.jar
    file.reference.commons-javaflow-20060411.jar=library/commons-javaflow-20060411.jar
    file.reference.commons-logging-1.0.2.jar=library/commons-logging-1.0.2.jar
    file.reference.jasperreports-2.0.2.jar=library/jasperreports-2.0.2.jar
    file.reference.jdt-compiler-3.1.1.jar=library/jdt-compiler-3.1.1.jar
    file.reference.jfreechart-1.0.0.jar=library/jfreechart-1.0.0.jar
    includes=**
    jar.compress=false
    javac.classpath=\
        ${libs.MySQLDriver.classpath}:\
        ${file.reference.commons-beanutils-1.7.jar}:\
        ${file.reference.commons-collections-2.1.jar}:\
        ${file.reference.commons-digester-1.7.jar}:\
        ${file.reference.commons-javaflow-20060411.jar}:\
        ${file.reference.jasperreports-2.0.2.jar}:\
        ${file.reference.jdt-compiler-3.1.1.jar}:\
        ${file.reference.commons-logging-1.0.2.jar}:\
        ${file.reference.jfreechart-1.0.0.jar}
    # Space-separated list of extra javac options
    javac.compilerargs=
    


Kemudian hapuslah seluruh reference ke library yang lama hingga menjadi seperti dibawah ini :

    
    
    excludes=
    includes=**
    jar.compress=false
    javac.classpath=\
        ${libs.MySQLDriver.classpath}:\
    # Space-separated list of extra javac options
    javac.compilerargs=
    



Setelah melakukan penyimpanan pada file **project.properties**, sekarang tambahkanlah library-library yang diperlukan dengan cara klik kanan node Library di Project Inspector kemudian pilih **Add JAR/Folder** seperti gambar dibawah ini:
[![AddLib](http://farm4.static.flickr.com/3172/2905609648_f36f014b94.jpg)  
Menambahkan library jasper report ke dalam NetBeans IDE](http://www.flickr.com/photos/10243554@N02/2905609648/)

Klo sudah, sekarang bukalah file FormReport kemudian tambahkanlah event pada button Print dengan cara klik kanan pada button Print kemudian pilih **Events > Action > actionPerformed[jButton3ActionPerformed]** seperti gambar dibawah ini :
[![AddEvent](http://farm4.static.flickr.com/3226/2904810135_50cba7b24d.jpg)  
Menambahkan event pada button print](http://www.flickr.com/photos/10243554@N02/2904810135/)

Sekarang gantilah baris dibawah ini :

    
    
        private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {
            // TODO add your handling code here:
            JOptionPane.showMessageDialog(null, "Maaf fasilitas ini belum aktif !!");
        }
    


menjadi seperti ini :

    
    
        private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {
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
                    // JasperViewer.viewReport(JPrint, false);
                    JasperPrintManager.printPage(JPrint, 0, false);
                } catch (Exception rptexcpt) {
                    System.out.println("Report Can't view because : " + rptexcpt);
                }
            } catch (Exception e) {
                System.out.println(e);
            }
            this.setCursor(Cursor.getDefaultCursor());
        }
    


**Note :

* Sesuaikan konfigurasi koneksi database dengan konfigurasi yang terdapat pada komputer anda.


* Tekan kombinasi tombol Ctrl+Shift+I untuk automatic import, jika terdapat baris kode yang berwarna merah
**

Setelah melakukan proses penyimpanan sekarang coba jalankanlah dengan menekan tombol F6 kemudian tekanlah tombol Print, dan jika tidak ada pesan kesalahan maka pada output Window akan menampilkan pesan seperti dibawah ini dan printer akan otomatis mencetak laporan kita tanpa mengeluarkan Print Dialog lagi :) :

    
    
    Found Report File at : /home/martin/Desktop/RptMasterDetail/dist/Report/RptMaster.jrxml
    Found Report File at : /home/martin/Desktop/RptMasterDetail/build/Report/RptMaster.jrxml
    Report Directory at : /home/martin/Desktop/RptMasterDetail/build/Report/
    



Happy NetBeaning All :)
