---
comments: true
date: 2009-09-04 19:57:50+00:00
layout: post
slug: playing-with-jtable-and-jcheckbox
title: Playing with JTable and JCheckBox
wordpress_id: 65
categories:
- Java
- NetBeans
tags:
- JTable
---

Sudah pernah mencoba menampilkan [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html) didalam [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html) ? Bagi sebagian teman-teman mungkin langsung berkata **"Itu kan gampang, tinggal tambahkan 1 kolom dengan tipe data Boolean kita sudah dapat menampilkan [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html) didalam [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html)"**, yups memang benar dan jawaban teman-teman sudah terdapat pada tutorial Java Swing :) Ok, sekarang mari kita bahas satu persatu bagaimana cara menampilkan [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html) didalam [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html). Untuk menampilkan [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html) didalam [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html), biasanya saya akan membuat sebuah Domain Class yang mempunyai tipe data boolean sesuai kata teman-teman seperti dibawah ini :

    
    
    public class Domain {
    
        private boolean data1;
        private boolean data2;
        private boolean data3;
        private boolean data4;
    
        // Automatic Generate Getter and Setter
    }
    



Nah setelah selesai membuat Domain seperti diatas, sekarang mari kita bikinkan tabel modelnya seperti dibawah ini :

    
    
    public class TableModelStandart extends AbstractTableModel {
    
        private final String[] HEADER = new String[]{"KOLOM1", "KOLOM2", "KOLOM3", "KOLOM4"};
        private List<domain> listDomain;
    
        public TableModelStandart(List<domain> listDomain) {
            this.listDomain = listDomain;
        }
    
        public int getRowCount() {
            return listDomain.size();
        }
    
        public int getColumnCount() {
            return HEADER.length;
        }
    
        @Override
        public String getColumnName(int column) {
            return HEADER[column];
        }
    
        @Override
        public Class getColumnClass(int columnIndex) {
            Class tipe = super.getColumnClass(columnIndex);
            if (columnIndex == 0) {
                tipe = Boolean.class;
            } else if (columnIndex == 1) {
                tipe = Boolean.class;
            } else if (columnIndex == 2) {
                tipe = Boolean.class;
            } else if (columnIndex == 3) {
                tipe = Boolean.class;
            }
    
            return tipe;
        }
    
        @Override
        public boolean isCellEditable(int rowIndex, int columnIndex) {
            if (columnIndex == 0) {
                return true;
            } else if (columnIndex == 1) {
                return true;
            } else if (columnIndex == 2) {
                return true;
            } else if (columnIndex == 3) {
                return true;
            } else {
                return false;
            }
        }
    
        public Object getValueAt(int rowIndex, int columnIndex) {
            Domain domain = listDomain.get(rowIndex);
            switch (columnIndex) {
                case 0:
                    return domain.isData1();
                case 1:
                    return domain.isData2();
                case 2:
                    return domain.isData3();
                case 3:
                    return domain.isData4();
                default:
                    return "";
            }
        }
    
        @Override
        public void setValueAt(Object aValue, int rowIndex, int columnIndex) {
            Domain model = listDomain.get(rowIndex);
            if (columnIndex == 0 && aValue instanceof Boolean) {
                model.setData1((Boolean) aValue);
            } else if (columnIndex == 1 && aValue instanceof Boolean) {
                model.setData2((Boolean) aValue);
            } else if (columnIndex == 2 && aValue instanceof Boolean) {
                model.setData3((Boolean) aValue);
            } else if (columnIndex == 3 && aValue instanceof Boolean) {
                model.setData4((Boolean) aValue);
            }
        }
    }
    


<!-- more -->
Pembuatan tabel model sudah selesai, sekarang saatnya mari kita coba :) Buatlah sebuah JFrame baru kemudian tambahkanlah komponen [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html) pada JFrame tersebut, setelah itu pindahlah ke **source mode** dengan menekan kombinasi tombol **CTRL+PAGE_UP/PAGE_DOWN**. Pada jendela **source mode** tambahkanlah 1 buah method yang akan mengisi [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html) dengan data **List Of Domain** seperti dibawah ini :

    
    
        private void initTable() {
            List<domain> listDomain = new ArrayList<domain>();
            for (int i=0; i<4; i++) {
                Domain dm = new Domain();
                dm.setData1(Boolean.FALSE);
                dm.setData2(Boolean.FALSE);
                dm.setData3(Boolean.FALSE);
                dm.setData4(Boolean.FALSE);
    
                listDomain.add(dm);
            }
    
            jTable1.setModel(new TableModelStandart(listDomain));
        }
    



Setelah semuanya siap, sekarang tambahkanlah didalam **constructor** JFrame yang telah dibuat, dan panggilah method **initTable()** dari dalam **constructor** seperti dibawah ini :

    
    
        public MainForm() {
            initComponents();
            initTable();
            setLocationRelativeTo(null);
        }
    



Sekarang coba jalankan dan kita akan mendapati tampilan seperti gambar dibawah ini :
[![gambar_jtable_jcheckbox_standart](http://farm3.static.flickr.com/2459/3887218513_c152c7c2cc_o.png)](http://www.flickr.com/photos/10243554@N02/3887218513/)

Mudah bukan ? Yups, karena secara _default_ [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html) akan me-render cell yang mempunyai tipe data Boolean dengan [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html). Jadi kita tinggal mengirimkan nilai Boolean saja ke [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html) dan biarkan [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html) sendiri yang mengurusi urusan rendering-nya :)

Tapi sekarang bagaimana kalau misalkan kita ingin menampilkan [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html) beserta dengan text-nya sekalian dan itu kita tampilkan didalam [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html) ? Karena tampilan [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html) yang standart adalah seperti gambar dibawah ini :
[![standart_jcheckbox](http://farm4.static.flickr.com/3504/3887218515_8115627df4_o.png)](http://www.flickr.com/photos/10243554@N02/3887218515/)

Kalau kita ingin membuat supaya [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html) kita berisi [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html) seperti gambar diatas, tentunya kita tidak bisa menggunakan cara pada langkah pertama diatas :) Nah agar kita dapat menampilkan [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html) beserta textnya pada [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html), langkah-langkah yang saya lakukan yaitu yang pertama yaitu membuat sebuah Domain Class yang akan dipakai. Domain Class ini mempunyai tipe data [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html) dan potongan kodenya adalah seperti dibawah ini :

    
    
    public class DomainCheckBox {
    
        private JCheckBox checkBox1;
        private JCheckBox checkBox2;
        private JCheckBox checkBox3;
        private JCheckBox checkBox4;
    
        // Generate getter and setter
    }
    



Setelah selesai membuat sebuah DomainClass, buatlah sebuah TableModel yang akan kita gunakan untuk menampilkan data-data yang kita masukkan. Sedangkan kode dari tablemodelnya adalah seperti dibawah ini :

    
    
    public class TableModelDomainCheckBox extends AbstractTableModel {
    
        private final String[] HEADER = new String[]{"KOLOM1", "KOLOM2", "KOLOM3", "KOLOM4"};
        private List<domaincheckbox> listDomain;
    
        public TableModelDomainCheckBox(List<domaincheckbox> listDomain) {
            this.listDomain = listDomain;
        }
    
        public int getRowCount() {
            return listDomain.size();
        }
    
        public int getColumnCount() {
            return HEADER.length;
        }
    
        @Override
        public String getColumnName(int column) {
            return HEADER[column];
        }
    
        @Override
        public boolean isCellEditable(int rowIndex, int columnIndex) {
            return true;
        }
    
        public Object getValueAt(int rowIndex, int columnIndex) {
            DomainCheckBox ds = listDomain.get(rowIndex);
            switch (columnIndex) {
                case 0:
                    return ds.getCheckBox1().getText();
                case 1:
                    return ds.getCheckBox2().getText();
                case 2:
                    return ds.getCheckBox3().getText();
                case 3:
                    return ds.getCheckBox4().getText();
                default:
                    return "";
            }
        }
    }
    



Karena kita tidak menggunakan renderer standart dari [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html), maka kita harus buat sendiri renderer yang fungsinya agar yang ditampilkan adalah [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html). Untuk membuat sebuah CellRenderer sendiri, buatlah sebuah class yang meng-implements **TableCellRenderer** dan **extends**-lah komponen yang ingin dijadikan sebagai CellRenderer agar tampilan dari Cell yang di render menampilkan komponen yang kita inginkan seperti kode dibawah ini :

    
    
    public class CheckBoxRenderer extends JCheckBox implements TableCellRenderer {
        private List<domaincheckbox> listCk;
    
        public CheckBoxRenderer(List<domaincheckbox> listCk) {
            this.listCk = listCk;
        }
    
        public Component getTableCellRendererComponent(JTable table,
                Object value,
                boolean isSelected,
                boolean hasFocus,
                int row, int column) {
    
            JCheckBox checkBox = null;
            for (DomainCheckBox ck : listCk) {
                if (ck.getCheckBox1().getText().equals((String) value)) {
                    checkBox = ck.getCheckBox1();
                } else  if (ck.getCheckBox2().getText().equals((String) value)) {
                    checkBox = ck.getCheckBox2();
                } else  if (ck.getCheckBox3().getText().equals((String) value)) {
                    checkBox = ck.getCheckBox3();
                } else  if (ck.getCheckBox4().getText().equals((String) value)) {
                    checkBox = ck.getCheckBox4();
                }
            }
    
            if (!isSelected) {
                setBackground(table.getBackground());
                setForeground(table.getForeground());
            } else {
                setBackground(table.getSelectionBackground());
                setForeground(table.getSelectionForeground());
            }
            return checkBox;
        }
    }
    



Sampai disini, [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html) sudah dapat menampilkan [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html) dengan sempurna beserta text yang kita inginkan. Tapi jika kita coba meng-klik salah satu JChecBox, tampilan pada [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html) kita akan menjadi seperti gambar dibawah ini :
[![buggy](http://farm3.static.flickr.com/2424/3887218501_f37ffbb71f_o.png)](http://www.flickr.com/photos/10243554@N02/3887218501/)

Hmm.. kenapa hasilnya koq bisa seperti gambar diatas ??? Jawabannya adalah karena kita belum menambahkan sebuah TableCellEditor yang fungsinya untuk mendeteksi komponen apa yang kita gunakan. Sekarang buatlah sebuah class yang meng-extends AbstractCellEditor dan meng-implements-kan TableCellEditor seperti kode dibawah ini :

    
    
    public class CheckBoxEditor extends AbstractCellEditor
            implements TableCellEditor {
    
        private JCheckBox currentValue;
        private List<domaincheckbox> listCk;
    
        public CheckBoxEditor(List<domaincheckbox> listCk) {
            this.listCk = listCk;
        }
    
        /** This method required by cell editor to get the cell current value */
        public Object getCellEditorValue() {
            return currentValue;
        }
    
        /** This method required by TableCellEditor to get which component i want
         * to use for the editor */
        public Component getTableCellEditorComponent(JTable table,
                Object value,
                boolean isSelected,
                int row,
                int column) {
    
            /* Mengambil last selected checkbox */
            for (DomainCheckBox ck : listCk) {
                if (ck.getCheckBox1().getText().equals((String) value)) {
                    currentValue = ck.getCheckBox1();
                } else if (ck.getCheckBox2().getText().equals((String) value)) {
                    currentValue = ck.getCheckBox2();
                }
            }
            return currentValue;
        }
    }
    



Setelah selesai membuat sebuah CellEditor, sekarang buatlah sebuah JFrame kemudian tambahkanlah komponen [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html) pada JFrame tersebut, setelah itu buatlah 1 method yang berfungsi untuk mengisi table model dan memasang CellRenderer dan CellEditor pada tabel kita seperti kode dibawah ini :

    
    
        private void initTable() {
            List<domaincheckbox> listCk = new ArrayList<domaincheckbox>();
            List<jcheckbox> listCheckBox = new ArrayList<jcheckbox>();
            for (int i = 0; i < 10; i++) {
                JCheckBox chk1 = new JCheckBox("K 1 B " + i);
                chk1.addActionListener(getActionListener("K 1 B " + i, chk1));
                JCheckBox chk2 = new JCheckBox("K 2 B " + i);
                chk2.addActionListener(getActionListener("K 2 B " + i, chk2));
                JCheckBox chk3 = new JCheckBox("K 3 B " + i);
                chk3.addActionListener(getActionListener("K 3 B " + i, chk3));
                JCheckBox chk4 = new JCheckBox("K 4 B " + i);
                chk4.addActionListener(getActionListener("K 4 B " + i, chk4));
    
                listCheckBox.add(chk1);
                listCheckBox.add(chk2);
                listCheckBox.add(chk3);
                listCheckBox.add(chk4);
    
                DomainCheckBox dc = new DomainCheckBox(chk1, chk2, chk3, chk4);
                listCk.add(dc);
            }
    
            jTable1.setModel(new TableModelDomainCheckBox(listCk));
            jTable1.getColumnModel().getColumn(0).setCellRenderer(new CheckBoxRenderer(listCk));
            jTable1.getColumnModel().getColumn(0).setCellEditor(new CheckBoxEditor(listCk));
            jTable1.getColumnModel().getColumn(1).setCellRenderer(new CheckBoxRenderer(listCk));
            jTable1.getColumnModel().getColumn(1).setCellEditor(new CheckBoxEditor(listCk));
        }
    
        private ActionListener getActionListener(final String message, final JCheckBox chk) {
            ActionListener actionListener = new AbstractAction() {
    
                public void actionPerformed(ActionEvent e) {
                    if (chk.isSelected()) {
                        System.out.println("Message From [selected] : " + message);
                    } else {
                        System.out.println("Message From [unselected] : " + message);
                    }
                }
            };
    
            return actionListener;
        }
    



Dan langkah terakhir yaitu, panggillah method **initTable()** dari dalam **constructor** seperti kode dibawah ini :

    
    
        public MainForm() {
            initComponents();
            initTable();
        }
    



Sekarang coba jalankan dengan menekan kombinasi tombol **SHIFT+F6** dan jika tidak ada pesan error, maka kita akan melihat tampilan seperti gambar dibawah ini:
[![hasil_akhir](http://farm3.static.flickr.com/2569/3888032694_d2eae26bb0_o.png)](http://www.flickr.com/photos/10243554@N02/3888032694/)

dan coba lihat pada terminal, jika kita mencoba melakukan proses select pada salah 1 [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html) maka akan menampilkan pesan seperti tampilan dibawah ini:

    
    
    Message From [selected] : K 1 B 0
    Message From [selected] : K 2 B 4
    Message From [selected] : K 2 B 1
    



Ok mudah bukan ?? :) Yang perlu diperhatikan disini yaitu adalah :
- Buatlah sebuah **TableCellRenderer** untuk merender [JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html) agar menampilkan komponen yang kita inginkan.
- Jika kita perlu melakukan proses editing pada cell yang kita render maka, buatlah sebuah TableCellEditor yang meng-extends komponen yang kita tampilkan untuk mengambil komponen yang kita gunakan di TableCellRenderer.

**Link-link terkait : **
- [Download Sample Project JTable_and_JCheckBox.zip](http://martin-personal-project.googlecode.com/files/JTableJCheckBox.zip)
- [SVN Access Sample ProjectJTable and JCheckBox](http://code.google.com/p/martin-personal-project/source/browse/#svn/trunk/java/jtable-checkbox/JTableJCheckBox)
- [Tutorial JTable](http://java.sun.com/docs/books/tutorial/uiswing/components/table.html)
- [JCheckBox](http://java.sun.com/docs/books/tutorial/uiswing/components/button.html)
- [SubVersion Mudah Dengan RabbitVCS](http://martinusadyh.web.id/2010/03/13/subversion-mudah-dengan-rabbitvcs/)
**Tulisan ini dibuat untuk menyukseskan [Lomba Blog Open Source](http://www.informatika.lipi.go.id/seminar/lombablog/) P2I-LIPI dan [Seminar Open Source](http://www.informatika.lipi.go.id/seminar/) P2I-LIPI 2009. **
