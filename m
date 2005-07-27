From: Jonathan Lassoff <jlassoff@gmail.com>
Subject: Hamlib: "ppdev0: claim the port first"
Date: Tue, 26 Jul 2005 19:30:57 -0700
Message-ID: <40764501050726193096edae3@mail.gmail.com>
Reply-To: Jonathan Lassoff <jlassoff@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Howdy. I'm trying to use hamlib to control an Icom IC-746 with a
homebrew TTL to RS232 level converter. The level converter works great
on my dekstop's DB9 RS-232 serial port, but not on my laptop's DB25
RS-232 parallel port. Both run the same Debian Sarge release with very
similar sets of software packages. The problem I'm having is that when
any application tries to use the parallel port, ppdev gets angry. The
specific error in the message log is:
"ppdev0: claim the port first"
Does anyone have an idea as to what this is alluding to? Google wasn't
much help for me.

Cheers,
Jonathan Lassoff (KG6THI)
