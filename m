From: mvw@mvw.net
Subject: ax25 pakcet problem: any ideas?
Date: Fri, 27 Dec 2002 12:41:37 -0500 (EST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0212271237170.3199-100000@jeeves.mvw.net>
References: <11467.210.86.76.47.1040973380.squirrel@server.localdomain>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <11467.210.86.76.47.1040973380.squirrel@server.localdomain>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Hello all,

Here's the issue: any ideas welcome.

Box 1 (client) talks to box 2( bbs server), via ax25. When box2 sends a
packet, box 1 (the client)  hears it. But when I open by bbs, the first
packet is 255 characters long, and is never heard, The next packets are 
shorter and are always heard. Like this:

This packet from va3oak to va3mvw is sent but never seen by va3mvw:

radio1: fm VA3OAK-1 to VA3MVW ctl I00^ pid=F0(Text) len 250 12:30:33
0000  [FBB-7.04h-AB1FHMRX$]MM-----------------------------------------
0040  -------MHello Michael, on 27-Dec at 12:30MWelcome to The VA3OAK
0080  Message System, located inMOakville, Ontario. For licensed amate
00C0  ur use only.M---------------------------------------------


This one follows and IS always seen:

radio1: fm VA3OAK-1 to VA3MVW ctl I01+ pid=F0(Text) len 47 12:30:33
0000  ---MMVA3OAK (B,LM,R<nr>,S<call>,I,O,X,!,#,?) >


Any ideas?

Michael


