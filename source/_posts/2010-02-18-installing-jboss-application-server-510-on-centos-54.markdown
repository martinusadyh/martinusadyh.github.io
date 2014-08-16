---
comments: true
date: 2010-02-18 21:36:22+00:00
layout: post
slug: installing-jboss-application-server-510-on-centos-54
title: Installing JBoss Application Server 5.1.0 on CentOS 5.4
wordpress_id: 100
categories:
- CentOS
- Java
- NetBeans
tags:
- jboss
---

Nah setelah [kemarin](http://martinusadyh.web.id/2010/02/17/step-by-step-installing-centos-54/) kita berhasil meng-install [CentOS](http://centos.org/) yang difungsikan sebagai **Server**, sekarang mari kita coba install sebuah **Java EE Application Server** diatas-nya yaitu [JBoss Application Server (AS)](http://www.jboss.org/). Nah buat yang belum tahu apa sih [JBoss Application Server](http://www.jboss.org/) itu, [JBoss Application Server](http://www.jboss.org/) ini merupakan sebuah **Java EE Application Server** yang berbasis pada spesifikasi Java EE versi 5 (sampai versi sekarang (versi 5.1.0) [JBoss Application Server](http://www.jboss.org/) ini belum mendukung spesifikasi Java EE versi 6). Nah kalau bicara tentang **Java EE Application Server** [JBoss Application Server](http://www.jboss.org/) ini sekelas dengan beberapa nama besar lain-nya yaitu [Oracle WebLogic](http://www.oracle.com/appserver/weblogic/enterprise-edition.html) dan [Glassfish Application Server](https://glassfish.dev.java.net/).

Yang perlu teman-teman ketahui selain hal-hal diatas yaitu bahwa [JBoss Application Server](http://www.jboss.org/) ini dulu-nya dikembangkan oleh sebuah perusahaan bernama [JBoss](http://www.jboss.com/), setelah dibeli oleh [Red Hat](http://www.redhat.com/) akhir-nya [JBoss](http://www.jboss.com/) ini sekarang menjadi sebuah divisi di [Red Hat](http://www.redhat.com/) yang bergerak pada bidang aplikasi **middleware** dengan sifat opensource. Sedangkan fitur-fitur yang dibawa oleh [JBoss Application Server](http://www.jboss.org/) ini adalah :




  * Clustering


  * Failover (including sessions)


  * Load Balancing


  * Distributed caching (using JBoss Cache, a standalone product)


  * Distributed deployment (farming)


  * Deployment API


  * Management API


  * Aspect-Oriented Programming (AOP) support


  * JSP/Servlet 2.1/2.5 (Tomcat)


  * JavaServer Faces 1.2 (Mojarra)


  * Enterprise Java Beans versions 3 and 2.1


  * JNDI (Java Naming and Directory Interface)


  * Hibernate-integration (for persistence programming; JPA)


  * JDBC


  * JTA (Java Transaction API)


  * Support for Java EE-Web Services like JAX-WS


  * SAAJ (SOAP with Attachments API for Java)


  * JMS (Java Message Service) integration


  * JavaMail


  * RMI-IIOP (JacORB, alias Java and CORBA)


  * JAAS (Java Authentication and Authorization Service)


  * JCA (Java Connector Architecture)-integration


  * JACC (Java Authorization Contract for Containers)-integration


  * Java Management Extensions



Hm.. mantap kan dan [JBoss Application Server](http://www.jboss.org/) ini juga open source loh :) , nah gimana tertarik mencoba [JBoss Application Server](http://www.jboss.org/) ini sebagai server utama ? Klo iya, mari kita lanjutkan dengan meng-install [JBoss Application Server](http://www.jboss.org/) ini pada mesin [CentOS](http://centos.org/) yang sudah kita persiapkan sebelum-nya. Sebelum mulai meng-install persiapkan dahulu beberapa kebutuhan yang akan kita gunakan agar [JBoss Application Server](http://www.jboss.org/) ini dapat berjalan dengan mulus di server yang sudah kita siapkan. Untuk perlengkapan yang digunakan pada tulisan ini yaitu :




  * [Sun Java JDK versi 1.6.0_17 (~+ 78 MB)](http://java.sun.com/javase/downloads/index.jsp)


  * [JBoss Application Server 5.1.0.GA.zip (~+ 133.5 MB)](http://sourceforge.net/settings/mirror_choices?projectname=jboss&filename=JBoss/JBoss-5.1.0.GA/jboss-5.1.0.GA.zip)


**Note: Pada tulisan ini saya me-remove semua versi java bawaan CentOS dan mengganti-nya dengan SunJDK, jadi sebelum menginstall SunJDK hapuslah dahulu OpenJDK dan GCJ yang dibawa oleh CentOS.**
<!-- more -->
Agar [JBoss Application Server 5.1.0.GA](http://sourceforge.net/settings/mirror_choices?projectname=jboss&filename=JBoss/JBoss-5.1.0.GA/jboss-5.1.0.GA.zip) ini dapat berjalan sesuai dengan rencana, pastikan dahulu bahwa variabel **JAVA_HOME** sudah mengarah pada direktori tempat dimana java terinstall. Untuk mengecek apakah variabel **JAVA_HOME** sudah dikenali atau belum pada sistem, coba ketikkan perintah **echo $JAVA_HOME** pada terminal atau console seperti dibawah ini :

    
    
    [root@localhost ~]# echo $JAVA_HOME
    /opt/jdk1.6.0_17
    [root@localhost ~]#
    


**Note: Pada tulisan ini, SUN JDK 1.6.0_17 di install pada direktori /opt/jdk1.6.0_17**

Jika hasil dari perintah **echo $JAVA_HOME** tidak mengeluarkan keterangan apapun, kemungkinan terbesar adalah **JDK belum ter-install** atau **Sudah terinstall tapi belum di konfigurasi**. Nah jika kondisi-nya seperti ini, maka kita perlu untuk membuat sebuah variabel **JAVA_HOME** dahulu dengan cara editlah file **/etc/profile** dan tambahkan baris dibawah ini kemudian simpan dan coba **logout** atau kalau diperlukan **reboot** :) :

    
    
    # Konfigurasi JDK
    export JAVA_HOME=/opt/jdk1.6.0_17
    export PATH=$PATH:$JAVA_HOME/bin
    



Jika konfigurasi environment variable **JAVA_HOME** sudah benar, untuk meng-install [JBoss Application Server](http://www.jboss.org/) ada beberapa tahapan yang perlu dilakukan agar bisa berjalan dengan lancar yaitu :




  1. Pembuatan User jboss Beserta Home Direktori-nya


  2. Ekstrak File jboss-5.1.0.GA.zip Ke Dalam Direktori Home User jboss


  3. Pembuatan Init Script Agar JBoss Bisa Berjalan Sebagai Daemon Di CentOS


  4. Testing Konfigurasi



Sebelum melanjutkan ke tahapan berikut-nya, kita akan menginstall [JBoss Application Server](http://www.jboss.org/) ini pada direktori **/opt/jboss** karena pada halaman manual [JBoss Application Server](http://www.jboss.org/) lebih menyarankan agar kita menginstall pada direktori **/usr/local/jboss**. Nah setelah mengetahui apa yang akan kita lakukan, sekarang mari kita coba langkah-langkah untuk meng-install [JBoss Application Server](http://www.jboss.org/) ini secara bertahap seperti berikut :





  1. **Pembuatan User jboss Beserta Home Direktori-nya**
Langkah pertama yang harus kita lakukan yaitu kita harus menyiapkan dahulu user yang akan digunakan untuk menjalankan **service** [JBoss Application Server](http://www.jboss.org/) ini, agar lebih aman kita akan membuat sebuah user dengan nama **jboss** yang tidak mempunyai hak akses login ke dalam mesin kita. Karena kita ingin menginstall [JBoss Application Server](http://www.jboss.org/) ini pada direktori **/opt/jboss** maka jadikan direktori tersebut (**/opt/jboss**) sebagai **home** direktori user **jboss** dengan cara ketikkan perintah seperti dibawah ini :

    
    
    [root@localhost ~]# useradd -d /opt/jboss -s /bin/sh jboss
    Creating mailbox file: File exists
    [root@localhost ~]#
    



Setelah selesai menjalankan perintah diatas, sekarang mari kita cek apakah user **jboss** sudah berhasil ditambahkan kedalam sistem dengan melihat entri pada file **/etc/passwd** seperti dibawah ini :

    
    
    [root@localhost ~]# cat /etc/passwd | grep jboss
    jboss:x:501:501::/opt/jboss:/bin/sh
    [root@localhost ~]#
    


Sampai disini proses pembuatan user yang akan digunakan untuk menjalankan **service** [JBoss Application Server](http://www.jboss.org/) sudah selesai, sekarang mari kita **ekstrak** file **jboss-5.1.0.GA.zip** kedalam direktori **home** user **jboss** yang terdapat pada **/opt/jboss** yang dijelaskan pada langkah selanjutnya :)




  2. **Ekstrak File jboss-5.1.0.GA.zip Ke Dalam Direktori Home User jboss**
Setelah proses pembuatan user selesai, sekarang ekstrak-lah file **jboss-5.1.0.GA.zip** ini pada **current direktori** seperti perintah dibawah ini :

    
    
    [root@localhost ~]# unzip jboss-5.1.0.GA.zip
      ............
      ............
      ............
      inflating: jboss-5.1.0.GA/server/web/deployers/ejb3.deployer/jboss-ejb3-deployer.jar
      inflating: jboss-5.1.0.GA/server/web/deployers/ejb3.deployer/jboss-ejb3-iiop.jar
      inflating: jboss-5.1.0.GA/server/web/deployers/jboss-aop-jboss5.deployer/META-INF/MANIFEST.MF
      inflating: jboss-5.1.0.GA/server/web/deployers/jboss-aop-jboss5.deployer/META-INF/jboss-aspect-library-jboss-beans.xml
      inflating: jboss-5.1.0.GA/server/web/deployers/jboss-aop-jboss5.deployer/base-aspects.xml
      inflating: jboss-5.1.0.GA/server/web/deployers/jboss-aop-jboss5.deployer/jboss-aop-aspects.jar
      inflating: jboss-5.1.0.GA/server/web/deployers/jboss-aop-jboss5.deployer/jboss-aspect-library.jar
      inflating: jboss-5.1.0.GA/server/web/deployers/jboss-aop-jboss5.deployer/jrockit-pluggable-instrumentor.jar
      inflating: jboss-5.1.0.GA/server/web/deployers/jboss-aop-jboss5.deployer/pluggable-instrumentor.jar
      inflating: jboss-5.1.0.GA/server/web/deployers/jboss-jca.deployer/META-INF/jca-deployers-jboss-beans.xml
      inflating: jboss-5.1.0.GA/server/web/deployers/jboss-jca.deployer/jboss-jca-deployer.jar
      inflating: jboss-5.1.0.GA/server/web/deployers/jbossweb.deployer/META-INF/jboss-structure.xml
      inflating: jboss-5.1.0.GA/server/web/deployers/jbossweb.deployer/META-INF/war-deployers-jboss-beans.xml
      inflating: jboss-5.1.0.GA/server/web/deployers/jbossweb.deployer/jboss-web-deployer.jar
      inflating: jboss-5.1.0.GA/server/web/deployers/jbossweb.deployer/web.xml
      inflating: jboss-5.1.0.GA/server/web/deployers/metadata-deployer-jboss-beans.xml
      inflating: jboss-5.1.0.GA/server/web/deployers/security-deployer-jboss-beans.xml
    [root@localhost ~]#
    



Hasil perintah diatas akan membuat sebuah direktori dengan nama **jboss-5.1.0.GA** yang berisi [JBoss Application Server](http://www.jboss.org/) yang sebenar-nya, sekarang copy-kan file yang terdapat didalam direktori **jboss-5.1.0.GA** ini ke direktori **/opt/jboss** dengan cara seperti dibawah ini :

    
    
    [root@localhost ~]# cp -R jboss-5.1.0.GA/* /opt/jboss/
    [root@localhost ~]#
    



Jika sudah sekarang rubahlah hak akses kepemilikan file pada direktori **/opt/jboss** ini dari user **root** ke user **jboss** dengan mengetikkan perintah seperti dibawah ini pada terminal :

    
    
    [root@localhost ~]# chown -R jboss:jboss /opt/jboss/
    [root@localhost ~]#
    



Sekarang mari kita cek, apakah direktori **/opt/jboss** beserta subdirektori didalam-nya ini sudah menjadi milik user **jboss** atau belum dengan mengetikkan perintah seperti dibawah ini :

    
    
    [root@localhost ~]# ls -l /opt/jboss/
    total 268
    drwxr-xr-x 2 jboss jboss   4096 Feb 17 07:26 bin
    drwxr-xr-x 2 jboss jboss   4096 Feb 17 07:26 client
    drwxr-xr-x 3 jboss jboss   4096 Feb 17 07:26 common
    -rw-r--r-- 1 jboss jboss   6133 Feb 17 07:26 copyright.txt
    drwxr-xr-x 7 jboss jboss   4096 Feb 17 07:26 docs
    -rw-r--r-- 1 jboss jboss 107376 Feb 17 07:26 jar-versions.xml
    -rw-r--r-- 1 jboss jboss   8074 Feb 17 07:26 JBossORG-EULA.txt
    -rw-r--r-- 1 jboss jboss  33732 Feb 17 07:26 lgpl.html
    drwxr-xr-x 3 jboss jboss   4096 Feb 17 07:26 lib
    -rw-r--r-- 1 jboss jboss  36365 Feb 17 07:26 readme.html
    drwxr-xr-x 7 jboss jboss   4096 Feb 17 07:26 server
    [root@localhost ~]#
    


Hore... proses installasi [JBoss Application Server](http://www.jboss.org/) sampai disini sudah bisa dikatakan **hampir** selesai, dan jika anda tidak percaya sekarang coba jalankan perintah **/bin/sh /opt/jboss/bin/run.sh** dan anda akan dapat melihat bahwa [JBoss Application Server](http://www.jboss.org/) memulai proses inisialisasi dan pada akhir-nya kita bisa mengakses ke alamat **localhost:8080** seperti dibawah ini :

    
    
    [root@localhost ~]# /bin/sh /opt/jboss/bin/run.sh
    =========================================================================
    
      JBoss Bootstrap Environment
    
      JBOSS_HOME: /opt/jboss
    
      JAVA: /opt/jdk1.6.0_17/bin/java
    
      JAVA_OPTS: -Dprogram.name=run.sh -server -Xms128m -Xmx512m -XX:MaxPermSize=256m -Dorg.jboss.resolver.warning=true -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000 -Djava.net.preferIPv4Stack=true
    
      CLASSPATH: /opt/jboss/bin/run.jar:/opt/jdk1.6.0_17/lib/tools.jar
    
    =========================================================================
    
    10:31:09,337 INFO  [ServerImpl] Starting JBoss (Microcontainer)...
    10:31:09,338 INFO  [ServerImpl] Release ID: JBoss [The Oracle] 5.1.0.GA (build: SVNTag=JBoss_5_1_0_GA date=200905221053)
    10:31:09,339 INFO  [ServerImpl] Bootstrap URL: null
    10:31:09,339 INFO  [ServerImpl] Home Dir: /opt/jboss
    10:31:09,339 INFO  [ServerImpl] Home URL: file:/opt/jboss/
    10:31:09,340 INFO  [ServerImpl] Library URL: file:/opt/jboss/lib/
    10:31:09,341 INFO  [ServerImpl] Patch URL: null
    10:31:09,341 INFO  [ServerImpl] Common Base URL: file:/opt/jboss/common/
    10:31:09,341 INFO  [ServerImpl] Common Library URL: file:/opt/jboss/common/lib/
    10:31:09,342 INFO  [ServerImpl] Server Name: default
    10:31:09,342 INFO  [ServerImpl] Server Base Dir: /opt/jboss/server
    10:31:09,366 INFO  [ServerImpl] Server Base URL: file:/opt/jboss/server/
    10:31:09,366 INFO  [ServerImpl] Server Config URL: file:/opt/jboss/server/default/conf/
    10:31:09,367 INFO  [ServerImpl] Server Home Dir: /opt/jboss/server/default
    10:31:09,367 INFO  [ServerImpl] Server Home URL: file:/opt/jboss/server/default/
    10:31:09,367 INFO  [ServerImpl] Server Data Dir: /opt/jboss/server/default/data
    10:31:09,368 INFO  [ServerImpl] Server Library URL: file:/opt/jboss/server/default/lib/
    10:31:09,368 INFO  [ServerImpl] Server Log Dir: /opt/jboss/server/default/log
    10:31:09,368 INFO  [ServerImpl] Server Native Dir: /opt/jboss/server/default/tmp/native
    10:31:09,369 INFO  [ServerImpl] Server Temp Dir: /opt/jboss/server/default/tmp
    10:31:09,369 INFO  [ServerImpl] Server Temp Deploy Dir: /opt/jboss/server/default/tmp/deploy
    10:31:10,457 INFO  [ServerImpl] Starting Microcontainer, bootstrapURL=file:/opt/jboss/server/default/conf/bootstrap.xml
    10:31:11,249 INFO  [VFSCacheFactory] Initializing VFSCache [org.jboss.virtual.plugins.cache.CombinedVFSCache]
    10:31:11,252 INFO  [VFSCacheFactory] Using VFSCache [CombinedVFSCache[real-cache: null]]
    10:31:11,764 INFO  [CopyMechanism] VFS temp dir: /opt/jboss/server/default/tmp
    10:31:11,765 INFO  [ZipEntryContext] VFS force nested jars copy-mode is enabled.
    10:31:14,613 INFO  [ServerInfo] Java version: 1.6.0_17,Sun Microsystems Inc.
    10:31:14,615 INFO  [ServerInfo] Java Runtime: Java(TM) SE Runtime Environment (build 1.6.0_17-b04)
    10:31:14,616 INFO  [ServerInfo] Java VM: Java HotSpot(TM) Server VM 14.3-b01,Sun Microsystems Inc.
    10:31:14,617 INFO  [ServerInfo] OS-System: Linux 2.6.18-164.el5,i386
    10:31:14,618 INFO  [ServerInfo] VM arguments: -Dprogram.name=run.sh -Xms128m -Xmx512m -XX:MaxPermSize=256m -Dorg.jboss.resolver.warning=true -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000 -Djava.net.preferIPv4Stack=true -Djava.endorsed.dirs=/opt/jboss/lib/endorsed
    10:31:14,676 INFO  [JMXKernel] Legacy JMX core initialized
    10:31:19,588 INFO  [ProfileServiceBootstrap] Loading profile: ProfileKey@1f2412a[domain=default, server=default, name=default]
    10:31:24,116 INFO  [WebService] Using RMI server codebase: http://127.0.0.1:8083/
    10:31:39,347 INFO  [NativeServerConfig] JBoss Web Services - Stack Native Core
    10:31:39,349 INFO  [NativeServerConfig] 3.1.2.GA
    10:31:40,416 INFO  [AttributeCallbackItem] Owner callback not implemented.
    10:31:42,850 INFO  [LogNotificationListener] Adding notification listener for logging mbean "jboss.system:service=Logging,type=Log4jService" to server org.jboss.mx.server.MBeanServerImpl@1257687[ defaultDomain='jboss' ]
    10:32:00,607 INFO  [Ejb3DependenciesDeployer] Encountered deployment AbstractVFSDeploymentContext@19997545{vfsfile:/opt/jboss/server/default/deploy/profileservice-secured.jar/}
    10:32:00,611 INFO  [Ejb3DependenciesDeployer] Encountered deployment AbstractVFSDeploymentContext@19997545{vfsfile:/opt/jboss/server/default/deploy/profileservice-secured.jar/}
    10:32:00,611 INFO  [Ejb3DependenciesDeployer] Encountered deployment AbstractVFSDeploymentContext@19997545{vfsfile:/opt/jboss/server/default/deploy/profileservice-secured.jar/}
    10:32:00,611 INFO  [Ejb3DependenciesDeployer] Encountered deployment AbstractVFSDeploymentContext@19997545{vfsfile:/opt/jboss/server/default/deploy/profileservice-secured.jar/}
    10:32:03,751 INFO  [JMXConnectorServerService] JMX Connector server: service:jmx:rmi://127.0.0.1/jndi/rmi://127.0.0.1:1090/jmxconnector
    10:32:04,779 INFO  [MailService] Mail Service bound to java:/Mail
    10:32:08,801 WARN  [JBossASSecurityMetadataStore] WARNING! POTENTIAL SECURITY RISK. It has been detected that the MessageSucker component which sucks messages from one node to another has not had its password changed from the installation default. Please see the JBoss Messaging user guide for instructions on how to do this.
    10:32:08,820 WARN  [AnnotationCreator] No ClassLoader provided, using TCCL: org.jboss.managed.api.annotation.ManagementComponent
    10:32:09,626 WARN  [AnnotationCreator] No ClassLoader provided, using TCCL: org.jboss.managed.api.annotation.ManagementComponent
    10:32:09,835 INFO  [TransactionManagerService] JBossTS Transaction Service (JTA version - tag:JBOSSTS_4_6_1_GA) - JBoss Inc.
    10:32:09,837 INFO  [TransactionManagerService] Setting up property manager MBean and JMX layer
    10:32:10,262 INFO  [TransactionManagerService] Initializing recovery manager
    10:32:10,429 INFO  [TransactionManagerService] Recovery manager configured
    10:32:10,429 INFO  [TransactionManagerService] Binding TransactionManager JNDI Reference
    10:32:11,318 INFO  [TransactionManagerService] Starting transaction recovery manager
    10:32:12,240 INFO  [AprLifecycleListener] The Apache Tomcat Native library which allows optimal performance in production environments was not found on the java.library.path: /opt/jdk1.6.0_17/jre/lib/i386/server:/opt/jdk1.6.0_17/jre/lib/i386:/opt/jdk1.6.0_17/jre/../lib/i386:/usr/java/packages/lib/i386:/lib:/usr/lib
    10:32:12,598 INFO  [Http11Protocol] Initializing Coyote HTTP/1.1 on http-127.0.0.1-8080
    10:32:12,600 INFO  [AjpProtocol] Initializing Coyote AJP/1.3 on ajp-127.0.0.1-8009
    10:32:12,687 INFO  [StandardService] Starting service jboss.web
    10:32:12,690 INFO  [StandardEngine] Starting Servlet Engine: JBoss Web/2.1.3.GA
    10:32:12,775 INFO  [Catalina] Server startup in 173 ms
    10:32:12,815 INFO  [TomcatDeployment] deploy, ctxPath=/web-console
    10:32:14,004 INFO  [TomcatDeployment] deploy, ctxPath=/jbossws
    10:32:14,270 INFO  [TomcatDeployment] deploy, ctxPath=/invoker
    10:32:14,474 INFO  [RARDeployment] Required license terms exist, view vfszip:/opt/jboss/server/default/deploy/jboss-local-jdbc.rar/META-INF/ra.xml
    10:32:14,565 INFO  [RARDeployment] Required license terms exist, view vfszip:/opt/jboss/server/default/deploy/jboss-xa-jdbc.rar/META-INF/ra.xml
    10:32:14,622 INFO  [RARDeployment] Required license terms exist, view vfszip:/opt/jboss/server/default/deploy/jms-ra.rar/META-INF/ra.xml
    10:32:14,661 INFO  [RARDeployment] Required license terms exist, view vfszip:/opt/jboss/server/default/deploy/mail-ra.rar/META-INF/ra.xml
    10:32:14,736 INFO  [RARDeployment] Required license terms exist, view vfszip:/opt/jboss/server/default/deploy/quartz-ra.rar/META-INF/ra.xml
    10:32:14,942 INFO  [SimpleThreadPool] Job execution threads will use class loader of thread: main
    10:32:15,765 INFO  [QuartzScheduler] Quartz Scheduler v.1.5.2 created.
    10:32:15,769 INFO  [RAMJobStore] RAMJobStore initialized.
    10:32:15,770 INFO  [StdSchedulerFactory] Quartz scheduler 'DefaultQuartzScheduler' initialized from default resource file in Quartz package: 'quartz.properties'
    10:32:15,770 INFO  [StdSchedulerFactory] Quartz scheduler version: 1.5.2
    10:32:15,770 INFO  [QuartzScheduler] Scheduler DefaultQuartzScheduler_$_NON_CLUSTERED started.
    10:32:16,584 INFO  [ConnectionFactoryBindingService] Bound ConnectionManager 'jboss.jca:service=DataSourceBinding,name=DefaultDS' to JNDI name 'java:DefaultDS'
    10:32:17,409 INFO  [ServerPeer] JBoss Messaging 1.4.3.GA server [0] started
    10:32:17,561 INFO  [QueueService] Queue[/queue/ExpiryQueue] started, fullSize=200000, pageSize=2000, downCacheSize=2000
    10:32:17,745 INFO  [ConnectionFactory] Connector bisocket://127.0.0.1:4457 has leasing enabled, lease period 10000 milliseconds
    10:32:17,745 INFO  [ConnectionFactory] org.jboss.jms.server.connectionfactory.ConnectionFactory@1e88ea started
    10:32:17,746 INFO  [ConnectionFactoryJNDIMapper] supportsFailover attribute is true on connection factory: jboss.messaging.connectionfactory:service=ClusteredConnectionFactory but post office is non clustered. So connection factory will *not* support failover
    10:32:17,747 INFO  [ConnectionFactoryJNDIMapper] supportsLoadBalancing attribute is true on connection factory: jboss.messaging.connectionfactory:service=ClusteredConnectionFactory but post office is non clustered. So connection factory will *not* support load balancing
    10:32:17,748 INFO  [ConnectionFactory] Connector bisocket://127.0.0.1:4457 has leasing enabled, lease period 10000 milliseconds
    10:32:17,749 INFO  [ConnectionFactory] org.jboss.jms.server.connectionfactory.ConnectionFactory@d98370 started
    10:32:17,760 INFO  [ConnectionFactory] Connector bisocket://127.0.0.1:4457 has leasing enabled, lease period 10000 milliseconds
    10:32:17,761 INFO  [ConnectionFactory] org.jboss.jms.server.connectionfactory.ConnectionFactory@11bcb51 started
    10:32:17,763 INFO  [QueueService] Queue[/queue/DLQ] started, fullSize=200000, pageSize=2000, downCacheSize=2000
    10:32:18,151 INFO  [ConnectionFactoryBindingService] Bound ConnectionManager 'jboss.jca:service=ConnectionFactoryBinding,name=JmsXA' to JNDI name 'java:JmsXA'
    10:32:19,709 INFO  [JBossASKernel] Created KernelDeployment for: profileservice-secured.jar
    10:32:19,715 INFO  [JBossASKernel] installing bean: jboss.j2ee:jar=profileservice-secured.jar,name=SecureProfileService,service=EJB3
    10:32:19,716 INFO  [JBossASKernel]   with dependencies:
    10:32:19,716 INFO  [JBossASKernel]   and demands:
    10:32:19,716 INFO  [JBossASKernel]      jndi:SecureManagementView/remote-org.jboss.deployers.spi.management.ManagementView
    10:32:19,716 INFO  [JBossASKernel]      jboss.ejb:service=EJBTimerService
    10:32:19,716 INFO  [JBossASKernel]   and supplies:
    10:32:19,718 INFO  [JBossASKernel]      Class:org.jboss.profileservice.spi.ProfileService
    10:32:19,718 INFO  [JBossASKernel]      jndi:SecureProfileService/remote
    10:32:19,718 INFO  [JBossASKernel]      jndi:SecureProfileService/remote-org.jboss.profileservice.spi.ProfileService
    10:32:19,719 INFO  [JBossASKernel] Added bean(jboss.j2ee:jar=profileservice-secured.jar,name=SecureProfileService,service=EJB3) to KernelDeployment of: profileservice-secured.jar
    10:32:19,723 INFO  [JBossASKernel] installing bean: jboss.j2ee:jar=profileservice-secured.jar,name=SecureDeploymentManager,service=EJB3
    10:32:19,724 INFO  [JBossASKernel]   with dependencies:
    10:32:19,724 INFO  [JBossASKernel]   and demands:
    10:32:19,724 INFO  [JBossASKernel]      jboss.ejb:service=EJBTimerService
    10:32:19,725 INFO  [JBossASKernel]   and supplies:
    10:32:19,727 INFO  [JBossASKernel]      jndi:SecureDeploymentManager/remote-org.jboss.deployers.spi.management.deploy.DeploymentManager
    10:32:19,749 INFO  [JBossASKernel]      Class:org.jboss.deployers.spi.management.deploy.DeploymentManager
    10:32:19,751 INFO  [JBossASKernel]      jndi:SecureDeploymentManager/remote
    10:32:19,752 INFO  [JBossASKernel] Added bean(jboss.j2ee:jar=profileservice-secured.jar,name=SecureDeploymentManager,service=EJB3) to KernelDeployment of: profileservice-secured.jar
    10:32:19,753 INFO  [JBossASKernel] installing bean: jboss.j2ee:jar=profileservice-secured.jar,name=SecureManagementView,service=EJB3
    10:32:19,775 INFO  [JBossASKernel]   with dependencies:
    10:32:19,775 INFO  [JBossASKernel]   and demands:
    10:32:19,775 INFO  [JBossASKernel]      jboss.ejb:service=EJBTimerService
    10:32:19,775 INFO  [JBossASKernel]   and supplies:
    10:32:19,776 INFO  [JBossASKernel]      jndi:SecureManagementView/remote-org.jboss.deployers.spi.management.ManagementView
    10:32:19,776 INFO  [JBossASKernel]      Class:org.jboss.deployers.spi.management.ManagementView
    10:32:19,776 INFO  [JBossASKernel]      jndi:SecureManagementView/remote
    10:32:19,776 INFO  [JBossASKernel] Added bean(jboss.j2ee:jar=profileservice-secured.jar,name=SecureManagementView,service=EJB3) to KernelDeployment of: profileservice-secured.jar
    10:32:19,829 INFO  [EJB3EndpointDeployer] Deploy AbstractBeanMetaData@efd6cf{name=jboss.j2ee:jar=profileservice-secured.jar,name=SecureProfileService,service=EJB3_endpoint bean=org.jboss.ejb3.endpoint.deployers.impl.EndpointImpl properties=[container] constructor=null autowireCandidate=true}
    10:32:19,829 INFO  [EJB3EndpointDeployer] Deploy AbstractBeanMetaData@9d44a2{name=jboss.j2ee:jar=profileservice-secured.jar,name=SecureDeploymentManager,service=EJB3_endpoint bean=org.jboss.ejb3.endpoint.deployers.impl.EndpointImpl properties=[container] constructor=null autowireCandidate=true}
    10:32:19,830 INFO  [EJB3EndpointDeployer] Deploy AbstractBeanMetaData@1a1b224{name=jboss.j2ee:jar=profileservice-secured.jar,name=SecureManagementView,service=EJB3_endpoint bean=org.jboss.ejb3.endpoint.deployers.impl.EndpointImpl properties=[container] constructor=null autowireCandidate=true}
    10:32:20,154 INFO  [SessionSpecContainer] Starting jboss.j2ee:jar=profileservice-secured.jar,name=SecureDeploymentManager,service=EJB3
    10:32:20,173 INFO  [EJBContainer] STARTED EJB: org.jboss.profileservice.ejb.SecureDeploymentManager ejbName: SecureDeploymentManager
    10:32:20,319 INFO  [JndiSessionRegistrarBase] Binding the following Entries in Global JNDI:
    
            SecureDeploymentManager/remote - EJB3.x Default Remote Business Interface
            SecureDeploymentManager/remote-org.jboss.deployers.spi.management.deploy.DeploymentManager - EJB3.x Remote Business Interface
    
    10:32:20,437 INFO  [SessionSpecContainer] Starting jboss.j2ee:jar=profileservice-secured.jar,name=SecureManagementView,service=EJB3
    10:32:20,441 INFO  [EJBContainer] STARTED EJB: org.jboss.profileservice.ejb.SecureManagementView ejbName: SecureManagementView
    10:32:20,539 INFO  [JndiSessionRegistrarBase] Binding the following Entries in Global JNDI:
    
            SecureManagementView/remote - EJB3.x Default Remote Business Interface
            SecureManagementView/remote-org.jboss.deployers.spi.management.ManagementView - EJB3.x Remote Business Interface
    
    10:32:20,619 INFO  [SessionSpecContainer] Starting jboss.j2ee:jar=profileservice-secured.jar,name=SecureProfileService,service=EJB3
    10:32:20,625 INFO  [EJBContainer] STARTED EJB: org.jboss.profileservice.ejb.SecureProfileServiceBean ejbName: SecureProfileService
    10:32:20,640 INFO  [JndiSessionRegistrarBase] Binding the following Entries in Global JNDI:
    
            SecureProfileService/remote - EJB3.x Default Remote Business Interface
            SecureProfileService/remote-org.jboss.profileservice.spi.ProfileService - EJB3.x Remote Business Interface
    
    10:32:20,958 INFO  [TomcatDeployment] deploy, ctxPath=/admin-console
    10:32:21,079 INFO  [config] Initializing Mojarra (1.2_12-b01-FCS) for context '/admin-console'
    10:32:27,285 INFO  [TomcatDeployment] deploy, ctxPath=/
    10:32:27,647 INFO  [TomcatDeployment] deploy, ctxPath=/jmx-console
    10:32:27,931 INFO  [Http11Protocol] Starting Coyote HTTP/1.1 on http-127.0.0.1-8080
    10:32:28,250 INFO  [AjpProtocol] Starting Coyote AJP/1.3 on ajp-127.0.0.1-8009
    10:32:28,308 INFO  [ServerImpl] JBoss (Microcontainer) [5.1.0.GA (build: SVNTag=JBoss_5_1_0_GA date=200905221053)] Started in 1m:18s:937ms
    


[![Screenshot JBoss](http://martinusadyh.web.id/wp-content/gallery/tutorial/screenshot.png)](http://martinusadyh.web.id/gallery/?album=4&gallery=3&pid=106)  
Tampilan Awal JBoss Application Server

Nah kenapa saya bilang ini **hampir selesai** ? Karena untuk menjalankan dan meng-shutdown [JBoss Application Server](http://www.jboss.org/) kita harus melakukan penekanan tombol **CTRL+C** pada terminal yang sedang aktif menjalankan [JBoss Application Server](http://www.jboss.org/), dan selain itu dengan cara seperti ini kita tidak bisa membuat agar ketika server di **reboot** [JBoss Application Server](http://www.jboss.org/) juga secara otomatis ikut berjalan.




  3. **Pembuatan Init Script Agar JBoss Bisa Berjalan Sebagai Daemon Di CentOS**
Agar [JBoss Application Server](http://www.jboss.org/) dapat berjalan sebagai **service** di [CentOS](http://centos.org/) maka kita harus membuatkan sebuah **init script** yang kita simpan pada direktori **/etc/init.d**. Untung-nya [JBoss Application Server](http://www.jboss.org/) menyertakan contoh **init script** sederhana untuk distribusi [RedHat](http://www.redhat.com/) yang terdapat pada direktori **/opt/jboss/bin/** dengan nama **jboss_init_redhat.sh**. Sekarang copy-kan file **/opt/jboss/bin/jboss_init_redhat.sh** tersebut kedalam direktori **/etc/init.d/** dan beri nama **jboss** seperti perintah dibawah ini :

    
    
    [root@localhost bin]# cp /opt/jboss/bin/jboss_init_redhat.sh /etc/init.d/jboss
    [root@localhost bin]#
    



Kemudian editlah file **/etc/init.d/jboss** diatas hingga menjadi seperti dibawah ini :

    
    
    #!/bin/sh
    #
    # $Id: jboss_init_redhat.sh 81068 2008-11-14 15:14:35Z dimitris@jboss.org $
    #
    # JBoss Control Script
    #
    # To use this script run it as root - it will switch to the specified user
    #
    # Here is a little (and extremely primitive) startup/shutdown script
    # for RedHat systems. It assumes that JBoss lives in /usr/local/jboss,
    # its run by user 'jboss' and JDK binaries are in /usr/local/jdk/bin.
    # All this can be changed in the script itself.
    #
    # Either modify this script for your requirements or just ensure that
    # the following variables are set correctly before calling the script.
    
    #define where jboss is - this is the directory containing directories log, bin, conf etc
    JBOSS_HOME=${JBOSS_HOME:-"/opt/jboss"}
    
    #define the user under which jboss will run, or use 'RUNASIS' to run as the current user
    JBOSS_USER=${JBOSS_USER:-"jboss"}
    
    #make sure java is in your path
    JAVAPTH=${JAVAPTH:-"/opt/jdk1.6.0_17/bin"}
    
    #configuration to use, usually one of 'minimal', 'default', 'all'
    JBOSS_CONF=${JBOSS_CONF:-"default"}
    
    #define the classpath for the shutdown class
    JBOSSCP=${JBOSSCP:-"$JBOSS_HOME/bin/shutdown.jar:$JBOSS_HOME/client/jnet.jar"}
    
    #define the script to use to start jboss
    # Catatan : tambahan opsi -b 0.0.0.0 ini berfungsi agar JBOSS bisa diakses
    # didalam LAN. Secara default JBOSS hanya mengijinkan akses yang berasal
    # dari localhost saja.
    JBOSSSH=${JBOSSSH:-"$JBOSS_HOME/bin/run.sh -c $JBOSS_CONF -b 0.0.0.0"}
    
    if [ "$JBOSS_USER" = "RUNASIS" ]; then
      SUBIT=""
    else
      SUBIT="su - $JBOSS_USER -c "
    fi
    
    if [ -n "$JBOSS_CONSOLE" -a ! -d "$JBOSS_CONSOLE" ]; then
      # ensure the file exists
      touch $JBOSS_CONSOLE
      if [ ! -z "$SUBIT" ]; then
        chown $JBOSS_USER $JBOSS_CONSOLE
      fi
    fi
    
    if [ -n "$JBOSS_CONSOLE" -a ! -f "$JBOSS_CONSOLE" ]; then
      echo "WARNING: location for saving console log invalid: $JBOSS_CONSOLE"
      echo "WARNING: ignoring it and using /dev/null"
      JBOSS_CONSOLE="/dev/null"
    fi
    
    #define what will be done with the console log
    JBOSS_CONSOLE=${JBOSS_CONSOLE:-"/dev/null"}
    
    JBOSS_CMD_START="cd $JBOSS_HOME/bin; $JBOSSSH"
    # comment this line, we will create new function to stopping jboss
    # JBOSS_CMD_STOP=${JBOSS_CMD_STOP:-"java -classpath $JBOSSCP org.jboss.Shutdown --shutdown"}
    
    if [ -z "`echo $PATH | grep $JAVAPTH`" ]; then
      export PATH=$PATH:$JAVAPTH
    fi
    
    if [ ! -d "$JBOSS_HOME" ]; then
      echo JBOSS_HOME does not exist as a valid directory : $JBOSS_HOME
      exit 1
    fi
    
    # echo JBOSS_CMD_START = $JBOSS_CMD_START
    
    # Function yang mengecek apakah service jboss masih aktif atau tidak
    procrunning() {
      procid=0
      for procid in `/sbin/pidof -x $JBOSS_HOME/bin/run.sh`; do
        ps -fp $procid | grep "${JBOSSSH% *}" > /dev/null && pid=$procid
      done
    }
    
    # Konfigurasi tambahan untuk proses stop service jboss berdasarkan PID
    stop() {
      pid=0
      procrunning
      if [ $pid = '0' ]; then
        /bin/echo -n -e "\nNo JBoss AS currently running\n"
       exit 1
      fi
    
      RETVAL=1
    
      # If process still running, try kill nicely
      for id in `ps --ppid $pid | awk '{print $1}' | grep -v "^PID$"`; do
        if [ -z "$SUBIT" ]; then
          kill -15 $id
        else
          $SUBIT "kill -15 $id"
        fi
      done
    
      sleep=0
      while [ $sleep -lt 120 -a $RETVAL -eq 1 ]; do
        /bin/echo -n -e "\n Waiting for JBoss process to stop";
       sleep 10
       sleep=`expr $sleep + 10`
       pid=0
       procrunning
       if [ $pid = '0' ]; then
         RETVAL=0
       fi
      done
    
      count=0
      pid=0
      procrunning
    
      if [ $RETVAL != 0 ]; then
         /bin/echo -e "\nTimeout: Shutdown command was sent, but process is still running with $pid PID"
         exit 1
      fi
    
      echo
      exit 0
    }
    
    case "$1" in
    start)
        cd $JBOSS_HOME/bin
        if [ -z "$SUBIT" ]; then
            eval $JBOSS_CMD_START >${JBOSS_CONSOLE} 2>&1 &
        else
            $SUBIT "$JBOSS_CMD_START >${JBOSS_CONSOLE} 2>&1 &"
        fi
        ;;
    stop)
        stop
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    *)
        echo "usage: $0 (start|stop|restart|help)"
    esac
    



Setelah melakukan penyimpanan, sekarang mari kita daftarkan pada **service** yang terdapat pada [CentOS](http://centos.org/) dengan mengetikkan perintah **/sbin/chkconfig --add jboss** seperti dibawah ini :

    
    
    [root@localhost init.d]# /sbin/chkconfig --add jboss
    service jboss does not support chkconfig
    [root@localhost init.d]#
    



Hmm.. waduh koq tidak mau, ok sekarang waktu-nya bertanya pada paman google :D :) Dan untung-nya paman google sangat berbaik hati dengan memberikan link-link [ini](http://www.google.co.id/search?hl=id&client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&hs=inD&q=chkconfig&btnG=Telusuri&meta=&aq=f&oq=) dan akhir-nya membawa saya pada halaman manual chkconfig [disini](http://linuxcommand.org/man_pages/chkconfig8.html). Kesimpulan yang didapat, jika kita membuat sebuah **custom init script** dan ingin diregisterkan menggunakan **chkconfig** maka yang harus dilakukan yaitu dengan menambah beberapa baris pada file **init script** kita dengan informasi seperti dibawah ini :

    
    
    # chkconfig: 2345 20 80
    # description: Saves and restores system entropy pool for
    #              higher quality random number generation.
    



Nah maksud dari **script** diatas adalah, kita ingin agar service kita berjalan pada **run level 2345** dan prioritas untuk start-nya adalah 20 dan untuk shutdown-nya adalah 80 :) (Buat teman-teman pengguna kawakan distro Red Hat atau turunan-nya, ada yang tahu gimana penentuan prioritas startup dan shutdown-nya ? Maksud saya bagaimana menentukan angka 20 dan 80 tersebut ?)

Ok sekarang mari kita rubah init script kita menjadi seperti dibawah ini (dengan tambahan keterangan untuk **chkconfig** tentu-nya) :

    
    
    #!/bin/sh
    #
    # $Id: jboss_init_redhat.sh 81068 2008-11-14 15:14:35Z dimitris@jboss.org $
    #
    # JBoss Control Script
    # chkconfig: 2345 92 08
    # description: JBoss Application Server
    #
    # To use this script run it as root - it will switch to the specified user
    #
    # Here is a little (and extremely primitive) startup/shutdown script
    # for RedHat systems. It assumes that JBoss lives in /usr/local/jboss,
    # its run by user 'jboss' and JDK binaries are in /usr/local/jdk/bin.
    # All this can be changed in the script itself.
    #
    # Either modify this script for your requirements or just ensure that
    # the following variables are set correctly before calling the script.
    



Setelah semua-nya selesai, sekarang mari kita coba daftarkan init script kita diatas dengan menggunakan perintah **/sbin/chkconfig --add jboss** seperti dibawah ini :

    
    
    [root@localhost init.d]# /sbin/chkconfig --add jboss
    



Ok sukses, sekarang mari kita coba cek apakah **service jboss** sudah aktif pada **run level** yang kita inginkan dengan mengetikkan perintah seperti dibawah ini :

    
    
    [root@localhost init.d]# /sbin/chkconfig --list jboss
    jboss        0:off   1:off   2:on    3:on    4:on    5:on    6:off
    [root@localhost init.d]#
    



Seeep sekarang mari kita coba jalankan dengan mengetik-kan perintah **/etc/init.d/jboss start** untuk mencoba menjalankan **service jboss**-nya dan cek port 8080 menggunakan perintah **netstat -planet | grep 8080** apakah **service jboss** sudah siap atau belum seperti dibawah ini :

    
    
    [root@localhost init.d]# /etc/init.d/jboss start
    [root@localhost init.d]# netstat -planet | grep 8080
    tcp        0      0 0.0.0.0:8080                0.0.0.0:*                   LISTEN      501        33924      11273/java
    [root@localhost init.d]#
    



Jika tampilan pada terminal anda seperti diatas, sekarang coba cek dengan membuka browser dan arahkan pada alamat **http://localhost:8080/** dan harus-nya anda akan melihat tampilan halaman utama [JBoss Application Server](http://www.jboss.org/) muncul di browser kesayangan anda :)




  4. **Testing Konfigurasi**
Pada konfigurasi **init script** diatas, kita menambahkan 1 konfigurasi **-b 0.0.0.0** ini agar kita bisa mengakses [JBoss Application Server](http://www.jboss.org/) ini dari komputer selain **localhost**. Nah sekarang mari kita coba mengakses server kita dari komputer lain dengan mengetikkan alamat **http://ip-server:8080/** dan jika konfigurasi kita benar, maka seharusnya kita bisa melihat halaman awal [JBoss Application Server](http://www.jboss.org/) seperti gambar dibawah ini :
[![remote1](http://farm3.static.flickr.com/2723/4368926998_24bb8498a2.jpg)  
Tampilan Halaman Depan JBoss AS Di Akses Dari Jaringan 1 LAN](http://www.flickr.com/photos/10243554@N02/4368926998/)

[![remote2](http://farm5.static.flickr.com/4070/4368927004_e048168b86.jpg)  
Tampilan Halaman JBoss Web Consolse. Login dengan menggunakan username=admin, password=admin](http://www.flickr.com/photos/10243554@N02/4368927004/)

[![remote3](http://farm3.static.flickr.com/2768/4368927006_b91e72218c.jpg)  
Tampilan JMX Console JBoss](http://www.flickr.com/photos/10243554@N02/4368927006/)

[![remote4](http://farm3.static.flickr.com/2764/4368927008_e5571e0769.jpg)  
Tampilan JMX Agent](http://www.flickr.com/photos/10243554@N02/4368927008/)




Akhir-nya selesai juga proses installasi dan konfigurasi [JBoss Application Server](http://www.jboss.org/) ini :) . Nah bagaimana teman-teman, tertarik mencoba [JBoss Application Server](http://www.jboss.org/) sebagai server development atau server production-nya ? :)

**Link-link terkait :**




  * [JBoss Server Development](http://chiralsoftware.com/linux-system-administration/jboss-server-deployment.seam)

  * [Ubuntu Firewall IP Tables](http://chiralsoftware.com/linux-system-administration/ubuntu-firewall-iptables.seam;jsessionid=A646C674E1D5434B34AEE69737524119)

  * [JBoss Application Server](http://rimuhosting.com/jboss.jsp)

  * [Step By Step Installing CentOS 5.4](http://martinusadyh.web.id/2010/02/17/step-by-step-installing-centos-54/)


  * [JBoss Application Server](http://www.jboss.org/)


  * [Oracle WebLogic](http://www.oracle.com/appserver/weblogic/enterprise-edition.html)


  * [Glassfish Application Server](https://glassfish.dev.java.net/)


  * [CentOS (The Community Enterprise Operating System)](http://centos.org/)


