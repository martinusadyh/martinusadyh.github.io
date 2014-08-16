---
comments: true
date: 2009-10-07 17:51:21+00:00
layout: post
slug: gnome-2280-in-gsb-current-for-slackware-130
title: GNOME 2.28.0 in gsb-current for Slackware 13.0
wordpress_id: 74
categories:
- Slackware
---

Ihui... akhirnya GNOME SlackBuild mengabarkan bahwa GNOME 2.28.0 sudah tersedia untuk Slackware 13.0 meskipun masih versi **current** :) Dan ini adalah release note-nya :



> 
GNOME 2.28.0 is out!

gsb-current is a snapshot of the active GNOME SlackBuild development tree.
It is intended to give developers, edgy users, and other Linux gurus a
chance to test out the latest packages for GNOME SlackBuild.  The feedback
we get will allow us to make the next stable release better than ever.

gsb-current is a full GNOME 2.28.0 desktop for Slackware 13.0.  Most
things are working at the moment, but this is only an initial build.  Feel
free to try it out and report bugs!

WARNING: upgradepkg glib2 gtk+2 GConf before other upgrading other
packages.  If you're using slapt-get:

   $  slapt-get --install glib2 gtk+2 GConf

Afterwards, you can safely run slapt-get to upgrade your other packages.
Also, take care not to miss new packages that were split from old
ones.  If upgrading manually, then "upgradepkg --install-new" is (as
always) the safest approach.

See the ChangeLog.txt for a list of changes in gsb-current.

(Don't worry! The gsb64-current build is coming!)

Cheers,

- The GNOME SlackBuild Team




Do you want to try ?? :)
