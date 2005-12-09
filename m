From: Bill Vodall WA7NWP <wa7nwp@jnos.org>
Subject: Re: AX25 to Telnet to CONV
Date: Thu, 08 Dec 2005 16:40:07 -0800
Message-ID: <4398D267.7060705@jnos.org>
References: <4398A8E5.70500@jnos.org>  <0006$01c12a35$017630fc@arti> <200512082202.jB8M21Rh020813@yagi.h-net.msu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200512082202.jB8M21Rh020813@yagi.h-net.msu.edu>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org



Dennis Boone wrote:
>  > I think I saw some examples on how to do this, but I can't find
>  > them now.
>  > 
>  > Does anybody have notes on how to connect an AX25 connection to a
>  > telnet command with ax25d.conf in Linux?
>  > 
>  > I'd like a Connect Request to WA7NWP-17 to run the command 'telnet
>  > wetnet.net 3600' to hook up to the CONVER server.
> 
> You can use ax25d to invoke a command and hook its std{in,out} up
> to the AX25 socket.  You could use telnet, but I use a shim called
> axconv to create the socket connection to the convers server; it does
> line ending fixup, will auto-sign the caller into convers, etc.
> 
> 	http://he.fi/pub/ham/unix/linux/ax25/axconv.c.gz
> 
> The AX.25 howto has stuff on ax25d configuration:
> 
> 	http://www.tldp.org/HOWTO/AX25-HOWTO/x1474.html
> 
> De

It works.  Thank you very much.  I knew there had to be something like
this out there.

73,
Bill


++ W7EOC-9 AEA Gateway.  Type ? for help.
de MINOT (B,C,D,J,L,N,S,?) > C YYCONV
++ CONNECTED to YYCONV at MINOT
*** Connecting to wetnet.net, port 3600
*** Logging in as wa7nwp
*
* Access to channel 0 has been removed from this server.
* You will automatically be connected to channel 4424
conversd @ Wetnet Hessu's Tampa Ping-Pong conversd htpp-1.22
* Type /HELP for help.
*
* Enjoy the convers. Comments to n7ipb@wetnet.ampr.org.
* Set your /personal text if you haven't already done so. /? gives help.
*
*** There are 48 users online
*** There are 12 topics available
*** You created a new channel 4424.
*** Personal data set from file: Bill in Redmond Wa
*** ( 0:13) conversd made you a channel operator for channel 4424

User      Host       Via      Channel   Idle
wa7nwp    Wetnet                 4424    98s Bill in Redmond Wa
w7fqq     Wetnet                 4424    10m
*** Total of 2 users ***


