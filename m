From: Dennis Boone <drb@msu.edu>
Subject: Re: Writing AX.25 Server Progie
Date: Sun, 05 Jan 2003 22:02:34 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <E18VNX8-00050N-00@yagi.h-net.msu.edu>
References: <1041142023.32767.8.camel@edith>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of 29 Dec 2002 00:07:02 CST.)
             <1041142023.32767.8.camel@edith> 
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

 > Replacement of ARES/Data program used for the Twin Cities Marathon in
 > Minnesota.

Kelly:

Strange coincidences.  I recently built a perl database server similar
to ARESDATA for Linux.  I've just returned from holiday travels, so
much of what I would have said has already been discussed, but I
thought I would offer a few thoughts.

I spent a week looking into AX.25 server programming, and concluded
that to do it in perl would require a fair amount of work on the perl
networking modules.  However, I did discover that ax25d and the
net_call program can be combined to solve the line ending issues and
let you write a standard internet socket application.  This has the
additional advantages that there are lots of perl modules to support
such development, and that you can also use something like telnet to
access your application, as well as AX25 connects.  Since you seem to
have radio TCP/IP running in your area, you could also use telnet over
radio.

I opted for command line style, rather than a menu-driven approach,
but there's no reason why you would have to take that path.  You could
also build a client application which provided gui (or menu chui)
interface, and make the client-server protocol be fairly terse,
conserving bandwidth.

If you (or anyone else) wants to see the code I built, it's at:

    http://msuarc.egr.msu.edu/kb8zqz/packet/trivnetdbd

The code is ugly, especially in its abuse of global variables, but you
should be able to get a feel for the networking stuff.

Dennis Boone
KB8ZQZ
