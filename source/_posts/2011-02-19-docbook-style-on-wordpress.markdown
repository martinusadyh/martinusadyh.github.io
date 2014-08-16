---
author: admin
comments: true
date: 2011-02-19 10:02:15+00:00
layout: post
slug: docbook-style-on-wordpress
title: DocBook Style On WordPress
wordpress_id: 1207
categories:
- Blogging
- Java
- NetBeans
- OpenSolaris
- Slackware
tags:
- Blog
- DocBook
- WordPress
---

Sebenarnya sudah sejak lama ingin menulis sebuah tulisan atau buku mengikuti gaya penulisan yang terdapat pada [DocBook](http://www.docbook.org/), tapi apa daya sampai sekarang masih belum ada waktu untuk **"ngoprek"** format yang tersedia di **DocBook** :D Keinginan saya yang lain yaitu bagaimana meng-integrasikan antara [WordPress](http://wordpress.org/download/) yang sudah terbukti sebagai CMS (Content Management System) blogging yang paling populer dengan **DocBook** yang sudah dikenal luas sebagai alat untuk penulisan dokumentasi sebuah software.

Kombinasi struktur buku yang terdapat di **DocBook** dengan banyak-nya plugin yang tersedia untuk **WordPress** plus adanya fasilitas komentar, bagi saya ini merupakan sebuah kombinasi yang pas bagi seoarang penulis untuk mem-_publish_ tulisan-nya di Internet :) Plus-nya sebagai penulis yaitu kita bisa langsung mendapatkan respon pembaca melalui fasilitas komentar yang sudah terdapat pada **WordPress** :D

Nah untuk merealisasikan ide diatas, kemarin saya juga sudah coba iseng-iseng untuk mengimplementasikan-nya pada blog ini. Dan hasilnya bisa teman-teman lihat pada tulisan [Berkenalan dengan ISO 8583 Menggunakan Java](http://martinusadyh.web.id/tulisanku/berkenalan-dengan-iso-8583-menggunakan-java/) :) Masih sangat-sangat sederhana sih, tapi setidaknya sudah bisa mencukupi kebutuhan saya saat ini yaitu menulis buku layaknya menulis blog :D plus dapat fasilitas komentar langsung pada bab yang dibahas :) 

Nah untuk teman-teman yang ingin mencoba konsep serupa dan ingin tahu apa yang dibutuhkan agar blog kita mempunyai halaman seperti itu, langkah pertama copy paste beberapa script dibawah ini dan simpanlah pada direktori **themes** yang teman-teman gunakan. Script-script yang diperlukan yaitu :




  1. **docbook-archive.php**

    
    
    /docbook-archive.php
     * where <your-themes> is your current blog themes :)
     * 
     * Template Name: DocBookArchive
     */
    ?>
    
    
    
    <div id="content" class="narrowcolumn">
        
            <div class="post" id="post-<?php the_ID(); ?>">
                <h2></h2>
                <div class="entry">
                    Read the rest of this page »</p>'); ?>
                    
                </div>
            </div>
            
            
            ', '</p>'); ?>
    </div>
    
    
    



File **docbook-archive.php** ini berfungsi sebagai halaman depan untuk semua tulisan yang kita publish :) Sedangkan bagaimana cara pakainya yaitu buatlah sebuah halaman baru dengan nama misalkan **Tulisanku** kemudian pada opsi **Page Attributes** pilihlah **(no parent)** pada opsi **Parent** dan **DocBookArchive** pada opsi **Template** seperti gambar dibawah ini :

[![TulisankuEdit](http://farm6.static.flickr.com/5176/5458157556_23499a1ea6.jpg)](http://www.flickr.com/photos/10243554@N02/5458157556/)  
**Cara Penggunaan Template DocBook Archive**

Sedangkan tampilan live-nya adalah seperti gambar dibawah ini :

[![DocBookArchiveLive](http://farm6.static.flickr.com/5016/5458157552_6f0759b2c5.jpg)](http://www.flickr.com/photos/10243554@N02/5458157552/)  
**Tampilan Halaman Dengan Template DocBook Archive**


<!-- more -->

  2. **docbook-toc.php**


    
    
    /docbook-toc.php
     * where <your-themes> is your current blog themes :)
     *
     * Template Name: DocBookTOC
     */
    ?>
    
    
    	<div id="content" class="widecolumn_single">
    
    	
        
    
    		<div class="navigation">
    			<div class="alignleft"></div>
    			<div class="alignright"></div>
    		</div>
    
    		<div class="post" id="post-<?php the_ID(); ?>">
    			<h2></h2>
    			<div class="entry">
    				Read the rest of this entry »</p>'); ?>
    
    				<h2>License</h2>
                    <p>Redistribution and use in textual and binary forms, with or without modification, are permitted provided that the following conditions are met:<br></br>
                    1. Redistributions of this book must retain the above copyright notice, this list of conditions and the following disclaimer.<br></br>
                    2. The names of the authors may not be used to endorse or promote products derived from this book without specific prior written permission.</p>
                    <p>THIS BOOK IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS BOOK, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. </p><br></br>
                    
                    <small>Published by  on </small>
                    <hr>
                    <h2>Daftar Isi</h2>
                    
                    <p></p>
                    <p>
                    ID;
                        }
                        
                        $current = array_search($post->ID, $pages);
                        $prevID = $pages[$current-1];
                        $nextID = $pages[$current+1];
                    ?>
                    
                    <div class="navigation">
                        
                        
                            <div class="alignright"><a href="<?php echo get_permalink($nextID); ?>" title="<?php echo get_the_title($nextID); ?>"></a></div>
                        
                    </div>
                    </p>
                    <p></p>
    				<p class="postmetadata alt">
    					<small>                    
    						
    						 for this entry.
    
    						 comment_status) && ('open' == $post->ping_status)) {
    							// Both Comments and Pings are open ?>
    							<a href="#respond">Leave a response</a>, or <a href="<?php trackback_url(); ?>" rel="trackback">trackback</a> from your own site.
    
    						 comment_status) && ('open' == $post->ping_status)) {
    							// Only Pings are Open ?>
    							Responses are currently closed, but you can <a href="<?php trackback_url(); ?> " rel="trackback">trackback</a> from your own site.
    
    						 comment_status) && !('open' == $post->ping_status)) {
    							// Comments are open, Pings are not ?>
    							You can skip to the end and leave a response. Pinging is currently not allowed.
    
    						 comment_status) && !('open' == $post->ping_status)) {
    							// Neither Comments, nor Pings are open ?>
    							Both comments and pings are currently closed.
    
    						
    
    					</small>
    				</p>
    
    			</div>
    		</div>
    
    	
    
    	
    
    		<p>Sorry, no posts matched your criteria.</p>
    
    
    
    	</div>
    
    



Sedangkan file **docbook-toc.php** ini digunakan sebagai halaman **Daftar Isi** atau **Table Of Content** untuk tulisan kita, di file ini juga akan secara otomatis memberi sebuah lisensi untuk semua tulisan kita yang menggunakan template **DocBookTOC**. Jika kita ingin merubah lisensi yang akan digunakan, maka ganti atau hapuslah baris dibawah ini agar sesuai dengan keinginan kita :

    
    
    				<h2>License</h2>
                    <p>Redistribution and use in textual and binary forms, with or without modification, are permitted provided that the following conditions are met:<br></br>
                    1. Redistributions of this book must retain the above copyright notice, this list of conditions and the following disclaimer.<br></br>
                    2. The names of the authors may not be used to endorse or promote products derived from this book without specific prior written permission.</p>
                    <p>THIS BOOK IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS BOOK, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. </p><br></br>
    



Sedangkan cara penggunaan-nya adalah, buatlah sebuah halaman baru dengan nama tulisan yang akan dipublish dan pada opsi **Page Attributes** pilihlah **Tulisanku** (Halaman Tulisanku ini adalah halaman yang telah dibuat pada langkah nomor #1 diatas) pada opsi **Parent** dan **DocBookTOC** pada opsi **Template** seperti gambar dibawah ini :

[![TOCNoImage](http://farm6.static.flickr.com/5177/5458184122_5c46398d40.jpg)](http://www.flickr.com/photos/10243554@N02/5458184122/)  
**Cara Penggunaan Template DocBook TOC**

Dan tampilan live-nya kurang lebih seperti gambar dibawah ini :

[![TOCLive](http://farm6.static.flickr.com/5052/5458184120_36c2a1713c.jpg)](http://www.flickr.com/photos/10243554@N02/5458184120/)  
**Tampilan Halaman Dengan Template DocBook TOC**

Jika kita ingin menggunakan gambar untuk sampul depan tulisan kita, pasangkan gambar tersebut seperti gambar dibawah ini :

[![EditTOC](http://farm6.static.flickr.com/5254/5458184110_1f5e05f3f7.jpg)](http://www.flickr.com/photos/10243554@N02/5458184110/)  
**Cara Penggunaan Template DocBook TOC Menggunakan Gambar Sampul**




  3. **docbook-toc-content.php**

    
    
    /docbook-toc-content.php
     * where <your-themes> is your current blog themes :)
     *
     * Template Name: DocBookTOCContent
     */
    ?>
    
    
    	<div id="content" class="widecolumn_single">
    
    	
        
    		<div class="post" id="post-<?php the_ID(); ?>">
    			<h2></h2>
    			<div class="entry">
    				Read the rest of this entry »</p>'); ?>
                    
                    <p></p>
                    <p>
                    ID;
                        }
                        
                        $current = array_search($post->ID, $pages);
                        $prevID = $pages[$current-1];
                        $nextID = $pages[$current+1];
                    ?>
                    
                    <div class="navigation">
                        
                        
                            <div class="alignright"><a href="<?php echo get_permalink($nextID); ?>" title="<?php echo get_the_title($nextID); ?>"></a></div>
                        
                    </div>
                    </p>
                    <p></p>
    				<p class="postmetadata alt">
    					<small>                    
    						
    						 for this entry.
    
    						 comment_status) && ('open' == $post->ping_status)) {
    							// Both Comments and Pings are open ?>
    							<a href="#respond">Leave a response</a>, or <a href="<?php trackback_url(); ?>" rel="trackback">trackback</a> from your own site.
    
    						 comment_status) && ('open' == $post->ping_status)) {
    							// Only Pings are Open ?>
    							Responses are currently closed, but you can <a href="<?php trackback_url(); ?> " rel="trackback">trackback</a> from your own site.
    
    						 comment_status) && !('open' == $post->ping_status)) {
    							// Comments are open, Pings are not ?>
    							You can skip to the end and leave a response. Pinging is currently not allowed.
    
    						 comment_status) && !('open' == $post->ping_status)) {
    							// Neither Comments, nor Pings are open ?>
    							Both comments and pings are currently closed.
    
    						
    
    					</small>
    				</p>
    			</div>
    		</div>
    	
    	
    		<p>Sorry, no posts matched your criteria.</p>
    
    	</div>
    
    



File **docbook-toc-content.php** ini digunakan sebagai template untuk **bab (chapter)** yang terdapat pada tulisan kita, cara penggunaan-nya adalah buatlah sebuah halaman baru dengan judul bab (chapter) yang akan dipublish dan pada opsi **Page Attributes** pilihlah parent yang menggunakan template **DocBookTOC** (dalam contoh ini parent page-nya adalah **Berkenalan dengan ISO 8583 Menggunakan Java**) pada opsi **Parent** dan **DocBookTOCContent** pada opsi **Template** seperti gambar dibawah ini :

[![DocBookTOCContentEdit](http://farm6.static.flickr.com/5018/5457599263_3cddaf9266.jpg)](http://www.flickr.com/photos/10243554@N02/5457599263/)  
**Cara Penggunaan Template DocBook TOC Content (Template Untuk Bab / Chapter)**

Sedangkan tampilan livenya adalah seperti gambar dibawah ini :
[![DocBookTOCContentLive](http://farm6.static.flickr.com/5295/5457599265_eb114d1690.jpg)](http://www.flickr.com/photos/10243554@N02/5457599265/)  
**Tampilan Live  Template DocBook TOC Content (Template Untuk Bab / Chapter)**




  4. **docbook-content.php**

    
    
    /docbook-content.php
     * where <your-themes> is your current blog themes :)
     *
     * Template Name: DocBookContent
     */
    ?>
    
    	<div id="content" class="widecolumn_single">
    	
        
    		<div class="navigation">
    			<div class="alignleft"></div>
    			<div class="alignright"></div>
    		</div>
    
    		<div class="post" id="post-<?php the_ID(); ?>">
    			<h2></h2>
    			<div class="entry">
    				Read the rest of this entry »</p>'); ?>
    
    				 '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
                    
                    <p></p>
                    <p>
                    
                    ID;
                        }
                        
                        $current = array_search($post->ID, $pages);
                        $prevID = $pages[$current-1];
                        $nextID = $pages[$current+1];
                    ?>
                    
                    <div class="navigation">
                        
                            <div class="alignleft"><a href="<?php echo get_permalink($prevID); ?>" title="<?php echo get_the_title($prevID); ?>"></a></div>
                        
                            <div class="alignright"><a href="<?php echo get_permalink($nextID); ?>" title="<?php echo get_the_title($nextID); ?>"></a></div>
                        
                    </div>
                    </p>
                    <p></p>
    				<p class="postmetadata alt">
    					<small>                    
    						
    						 for this entry.
    
    						 comment_status) && ('open' == $post->ping_status)) {
    							// Both Comments and Pings are open ?>
    							<a href="#respond">Leave a response</a>, or <a href="<?php trackback_url(); ?>" rel="trackback">trackback</a> from your own site.
    
    						 comment_status) && ('open' == $post->ping_status)) {
    							// Only Pings are Open ?>
    							Responses are currently closed, but you can <a href="<?php trackback_url(); ?> " rel="trackback">trackback</a> from your own site.
    
    						 comment_status) && !('open' == $post->ping_status)) {
    							// Comments are open, Pings are not ?>
    							You can skip to the end and leave a response. Pinging is currently not allowed.
    
    						 comment_status) && !('open' == $post->ping_status)) {
    							// Neither Comments, nor Pings are open ?>
    							Both comments and pings are currently closed.
    
    						
    					</small>
    				</p>
    			</div>
    		</div>
    
    	
    	
    		<p>Sorry, no posts matched your criteria.</p>
    
    	</div>
    
    



Sedangkan file yang terakhir ini yaitu **docbook-content.php** digunakan untuk bagian **Sub Bab** pada tulisan kita, cara penggunaan-nya yaitu  buatlah sebuah halaman baru dengan judul **sub bab** yang akan dipublish dan pada opsi **Page Attributes** pilihlah parent yang menggunakan template **DocBookTOCContent** (dalam contoh ini parent page-nya adalah **Pendahuluan**) pada opsi **Parent** dan **DocBookContent** pada opsi **Template** seperti gambar dibawah ini :

[![DocBookContentEdit](http://farm6.static.flickr.com/5174/5457613225_6b9f039dec.jpg)](http://www.flickr.com/photos/10243554@N02/5457613225/)  
**Cara Penggunaan Template DocBook Content (Template Untuk SubBab)**

Sedangkan tampilan live-nya kurang lebih seperti gambar dibawah ini :
[![DocBookContentLive](http://farm6.static.flickr.com/5296/5457613227_ff70da3681.jpg)](http://www.flickr.com/photos/10243554@N02/5457613227/)  
**Tampilan Template DocBook Content (Template Untuk SubBab)**




Dengan sedikit modifikasi yang sudah kita lakukan diatas, sekarang blog kita sudah bisa mendukung tampilan seperti **DocBook** dengan tambahan fasilitas komentar seperti yang dimiliki oleh halaman manual [MySQL](http://dev.mysql.com/doc/refman/5.1/en/date-and-time-functions.html) :) Alasan saya pribadi tertarik dengan model seperti ini yaitu **supaya komunikasi antara penulis dan pembaca bisa 2 arah** :D Jika pembaca tidak mengerti pada bab yang dibaca, bisa langsung konsultasi melalui kolom komentar yang sudah terdapat pada **WordPress** dan penulis bisa langsung menjawab pertanyaan tersebut secara langsung dan tentunya menggunakan fasilitas komentar juga :)

Nah sekarang bagaimana pendapat teman-teman ? Ada ide yang lain ? :) 

