From: Dennis Boone <drb@msu.edu>
Subject: Re: AX25 to Telnet to CONV
Date: Thu, 08 Dec 2005 17:02:01 -0500
Message-ID: <200512082202.jB8M21Rh020813@yagi.h-net.msu.edu>
References: <4398A8E5.70500@jnos.org>  <0006$01c12a35$017630fc@arti>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Thu, 08 Dec 2005 13:43:01 PST.)
             <4398A8E5.70500@jnos.org> 
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > I think I saw some examples on how to do this, but I can't find
 > them now.
 > 
 > Does anybody have notes on how to connect an AX25 connection to a
 > telnet command with ax25d.conf in Linux?
 > 
 > I'd like a Connect Request to WA7NWP-17 to run the command 'telnet
 > wetnet.net 3600' to hook up to the CONVER server.

You can use ax25d to invoke a command and hook its std{in,out} up
to the AX25 socket.  You could use telnet, but I use a shim called
axconv to create the socket connection to the convers server; it does
line ending fixup, will auto-sign the caller into convers, etc.

	http://he.fi/pub/ham/unix/linux/ax25/axconv.c.gz

The AX.25 howto has stuff on ax25d configuration:

	http://www.tldp.org/HOWTO/AX25-HOWTO/x1474.html

De
