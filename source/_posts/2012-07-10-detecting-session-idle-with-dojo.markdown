---
comments: true
date: 2012-07-10 20:15:40+00:00
layout: post
slug: detecting-session-idle-with-dojo
title: Detecting Session Idle with Dojo
wordpress_id: 1658
categories:
- JavaScript
tags:
- Dojo
- Idle
- JavaScript
- Session
---

Sedang mempunyai masalah bagaimana caranya mendeteksi sesi yang sedang **idle** di aplikasi yang menggunakan [Dojo]() ? Sebenarnya **Dojo** juga sudah mempunyai sebuah **plugin** yaitu `dojox.analytics.plugins.idle` yang terdapat pada package [dojox.analytics](http://dojotoolkit.org/api/). Sedangkan untuk cara penggunan-nya adalah kita bisa menambahkan parameter `idleTime` dan `analyticsUrl` pada `dojoConfig` yang kurang lebih seperti berikut :

```javascript
<script>
var dojoConfig = {
    isDebug: true,
    idleTime: 3000,
    sendInterval: 3000,
    analyticsUrl: 'http://localhost:10000/monitor/idle',
    modulePaths: {
    app: '../../../app'
    }
</script>
```


Selain itu, import-lah juga package `dojox.analytics` dan `dojox.analytics.plugins.idle` supaya plugin **idle** dapat digunakan. Dengan kode seperti diatas, harusnya jika aplikasi kita tidak melakukan apapun selama 3 detik maka **Dojo** akan mengirimkan `POST` request ke alamat `http://localhost:10000/monitor/idle`. Nah yang jadi masalah disini adalah, sekarang bagaimana caranya menghandle jika di sisi browser sudah melewati batasan waktu 3 detik apa yang harus dilakukan di sisi client ??? :D (Karena dari sisi aplikasi, aplikasi hanya akan mengirimkan `POST` request ke server dengan informasi `idle` saja)
<!-- more -->
Karena kurang puas dengan library bawaan **Dojo** secara tidak sengaja saya menemukan script yang cara penggunaan-nya lebih sederhana dari bawaan **Dojo** diatas, yang kode-nya kurang lebih seperti dibawah ini :

```javascript
/*
 * dojo idle listener
 * version 0.1
 * by Sean O' Shea. 
 * http://github.com/seanoshea/dojo-idle-listener
 * MIT license
 *
 * adapted from:
 * 1. YUI idle timer by nzakas: http://github.com/nzakas/yui-misc/
 * 2. jQuery idle timer by Paul Irish: http://paulirish.com/2009/jquery-idletimer-plugin/
 *
 * Copyright (c) 2009 Nicholas C. Zakas
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
dojo.declare("IdleListener", [], {
    
    _handles: [],
    _timeout: 30000,
    
    isRunning: function() {
        return this._enabled;
    },

    isIdle: function() {
        return this._idle;
    },

    start: function(newTimeout) {
        this._enabled = true;
        this._idle = false;
        if(typeof newTimeout == "number") {
            this._timeout = newTimeout;
        }

        dojo.forEach(["onmousemove", "onkeydown", "onmousewheel", "DOMMouseScroll"], dojo.hitch(this, function(item, index, array) {
            this._handles.push(dojo.connect(dojo.doc, item, this, "_handleUserEvent"));
        }))

        // set a timeout to toggle state
        this._idleTimeout = setTimeout(dojo.hitch(this, "_toggleIdleState"), this._timeout);
    },

    stop: function() {
        this._enabled = false;

        // clear any pending timeouts
        clearTimeout(this._idleTimeout);

        // detach the event handlers
        dojo.forEach([this._handles], dojo.disconnect);
    },
    
    _handleUserEvent: function() {
        // clear any existing timeout
        clearTimeout(this._idleTimeout);

        if(this._enabled) {
            // if the user is just waking us up again, toggle the idle state.
            // otherwise, reset the timeout with a new timeout
            this._idle ? this._toggleIdleState() : this._idleTimeout = setTimeout(dojo.hitch(this, "_toggleIdleState"), this._timeout);
        }
    },
    
    _toggleIdleState: function() {
        this._idle = !this._idle;
        this._idle ? dojo.publish("idle", []) : dojo.publish("active", []); 
    }
});
```



Sedangkan cara penggunaan-nya sangat mudah sekali seperti dapat kita lihat pada potongan kode dibawah ini yang akan mendeteksi proses **idle** selama 30 detik tanpa ada pergerakan dilayar :

```javascript
var idleListener = new my.IdleListener();
idleListener.start(30000);
```

Dan langkah terakhir adalah, kita dapat menangkap aksi ketika proses **idle** terjadi dengan menggunakan `dojo.subscribe` seperti dibawah ini :

```javascript
dojo.subscribe("idle", function() {
    // do something here
});
dojo.subscribe("active", function() {
    // do something here
});
```


Lebih mudah dan sederhana bukan ? Seluruh kode `IdleListener` diatas tadi ditulis oleh [Sean O' Shea](http://whatsthepointeh.blogspot.com/) dan dijelaskan pada artikel pada blognya yang berjudul [Idle Handler with Dojo](http://whatsthepointeh.blogspot.com/2009/06/idle-handler-with-dojo.html) :) 

Bagaimana guys ?? Ada yang sudah menggunakan `dojox.analytics.plugins.idle` di aplikasi-nya ? Jika sudah, bisa di sharing cara penggunaan-nya bagaimana ? :)

