---
comments: true
date: 2010-10-22 17:42:04+00:00
layout: post
slug: apa-itu-transaksi
title: Apa Itu Transaksi?
wordpress_id: 1043
categories:
- DataBase
tags:
- DataBase
- MySQL
- Oracle
- PostgreSQL
---

## Apa Itu Transaksi?


**oleh : Steven Haryanto**

Artikel ini hendak memperkenalkan konsep transaksi kepada mereka yang masih asing dengannya. Berhubung transaksi baru diperkenalkan di MySQL sekitar 2 tahun lalu, masih banyak penggunanya yang tidak pernah mengenal fasilitas yang sebetulnya amat penting ini. Begitu database kita sudah mengandung data yang cukup penting bukan sekedar berisi posting komentar pengunjung situs yang bisa dihapus kapan saja, misalnya atau begitu kita menginginkan stabilitas dan konsistensi dan tidak ingin waktu demi waktu harus memperbaiki record yang ngaco, misalnya maka kita harus memahami transaksi.



## Contoh Pertama


Setiap kali orang menerangkan tentang transaksi database, contoh yang biasanya diambil adalah nyaris selalu tentang transaksi di bank, khususnya tentang seorang nasabah yang menyimpan sejumlah uang di rekening tabungannya, atau memindahkan uang dari rekening cek ke tabungan. Saya akan meneruskan tradisi ini karena memang contoh tersebut pas sekali menekankan pentingnya sebuah transaksi.

Anggaplah kita seorang nasabah untuk sebuah bank bernama Mandi Sendiri jelas bukan bank dengan aset terbesar di Indonesia karena ternyata dia sudah merasa cukup dengan hanya memakai Python dan MySQL. Tiga buah tabel di database bank ini skemanya sebagai berikut (telah disederhanakan):

    
    
    # mencatat daftar transaksi
    CREATE TABLE trans (
        id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        tgl DATETIME,
        ket varchar(255) NOT NULL,
        teller_id SMALLINT NOT NULL
    );
    
    # jurnal kredit tabungan
    CREATE TABLE jtabungan (
        trans_id BIGINT NOT NULL,
        norek_nasabah INT NOT NULL,
        jumlah DOUBLE NOT NULL
    );
    
    # jurnal kas bank
    CREATE TABLE jkas (
        trans_id BIGINT NOT NULL,
        jumlah DOUBLE NOT NULL
    );
    


<!-- more -->
Nah, jika misalnya Anda datang ke kantor cabang BMS lalu menyerahkan uang sebesar Rp 500.000,- kepada teller, apa yang akan terjadi? Pertama, teller akan menghitung uang tersebut. Jumlahnya benar. Dia lalu memilih menu transaksi **Tabungan > Setor** di layar komputernya. Teller memasukkan nomor rekening Anda, jumlah uang, dan menekan tombol Proses. Program Python yang menerima masukan ini lalu menjalankan perintah-perintah berikut:

    
    
    c = db.cursor()
    c.execute("""INSERT INTO trans (tgl,ket,teller_id) 
         VALUES (NOW(),%s,%s)""", ('SETORAN TUNAI',teller_id))
    trans_id = c.insert_id()
    c.execute("""INSERT INTO jkas (trans_id,jumlah) VALUES (%s,%s)""", (trans_id,jumlah))
    c.execute("""INSERT INTO jtabungan (trans_id,norek_nasabah,jumlah) 
         VALUES (%s,%s,%s)""", (trans_id,norek_nasabah,-jumlah))
    show_message("Sukses")
    



Kode di atas mengambil nomor transaksi baru (baris 2–4), lalu mendebet rekening kas (baris 5) dan mengkredit rekening tabungan (baris 6–7). Ingat bahwa dalam akuntansi, setiap transaksi hanyalah merupakan perpindahan uang dari satu rekening ke rekening lain. Dalam kasus ini, uang Anda akan masuk ke kas bank (dengan kata lain, menambah debit bagi rekening kas) dan pada waktu yang sama memperbesar hutang bank kepada Anda (dengan kata lain, menambah kredit di rekening tabungan). Untuk setiap transaksi, jumlah kredit harus sama dengan jumlah debit sehingga totalnya 0 (balance).

Jika program di atas berjalan dengan baik, maka tidak ada masalah bukan? Setoran Anda sudah diterima, tercatat dengan baik di database, dan seharusnya tabungan Anda bertambah. Anda bisa pulang dengan tenang. Tapi pusatkan perhatian pada kata jika.

Mari kita lihat beberapa kemungkinan program ini bisa tidak berjalan dengan baik:

Pertama, bagaimana jika di langkah 5 ternyata disk di server penuh? Akibatnya, langkah 5–8 tidak pernah tereksekusi dan transaksi baru ini kosong. Mbak Teller nanti akan kebingungan saat harus menjelaskan ini kepada manajernya…

Kedua, apa yang terjadi jika di antara langkah 5 dan 6, koneksi ke database putus (karena Pak Satpam tak sengaja menyenggol komputer Mbak Teller)? Langkah 6–8 tidak pernah tereksekusi sehingga akibatnya uang sudah diterima bank dan sudah tercatat di kas, tapi saldo tabungan Anda tidak bertambah. Aduh, sesuatu yang paling tidak kita harapkan…

Dan bukan hanya koneksi database dan disk penuh saja yang bisa menyebabkan kita kehilangan uang. Bagaimana jika di antara langkah 5 dan 6 listrik mati (dan UPS-nya gagal up)? Bagaimana jika memori habis dan program Python crash? Bagaimana jika ada cracker masuk dan meng-kill proses program/MySQL tepat di antara kedua langkah ini? Bagaimana jika harddisk di server mati? Filesystem rusak?

Si programer bisa saja mengambil tindakan aman dengan melakukan pengecekan di antara langkah 4–5, 5–6, 7–8 untuk memastikan bahwa operasi SQL yang diberikan telah dieksekusi dengan sukses. Tapi kode 8 baris ini mungkin akan menjadi belasan bahkan ratusan baris jika berbagai kemungkinan hendak diperiksa. Dan itu untuk transaksi 2 tabel saja. Bagaimana dengan transaksi yang cukup kompleks yang melibatkan banyak tabel sekaligus? Kapan si programer bisa pulang ke rumah menemui istrinya?



## Contoh Kedua


Saya ingin memberi sebuah contoh tambahan. Kode berikut ini diambil dari program lama pengatur berlangganan mwmag yang terletak di [https://backroom.mwmag.com](https://backroom.mwmag.com) yang ditulis dalam PHP:

    
    
    $errors = 0;
    if (!$fistName) { echo "<p>Harap isi nama depan Anda!"; $errors++; }
    if (!$lastName) { echo "<p>Harap isi nama belakang Anda!"; $errors++; }
    ...
    if (!$errors) {
        # 1. add user
        $password = mt_rand(100000,999999);
        mysql_query("INSERT INTO tblUser (firstName,...) VALUES ('$firstName',...)")
            or die("Error adding user: ".mysql_error());
            
        $userId = mysql_insert_id();
    
        # 2. add privilege
        mysql_query("INSERT INTO tblPrivilege (userId,canLogin,...) VALUES ($userId,1,...)")
            or die("Error setting privilege: ".mysql_error());
    
        # 3. add subscription
        mysql_query("INSERT INTO tblSubscription (userId,fromIssue,toIssue,cost,date,...)
                     VALUES ($userId,$fromIssue,$toIssue,$cost,NOW(),...)")
            or die("Error adding subscription: ".mysql_error());
    
        # 4. schedule shipping
        for($i=$fromIssue; $i<=$toIssue; $i++) {
            mysql_query("INSERT INTO tblShipping (userId,issue,isShipped,...)
                         VALUES ($userId,$i,0,...)")
                or die("Error scheduling shipping ($i): ".mysql_error());
        }
        
        echo "<p>Success. Thank you.";
    }
    



Kode ini akan dieksekusi jika seorang pengunjung mengisi form berlangganan dan menekan tombol Submit. Skrip PHP akan menambahkan record user tersebut ke tabel `tblUser` (dengan field `email` sebagai primary key), mengeset privilege si user di tabel `tblPrivilege` (mis: diperbolehkan login, melihat halaman `user.html`, dsb.), mencatat pesanan berlangganannya di tabel `tblSubscription`, dan terakhir menjadwalkan record pengiriman untuk setiap edisi yang dipesan ke tabel `tblShipping`. Proses ini melibatkan empat tabel.

Meskipun di setiap langkah `INSERT` si skrip PHP melakukan pengecekan alakadarnya (dengan klausa `or die(...);` ), dan berhenti jika tahap ybs tidak berjalan benar, tetap saja skrip ini amat rapuh dan telah terbukti kerapuhannya sehingga menyebabkan saya sempat pusing. Pertama, si pemrogramnya sempat salah mengetik perintah SQL di tahap ketiga (syntax error). Jadi langkah ketiga dan keempat gagal tereksekusi. Ini mengakibatkan user gagal memesan meskipun record usernya sudah terekam. Ini tidak terlalu parah, tinggal memperbaiki syntax errornya saja. Kedua, karena ada lupa escaping, maka pada kasus tertentu perintah `mysql_query()` di langkah empat gagal. Ini cukup parah, dan terlebih lagi karena baru terdeteksi beberapa saat setelah dilakukan pengiriman. Ada pelanggan tertentu yang sudah tercatat sebagai pelanggan (masuk hingga langkah 1, 2, 3) tapi tidak ada jadwal pengirimannya sehingga ia pun protes karena majalah tidak pernah datang.



## Semua Atau Tidak Sama Sekali



Dari kedua contoh tadi, masalahnya sama: kita mengirimkan lebih dari satu perintah SQL, tapi sebetulnya menginginkan perintah-perintah itu dieksekusi sebagai satu kesatuan. Pada kasus mencatat setoran tabungan bank, jika terjadi kegagalan di `INSERT` rekening tabungan setelah sukses di `INSERT` rekening kas, maka kita ingin agar keduanya dibatalkan. Jika keduanya sukses, barulah semuanya jadi dilakukan. Begitu pula di kasus mencatat pesanan berlangganan majalah, jika terjadi kegagalan di perintah SQL ketiga, maka perintah SQL pertama dan kedua mohon agar dibatalkan. Jika tidak, maka dari waktu ke waktu—mungkin 1 dalam 100, mungkin sekali setiap sekian minggu, atau setiap bulan—akan timbul pencatatan-pencatatan separuh jadi atau tidak lengkap di database. Nasabah marah, pelanggan marah, bank dan mwmag kehilangan muka, semua dirugikan.

Tahukah Anda, sejak lebih dari 30 tahun lalu sebetulnya masalah ini telah terselesaikan oleh apa yang disebut **transaksi database**. Caranya amat sederhana: Anda menandai bagian awal dan akhir blok perintah yang ingin dieksekusi sebagai satu kesatuan (dengan kata lain, sebagai satu transaksi). Dan di bagian akhir ini Anda bisa memutuskan apakah ingin jadi mengeksekusi seluruh blok tersebut (commit) ataukah ingin membatalkan semuanya (rollback). Mari kembali ke contoh pertama:

    
    
    c = db.cursor()
    c.begin() 
    c.execute("""INSERT INTO trans (tgl,ket,teller_id) VALUES (NOW(),%s,%s)""",
              ('SETORAN TUNAI',teller_id))
    trans_id = c.insert_id()
    c.execute("""INSERT INTO jkas (trans_id,jumlah) VALUES (%s,%s)""", (trans_id,jumlah))
    c.execute("""INSERT INTO jtabungan (trans_id,norek_nasabah,jumlah)
              VALUES (%s,%s,%s)""", (trans_id,norek_nasabah,-jumlah))
    c.commit() 
    show_message("Sukses")
    



Perhatikan bedanya. Kini kita mengapit baris-baris berisi perintah SQL dengan **begin** dan **commit**. Jika di dalam transaksi ini ada salah satu perintah yang gagal, maka secara otomatis perintah-perintah sebelumnya akan dibatalkan juga (di **rollback otomatis**) dan kondisi kembali ke keadaan seperti sebelum terjadi transaksi. Sebaliknya, jika hingga baris 8 semuanya lancar, maka di tahap commit semua perubahan dari awal baris 3 akan dieksekusi dan terekam secara permanen di database.

Untuk memperkokoh skrip berlangganan di contoh kedua, kini Anda sudah tahu caranya. Ya, tambahkan begin dan commit untuk mengapit langkah 1 hingga 4:

    
    
    mysql_query("BEGIN"); 
    
    # langkah 1
    mysql_query("INSERT ...");
    
    ...
    
    # langkah 4
    
    ...
    
    mysql_query("COMMIT"); 
    echo "<p>Success. Thank you.";
    



Jika Anda mendeteksi ada hal yang tidak benar di tengah transaksi, Anda juga bisa melakukan **rollback secara eksplisit/manual** dengan perintah SQL: `ROLLBACK`.

    
    
    # menarik uang dari tabungan
    c.begin()
    ...
    c.execute("""SELECT saldo FROM ringkasanTabungan WHERE norek_nasabah=%s...
    saldo, = c.fetchone()
    if saldo < jumlah_tarikan:
        c.rollback() 
        show_message("Maaf. Transaksi gagal karena saldo tidak cukup.")
    else:
        ...
        c.commit() 
        show_message("Transaksi berhasil.") 
    





## Bagaimana Transaksi Diimplementasi


Kelihatannya mudah sekali, bukan? Bagai sihir malah. Cukup apit dengan dua keyword, maka jadilah sebuah transaksi. Segala macam yang terjadi di tengah sudah diurus oleh database. Kita tidak usah ambil pusing. Yang kita ingin tahu hanyalah, apakah transaksi itu berhasil atau tidak. Kalau berhasil, semua perintah harus dieksekusi. Kalau tidak, semua perintah harus dibatalkan. _All or nothing_.

Di belakang layar, berikut ini kurang lebih cara database mengimplementasi transaksi.

Pertama, data sebelum commit tidak ditulis dulu ke disk. Di luar konteks transaksi, sebuah perintah `INSERT` atau `DELETE` benar-benar akan langsung memodifikasi data di disk. Misalnya, jika terjadi sebuah `INSERT` ke tabel A, maka database Anda membuka file A.dat dalam mode baca-tulis, lalu melakukan seek pointer file ke bagian akhir file, menulis record baru dengan syscall `write()`, lalu melakukan flush. Dalam sebuah transaksi, perintah `INSERT` akan diperlakukan oleh database sbb.: record baru ini dicatat dalam buffer di RAM (misalnya di shared memory). Jika klien yang sama kemudian memberikan perintah `SELECT`, maka record baru ini akan ikut diperhitungkan bersama record lainnya yang telah ada di file supaya si klien tersebut melihat bahwa record baru seolah-olah telah di `INSERT`, meskipun bagi klien lain si database tidak akan memperlihatkan record sementara ini. Andai sebelum terjadi commit listrik mati, dan data di memori hilang, maka tidak masalah: seluruh perubahan toh belum masuk ke disk, baru di RAM dengan kata lain, semua perubahan telah batal alias terjadi rollback. Namun seandainya semua lancar hingga commit, maka di tahap commit baru perubahan data ditulis ke medium permanen (yakni, disk). Ini juga berarti, semakin panjang dan lama transaksi, semakin besar dan lama buffer RAM dibutuhkan. Jadi, transaksi harus kita buat agar sependek dan sesebentar mungkin agar buffer ini bisa dipakai untuk keperluan transaksi lain.

Kedua, saat commit, penulisan data ke disk harus dipastikan sukses secara keseluruhan, atau batal secara total. Bagaimana caranya? Pada intinya dengan melakukan dua kali penulisan. Database seperti PostgreSQL 7.1 ke atas memiliki sistem yang disebut _Write Ahead Logging_. Misalnya selama transaksi ditambahkan 10 record di tiga tabel. Setelah dihitung-hitung, PostgreSQL harus melakukan write ke 3 page disk. PostgreSQL akan mencatat dulu data yang harus ditulis ini ke dalam sebuah jurnal (sebuah file log). Jika selama menulis file log terjadi kegagalan, maka transaksi batal dan harus di-rollback. Jika file log telah berhasil ditulis, posisi sudah cukup aman. Sekarang PostgreSQL harus menulis data ke bagian disk yang sebenarnya. Jika terjadi kegagalan di tahap ini karena listrik mati misalnya, maka saat PostgreSQL hidup kembali, ia melihat catatan bahwa transaksi ini belum lengkap, dan akan melakukan roll-forward (REDO) atau rollback (UNDO) berdasarkan catatan dari log. Dengan kata lain, prinsip utama transaksi tetap terjaga: seluruh transaksi terjadi atau tidak sama sekali. Database lain seperti InnoDB pada intinya melakukan hal yang sama, dengan sistem yang disebut doublewrite. Sebelum menulis data ke tujuan akhir, InnoDB menulis data yang sama di tablespace buffer. Jika penulisan ini sukses, maka jika penulisan di tahap yang sebenarnya gagal, InnoDB sudah punya rekaman data untuk diulang/dibatalkan.

Nah, jadi bisa dilihat bahwa data transaksi kita betul-betul akan ditulis secara konsisten. Jika terjadi mati listrik di tengah-tengah penulisan log transaksi ke disk, maka transaksi batal. Jika terjadi mati listrik di tengah-tengah penulisan data asli, maka transaksi bisa kita ulang karena ada catatan log.

Tapi apakah dengan transaksi segala sesuatunya jadi sempurna? 100,0%? Bagaimana seandainya setelah tahap penulisan log sukses, bagian disk yang berisi log rusak saat kita menulis data yang sebenarnya? Dan lalu tahap penulisan data sebenarnya gagal, sehingga kita tidak dapat melakukan roll-forward? Bagaimana jika sewaktu merekam data transaksi di buffer RAM terjadi kesalahan RAM karena ada elektron yang nakal, sehingga data yang ditulis ke disk tidak benar? Bagaimana jika…

Tentu saja, peluang terjadi kesalahan _masih_ ada. Transaksi database akan 100% andal seandainya hardware tidak mengalami kegagalan. _Dan_ seperti yang kita tahu, semua hardware pasti mengalami kegagalan suatu waktu. Yang harus Anda pahami di sini adalah, peluang terjadinya kekacauan di fasa commit itu kecil sekali, _jauh jauh_ lebih kecil daripada kemungkinan data tidak konsisten karena perubahan di satu tabel tidak diikuti perubahan di tabel lain. Misalnya, dari kemungkinan 1:100 atau 1:1000 menjadi 1:setriliun. Dan dengan menjaga/mengupgrade hardware secara berkala, atau dengan mempergunakan mekanisme redundancy seperti RAID, kita dapat lebih memperkecil lagi terjadinya kesalahan. Dengan menciptakan transaksi, vendor database telah amat berjasa dalam membuat rekening Anda di bank tetap konsisten, dan agar data berlangganan _mwmag_ Anda terekam dengan lengkap. Singkatnya, membuat database menjadi jauh lebih andal. Kini Anda mengerti mengapa tak ada bank atau perusahaan yang mau memakai database yang tidak memiliki fitur transaksi.



## Transaksi di MySQL


Transaksi penting sekali. Kalau Anda lihat contoh-contoh sebelumnya, maka bisa dikatakan bahwa untuk setiap perubahan yang menyangkut dua tabel atau lebih, kita wajib membutuhkan transaksi untuk menjaga kekonsistenan semua tabel. Selain terjadi gangguan hardware, jaringan, atau matinya proses database, tabrakan antaruser atau istilah teknisnya, _race condition_ juga dapat terjadi seandainya kita tidak melakukan perubahan di dalam transaksi. Coba perhatikan kode fiktif menarik uang berikut:

    
    
    # ambil saldo saat ini
    c.execute("""SELECT saldo FROM tabungan WHERE norek=%s...
    saldo, = c.fetchone()
    if saldo < tarikan:
       show_message("Maaf. Saldo tidak cukup.")
    else:
        c.execute("""UPDATE tabungan SET saldo=%s""", (saldo-tarikan,))
        show_message("Transaksi berhasil.") 
    



Karena database MySQL adalah database multiuser, maka pada satu waktu bisa ada lebih dari satu klien yang sedang menatap atau bermaksud menyolek isi tabel. Andaikan di antara baris 2 dan baris 7 ternyata ada klien lain juga yang melakukan penarikan rekening yang sama, apa yang terjadi? Misalnya, saldo awal Rp 1.300.000. Di baris 3, klien A mendapatkan bahwa saldo saat ini masih cukup untuk tarikan sebesar Rp 900.000. Tapi, tepat setelah klien A berada di baris 3, klien B berada di baris 2. Dia melihat saldo masih Rp 1.300.000 dan melakukan penarikan Rp 750.000. Karena kebetulan klien B koneksinya lebih cepat, penarikan ini mendahului klien A. Sekarang kita lihat apa yang terjadi di baris 7. Klien A dengan tenangnya mengurangi saldo sebesar Rp 900.000, sebab ia yakin pada saat mengecek sesaat sebelumnya saldo masih di atas 1 juta. Tanpa diketahuinya, sebetulnya saldo saat ini sudah tinggal Rp 550.000. Baris 7 akan menyebabkan saldo menjadi negatif! Malang bagi si bank kecil.

Dengan transaksi hal seperti ini dapat dihindari. Saat klien A hendak mencapai akhir transaksi, database telah mencatat bahwa telah ada transaksi lain oleh klien B untuk tabel yang sama. Karena itu database berkata, “Tidak bisa. Transaksi ini harus dibatalkan karena **konflik** dengan transaksi lain.” Sekali lagi, sistem transaksi telah menyelamatkan data dari ketidakkonsistenan.

Tapi bagaimana dengan saat-saat di mana MySQL belum mempunyai transaksi? Nah, kasus seperti di atas sebetulnya masih bisa dilakukan tanpa transaksi, yaitu dengan **table locking**. Sebelum klien A ingin membaca tabel `tabungan`, ia dapat memerintahkan MySQL dulu untuk memblok klien-klien lain yang ingin membaca tabel ini:

    
    
    c.execute("""LOCK TABLES tabungan WRITE""")
    



Baru setelah semuanya selesai—row milik nasabah telah dikurangi sejumlah tarikan—tabel `tabungan` dapat dibebaskan kembali bagi klien lain.

    
    
    c.execute("""UNLOCK TABLES""")
    



Selama tahun-tahun di mana MySQL belum memiliki transaksi, cara inilah yang dipakai oleh programer untuk menjaga konsistensi data. Namun cara ini memiliki dua kelemahan: pertama menurunkan kinerja konkurensi, karena selama sebuah klien melakukan locking, klien lain tidak bisa berbuat apa-apa kecuali menunggu. Kedua, locking table tidak bisa melakukan rollback.



## Transaksi Terdistribusi


Sebelum kita berpisah, ada satu konsep lagi yang ingin saya sebutkan di sini, yaitu **transaksi terdistribusi.** Kadang disebut juga two phase commit atau transaksi antardatabase.

Jika kita menggunakan sebuah database yang mendukung transaksi, maka di dalam sebuah transaksi, perintah-perintah SQL yang kita tujukan kepada database tersebut akan dicatat dalam sistem transaksinya dan nanti bisa di-commit atau di-rollback sebagai satu kesatuan. Tapi bagaimana seandainya kita berurusan dengan dua database? Misalnya kita menggunakan PostgreSQL untuk menyimpan data utama, dan MySQL untuk logging. Dalam sebuah transaksi, kita melakukan langkah-langkah: 1) mengambil record saldo dari tabel 1 di PostgreSQL; 2) mendebet rekening di tabel 2 di PostgreSQL; 3) mengkredit rekening di tabel 3 di PostgreSQL; 4) melakukan logging untuk mencatat transaksi ini di tabel log di MySQL; 5) selesai/commit. Database MySQL dan PostgreSQL tidak mengetahui keberadaaan satu dengan yang lainnya. Anda tidak bisa membuat dua transaksi misalnya, karena kedua transaksi ini bukanlah satu kesatuan. Gagalnya transaksi di satu tempat tidak akan otomatis me-rollback transaksi yang lain. Bagaimana solusinya?

Jawabannya adalah, dibutuhkan satu program ketiga yang disebut Transaction Manager (TM)—atau middle tier, atau TPM. Dan tiap database yang terlibat dalam transaksi antardatabase ini harus mendukung apa yang disebut dengan commit dua tahap (tahap voting dan tahap eksekusi). Sekarang caranya begini: semua perintah SQL kita berikan kepada si TM. TM akan meneruskannya kepada database yang sesuai, sambil mencatat database apa saja yang terlibat dalam transaksi ini. Pada saat kita memberikan perintah COMMIT pada TM, maka TM akan memulai tahap voting: bertanya kepada tiap database yang terlibat apakah si database bisa melakukan commit. Jadi database harus bisa mempersiapkan diri untuk melakukan commit (mis: membersihkan buffer di RAM, mencatat ke jurnal log, dsb. sampai pada titik di mana bila commit benar-benar akan dilakukan, tinggal menulis ke satu bit/page disk secara atomik). TM akan menanyakan ini kepada setiap database. Jika salah satu database menyatakan tidak bisa/mau commit, maka seluruh transaksi gagal. Jika semua bersedia, maka masuklah ke tahap kedua, yaitu tahap commit yang sebenarnya. TM akan mengirim perintah “ya, lakukan!” kepada setiap database. Database yang sudah bersedia commit pada tahap pertama kini harus commit. Maka tercapailah tujuan semula: seluruh transaksi—yang meskipun tersebar di lebih dari satu database—menjadi satu kesatuan.

Transaksi terdistribusi belum didukung oleh kebanyakan database. Dari empat database open source primadona kita di edisi kali ini, hanya Interbase yang sudah mendukungnya. MySQL (3.23.x & 4.0.1), PostgreSQL (7.2), dan SAP DB (7.3) belum.



> 
Artikel ini murni diambil dari arsip majalah mwmag yang bisa dilihat pada alamat [http://www.master.web.id/mwmag/issue/04/content/fokus-transaksi/fokus-transaksi.html](http://www.master.web.id/mwmag/issue/04/content/fokus-transaksi/fokus-transaksi.html) dan di posting ulang pada blog ini dengan seijin penulis aslinya :) 

