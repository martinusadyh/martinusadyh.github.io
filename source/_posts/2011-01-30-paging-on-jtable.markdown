---
comments: true
date: 2011-01-30 19:43:45+00:00
layout: post
slug: paging-on-jtable
title: Paging On JTable
wordpress_id: 1196
categories:
- DataBase
- Java
- NetBeans
tags:
- Java
- java swing
- MySQL
- NetBeans
- Table Paging
---

Sedang mencari solusi **Paging di JTable** ? Jika iya, pada posting kali ini kita akan mencoba membuat supaya **JTable** pada aplikasi kita mendukung **pagination** :D Niat awal sih sebenarnya ingin menjadikan **Table Paging** ini menjadi sebuah komponen yang tinggal **"drag and drop"** saja untuk menggunakan-nya, tapi apa daya sampai sekarang juga belum jadi-jadi komponen-nya :D

Pembuatan **Table Paging** ini semuanya terinspirasi dari komponen javascript untuk jQuery bernama [Flexigrid](http://www.flexigrid.info/) yang tampilan-nya kurang lebih seperti gambar dibawah ini :
[![flexigrid](http://farm6.static.flickr.com/5052/5400874631_7bfb733fcf.jpg)](http://www.flickr.com/photos/10243554@N02/5400874631/)  
**Tampilan Paging Flexigrid**

Sedangkan tampilan **JTable** yang akan kita buat kurang lebih seperti gambar dibawah ini :
[![Screenshot](http://farm6.static.flickr.com/5171/5400874633_7c2390d82a.jpg)](http://www.flickr.com/photos/10243554@N02/5400874633/)  
**Tampilan Paging on JTable**

Pada posting kali ini, kita akan coba meng-implementasikan **Table Paging** ini menggunakan **JDBC** dan **Hibernate**. Untuk yang tidak menggunakan **JDBC** maupun **Hibernate**, saya rasa juga tidak akan begitu kesulitan karena tinggal mengganti sintaks query-nya saja :D Dan database yang digunakan pada posting kali ini adalah MySQL :)
<!-- more -->
Ok sebelum mulai latihan-nya, sekarang downloadlah dahulu contoh database-nya. Contoh database ini hanya mempunyai 1 table yaitu **wp_comments** dan mempunyai record sejumlah 1303 baris. Untuk contoh database beserta tabelnya bisa didownload [disini](http://martin-personal-project.googlecode.com/files/table_paging.sql), dan jika sudah selesai sekarang restore dengan cara jalankan perintah dibawah ini pada **Command Prompt** ataupun **Console** :

    
    
    martinus@martinusadyh:[~]$ mysql -u root -padmin < table_paging.sql
    martinus@martinusadyh:[~]$ 
    



Nah jika sudah, sekarang bukalah NetBeans IDE dan buatlah 4 buah project yaitu **domain,service,service.impl dan ui** kurang lebih seperti gambar dibawah ini :
[![StrukturProject](http://farm6.static.flickr.com/5299/5401141101_59a8e445f1.jpg)](http://www.flickr.com/photos/10243554@N02/5401141101/)  
**Contoh Struktur Project**

Sebelum mulai lebih lanjut, sekarang tambahkanlah dahulu beberapa library yang diperlukan oleh ke empat project diatas seperti gambar dibawah ini :
[![LibraryDomain](http://farm6.static.flickr.com/5133/5401949258_c80289c9b4.jpg)](http://www.flickr.com/photos/10243554@N02/5401949258/)  
**Library Project Domain**

[![LibraryService](http://farm6.static.flickr.com/5172/5401949260_fc9941c546.jpg)](http://www.flickr.com/photos/10243554@N02/5401949260/)  
**Library Project Service**

[![LibraryServiceImpl](http://farm6.static.flickr.com/5094/5401949264_dfa27ae237.jpg)](http://www.flickr.com/photos/10243554@N02/5401949264/)  
**Library Project Service Impl**

[![LibraryUI1](http://farm6.static.flickr.com/5051/5401949266_b4f56e6cdd.jpg)](http://www.flickr.com/photos/10243554@N02/5401949266/)  
**Library Project UI**

[![LibraryUI2](http://farm6.static.flickr.com/5217/5401949268_2045053900.jpg)](http://www.flickr.com/photos/10243554@N02/5401949268/)  
**Lanjutan Library Project UI**

Jika library yang diperlukan sudah ditambahkan seperti gambar diatas, sekarang buatlah sebuah **domain class** dengan nama `WPComment.java` pada project `com.artivisi.sample.tablepaging.domain` dengan isi kurang lebih seperti berikut :

``` java
package com.artivisi.sample.tablepaging.domain.hibernate;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author Martinus Ady H <martinus@artivisi.com>
 */
@Entity
@Table(name="wp_comments")
public class WPComment implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id @Column(name="comment_ID")
    private Integer commentID;
    @Column(name="comment_author")
    private String commentAuthor;
    
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    @Column(name="comment_date")
    private Date commentDate;
    
    @Column(name="comment_content")
    private String commentContent;
    
    // auto generate getter and setter
}
```
**Note: Klik [WPComment.java](https://github.com/martinusadyh/artivisi-farm-server/blob/master/table-paging/com.artivisi.sample.tablepaging.domain/src/com/artivisi/sample/tablepaging/domain/hibernate/WPComment.java) untuk melihat source code lengkap.**

Setelah selesai dengan masalah **domain class**, sekarang buatlah sebuah interface dengan nama `TablePagingService.java` pada project `com.artivisi.sample.tablepaging.service` yang berfungsi sebagai service layer kita. Sedangkan kode-nya kurang lebih seperti dibawah ini :

``` java
package com.artivisi.sample.tablepaging.service;

import com.artivisi.sample.tablepaging.domain.hibernate.WPComment;
import java.util.List;

/**
 *
 * @author Martinus Ady H <martinus@artivisi.com>
 */
public interface TablePagingService {

    public List<wpcomment> findAllComment(Integer pageNumber, Integer rowsPerPage);

    public Integer countComments();
}
``` 
**Note: Klik [TablePagingService.java](https://github.com/martinusadyh/artivisi-farm-server/blob/master/table-paging/com.artivisi.sample.tablepaging.service/src/com/artivisi/sample/tablepaging/service/TablePagingService.java) untuk melihat source code lengkap.**

Karena pada tulisan ini kita akan menggunakan **JDBC** dan **Hibernate**, maka kita harus membuat 2 buah implementasi pada project `com.artivisi.sample.tablepaging.service.impl` untuk **JDBC** dan **Hibernate**. Dibawah ini adalah contoh implementasi untuk **JDBC** yang kodenya kurang lebih seperti berikut :

``` java
package com.artivisi.sample.tablepaging.service.impl.jdbc;

import com.artivisi.sample.tablepaging.domain.hibernate.WPComment;
import com.artivisi.sample.tablepaging.service.TablePagingService;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Martinus Ady H <martinus@artivisi.com>
 */
public class TablePagingServiceJDBC implements TablePagingService {

    private final String COUNT_QRY = "select count(*) from wp_comments";
    private final String FIND_ALL_QRY = "select * from wp_comments limit ?,?";

    private PreparedStatement preparedCount;
    private PreparedStatement preparedFindAll;

    private Connection connection;

    public TablePagingServiceJDBC(Connection con) throws SQLException {
        this.connection = con;
        preparedCount = connection.prepareStatement(COUNT_QRY);
        preparedFindAll = connection.prepareStatement(FIND_ALL_QRY);
    }

    public List<wpcomment> findAllComment(Integer pageNumber, Integer rowsPerPage) {
        try {
            List<wpcomment> listWP = new ArrayList<wpcomment>();
            preparedFindAll.setInt(1, (rowsPerPage*(pageNumber-1)));
            preparedFindAll.setInt(2, rowsPerPage);
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
            Logger.getLogger(TablePagingServiceJDBC.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public Integer countComments() {
        try {
            Integer totalRows = 0;
            ResultSet rs = preparedCount.executeQuery();
            while (rs.next()) {
                totalRows = rs.getInt("count(*)");
            }
            return totalRows;
        } catch (SQLException ex) {
            Logger.getLogger(TablePagingServiceJDBC.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }
}
```
**Note: Klik [TablePagingServiceJDBC.java](https://github.com/martinusadyh/artivisi-farm-server/blob/master/table-paging/com.artivisi.sample.tablepaging.service.impl/src/com/artivisi/sample/tablepaging/service/impl/jdbc/TablePagingServiceJDBC.java) untuk melihat source code lengkap.**

Sedangkan implementasi untuk **Hibernate** kurang lebih seperti berikut :

``` java
package com.artivisi.sample.tablepaging.service.impl;

import com.artivisi.sample.tablepaging.domain.hibernate.WPComment;
import com.artivisi.sample.tablepaging.service.TablePagingService;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Martinus Ady H <martinus@artivisi.com>
 */
@Service("tablePagingService")
@Transactional
public class TablePagingServiceHibernate implements TablePagingService {

    @Autowired private SessionFactory sessionFactory;

    public List<wpcomment> findAllComment(Integer pageNumber, Integer rowsPerPage) {
        return sessionFactory.getCurrentSession()
                .createQuery("from WPComment wp")
                .setFirstResult(rowsPerPage*(pageNumber-1))
                .setMaxResults(rowsPerPage)
                .list();
    }

    public Integer countComments() {
        Long totalRow = (Long) sessionFactory.getCurrentSession()
                .createQuery("select count(*) from WPComment wp")
                .uniqueResult();

        return totalRow.intValue();
    }
}
```
**Note: Klik [TablePagingServiceHibernate.java](https://github.com/martinusadyh/artivisi-farm-server/blob/master/table-paging/com.artivisi.sample.tablepaging.service.impl/src/com/artivisi/sample/tablepaging/service/impl/TablePagingServiceHibernate.java) untuk melihat source code lengkap.**

Setelah urusan dengan **backend** selesai, sekarang mari kita fokus pada masalah di sisi UI :) Pada proejct `com.artivisi.sample.tablepaging.ui`, buatlah dahulu 3 buah file untuk inisialisasi **Spring Framework** dan **Hibernate**-nya. Ketiga buah file tersebut yaitu `applicationContext.xml` yang isinya kurang lebih seperti berikut :

``` xml
<beans xmlns="http://www.springframework.org/schema/beans" xmlns:tx="http://www.springframework.org/schema/tx" xmlns:p="http://www.springframework.org/schema/p" xmlns:context="http://www.springframework.org/schema/context" xmlns:util="http://www.springframework.org/schema/util" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemalocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
          http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-3.0.xsd
          http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-3.0.xsd
          http://www.springframework.org/schema/util http://www.springframework.org/schema/util/spring-util-3.0.xsd
">
    <context:component-scan base-package="com.artivisi.sample.tablepaging.service"></context:component-scan>
    <context:property-placeholder location="classpath:jdbc.properties"></context:property-placeholder>
    <context:annotation-config></context:annotation-config>
    <tx:annotation-driven></tx:annotation-driven>

    <bean p:driverclassname="${jdbc.driver}" class="org.apache.commons.dbcp.BasicDataSource" p:url="${jdbc.url}" p:username="${jdbc.username}" p:password="${jdbc.password}" id="dataSource"></bean>

    <bean p:datasource-ref="dataSource" p:configlocation="classpath:hibernate.cfg.xml" id="sessionFactory" class="org.springframework.orm.hibernate3.annotation.AnnotationSessionFactoryBean">
        <property name="hibernateProperties">
            <props>
                <prop key="hibernate.dialect">
                    ${hibernate.dialect}
                </prop>
            </props>
        </property>
    </bean>

    <bean p:sessionfactory-ref="sessionFactory" id="transactionManager" class="org.springframework.orm.hibernate3.HibernateTransactionManager"></bean>
</beans>
```
yang kedua yaitu file `hibernate.cfg.xml` yang isinya kurang lebih seperti dibawah ini :

``` xml    
<hibernate-configuration>
  <session-factory>
    <property name="hibernate.dialect">org.hibernate.dialect.MySQLInnoDBDialect</property>
    <property name="hibernate.hbm2ddl.auto">update</property>
    <property name="hibernate.show_sql">true</property>
    <property name="hibernate.format_sql">true</property>

    
    <mapping class="com.artivisi.sample.tablepaging.domain.hibernate.WPComment"></mapping>
  </session-factory>
</hibernate-configuration>
```

dan yang terakhir adalah file `jdbc.properties` yang isinya kurang lebih seperti dibawah ini :

``` properties
# To change this template, choose Tools | Templates
# and open the template in the editor.
jdbc.username=root
jdbc.password=admin
jdbc.url=jdbc:mysql://localhost:3306/table_paging
jdbc.driver=com.mysql.jdbc.Driver
hibernate.dialect=org.hibernate.dialect.MySQLInnoDBDialect
```

Simpan ke 3 file tersebut pada project `com.artivisi.sample.tablepaging.ui` seperti gambar dibawah ini :

[![FileKonfigurasiSpringHibernate](http://farm6.static.flickr.com/5053/5402028584_2e872dc9a9.jpg)](http://www.flickr.com/photos/10243554@N02/5402028584/)  
**Simpan file applicationContext.xml, hibernate.cfg.xml dan jdbc.properties pada root direktori src**

Jika sudah, sekarang buatlah sebuah **Main class** yang mempunyai fungsi sebagai inisialisasi awal aplikasi kita yang isinya kurang lebih seperti kode dibawah ini :

``` java    
package com.artivisi.sample.tablepaging.ui;

import com.artivisi.sample.tablepaging.service.TablePagingService;
import com.artivisi.sample.tablepaging.service.impl.jdbc.TablePagingServiceJDBC;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.sql.SQLException;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author Martinus Ady H <martinus@artivisi.com>
 */
public class Main {

    private static TablePagingService tablePagingService;
    private static Boolean jdbcMode = Boolean.FALSE;

    public static TablePagingService getTablePagingService() {
        return tablePagingService;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) throws SQLException {
        if (!jdbcMode) {
            ApplicationContext appCtx = new ClassPathXmlApplicationContext(
                    "classpath:applicationContext.xml");

            tablePagingService = (TablePagingService) appCtx.getBean("tablePagingService");
        } else {
            MysqlDataSource dataSource = new MysqlDataSource();
            dataSource.setUser("root");
            dataSource.setPassword("admin");
            dataSource.setDatabaseName("table_paging");
            dataSource.setServerName("localhost");
            dataSource.setPortNumber(3306);
            
            tablePagingService = new TablePagingServiceJDBC(dataSource.getConnection());
        }
        
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
                } catch (ClassNotFoundException ex) {
                } catch (InstantiationException ex) {
                } catch (IllegalAccessException ex) {
                } catch (UnsupportedLookAndFeelException ex) {
                }
            }
        });
    }
}
```

Setelah selesai membuat sebuah **Main class**, sekarang buatlah dahulu sebuah table model dengan nama `CommentTableModel.java` yang berfungsi untuk menampung data yang berasal dari database yang kodenya kurang lebih seperti dibawah ini :

``` java
package com.artivisi.sample.tablepaging.ui;

import com.artivisi.sample.tablepaging.domain.hibernate.WPComment;
import java.util.List;
import javax.swing.table.AbstractTableModel;

/**
 *
 * @author Martinus Ady H <martinus@artivisi.com>
 */
public class CommentTableModel extends AbstractTableModel {
    private static final long serialVersionUID = 1L;

    private final String[] HEADER = new String[] {
        "#", "ID", "AUTHOR", "DATE", "CONTENT"
    };
    
    private List<wpcomment> wPComments;

    public CommentTableModel(List<wpcomment> wPComments) {
        this.wPComments = wPComments;
    }

    public int getRowCount() {
        return wPComments.size();
    }

    public int getColumnCount() {
        return HEADER.length;
    }

    @Override
    public String getColumnName(int column) {
        return HEADER[column];
    }

    public Object getValueAt(int rowIndex, int columnIndex) {
        WPComment comment = wPComments.get(rowIndex);
        switch (columnIndex) {
            case 0: return rowIndex+1;
            case 1: return comment.getCommentID();
            case 2: return comment.getCommentAuthor();
            case 3: return comment.getCommentDate();
            case 4: return comment.getCommentContent();
            default: return "";
        }
    }
}
```

Setelah membuat sebuah table model, sekarang buatlah sebuah **JFrame** dengan nama `MainForm.java` yang mempunyai tampilan seperti gambar dibawah ini :
[![DesignForm](http://farm6.static.flickr.com/5098/5401313671_7217162b8a.jpg)](http://www.flickr.com/photos/10243554@N02/5401313671/)  
**Design Form**

Pada design form diatas terdapat 5 buah tombol yaitu `btnFirst, btnPrevious, btnNext, btnLast` dan `btnRefresh`. Sebelum menambahkan event pada setiap tombol diatas, sekarang buatlah 4 buah variable yaitu `totalRows, pageNumber, totalPage` dan `rowsPerPage` pada `MainForm.java` seperti dibawah ini :

``` java    
public class MainForm extends javax.swing.JFrame {
    private static final long serialVersionUID = 1L;

    // paging utility
    private Integer totalRows = 0;
    private Integer pageNumber = 1;
    private Integer totalPage = 1;
    private Integer rowsPerPage = 15;

    /** Creates new form MainForm */
    public MainForm() {
        initComponents();
        setLocationRelativeTo(null);
    }
    ....
    ....
}
```

Jika sudah, sekarang buatlah sebuah method dengan nama `autoResizeColumn(JTable jTable1)` pada `MainForm.java` yang fungsinya untuk melebarkan kolom sesuai dengan isi pada tabel yang kurang lebih kode-nya seperti dibawah ini :

``` java
....
....
private void autoResizeColumn(JTable jTable1) {
	JTableHeader header = jTable1.getTableHeader();
	int rowCount = jTable1.getRowCount();
	
	final Enumeration columns = jTable1.getColumnModel().getColumns();
	while(columns.hasMoreElements()){
		TableColumn column = (TableColumn)columns.nextElement();
		int col = header.getColumnModel().getColumnIndex(column.getIdentifier());
		int width = (int)jTable1.getTableHeader().getDefaultRenderer()
				.getTableCellRendererComponent(jTable1, column.getIdentifier()
						, false, false, -1, col).getPreferredSize().getWidth();
		
		for(int row = 0; row<rowCount; row++){
			int preferedWidth = (int)jTable1.getCellRenderer(row, col).getTableCellRendererComponent(jTable1,
					jTable1.getValueAt(row, col), false, false, row, col).getPreferredSize().getWidth();
			width = Math.max(width, preferedWidth);
		}
		header.setResizingColumn(column); // this line is very important
		column.setWidth(width+jTable1.getIntercellSpacing().width);
	}
}
....
....
```

Setelah membuat sebuah method untuk konfigurasi lebar kolom pada `JTable` diatas, sekarang buatlah sebuah method dengan nama `initDefaultValue()` tepat dibawah method `autoResizeColumn(JTable jTable1)` yang mempunyai fungsi untuk mengambil data ke database yang kodenya kurang lebih seperti dibawah ini :

``` java
....
....
private void initDefaultValue() {
	rowsPerPage = Integer.valueOf(cmbPageSize.getSelectedItem().toString());
	totalRows = Main.getTablePagingService().countComments();
	Double dblTotPage = Math.ceil(totalRows.doubleValue()/rowsPerPage.doubleValue());
	totalPage = dblTotPage.intValue();
	if (pageNumber == 1) {
		btnFirst.setEnabled(false);
		btnPrevious.setEnabled(false);
	} else {
		btnFirst.setEnabled(true);
		btnPrevious.setEnabled(true);
	}
	
	if (pageNumber.equals(totalPage)) {
		btnNext.setEnabled(false);
		btnLast.setEnabled(false);
	} else {
		btnNext.setEnabled(true);
		btnLast.setEnabled(true);
	}
	
	txtPageNumber.setText(String.valueOf(pageNumber));
	lblPageOf.setText(" of " + totalPage + " ");
	lblTotalRecord.setText("Total Record " + totalRows + " rows.");
	
	List<wpcomment> wPComments = Main.getTablePagingService().findAllComment(pageNumber, rowsPerPage);
	jTable1.setModel(new CommentTableModel(wPComments));
	autoResizeColumn(jTable1);
}
....
....
```

Setelah selesai, sekarang waktunya untuk menambahkan event pada ke 5 buah tombol yang sebelumnya sudah kita buat. Sedangkan event untuk ke 5 buah tombol diatas kodenya kurang lebih seperti potongan kode dibawah ini :

``` java    
....
....
private void btnFirstActionPerformed(java.awt.event.ActionEvent evt) {                                         
	pageNumber = 1;
	initDefaultValue();
}

private void btnPreviousActionPerformed(java.awt.event.ActionEvent evt) {                                            
	if (pageNumber > 1) {
        pageNumber -= 1;
        initDefaultValue();
    }
}   

private void btnNextActionPerformed(java.awt.event.ActionEvent evt) {                                        
	if (pageNumber < totalPage) {
		pageNumber += 1;
		initDefaultValue();
	}
}

private void btnLastActionPerformed(java.awt.event.ActionEvent evt) {                                        
	pageNumber = totalPage;
	initDefaultValue();
}                                       

private void btnRefreshActionPerformed(java.awt.event.ActionEvent evt) {                                           
	initDefaultValue();
}   
....
....
```

Sampai disini proses pembuatan UI sudah hampir selesai, langkah terakhir yang perlu kita lakukan yaitu menambahkan launcher pada class `Main.java` agar memanggil class `MainForm.java`. Untuk melakukan hal ini, sekarang tambahkanlah **statement** `new MainForm().setVisible(true);` pada file `Main.java` hingga kode kita menjadi seperti dibawah ini :

``` java
package com.artivisi.sample.tablepaging.ui;

import com.artivisi.sample.tablepaging.service.TablePagingService;
import com.artivisi.sample.tablepaging.service.impl.jdbc.TablePagingServiceJDBC;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.sql.SQLException;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author Martinus Ady H <martinus@artivisi.com>
 */
public class Main {

    private static TablePagingService tablePagingService;
    private static Boolean jdbcMode = Boolean.FALSE;

    public static TablePagingService getTablePagingService() {
        return tablePagingService;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) throws SQLException {
        if (!jdbcMode) {
            ApplicationContext appCtx = new ClassPathXmlApplicationContext(
                    "classpath:applicationContext.xml");

            tablePagingService = (TablePagingService) appCtx.getBean("tablePagingService");
        } else {
            MysqlDataSource dataSource = new MysqlDataSource();
            dataSource.setUser("root");
            dataSource.setPassword("admin");
            dataSource.setDatabaseName("table_paging");
            dataSource.setServerName("localhost");
            dataSource.setPortNumber(3306);
            
            tablePagingService = new TablePagingServiceJDBC(dataSource.getConnection());
        }
        
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
}
```

Nah sampai disini sekarang kita tinggal menjalankan projectnya dengan cara menekan tombol **F6** dan jika tidak ada pesan kesalahan maka harusnya kita sudah bisa melihat tampilan table kita seperti gambar dibawah ini :

[![Screenshot](http://farm6.static.flickr.com/5171/5400874633_7c2390d82a.jpg)](http://www.flickr.com/photos/10243554@N02/5400874633/)  
**Tampilan Paging on JTable**

Bagaimana ? Mudah bukan ? :D Mungkin solusi ini masih kurang elegan, tapi ya mari di diskusikan bagaimana baiknya :D :) Jika ada yang ingin bertanya, silahkan langsung tanya saja pada kolom komentar ya :)

**Referensi-referensi :**

  * [Membuat Menu Login di Java Swing Dengan Animasi Progress Bar](http://martinusadyh.web.id/2009/11/09/membuat-menu-login-di-java-swing-dengan-animasi-progress-bar/)

  * [Lebih Dekat Dengan Class SwingWorker](http://martinusadyh.web.id/2009/11/07/lebih-dekat-dengan-class-swingworker/)

  * [Swing Component Focus Handler Using KeyStroke Editor](http://martinusadyh.web.id/2009/07/03/swing-component-focus-handler-using-keystroke-editor/)
  
  * [DropDown Button di Java Swing](http://martinusadyh.web.id/2008/09/09/dropdownbutton-di-java-swing/)

