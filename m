From: Dennis Boone <drb@msu.edu>
Subject: Re: Trying to get Ax25 running.
Date: Thu, 14 Oct 2004 09:13:50 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200410141313.i9EDDoah001022@yagi.h-net.msu.edu>
References: <620c9057041014060070eeccf6@mail.gmail.com>  <620c9057041013094421cbf279@mail.gmail.com> <20041014025505.66938.qmail@web40824.mail.yahoo.com>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Thu, 14 Oct 2004 06:00:48 PDT.)
             <620c9057041014060070eeccf6@mail.gmail.com> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > Well, it appears that the locking up of the system happens when I
 > attempt to run CALL under X in a terminal screen. As long as I run
 > it on a consol it does not lock up. Is this normal or do I need to
 > go in and change make some changes some where so I can run it under
 > a xterm? I can run listen and mheard in xterm screens just fine,
 > but so far call is avoiding it all.

Call should work fine in an xterm.  The fact that it locks up the
machine so badly that pings &c don't work would seem to imply that
there's either a hardware problem or a kernel problem, possibly in
the configuration of the AX25 wares.

Getting into the long-haired realm, if you have a second serial
port, you might try setting up a serial console, to see if you
can get an oops message while running X.  See e.g.

	http://www.tldp.org/HOWTO/Remote-Serial-Console-HOWTO/

for details.

Dennis Boone
KB8ZQZ
