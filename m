From: Thomas Osterried <thomas@x-berg.in-berlin.de>
Subject: Re: unix98 ptys
Date: Tue, 6 Jul 2010 10:23:05 +0200
Message-ID: <20100706082305.GZ7246@x-berg.in-berlin.de>
References: <4C324469.4090500@gmail.com> <20100705232749.GY7246@x-berg.in-berlin.de> <C8D466FE-708F-49DE-8C5A-5B143DC078AA@gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <C8D466FE-708F-49DE-8C5A-5B143DC078AA@gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Ronan <jpronans@gmail.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hello John,

On 2010-07-06 08:41:36 +0100, John Ronan <jpronans@gmail.com>
wrote in <C8D466FE-708F-49DE-8C5A-5B143DC078AA@gmail.com>:
> 
> On 6 Jul 2010, at 00:27, Thomas Osterried wrote:
> >> I came across this message and was wondered if there is a similiar  
> >> mechanism to /dev/ptmx for the receive side.
> >> 
> >> http://www.mail-archive.com/linux-hams@vger.kernel.org/msg00103.html
> >> 
> >> At the moment I'm using kissattach /dev/pts/5 1200mk 44.155.6.12
> >> etc to attach to it.  I've never used Unix98 ptys before so any  
> >> assistance appreciated
> > 
> > Please read http://lists.debian.org/debian-hams/2010/06/msg00022.html
> Hi Thomas,
> 
> Thanks for the reply.  Ok I have it working now. However the link I quoted above indicated that kissattach finds the relevant slave pts/? devices automatically, but kissattach (from ax25-tools-0.0.10-rc2) does not.  A quick diff shows some code in  Bernards version seems to iterate through the ptys.  

# tail -1 /etc/ax25/axports
ax5     TE1ST     115200        255     7       test
# kissattach /dev/ptmx ax5
AX.25 port ax5 bound to device ax5
Awaiting client connects on
/dev/pts/32
# ifconfig ax5
ax5       Link encap:AMPR AX.25  HWaddr TE1ST  
          UP BROADCAST RUNNING  MTU:255  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:10 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B

kissattach writes out the slave pty name.
There's no reason for iterating through anything.
-> This is scriptable.

What you did reference with your URL is Bernard's script for multiplex
one tnc at ttyS0 via mkiss(8) and kissattach'ing them to more than one
interface.
The new mkiss does this like kissattach. 
# mkiss -x 2  /dev/ttyS3

Awaiting client connects on:
/dev/pts/32 /dev/pts/40
#
This is also scriptable.

I.e. something like this:

ptys=$(mkiss -x 2 /dev/ttyS3 | tail -1)
for port in ax5 ax9; do
  kissattach $port $pty
done

this is easy and secure.

Btw, please use the CVS head. Among other things, there was a bug in
nrattach which has been fixd.

73,
	- Thomas  dl9sau
