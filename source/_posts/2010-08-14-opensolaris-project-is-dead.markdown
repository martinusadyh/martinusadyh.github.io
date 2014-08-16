---
comments: true
date: 2010-08-14 15:31:10+00:00
layout: post
slug: opensolaris-project-is-dead
title: OpenSolaris Project is Dead ???
wordpress_id: 947
categories:
- OpenSolaris
tags:
- FreeBSD
- OpenSolaris
- Oracle
- Oracle Solaris
- Solaris
---

Waw.. bulan-bulan ini merupakan bulan yang bisa dikatakan sangat menyedihkan untuk perkembangan dunia OpenSource :( , setelah kasus [Oracle vs Google](http://news.cnet.com/8301-30684_3-20013546-265.html) tentang Android, sekarang timbul **memo** pada milis [osol-discuss](mailto:opensolaris-discuss@opensolaris.org) yang menyatakan bahwa project **OpenSolaris** tidak akan dikembangkan lagi oleh Oracle dan diganti dengan Solaris 11 Express :( Setelah berbulan-bulan Oracle sunyi-senyap tanpa kabar tentang Project OpenSolaris akhirnya setelah timbul **memo** dibawah ini jelas sudah nasib OpenSolaris kedepan-nya :( , Dan dibawah ini adalah detail dari **memo** yang di posting ke milis [osol-discuss](mailto:opensolaris-discuss@opensolaris.org) dengan Subject **OpenSolaris cancelled, to be replaced with Solaris 11 Express** :
<!-- more -->


> 
From : Alasdair Lumsden
To : opensolaris-discuss@opensolaris.org
Subject : **OpenSolaris cancelled, to be replaced with Solaris 11 Express**

Hi All,

This memo was circulated internally within Oracle (and subsequently leaked). Basically, the open source development model has now been
axed and OpenSolaris is officially now dead. A very sad day indeed.

**Solaris Engineering,**

Today we are announcing a set of decisions regarding the path to Solaris 11, and answering key pending questions on open source, open
development, software and binary licenses, and how developers and early adopters will be able to use Solaris 11 technology before its release in 2011.

As you all know, the term “OpenSolaris” has been used colloquially to refer to any or all of a collection of source code, a development
model, a web site, a logo, a binary release, a source license, a community, and many other related things. So it’s taken a while to go
over each issue from an organizational and business perspective, and align on the correct next step. Therefore, please take the time to
read all of the detail here carefully. We’ll discuss our strategy first, and then the decisions and changes to our policies and processes that implement that strategy.

**Solaris Strategy**
———————-

Solaris is the #1 Enterprise Operating System. We have the leading share of business applications on Solaris today, including both SPARC
and x64. We have more than twice the application base of AIX and HP-UX combined. We have a brand that stands for innovation, quality,
security, and trust, built on our 20-year investment in Solaris operating system engineering.

>From a business perspective, the purpose of our investment in Solaris engineering is to drive our overall server business, including both
SPARC and x64, and to drive business advantages resulting from integration of multiple components in the Oracle portfolio. This
includes combining our servers with our storage, our servers with our switches, Oracle applications with Solaris, and the effectiveness of
the service experience resulting from these combinations. All together, Solaris drives aggregate business measured in many billions of dollars, with significant growth potential.

We are increasing investment in Solaris, including hiring operating system expertise from throughout the industry, as a sign of our commitment to these goals. Solaris is not something we outsource to others, it is not the assembly of someone else’s technology, and it is not a sustaining-only product. We expect the top operating systems engineers in the industry, i.e. all of you, to be creating and delivering innovations that continue to make Solaris unique, differentiated, and valuable to our customers, and a unique asset of our business.

Solaris must stand alone as a best-of-breed technology for Oracle’s enterprise customers. We want all of them to think “If this has to work, then it runs on Solaris.” That’s the Solaris brand. That is where our scalability to more than a few sockets of CPU and gigabytes of DRAM matters. That is why we reliably deliver millions of IOPS of storage, networking, and Infiniband. That is why we have unique properties around file and data management, security and namespace isolation, fault management, and observability. And we also want our customers to know that Solaris is and continues to be a source of new ideas and new technologies– ones that simplify their business and optimize their applications. That’s what made Solaris 10 the most innovative operating system release ever. And that is the same focus that will drive a new set of innovations in Solaris 11.

For Solaris to stand alone as the best-of-breed operating system in Oracle’s complete and open portfolio, it must run well on other server hardware and execute everyone’s applications, while delivering unique optimizations for our hardware and our applications. That is the central value proposition of Oracle’s complete, open, and integrated strategy. And these are complementary and not contradictory goals that we will achieve through proper design and engineering.

The growth opportunity for Solaris has never been greater. As one example, Solaris is used by about 40% of Oracle’s enterprise customers, which means we have a 60% growth opportunity in our top customers alone. In absolute numbers, there are 130,000 Oracle
customers in North America alone who don’t use our servers and storage yet, and a global customer base of 350,000 (the prior Sun base was ~35,000). That’s a huge opportunity we can go attack as a combined company that will increase Solaris adoption and the overall Hardware server revenue. Our success will also increase the amount of effort ISVs exert optimizing their applications for Solaris.

We will continue to grow a vibrant developer and system administrator community for Solaris. Delivery of binary releases, delivery of APIs in source or binary form, delivery of open source code, delivery of technical documentation, and engineering of upstream contributions to common industry technologies (such as Apache, Perl, OFED, and many, many others) will be part of that activity. But we will also make
specific decisions about why and when we do those things, following two core principles: (1) We can’t do everything. The limiting factor
is our engineering bandwidth measured in people and time. So we have to ensure our top priority is driving delivery of the #1 Enterprise Operating System, Solaris 11, to grow our systems business; and (2) We want the adoption of our technology and intellectual property to accelerate our overall goals, yet not permit competitors to derive business advantage (or FUD) from our innovations before we do. 
We are using our investment in core Solaris innovation and engineering to drive multiple businesses, through multiple product lines. This
already includes our Solaris operating system for Enterprise, and our ZFS Storage product line, and will soon include other Oracle  products.

This strategy is all about creating more value from a set of common software investments: it makes everything you do more valuable and used by more people worldwide. It also means you as an individual engineer or manager have an even greater responsibility to
understand the broader business and technical contexts in which your engineering is deployed.

**Solaris Decisions**
————————

We will continue to use the CDDL license statement in nearly all Solaris source code files. We will not remove the CDDL from any files
in Solaris to which it already applies, and new source code files that are created will follow the current policy regarding applying the CDDL (simply, that usr/src files will have the CDDL, and the very small minority of files in usr/closed might not have it). Use of other open
licenses in non-ON consolidations (e.g. GPL in the Desktop area) will also continue. As before, requests to change the license associated
with source code are case-by-case decisions.

We will distribute updates to approved CDDL or other open source-licensed code following full releases of our enterprise Solaris operating system. In this manner, new technology innovations will show up in our releases before anywhere else. We will no longer
distribute source code for the entirety of the Solaris operating system in real-time while it is developed, on a nightly basis.

Anyone who is consuming Solaris code using the CDDL, whether in pieces or as a part of the OpenSolaris source distribution or a derivative thereof, would therefore be able to consume any updates we release at that time, under the terms of the CDDL, LGPL, or whatever license applies.

We will have a technology partner program to permit our industry partners full access to the in-development Solaris source code through
the Oracle Technology Network (OTN). This will include both early access to code and binaries, as well as contributions to us where that
is appropriate. All such partnerships will be evaluated on a case-by-case basis, but certainly our core, existing technology partnerships, such as the one with Intel, are examples of valued participation.

We will encourage and listen to any and all license requests for Solaris technology, either in part or in whole. All such requests will be evaluated on a case-by-case basis, but we believe there are many complementary areas where new partnership opportunities exist to
expand use of our IP.

We will continue active open development, including upstream contributions, in specific areas that accelerate our overall Solaris goals. Examples include our activities around Gnome and X11, IPS packaging, and our work to optimize ecosystems like Apache, OpenSSL, and Perl on Solaris.

We will deliver technical design information, in the form of documentation, design documents, and source code descriptions, through our OTN presence for Solaris. We will no longer post advance technical descriptions of every single ARC case by default, indicating what technical innovations might be present in future Solaris releases. We can at any time make a specific decision to post advance technical information for any project, when it serves a particular useful need to do so.

We will have a Solaris 11 binary distribution, called Solaris 11 Express, that will have a free developer RTU license, and an optional support plan. Solaris 11 Express will debut by the end of this calendar year, and we will issue updates to it, leading to the full release of Solaris 11 in 2011.

All of Oracle’s efforts on binary distributions of Solaris technology will be focused on Solaris 11. We will not release any other binary distributions, such as nightly or bi-weekly builds of Solaris binaries, or an OpenSolaris 2010.05 or later distribution. We will determine a simple, cost-effective means of getting enterprise users of prior OpenSolaris binary releases to migrate to S11 Express.

We will have a Solaris 11 Platinum Customer Program, including direct engineering involvement and feedback, for customers using our Solaris 11 technology. We will be asking all of you to participate in this endeavor, bringing with us the benefit of previous Sun Platinum
programs, while utilizing the much larger megaphone that is available to us now as a combined company.

We look forward to everyone’s continued work on Solaris 11. Our goal is simply to make it the best and most important release of Solaris
ever.

-Mike Shapiro, Bill Nesheim, Chris Armes
_______________________________________________
opensolaris-discuss mailing list
opensolaris-discuss@opensolaris.org




Sebelum **memo** ini muncul, ada beberapa **"pendekar"** dari OpenSolaris yang membuat sebuah project bernama **Illumos** yang halaman project-nya bisa teman-teman lihat [disini.](http://www.illumos.org/announce)

Sepertinya sudah saat-nya untuk melihat-lihat [FreeBSD](http://www.freebsd.org/) yang "katanya" sudah menerapkan ZFS dan DTrace di System Operasi-nya.
