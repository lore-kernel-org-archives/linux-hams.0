From: Jeremy Utley <jerutley@gmail.com>
Subject: ax25-tools and Kernel 2.6
Date: Sat, 25 Sep 2004 20:41:51 -0700
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <d5d4185b0409252041110e8607@mail.gmail.com>
Reply-To: Jeremy Utley <jerutley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hey all!

Running into some difficulty compiling the ax25-tools package on my
computer at home.  I'll start off with some stats on my system:

P-II 266 laptop system
Self-Compiled distribution (Linux from Scratch)
Kernel 2.6.8.1-ck7
GCC 3.4.2
Glibc CVS Checkout from 08/28
Binutils 2.15.91.0.2
Linux-libc-headers 2.6.8.1

The problem is in compiling the ax25-tools - getting an error
regarding soundmodem.h not found - this is of course because the
soundmodem driver being removed from the kernel itself, and becoming
the user-space application.  I did succeed in compiling the software
by taking the old soundmodem.h from a 2.4.x kernel distribution, and
placing it into /usr/include/linux, and this worked for a period of
time.  However, I started encountering kernel panics every time I used
kissattach to set up my ax0 interface.

Do any of you out there have any suggestions on how I could remove the
references to the old soundmodem abi's from the ax25-tools package?

Jeremy, KF3EL
