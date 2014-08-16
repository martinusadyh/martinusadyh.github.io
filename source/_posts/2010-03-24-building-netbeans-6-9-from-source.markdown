---
comments: true
date: 2010-03-24 20:57:16+00:00
layout: post
slug: building-netbeans-6-9-from-source
title: Building NetBeans 6.9 From Source
wordpress_id: 403
categories:
- Java
- NetBeans
tags:
- apache ant
- installer
- Java
- java installer
- java swing
- NetBeans
- RCP
---

Untuk teman-teman pecinta [NetBeans IDE](http://netbeans.org/) pasti sudah tahu dong kalau tanggal 17 Februari 2010 kemarin [NetBeans](http://netbeans.org/) sudah merilis versi [NetBeans 6.9 M1](http://bits.netbeans.org/netbeans/6.9/m1/), nah untuk teman-teman yang baru tahu sekarang silahkan lihat dulu daftar fitur yang di bawa oleh [NetBeans 6.9 M1](http://bits.netbeans.org/netbeans/6.9/m1/) itu [disini](http://wiki.netbeans.org/NewAndNoteworthy69m1). Berselang satu bulan kemudian, saya membaca entri di blog om Geertjan dengan topik [Generate a NetBeans Platform Installer with NetBeans IDE 6.9](http://blogs.sun.com/geertjan/entry/generate_a_netbeans_platform_installer) . Nah jika teman-teman ingin menggunakan [NetBeans IDE](http://netbeans.org/) yang mempunyai fasilitas installer tersebut, teman-teman harus bersusah-susah (ukuran total dari repository **main-silver** mencapai 2.4 GB dan berhasil saya download dalam 2 hari :( ) dahulu mendownload source code versi develpomentnya :D Karena di [NetBeans 6.9 M1](http://bits.netbeans.org/netbeans/6.9/m1/) yang sudah di release, fasilitas ini tidak ditemukan :D 

Nah jika memang teman-teman sudah tidak sabar untuk segera mencicipi fasilitas terbaru yang terdapat pada [NetBeans IDE](http://netbeans.org/) versi development dan ingin mencoba untuk melakukan build dari source code, maka teman-teman harus mempersiapkan beberapa kebutuhan seperti dibawah ini terlebih dahulu :




  1. **Java Development Kit versi 1.6**
Agar proses build berhasil pada [NetBeans versi 6.9](http://netbeans.org/) ini, maka teman-teman harus memastikan dulu bahwa versi java yang digunakan adalah versi **1.6** atau versi yang lebih baru dan bisa di download di [sini](http://java.sun.com/javase/downloads/index.jsp). Sedangkan jika teman-teman merasa bahwa sudah menginstall java, tapi kurang begitu yakin dengan versinya bisa mengecek dengan menjalankan perintah `java -version` pada terminal atau `command prompt` seperti dibawah ini :

    
    
    martinus@martinusadyh:[~]$ java -version
    java version "1.6.0_16"
    Java(TM) SE Runtime Environment (build 1.6.0_16-b01)
    Java HotSpot(TM) Server VM (build 14.2-b01, mixed mode)
    martinus@martinusadyh:[~]$
    





  2. **Apache Ant 1.7.1**
[NetBeans IDE](http://netbeans.org/) menggunakan [Apache ANT](http://ant.apache.org/) sebagai **automatic build tools**-nya, maka pastikan bahwa teman-teman juga sudah menginstall [Apache ANT](http://ant.apache.org/) versi **1.7.1** atau yang lebih baru. Jika teman-teman belum menginstall [Apache ANT](http://ant.apache.org/), maka download-lah dahulu versi yang terbaru dari situs [Apache ANT](http://ant.apache.org/). Sedangkan untuk mengecek berapa versi [Apache ANT](http://ant.apache.org/) yang terinstall pada komputer, teman-teman bisa mengetikkan perintah `ant -v` seperti perintah dibawah ini :

    
    
    martinus@martinusadyh:[~]$ ant -v
    Apache Ant version 1.7.1 compiled on June 27 2008
    Buildfile: build.xml does not exist!
    Build failed
    martinus@martinusadyh:[~]$
    






  3. **Mercurial 1.0.2**
Selain dua kebutuhan diatas, pengembang [NetBeans](http://netbeans.org/) juga menyarankan agar teman-teman mempunyai [Mercurial](http://mercurial.selenic.com/) versi **1.0.2** atau yang lebih baru terinstall pada komputer teman-teman. Sedangkan untuk mengecek berapa versi [Mercurial](http://mercurial.selenic.com/) yang terinstall pada komputer kita, teman-teman bisa mengetikkan perintah `hg --version` seperti dibawah ini :

    
    
    martinus@martinusadyh:[~]$ hg --version
    Mercurial Distributed SCM (version 1.2.1)
    
    Copyright (C) 2005-2009 Matt Mackall <mpm@selenic.com> and others
    This is free software; see the source for copying conditions. There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    martinus@martinusadyh:[~]$
    





Semua kebutuhan diatas ini merupakan kebutuhan minimal yang harus teman-teman penuhi agar [NetBeans IDE](http://netbeans.org/) bisa di build, jika teman-teman mempunyai versi diatas versi yang telah disebutin diatas itu lebih bagus :)

<!-- more -->
Jika semua kebutuhan yang telah disebutkan diatas sudah terpenuhi, sekarang mari kita download source code [NetBeans IDE](http://netbeans.org/) dari repository **main-silver** dengan mengetikkan perintah `hg clone http://hg.netbeans.org/main-silver/` seperti dibawah ini :

    
    
    martinus@martinusadyh:[/media/data/NB_SOURCE]$ hg clone http://hg.netbeans.org/main-silver/
    destination directory: main-silver
    requesting all changes
    adding changesets
    adding manifests
    adding file changes
    added 162995 changesets with 619735 changes to 123586 files
    updating working directory
    91308 files updated, 0 files merged, 0 files removed, 0 files unresolved
    martinus@martinusadyh:[/media/data/NB_SOURCE]$
    


**Catatan: Source code netbeans-nya besar sekali, total 2.4 GB :D Jadi persiapkan hard disk dan koneksi internet teman-teman ya :D :) **

Jika source code [NetBeans IDE](http://netbeans.org/) sudah selesai di download, sekarang masuklah pada direktori `main-silver` kemudian jalankan perintah `ant -p` untuk melihat opsi-opsi apa saja yang tersedia seperti dibawah ini :

    
    
    martinus@martinusadyh:[/media/data/NB_SOURCE/main-silver]$ ant -p
    Buildfile: build.xml
    NetBeans master build script.
    Main targets:
    
     all                        Build the IDE and run basic validation tests.
     all-commitValidation       dummy target for build error recognition facility
     all-installer              Dummy target for build system compatibility
     all-nozip                  Build the IDE (no ZIP file, unpacked) and run basic validation tests.
     bootstrap                  Bootstrap NetBeans-specific Ant extensions.
     build                      Create a complete build including a ZIP distribution (but do not try it).
     build-jnlp                 Create a JNLP distribution.
     build-nbms                 Build all NBMs, all modules have to be built before proceed
     build-nozip                Build the IDE but do not create a final ZIP file.
     build-nozip-ml             Build the Multilanguage IDE but do not create a final ZIP file.
     build-platform             Build the NetBeans Platform (platform and harness clusters).
     build-source               Packages sources needed to compile given by cluster.name (can be specified by -Dcluster.name=nb.cluster.platform
     build-source-config        Packages sources needed to compile one cluster.config
     build-source-zips          Builds source zips for maven repository inclusion.
     build-test-dist            Build test distribution
     build-zip-ml               Create a compleate multilanguage build including a ZIP distributions
     check-javahelpbin          Validate intermodule links in helpsets.
     check-sigtests-release     Checks signature files of stable API modules
     clean                      Clean everything possible.
     clean-cluster              Clean only one cluster - takes clean.cluster.name as parameters
     clean-untracked-files      Removes files from clusters which are not listed as belonging to any NBM.
     commit-validation          Runs tests to validate IDE before commit.
     create-license-summary     Create a summary of the licenses used by libraries in the build.
     display-l10n-list-matches  Show which files are actually matched by an l10n.list in some module.
     gen-sigtests               Generates snaphost of API of all modules
     gen-sigtests-release       Generates signature files into stable API modules directories
     generate-files-layout      Generate summary of installed files.
     generate-golden-files      Generate summaries of module dependencies.
     increment-spec-versions    Increment all standard module specification versions. Pass -Dbranch=true if not on the trunk.
     index-layer-paths          Create index of layer paths.
     l10n-kit                   Builds the L10N kit
     print-selected-modules     Prints list of modules to build in selected cluster config.
     rebuild-cluster            Builds only one cluster with dependencies ; takes e.g. '-Drebuild.cluster.name=nb.cluster.visualweb' as parameter
     solpkg-build               Generate a prototype file and create a Solaris package.
     solpkg-pkgmk               Create a Solaris package.
     solpkg-pkgproto            Generate a prototype file.
     test                       Runs ${test.type} target in modules specified by ${test.modules}.
     testuserdir-delete         Clean temporary testing user directory.
     tryme                      Try running the IDE interactively. It is possible to use -Ddebug.port=3234 -Ddebug.pause=y to start the system in debug mode
     tryme-debug                Start IDE in debugger. May only be called from within IDE.
     tryme-profile              Start IDE in debugger. May only be called from within IDE.
     update                     Downloads binaries from an update center
     verify-libs-and-licenses   Verify the contents of third-party libraries and licenses.
    Default target: build-nozip
    martinus@martinusadyh:[/media/data/NB_SOURCE/main-silver]$ 
    



Jika teman-teman tidak ingin melakukan build seluruh project, teman-teman bisa memilih build per-modul. Sedangkan untuk mengetahui modul-modul apa saja yang tersedia teman-teman bisa mengetikkan perintah `ant print-selected-modules` seperti dibawah ini:

    
    
    martinus@martinusadyh:[/media/data/NB_SOURCE/main-silver]$ ant print-selected-modules
    Buildfile: build.xml
    
    -jdk-pre-preinit:
    
    -jdk-preinit:
    
    -jdk-warn:
    
    -jdk-presetdef-basic:
    
    -jdk-default:
    
    -jdk-init:
    
    -load-build-properties:
    
    bootstrap:
    [validate-hg-configuration] ======== WARNING ========
    [validate-hg-configuration] You need to configure a Mercurial username
    [validate-hg-configuration] if you intend to push changes to NetBeans repositories.
    [validate-hg-configuration] Format (in ~/.hgrc or Mercurial.ini):
    [validate-hg-configuration] [ui]
    [validate-hg-configuration] username = Robert Q. Hacker <rhacker@netbeans.org>
    [validate-hg-configuration] =========================
    [validate-hg-configuration] ======== WARNING ========
    [validate-hg-configuration] You need to guard against committing carriage returns into Mercurial
    [validate-hg-configuration] if you intend to push changes to NetBeans repositories.
    [validate-hg-configuration] Format (in ~/.hgrc or Mercurial.ini):
    [validate-hg-configuration] [hooks]
    [validate-hg-configuration] pretxncommit.crlf = python:hgext.win32text.forbidcrlf
    [validate-hg-configuration] =========================
         [echo] Bootstrapping NetBeans-specific Ant extensions...
    
    init-tasks:
    
    init-module-list:
    
    print-selected-modules:
         [echo] modules=glassfish.jruby,jellytools.ruby,libs.jrubyparser,libs.yydebug,o.jruby,o.jruby.distro,o.kxml2,o.rubyforge.debugcommons,ruby,ruby.codecoverage,ruby.debugger,ruby.extrahints,ruby.help,ruby.hints,ruby.javaint,ruby.kit,ruby.platform,ruby.project,ruby.railsprojects,ruby.rakeproject,ruby.refactoring,ruby.rhtml,ruby.samples.depot,ruby.testrunner,spellchecker.bindings.ruby,cnd,cnd.antlr,cnd.antlr3,cnd.api.model,cnd.api.project,cnd.api.remote,cnd.apt,cnd.asm,cnd.callgraph,cnd.classview,cnd.completion,cnd.debugger.common,cnd.debugger.gdb,cnd.discovery,cnd.dwarfdiscovery,cnd.dwarfdump,cnd.editor,cnd.folding,cnd.gizmo,cnd.gotodeclaration,cnd.highlight,cnd.kit,cnd.lexer,cnd.makeproject,cnd.model.services,cnd.modeldiscovery,cnd.modelimpl,cnd.modelui,cnd.modelutil,cnd.navigation,cnd.qnavigator,cnd.refactoring,cnd.remote,cnd.repository,cnd.repository.api,cnd.script,cnd.source,cnd.testrunner,cnd.toolchain,cnd.utils,jellytools.cnd,dlight,dlight.annotationsupport,dlight.collector.procfs,dlight.collector.stdout,dlight.core.stack,dlight.core.ui,dlight.cpu,dlight.db.derby,dlight.db.h2,dlight.dtrace,dlight.extras,dlight.fops,dlight.indicators,dlight.kit,dlight.management,dlight.memory,dlight.msa,dlight.msa.support,dlight.nativeexecution,dlight.perfan,dlight.procfs,dlight.remote,dlight.spi,dlight.sync,dlight.threadmap.support,dlight.threads,dlight.tools,dlight.toolsui,dlight.util,dlight.visualizers,lib.terminalemulator,terminal,libs.javacup,php.api.phpmodule,php.dbgp,php.editor,php.help,php.kit,php.project,php.refactoring,php.samples,php.symfony,php.zend,websvc.saas.codegen.php,apisupport.harness,apisupport.tc.cobertura,jellytools.platform,jemmy,libs.nbi.ant,libs.nbi.engine,nbjunit,o.n.insane,api.annotations.common,api.progress,api.visual,applemenu,autoupdate.services,autoupdate.ui,core.execution,core.io.ui,core.kit,core.multiview,core.nativeaccess,core.netigso,core.osgi,core.output2,core.startup,core.ui,core.windows,editor.mimelookup,editor.mimelookup.impl,favorites,javahelp,keyring,libs.felix,libs.jna,libs.jsr223,libs.junit4,libs.osgi,masterfs,o.jdesktop.layout,o.n.bootstrap,o.n.core,o.n.swing.outline,o.n.swing.plaf,o.n.swing.tabcontrol,openide.actions,openide.awt,openide.compat,openide.dialogs,openide.execution,openide.explorer,openide.filesystems,openide.io,openide.loaders,openide.modules,openide.nodes,openide.options,openide.text,openide.util,openide.util.enumerations,openide.util.lookup,openide.windows,options.api,options.keymap,print,progress.ui,queries,sendopts,settings,spi.actions,spi.quicksearch,api.debugger,api.java.classpath,api.xml,bugtracking,bugtracking.bridge,bugtracking.kenai,bugzilla,core.browser,core.ide,csl.api,css.editor,css.visual,db,db.core,db.dataview,db.drivers,db.kit,db.metadata.model,db.mysql,db.sql.editor,db.sql.visualeditor,dbapi,defaults,diff,editor,editor.actions,editor.bookmarks,editor.bracesmatching,editor.codetemplates,editor.completion,editor.deprecated.pre61settings,editor.errorstripe,editor.errorstripe.api,editor.fold,editor.guards,editor.indent,editor.indent.project,editor.kit,editor.lib,editor.lib2,editor.macros,editor.plain,editor.plain.lib,editor.settings,editor.settings.storage,editor.structure,editor.util,extbrowser,extexecution,extexecution.destroy,glassfish.common,gototest,gsf,gsf.api,gsf.codecoverage,gsf.testrunner,gsfpath.api,html,html.editor,html.editor.lib,html.lexer,httpserver,hudson,hudson.kenai,hudson.mercurial,hudson.subversion,ide.kit,image,javascript.editing,javascript.hints,javascript.kit,javascript.refactoring,jellytools.ide,jumpto,kenai,kenai.ui,languages,languages.diff,languages.manifest,languages.yaml,lexer,lexer.nbbridge,lib.cvsclient,libs.bugtracking,libs.bugzilla,libs.bytelist,libs.commons_codec,libs.commons_logging,libs.commons_net,libs.freemarker,libs.ini4j,libs.jakarta_oro,libs.jaxb,libs.jsch,libs.jvyamlb,libs.jzlib,libs.lucene,libs.smack,libs.svnClientAdapter,libs.swingx,libs.xerces,localhistory,mercurial,o.apache.xml.resolver,o.mozilla.rhino.patched,o.n.swing.dirchooser,o.openidex.util,options.editor,parsing.api,print.editor,project.ant,project.libraries,projectapi,projectui,projectui.buildmenu,projectuiapi,properties,properties.syntax,refactoring.api,schema2beans,server,servletapi,spellchecker,spellchecker.apimodule,spellchecker.bindings.htmlxml,spellchecker.dictionary_en,spellchecker.kit,spi.debugger.ui,spi.editor.hints,spi.navigator,spi.palette,spi.tasklist,spi.viewmodel,subversion,swing.validation,target.iterator,tasklist.kit,tasklist.projectint,tasklist.todo,tasklist.ui,team.kit,usersguide,utilities,utilities.project,versioning,versioning.indexingbridge,versioning.kenai,versioning.system.cvss,versioning.util,web.client.tools.api,web.common,web.flyingsaucer,xml,xml.axi,xml.catalog,xml.core,xml.jaxb.api,xml.lexer,xml.multiview,xml.retriever,xml.schema.completion,xml.schema.model,xml.tax,xml.text,xml.tools,xml.wsdl.model,xml.xam,xml.xdm,xsl,websvc.jaxwsmodelapi,websvc.saas.api,websvc.saas.codegen,websvc.saas.kit,websvc.saas.services.amazon,websvc.saas.services.delicious,websvc.saas.services.facebook,websvc.saas.services.flickr,websvc.saas.services.google,websvc.saas.services.strikeiron,websvc.saas.services.twitter,websvc.saas.services.weatherbug,websvc.saas.services.yahoo,websvc.saas.services.zillow,websvc.saas.services.zvents,websvc.saas.ui,ant.browsetask,ant.debugger,ant.freeform,ant.grammar,ant.kit,api.debugger.jpda,api.java,beans,classfile,dbschema,debugger.jpda,debugger.jpda.ant,debugger.jpda.projects,debugger.jpda.ui,derby,form,form.j2ee,form.kit,hibernate,hibernatelib,hudson.ant,hudson.maven,i18n,i18n.form,j2ee.core.utilities,j2ee.eclipselink,j2ee.jpa.refactoring,j2ee.jpa.verification,j2ee.metadata,j2ee.metadata.model.support,j2ee.persistence,j2ee.persistence.kit,j2ee.persistenceapi,j2ee.toplinklib,java.api.common,java.debug,java.editor,java.editor.lib,java.examples,java.freeform,java.guards,java.helpset,java.hints,java.hints.processor,java.j2seplatform,java.j2seproject,java.kit,java.lexer,java.navigation,java.platform,java.preprocessorbridge,java.project,java.source,java.source.ant,java.sourceui,javadoc,javawebstart,jellytools,jellytools.java,junit,kenai.maven,libs.cglib,libs.javacapi,libs.javacimpl,libs.springframework,maven,maven.embedder,maven.grammar,maven.graph,maven.hints,maven.indexer,maven.junit,maven.kit,maven.model,maven.osgi,maven.persistence,maven.repository,maven.search,maven.spring,o.apache.tools.ant.module,o.jdesktop.beansbinding,projectimport.eclipse.core,projectimport.eclipse.j2se,refactoring.java,spellchecker.bindings.java,spring.beans,swingapp,websvc.jaxws21,websvc.jaxws21api,websvc.saas.codegen.java,xml.jaxb,xml.tools.java,debugger.jpda.heapwalk,lib.profiler,lib.profiler.charts,lib.profiler.common,lib.profiler.ui,maven.profiler,profiler,profiler.attach,profiler.attach.impl,profiler.freeform,profiler.j2ee.generic,profiler.j2ee.jboss,profiler.j2ee.sunas,profiler.j2ee.tomcat,profiler.j2ee.weblogic,profiler.j2se,profiler.nbmodule,profiler.oql,profiler.oql.language,profiler.projectsupport,profiler.selector.java,profiler.selector.spi,profiler.selector.ui,profiler.utilities,autoupdate.pluginimporter,bugzilla.exceptionreporter,ide.branding,ide.branding.kit,lib.uihandler,o.n.upgrader,registration,reglib,uihandler,uihandler.exceptionreporter,updatecenters,welcome,apisupport.ant,apisupport.crudsample,apisupport.feedreader,apisupport.installer,apisupport.kit,apisupport.osgidemo,apisupport.paintapp,apisupport.project,apisupport.refactoring,maven.apisupport,timers,api.web.webmodule,apisupport.facebooksample,el.lexer,glassfish.eecommon,glassfish.javaee,hibernateweb,j2ee.ant,j2ee.api.ejbmodule,j2ee.archive,j2ee.clientproject,j2ee.common,j2ee.core,j2ee.dd,j2ee.dd.webservice,j2ee.ddloaders,j2ee.earproject,j2ee.ejbcore,j2ee.ejbjarproject,j2ee.ejbrefactoring,j2ee.ejbverification,j2ee.genericserver,j2ee.jboss4,j2ee.kit,j2ee.platform,j2ee.samples,j2ee.sun.appsrv,j2ee.sun.appsrv81,j2ee.sun.dd,j2ee.sun.ddui,j2ee.weblogic9,j2eeapis,j2eeserver,javaee.api,jellytools.enterprise,jsp.lexer,libs.commons_fileupload,libs.glassfish_logging,libs.httpunit,maven.j2ee,maven.jaxws,maven.samples,profiler.j2ee,projectimport.eclipse.web,servletjspapi,spring.webmvc,tomcat5,web.beans,web.client.javascript.debugger.ant,web.core,web.core.syntax,web.debug,web.examples,web.freeform,web.helpset,web.jsf,web.jsf.editor,web.jsf.kit,web.jsf.navigation,web.jsf12,web.jsf12ri,web.jsf20,web.jspparser,web.jstl11,web.kit,web.monitor,web.project,web.refactoring,web.struts,websvc.clientapi,websvc.core,websvc.customization,websvc.design,websvc.editor.hints,websvc.jaxws.lightapi,websvc.jaxwsapi,websvc.jaxwsmodel,websvc.kit,websvc.manager,websvc.metro.lib,websvc.metro.model,websvc.metro.samples,websvc.projectapi,websvc.rest,websvc.rest.samples,websvc.restapi,websvc.restkit,websvc.restlib,websvc.saas.codegen.j2ee,websvc.utilities,websvc.websvcapi,websvc.wsitconf,websvc.wsitmodelext,websvc.wsstack.jaxws,websvc.wsstackapi,groovy.editor,groovy.grails,groovy.grailsproject,groovy.gsp,groovy.kit,groovy.refactoring,groovy.samples,groovy.support,api.mobility,deployment.deviceanywhere,deployment.wm,j2me.cdc.kit,j2me.cdc.platform,j2me.cdc.platform.nokias80,j2me.cdc.platform.nsicom,j2me.cdc.platform.ricoh,j2me.cdc.platform.semc,j2me.cdc.platform.sjmc,j2me.cdc.platform.sun,j2me.cdc.project,j2me.cdc.project.execui,j2me.cdc.project.execuiimpl,j2me.cdc.project.nokiaS80,j2me.cdc.project.nsicom,j2me.cdc.project.ricoh,j2me.cdc.project.savaje,j2me.cdc.project.semc,j2me.cdc.project.sjmc,libs.aguiswinglayout,libs.ppawtlayout,mobility.antext,mobility.cldcplatform,mobility.cldcplatform.catalog,mobility.databindingme,mobility.deployment.ftpscp,mobility.deployment.nokia,mobility.deployment.ricoh,mobility.deployment.sonyericsson,mobility.deployment.webdav,mobility.editor,mobility.end2end,mobility.end2end.kit,mobility.j2meunit,mobility.javahelp,mobility.jsr172,mobility.kit,mobility.licensing,mobility.midpexamples,mobility.plugins.mpowerplayer,mobility.proguard,mobility.project,mobility.project.ant,mobility.project.bridge,mobility.project.bridge.impl,mobility.svgcore,mvd,o.n.mobility.lib.activesync,svg.perseus,vmd.analyzer,vmd.codegen,vmd.components.midp,vmd.components.midp.pda,vmd.components.midp.wma,vmd.components.svg,vmd.componentssupport,vmd.flow,vmd.game,vmd.inspector,vmd.io,vmd.io.javame,vmd.kit,vmd.midp,vmd.midp.converter,vmd.midpnb,vmd.model,vmd.palette,vmd.properties,vmd.screen,vmd.structure,identity.ant,identity.kit,identity.profile.api,identity.profile.ui,identity.samples,identity.server.manager,ide.ergonomics
    
    BUILD SUCCESSFUL
    Total time: 3 seconds
    martinus@martinusadyh:[/media/data/NB_SOURCE/main-silver]$ 
    



Kalau teman-teman merasa bingung dengan semua modul tersebut, teman-teman bisa pakai cara yang saya lakukan yaitu **build semua modul**-nya saja :D Nah jika sudah tidak sabar dengan fitur baru yang sudah kita bicarakan diatas, sekarang ketikkan perintah `ant all tryme` seperti dibawah ini dan tunggu sampai [NetBeans IDE](http://netbeans.org/) tampil dihadapan kita :

    
    
    martinus@martinusadyh:[/media/data/NB_SOURCE/main-silver]$ ant all tryme
    Buildfile: build.xml
    
    -jdk-pre-preinit:
    
    -jdk-preinit:
    
    -jdk-warn:
    
    -jdk-presetdef-basic:
    
    -jdk-default:
    
    -jdk-init:
    
    -load-build-properties:
    
    bootstrap:
    [validate-hg-configuration] ======== WARNING ========
    [validate-hg-configuration] You need to configure a Mercurial username
    [validate-hg-configuration] if you intend to push changes to NetBeans repositories.
    [validate-hg-configuration] Format (in ~/.hgrc or Mercurial.ini):
    [validate-hg-configuration] [ui]
    [validate-hg-configuration] username = Robert Q. Hacker <rhacker@netbeans.org>
    [validate-hg-configuration] =========================
    [validate-hg-configuration] ======== WARNING ========
    [validate-hg-configuration] You need to guard against committing carriage returns into Mercurial
    [validate-hg-configuration] if you intend to push changes to NetBeans repositories.
    [validate-hg-configuration] Format (in ~/.hgrc or Mercurial.ini):
    [validate-hg-configuration] [hooks]
    [validate-hg-configuration] pretxncommit.crlf = python:hgext.win32text.forbidcrlf
    [validate-hg-configuration] =========================
         [echo] Bootstrapping NetBeans-specific Ant extensions...
    
    init-tasks:
    
    init-module-list:
    
    -do-set-buildnumber:
    
    set-buildnumber:
    
    init:
    Loading module list from /media/data/NB_SOURCE/main-silver/nbbuild/nbproject/private/scan-cache-full.ser
    
    download-selected-extbins:
         [echo] Downloading external binaries (*/external/ directories) for cluster.config=full...
    [downloadbinaries] Creating /media/data/NB_SOURCE/main-silver/maven.embedder/external/maven-embedder-2.1-20080623-patched.jar
    .........
    .........
    .........
    .........
         [exec] 	org.netbeans.modules.profiler.attach.impl/2 [1.6 100325-29d026caf66e]
         [exec] 	org.netbeans.modules.websvc.saas.services.flickr [1.6 100325-29d026caf66e]
         [exec] 	org.netbeans.modules.websvc.saas.services.twitter [1.6 100325-29d026caf66e]
         [exec] 	org.netbeans.modules.websvc.saas.kit [1.5 100325-29d026caf66e]
         [exec] INFO [org.netbeans.modules.apisupport.project.universe.ModuleList]: ModuleList.createModuleListFromSources: /media/data/NB_SOURCE/main-silver
         [exec] INFO [org.netbeans.modules.parsing.impl.indexing.RepositoryUpdater]: Resolving dependencies took: 4,708 ms
         [exec] INFO [org.netbeans.modules.parsing.impl.indexing.RepositoryUpdater]: Complete indexing of 21 binary roots took: 9845 ms
         [exec] INFO [org.netbeans.modules.parsing.impl.indexing.RepositoryUpdater]: Indexing of: file:/media/data/NB_SOURCE/main-silver/openide.util.lookup/src/ took: 3567 ms (New or modified files: 33, Deleted files: 0)
         [exec] INFO [org.netbeans.modules.parsing.impl.indexing.RepositoryUpdater]: Complete indexing of 1 source roots took: 3567 ms (New or modified files: 33, Deleted files: 0)
    



Jika [NetBeans IDE](http://netbeans.org/) sudah muncul sekarang coba cek langsung pada **Sample Application** yang dibawa oleh [NetBeans IDE](http://netbeans.org/) versi development ini dan bandingkan dengan [NetBeans 6.9 M1](http://bits.netbeans.org/netbeans/6.9/m1/) :) Disini kita bisa melihat tambahan **tiga contoh NetBeans Platform** yaitu **Facebook Modules Sample, Felix Based Platform Application dan Equinox Based Platform Application** seperti gambar dibawah ini :








[![Contoh_NB_RCP_NB69M1](http://farm5.static.flickr.com/4071/4460120595_cd43a557c9.jpg)  
Contoh Aplikasi NetBeans Platform di NetBeans 6.9 M1](http://www.flickr.com/photos/10243554@N02/4460120595/)




[![Contoh_NB_RCP_NB69Devel](http://farm3.static.flickr.com/2732/4460120593_c099dec9b3.jpg)  
Contoh Aplikasi NetBeans Platform di NetBeans 6.9 Versi Development](http://www.flickr.com/photos/10243554@N02/4460120593/)





Nah gimana teman-teman, mantap tidak ? Apalagi ada contoh **Facebook Modules Sample** :) wah cocok buat teman-teman yang doyan  pacebook'an nih :D Oh iya, sampai lupa dengan **installer**-nya. Untuk melihat fitur installer yang sudah build-in pada [NetBeans IDE](http://netbeans.org/), buatlah sebuah project **NetBeans Platform Application** dahulu, kemudian coba klik kanan dan inilah hasil-nya :








[![ContohInstallerNB1](http://farm5.static.flickr.com/4017/4460120587_285ea69fb3.jpg)  
Tampilan Installer For NetBeans Platform](http://www.flickr.com/photos/10243554@N02/4460120587/)




[![ContohInstallerNB2](http://farm3.static.flickr.com/2731/4460120591_a888707b02.jpg)  
Tampilan Installer Properties](http://www.flickr.com/photos/10243554@N02/4460120591/)





Waw..waw..waw... kita bisa membuat installer untuk semua sistem operasi euy :) Mantap tidak ? Jadi mulai sekarang kita menyeragamkan tampilan installer pada aplikasi yang kita deliver ke client, dan hasil akhir dari ini yaitu aplikasi kita terlihat lebih profesional kan :) Dan 1 lagi nih teman-teman yang belum terdapat pada halaman [New And Noteworthy 6.9 m1](http://wiki.netbeans.org/NewAndNoteworthy69m1), buat teman-teman yang terlanjur jatuh cinta dengan fitur **Visual Web** pada [NetBeans IDE](http://netbeans.org/). Sejak [NetBeans 6.9 M1](http://bits.netbeans.org/netbeans/6.9/m1/), fasilitas **Visual Web** sudah bisa kita nikmati lagi tapi tidak default melainkan bisa teman-teman aktifkan dengan mendownload plugin dari [NetBeans 6.9 M1](http://bits.netbeans.org/netbeans/6.9/m1/) :) Dan dibawah ini adalah tampilan plugin **Visual Web** yang tersedia pada plugin [NetBeans 6.9 M1](http://bits.netbeans.org/netbeans/6.9/m1/) :

[![VisualWebComingBack](http://farm5.static.flickr.com/4034/4460120597_ce2ca82ebb.jpg)  
Visual Web Coming Back di NetBeans 6.9](http://www.flickr.com/photos/10243554@N02/4460120597/)

Hmm... dengan rasa-rasanya saya koq jadi makin jatuh cinta ya ama [NetBeans IDE](http://netbeans.org/) :) Sudah ditambah dengan fasilitas maven, osgi eh ditambah lagi installer :) Hm.... yummy-yummy, open source emang keren yah :D Kita bisa menikmati aplikasi yang keren-keren sekalian mengintip apa sih yang terjadi dibalik semua-nya itu :D Nah gimana teman-teman ? Tertarik coba compile sendiri [NetBeans](http://netbeans.org/)-nya ? Buat teman-teman yang berlokasi di Jakarta, mungkin bisa main-main ke kontrakan kalau mau ngopi seluruh source code hasil download saya :D (kalau mau loh ya :D )

**Link-link terkait :**




  1. [Working With NetBeans Sources](http://wiki.netbeans.org/WorkingWithNetBeansSources)


  2. [Hg How To](http://wiki.netbeans.org/HgHowTos)


  3. [Hg Parallel Project Integration](http://wiki.netbeans.org/HgParallelProjectIntegration)


  4. [NetBeans IDE](http://netbeans.org/)


  5. [NetBeans 6.9 M1](http://bits.netbeans.org/netbeans/6.9/m1/)


  6. [Fitur-fitur NetBeans 6.9](http://wiki.netbeans.org/NewAndNoteworthy69m1)


  7. [Generate a NetBeans Platform Installer with NetBeans IDE 6.9](http://blogs.sun.com/geertjan/entry/generate_a_netbeans_platform_installer)


  8. [Download JDK](http://java.sun.com/javase/downloads/index.jsp)


  9. [Apache ANT](http://ant.apache.org/)


  10. [Website Mercurial](http://mercurial.selenic.com/)



