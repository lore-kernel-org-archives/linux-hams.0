From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: Problems using MKISS
Date: Thu, 15 Mar 2007 13:13:58 +0100
Message-ID: <45F93886.9080100@ccr.jussieu.fr>
References: <dd22fa9c0703111705g306f77f7i1140c23c0793a3a9@mail.gmail.com>	 <45F8566D.10206@wa7v.com> <dd22fa9c0703141323g3e5568dekba6c57a5586d4f6e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <dd22fa9c0703141323g3e5568dekba6c57a5586d4f6e@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Brown Jr <stephen.brown75@gmail.com>
Cc: linux-hams@vger.kernel.org


Stephen Brown Jr wrote:
> I am using a single port TNC (tnc-x) and maybe mkiss is not the right
> tool for the job? I have tried rxecho, but that seemed to have a
> "ping-pong" effect in that I was transmitting and receiving everything
> back and forth between both ports, it's possible I set it up wrong.
> 
> What I am trying to accomplish is this, and I have not been succesfull
> at it yet:
> 
> I have two TNC-X KISS mode TNC's, one for regular packet, one for APRS.
> 
> I run javaaprssrvr for Igate software, will soon run digi_ned for
> digipeating/telemetry, and Xastir as a client on a seperate machine. I
> would like to share all 3 apps with one TNC, and I will be connecting
> Xastir to the box via an AXIP interface.
> 
> On the packet side, I will be running FBB, (X)net, and eventually jNOS
> and whatever else I decide to experiment with later on :) I want to do
> the same thing, share the TNC with a host of apps.
> 
> tnx and 73's
> Stephen
> K1LNX
> 
> On 3/14/07, Brett Mueller <wa7v@wa7v.com> wrote:
> Stephen Brown Jr wrote the following on 03/11/2007 17:05:
>> I am trying to share a KISS tnc on a serial port for APRS and MKISS
>> seems to be the way to do it, but I can't get it work for whatever
>> reason. I have two machines, Im using AXIP to carry traffic back and
>> forth between them. Here is my setup:
> 
>> Debian linux "Sarge" 3.1 using stock 2.4 kernel (this the box the TNC
>> is located on)
>> KISS mode TNC on /dev/ttyS4, AX25 and MKISS modules loaded and working
>> Ran mkiss -s 9600 /dev/ttyS4 /dev/ptyp0, then ran kissattach
>> /dev/ttyp0 aprs 192.168.1.6, port successfully binds to ax0
> 
> Is your TNC a single or dual port unit?  Maybe it doesn't matter, but it
> looks like your mkiss command is lacking a second pseudo-tty
> specification.
> If your TNC is single port, perhaps using "rxecho" would work better
> for your
> situation than mkiss?  I have several apps sharing a TNC on my BBS;
> only one
> of them is actually attached to the TNC, but the others talk AX.25
> "directly"
> through the TNC via rxecho on the appropriate shared interfaces.
> 
> Hope this helps somehow...
> 
> 73,
> 
> Brett, WA7V
> 

Hi,

You probably need to kissattach another pseudo TTY port (say port axip
to be declared into /etc/ax25/axports)

kissattach /dev/ptyq0 axip 192.168.1.6

and configure the other side of the tunnel /dev/ttyq0 in AXIP config file.

Actually I don't use axip itself but this is the way I did it using ax25ipd.

73 de Bernard, f6bvp

