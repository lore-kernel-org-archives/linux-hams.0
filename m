From: Robert Thoelen <kd1zd@rtcubed.org>
Subject: Questions on AX25 tools and support
Date: Tue, 11 May 2010 18:04:52 -0400
Message-ID: <AANLkTinONabV4XZGP2eFlq-Icd4x98JTbJz-GTb2tGW5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

I'm doing well with running my custom version of UROnode for the 2.6.18 kernel.

I have noticed two issues that I can't seem to figure out:

1.  I can't get mheard/mheardd to work.  I created the
/var/ax25/mheard/mheard.dat file, but even after running mheardd, and
verifying the process is running, nothing is getting written to the
file.  Perhaps I'm missing something?

2.  Is there a way to selectively broadcast netrom routes?  For
instance, I have several interfaces that each have a distinct netrom
name.  I only want to publish one of them on my VHF user port.  Right
now, netromd is broadcasting everything, filling up the neighbor
netrom node with three of my names.
