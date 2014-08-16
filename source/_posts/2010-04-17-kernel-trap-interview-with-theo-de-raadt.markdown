---
comments: true
date: 2010-04-17 12:18:47+00:00
layout: post
slug: kernel-trap-interview-with-theo-de-raadt
title: Kernel Trap Interview with Theo de Raadt
wordpress_id: 627
categories:
- CentOS
- OpenSolaris
- Slackware
- Ubuntu
tags:
- OpenBSD
- Slackware
- Theo de Raadt
- Unix
---

Kemarin secara tidak sengaja baca-baca artikel di [Kernel Trap](http://kerneltrap.org/) eh ga tau-nya ketemu postingan tentang interview Theo de Raadt [disini](http://kerneltrap.org/node/6). Buat teman-teman yang belum tahu siapa itu Theo de Raadt, Theo de Raadt adalah pendiri proyek [OpenBSD](http://www.openbsd.org/) yang terkenal dengan slogan **"Secure By Default"** :) Sedangkan biografi  Theo de Raadt sendiri bisa teman-teman baca di halaman [Biografi Theo de Raadt](http://en.wikipedia.org/wiki/Theo_de_Raadt) di wikipedia atau bisa main langsung ke [Halaman Pribadi Theo de Raadt](http://www.theos.com/deraadt/) langsung :)

Nah yang membikin saya kaget yaitu adalah ada beberapa perkataan Theo de Raadt yang menurut saya hm.. :D, contoh-nya seperti dibawah ini :




  1. Slackers are called slackers, people who can't read manual pages are called losers, and in general, calling things what they are results in developers wasting less time.



  2. 
OpenBSD development has a long tradition of stealing free code from other projects, and then improving it ;-)



  3. However, one learns how to write code by reading code. One doesn't learn how to ride a bike by reading a book, either



Waw... mengejutkan bukan ?? Perkataan dari seorang tokoh sekelas Theo de Raadt :D Penasaran membaca arsip lama ini ? Saya posting disini supaya gampang nanti cari-nya :D, jika penasaran yuuk kita baca sama-sama :)
<!-- more -->


# Interview: Theo de Raadt


Submitted by [Jeremy](http://kerneltrap.org/user/1) on November 26, 2001 - 8:38am

This week KernelTrap spoke with OpenBSD creator and maintainer, Theo de Raadt. OpenBSD is widely hailed as being the most secure OS available. The latest version, OpenBSD 3.0, is slated for an official release on December 1'st.





  1. **Jeremy Andrews:** What was the inspiration behind creating OpenBSD?
**Theo de Raadt:** After years of working on NetBSD, I was unfairly told to go play elsewhere. So I did, and built a new team of about 80 developers. Where did the inspiration come from? I have no idea. I've been writing and fixing Unix kernel and user-land code for about 15 years, and honestly do not know why, except that I really enjoy it.




  2. **Jeremy Andrews:** There's a [very lengthy page](http://www.theos.com/deraadt/coremail.html) (Warning: it's a big page, and takes a very long time to load in Mozilla) describing how you were told to "go play elsewhere". Toward the end of that page, I read a few emails referring to OpenBSD when it was just an idea. One comment I found to be interesting was when Herb Peyerl said, "Theo is not the kind of person to manage OpenBSD as much as he wants to, to show the world that he is capable." Obviously you've done quite well managing your team of developers. Are you willing to summarize the events leading up to your removal from the NetBSD core team?
**Theo de Raadt:** Yes, as you say, things have gone pretty well. We've not only done well at the things that an operating system group should do well at, but done our fair share of innovations that the entire Unix community now depends on. Like OpenSSH, and then all the security improvements that other projects have picked up. Four APIs we invented are now available on many other operating systems (strlcpy, strlcat, issetugid, and arc4random).

As to what happened to lead up to the NetBSD situation? Until two years ago, I still wished that I knew. Secrecy prevailed. I was not told why it happened. No-one was supposed to talk about it. It felt like a kangaroo court. Well, I gave them 7 months to repair things, and they decided not to. Realistically, why must we look back?

Some vague claims have been made that the fuss was over stuff that I said. Well, if anything I said back in those days was a crime against the community, I would say it again. And as anyone on our mailing lists knows, I am not someone to mince words. I say things as they are. Slackers are called slackers, people who can't read manual pages are called losers, and in general, calling things what they are results in developers wasting less time.




  3. **Jeremy Andrews:** Is your opinion of NetBSD and its core team still tainted, or has enough time gone by for it to be water under the bridge?
**Theo de Raadt:** Well, for quite some time it appears that a lot of their developers were somewhat brainwashed into hating me, and the effort I was leading. But as time goes by, these issues come up less, and since most of the main OpenBSD group feels that NetBSD is largely irrelevant as their direction is quite different from ours... we just don't care. For instance, in Boston we worked for a week to make a complete replacement packet filter; so you can imagine we were pretty darn amused to see Perry (of NetBSD) stand up in Boston at my OpenBSD BOF talk, and announce to me that Darren had just relaxed the evil license terms on ipf. Why would a NetBSD developer care? Such political play would be rude, if we didn't consider it just plain boring. But now I just tell this as an amusing story.




  4. **Jeremy Andrews:** Is any code now shared between the OpenBSD and NetBSD projects?
**Theo de Raadt:** Oh sure. As long as the licenses are fine, politics do not prevent any such sharing. OpenBSD development has a long tradition of stealing free code from other projects, and then improving it ;-)




  5. **Jeremy Andrews:** How about with the FreeBSD project?
**Theo de Raadt:** Well, we do not have quite as much code from FreeBSD. We are of course indebted to Bill Paul for his continued efforts to support every Ethernet chip-set on the market within weeks of introduction. But mostly we just look for bug fixes in their tree, as it seems they do in our tree.




  6. **Jeremy Andrews:** Was the original purpose behind OpenBSD to make it the most secure OS available, or did it just evolve this way?
**Theo de Raadt:** No way! Please go read [www.openbsd.org/security.html](http://www.openbsd.org/security.html) for the long version. The short version is that I used to do (SunOS) security auditing more than 10 years ago, then got into BSDs for 4 years, and about a year after starting OpenBSD, just got back into the game when I met some security company guys in Calgary. That started a magical process....




  7. **Jeremy Andrews:** I love the blowfish mascot. When was this adopted?
**Theo de Raadt:** Funny thing is, it has been so long, I actually had to think about this for a moment! So the story is that Niels Provos created our [new password file format](http://www.openbsd.org/events.html#usenix99), which used the blowfish algorithm. We had someone create some art for it. I liked it. I liked it A LOT. The daemon was becoming kind of tiring since FreeBSD was using it so effectively for their marketing. And at a conference the blowfish shirts sold extremely well -- I even have one that was signed by Douglas Adams. As a result, we switched everything new to use the blowfish.




  8. **Jeremy Andrews:** What advantages does OpenBSD offer over Linux?
**Theo de Raadt:** I don't use Linux, so I do not really know how to answer this.

But when I am pressed to answer, I normally point out that our development process is much tighter; this is perhaps a reflection of our goals to have simpler and more proven code, and also perhaps because of our very structured 6 month development cycle. I feel that OpenBSD development is evolutionary instead of revolutionary, and suspect that since our development methodology is so radically different at a fundamental level, that it will result in many obvious differences for the user community -- a long list full of contentious things which I prefer not to write up.




  9. **Jeremy Andrews:** You mention that you are on a strict six month development cycle. I'd be curious to hear more about your development methodology, such as how it came about, why you chose a six month cycle and how you differentiate between development releases and stable releases?
**Theo de Raadt:** We have a six month cycle for many reasons. First off, and most important to me personally, it is just the right length so that I do not kill myself. The holidays are nicely spaced for me. Since I am project leader, I must not be permitted to go insane.

Even though our development cycle is 6 months, we have a strong goal that our -current source tree always compile. Windows of brokenness lasting more than 20 minutes result in strong words. Things should not go into the source tree until they are well formed. The 6 month cycle just acts as a second level dampening effect... let me suggest that it is something like a 2 month lock-down period where we become increasingly more careful and lock down more and pieces, preceded by 3 months of regular development. Those of you who can do simple addition will note that I have left one month out: The insane month -- when the source tree has just unlocked because I made the final release CDs and sent them to the publisher. This is the period of greatest volatility, because many developers have completed projects over the last two months which were not permitted in because of the lock.




  10. **Jeremy Andrews:** Can you explain 'soft updates' and why they preclude the need for journaling filesystems?
**Theo de Raadt:** In a FFS (or similar) filesystem, metadata update ordering becomes the critical issue for ensuring filesystem safety. The filesystem contains files, directories (which are really just files with a few other semantic handling requirements), inode tables, and bit mask tables saying which blocks are currently allocated (other filesystems use extents; this is not a significant difference). Let us look at a complicated event, like creation of a new file. In this case, a directory entry must be created in the file, the directory file may need to be extended, blocks may need to be allocated, the block bit mask tables may need updating, and the directory inode needs to be updated. Then there are issues of the file itself -- the inode for it will need allocation, and possibly some other parts. Of course, our goal is to make the filesystem maximally recoverable after a crash, using fsck, when multiple such operations are in progress simultaneously. The goal of course is not really file data safety, but directory tree cleanliness (that is a whole other conversation).

What makes the job of fsck easiest? Obviously, careful and controlled ordering of the described operations will help a lot, since the number of inconsistencies which need to be resolved are minimized.

But a Unix buffer cache tends to re-order operations for higher performance. In a BSD system, because of how things are done, maximum recoverability was historically ensured by having the filesystem temporarily suspend "multi-tasking" and do 2 related disk operations in a row, without allowing any other interleaving. Then fsck is guaranteed that two operations could NOT have happened out of order: neither happened, one happened, or both happened; and there was no other operation between. In essence, while the filesystem operates asynchronous most of the time, a part of each file creation or file removal can result in a moment of "synchronous" performance.

This makes the filesystem as reliable as possible, but sacrifices performance for a common operation. A number of old CSRG tech reports explain clearly why this makes filesystems safer (and I think that the Linux community has been completely blind to this research. It is time for them to admit that completely async filesystems like ext2fs are unsafe. It isn't as if Linux admins don't already know so).

What does soft updates add? Two things.

Primarily, it causes the buffer cache to remember the ordering constraints of each file operation, thus causing the actual disk operations to still be "locally ordered". Operations to the platter on a particular directory happen in order; but operations for multiple directories happen asynchronously. This means fsck can still make the same safety guarantees, but the momentary synchronous behavior is gone. For those familiar with SCSI, soft updates is equivalent to tagged queuing with barriers.

Secondly, soft updates makes the buffer cache act smarter; now it can keep more transitional information and merge operations that are safe. When you delete an entire directory and the files in it, the filesystem code does almost no disk operations. I just deleted a 2700 file directory tree and caused only 90 IO operations to the disk. The other remove operations were "emulated" in memory. Obviously, my laptop runs longer as a result, since the disk has to seek much less.

Soft updates works well on a single platter. Journaling filesystems typically do not perform well until you use a separate journal disk.

For a survey on filesystem technologies, there was a [Usenix paper](http://www.usenix.org/publications/library/proceedings/usenix2000/general/full_papers/seltzer/seltzer_html/index.html) presented by Margo Seltzer and Kirk McKusick at Usenix about a year and a half ago that compared ALL these technologies, and I am very sad that most people have ignored this incredible paper. Short summary? Buffer cache changes make more of a difference than filesystem changes.




  11. **Jeremy Andrews:** How do you ensure file safety?
**Theo de Raadt:** Simply by having your buffer cache write blocks out often enough.



  12. **Jeremy Andrews:** Do soft updates then speed up the operation of fsck?
**Theo de Raadt:** No, you miss the point. We don't want to make fsck faster -- we want to make it possible. The McKusick/seltzer paper has a section that explains the trade-offs. On ext2fs, with Linux in the default async mode, it is NOT possible to recover all possibilities. It is just not theoretically possible, and I hear that people run into this often...




  13. **Jeremy Andrews:** If you still have to run fsck, even with soft updates, why wouldn't a journaling filesystem be welcome?
**Theo de Raadt:** Because, as the paper shows, a journaling filesystem is typically slower, and only really performs well on multiple platters or using an nvram journal. That said, there are changes coming which will make soft update filesystems be capable of background fsck. As it is now, you can mount a soft update filesystem after a crash, and it will work, but the block allocation bitmaps may state that certain blocks
are in use, when they are not. So work has to happen to permit background block cleanup.




  14. **Jeremy Andrews:** I remember when OpenBSD v2.9 was released about four months ago, it boasted a 60-time speed increase in disk IO. Does this put its disk IO significantly faster than other OS's?
**Theo de Raadt:** Well, the boast was a lot more specific than that. Disk IO performance has not increased. Buffer cache performance has for some operations, when soft updates are enabled and the new dirprefs code is doing the job it is intended to do. Still, the effect is completely astounding, and needs to be seen. I am more afraid of rm than I have ever been before (I accidentally deleted a 2GB partition: rm returned almost instantly; ls showed all the files were gone, but the disk drive was still frantically completing the operation).




  15. **Jeremy Andrews:** What is the affect of removing a large directory, then suffering a power hit after the prompt returns but before the disk drive catches up?
**Theo de Raadt:** fsck can recover the correct state. What is the correct state? Go read the paper -- it discusses that there are multiple possible "correct" states...




  16. **Jeremy Andrews:** There was a fair amount of news generated recently when IPF was removed from the OpenBSD tree, replaced with PF. Can you talk a little about what lead up to that decision?
**Theo de Raadt:** Well, I think what happened is that Darren heard word that we were about to "split" ipf. For years, we had been unsatisfied with not having control over the integration into the source tree. Technically, ipf was not cutting it for us. The mbuf handling for ipv6 was poor. It was not possible to do bi-directional bridge handling with it. The grammar configuration was weak, and the userland code was very brittle. We had in the past tried to deal with Darren by sending him calls for "this part sucks, can it get fixed?". On the other hand when we sent him diffs, he only took the parts he liked, and ignored other parts. In summary, since our developers chit-chat all day long, and hack on code almost in real time, we were just tired of such a disassociated development model.

So I guess Darren heard, then told us that we were not allowed to split ipf.

So we removed it.

And the funny part? Darren makes more of an issue about this than we did. We just reacted as we had to.




  17. **Jeremy Andrews:** Why was the license mismatch suddenly such a big issue?
**Theo de Raadt:** Well, partly because we had just come out of the battle with SSH.com, after legal threats they made against us. This made us a bit more paranoid. But we have always tried to follow the terms of the licenses in our source tree strictly, and thus could not ship ipf. Having become aware of the ipf license issue, we suspected more issues might exist, and therefore I proceeded with other developers to do a license
audit on the source tree. Numerous other software components had problems, but I am happy to say that we have had great success at the cleanup. tcpwrappers, the mbone tools, tcpdump, the ppp code... a total of perhaps 40 pieces of software... all had issues which were easily resolved by dealing with the authors of each component. In some cases, we just rewrote the parts that were bad. ipf was just a small part of this effort.




  18. **Jeremy Andrews:** How evolved now is PF? How rapidly is it being developed?
**Theo de Raadt:** pf has pretty much everything that ipf has. It also has a number of new technologies that other packet filters lack.

First thing I find cool is that the [rule grammar](http://openbsd.org/faq/faq6.html#6.2) and operation was changed so that typical filter configurations can be set up with fewer rules. Almost all rule formats can take lists, for instance "[...] port { 22, 80, 1024-49152 }". This results in shorter configuration files, which are easier to read.

The second thing of great interest is that we have implemented many of the ideas from a recent LBL paper on packet normalization. A new "scrub" directive allows IP traffic to be normalized as it flows through the packet filter, making tools such as fragrouter irrelevant, since IP fragment overlaps and such can no longer occur.

A third thing of interest is that pf can pick up session state for TCP sessions which are already running at the time the filter comes up. This is very neat.

IPv6 is also supported fully, though 3.0 shipped with a few bugs in that code.

Obviously we have a number of plans for future improvement. One of my ideas is that anywhere you can put an address, you should be able to put an interface name, and then the in-kernel code should support that rule on all addresses on that interface -- for instance, to support interfaces aliases easier, or to automatically and invisibly apply rules to a new DHCP assigned address, or to support IPv6 configurations with much less configuration file editing. Currently, the userland code can do part of this... but if the kernel does it, oh that would be cool.




  19. **Jeremy Andrews:** What window managers/desktops run on OpenBSD? Which do you use?
**Theo de Raadt:** Well, I honestly don't know exactly which, but the people who do our ports claim that KDE and Gnome and all that other gunk works. I use different ones on different machines, but stay on the minimal side. I don't need anything fancy.




  20. **Jeremy Andrews:** Do you use other OS's besides OpenBSD?
**Theo de Raadt:** No, I do not need to.




  21. **Jeremy Andrews:** Are there plans to support multi-processors with OpenBSD?
**Theo de Raadt:** Yes, there is actually work happening for it now. Will it be out by next release? I doubt it. We actually also want to do something kind of cool: use additional CPUs to do crypto.




  22. **Jeremy Andrews:** Is OpenBSD used within any embedded devices?
**Theo de Raadt:** I spent a few years putting effort into SCADA type applications, and after seeing how fast things cycle through in that business, I have pretty much no interest in getting involved. For our developers and our direct user community, that stuff is just useless. But OpenBSD parts are there, they are free. If these embedded components use parts of what we have written, that is very cool.




  23. **Jeremy Andrews:** The changelog leading from 2.9 to 3.0 is a very long list of seemingly minor changes. This would be your evolutionary method as described earlier. Aside from the switch to PF, are there any other revolutionary changes in the 3.0 release?
**Theo de Raadt:** It depends on perspective, I suppose. For instance, is it revolutionary to steal NetBSD's ultrasparc "sparc64" code, merge it into our source tree and ship a nearly complete release in 2 months -- with more models supported than them? I am sure that some might think so, but for our development community this is just a sequence of little tweaks.




  24. **Jeremy Andrews:** I've got an older Sparc Ultra 1 on which I will be installing OpenBSD on as soon as my 3.0 CD arrives. How evolved is the Sparc64 port compared to the others?
**Theo de Raadt:** For a 2 month old port, it isn't bad! Unfortunately, a major part is still missing. There is no framebuffer or X11 support yet. I hope this is resolved soon. Sometime in 2002, I hope to put a Blade 100 on my desktop (or maybe a Blade 1000 :-)




  25. **Jeremy Andrews:** Which ports do you work on?
**Theo de Raadt:** Pretty equally on almost all of them, since I do a lot of release engineering all through the year. There's roughly two of each main architecture running in the basement, so I am constantly building snapshots and running into issues often earlier than the main developer for each port runs into them. I try to ensure that nothing ever breaks for too long.

I think there is perhaps some confusion about what I do. I do not work on some things. Instead, I try to work on absolutely nearly everything. After dealing with my mail in the morning, I try to pick a nearly random part of the source tree and read it. I try to spot bugs. Since I have been doing this for a couple of years, it is starting to become increasingly difficult! But the main goal is to spot new classes of programmer error. For instance, in the last few months I have been working on spotting signal and longjmp races in userland programs, and continuing my efforts at cleaning fd_set overflows. The parts of the kernel I maintain are more confined now, since there are more excellent kernel people in the group than excellent userland hacking people.




  26. **Jeremy Andrews:** [OpenSSH 3.0 ](http://www.openssh.org/) was released on November 6'th. I use the Linux port heavily at work and at home. Is there additional functionality with the OpenBSD version, lacking in the ports?
**Theo de Raadt:**  While I can think of no functional difference besides native support for smartcards, we think that the OpenBSD version is more secure, because OpenSSH is a direct part of OpenBSD. Thus, we have very carefully audited not just OpenSSH, but also all the other parts of the system that it depends on. Do you trust glibc? OK, perhaps that snide remark is overstating things a bit, but secure software only happens when all the pieces have 100% correct behavior.




  27. **Jeremy Andrews:** Alan Cox recently censored security changes made in the Linux 2.2.20 kernel due to the American DMCA. What are your thoughts on this? Do you ever foresee yourself censoring such information when making OpenBSD fixes?
**Theo de Raadt:** I think that his actions are totally ridiculous, since the DMCA only refers to copyright control devices. Whatever. Let them keep their user base in the dark.

We do not keep our users in the dark. We often release fixes because we are concerned that they "might very theoretically perhaps, once in a blue moon" be exploitable. Once in a while, something does not get out to our users because the volume of fixes makes it unfeasible. For instance, Todd and I have fixed about 900 signal handler routines, and over the last two years roughly the same number of fd_set overflows, but i do not spend my time determining exactly which of the bugs in these wholly new classes of bugs are exploitable, and thus do not wish to pain our users with 900 patches. A 6 month release cycle is the best we can offer for this situation.




  28. **Jeremy Andrew:** There has been a lengthy discussion raging on the OpenBSD mailing lists recently regarding the lack of an ISO distribution. I'd like to hear from the creator, why is there not one?
**Theo de Raadt:**  It simply does not make economic sense for us to reduce the CD sales we have now. If people do not like this, by all means, go ahead and do something about it yourself, but we will not. (I think it needs to be mentioned that people who dislike our project seem to be part of the most vocal group).




  29. **Jeremy Andrew:** Is enough money generated from CD sales to justify OpenBSD development?
**Theo de Raadt:** No, the CDs and donations do not bring in enough money for our yearly running. Well, three years ago when I was really poor it did. The donations have seriously slumped in the last year, but that is probably just due to industry tightening of the belts. We are very happy to have a DARPA grant paying for certain things for the current 2 year period, but when that runs out we will need to reeducate our user community about how the 2.5-2.9 period was completely run based on donations and CD sales. The money buys nice hardware, and people donate [other parts](http://openbsd.org/images/rack.jpg) and a 95% volunteer group writes & fixes cool stuff. There is no need to whine, after all, we are living the operating system hacker rock star lifestyle... without being involved in any IPO madness/stupidity schemes... aren't we?




  30. **Jeremy Andrew:** Are there any books or webpages you can recommend, regarding OpenBSD and kernel hacking?
**Theo de Raadt:** Well, I doubt many of your readers write kernel code. However, one learns how to write code by reading code. One doesn't learn how to ride a bike by reading a book, either.




  31. **Jeremy Andrew:** On your web page I read that you were one of the four people to start NetBSD. Was this your first exposure to kernel code?
**Theo de Raadt:** No. With some friends we ported Minix to the sun3/50, then I ported it to the Amiga 2000... we tried to port BSD 2.9 to a MVME147 board, but that did not go so well, though a modified version of the MVME147 bootrom I wrote is still part of the OpenBSD/mvme68k distribution. I also did some SunOS 4 kernel hacking. Then the CSRG made their code available... and everything changed...




  32. **Jeremy Andrew:** What do you like to do in your non-OpenBSD time?
**Theo de Raadt:** I bike and hike... and a bit of beer and coffee...




  33. **Jeremy Andrew:** I read a little about your hobbies on your [home page](http://www.theos.com/deraadt/). What peaks do you plan to tackle in the near future?
**Theo de Raadt:** Sometime next week, I hope to climb another volcano in Mexico. I am giving a talk there, and conference organizers have found that it's pretty easy to invite me to give talks near mountains ;)




  34. **Jeremy Andrew:** Thank you very much for taking the time to respond to all my questions. It was a distinct honor for me to have a chance to speak with you! I'm now all the more excited to try out the latest release of OpenBSD which I already pre-ordered and expect to arrive within the week.






> 
_OpenBSD 3.0 will be officially released on December 1st, 2001. The collection of three CDs includes OpenBSD for i386, alpha, macppc, amiga, hp300, mvme68k, mac68k, vax, sparc and sparc64 architectures. 3.0 can be [ordered here](http://www.openbsd.org/items.html#30). It is already available for [download here](http://www.openbsd.org/ftp.html). If you use OpenBSD, I encourage you to support their efforts by purchasing a CD and/or making a [donation](http://www.openbsd.org/donations.html)._




[Theo de Raadt](http://www.theos.com/deraadt/) lives in Calgary, Alberta, in Canada. He is the creator of [OpenBSD](http://www.openbsd.org/), widely hailed as the most secure operating system available, earning the boast "Four years without a remote hole in the default install!"

[Jeremy Andrews](http://www.kerneltrap.com/jeremy/) lives in South Florida, in the US. He maintains [KernelTrap](http://www.kerneltrap.com/) as a hobby in his spare time.

Fyuh... panjang juga yah :) Sangat-sangat meng-inspirasi :) 
