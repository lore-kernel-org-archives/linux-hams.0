From: Arno Verhoeven <pe1icq@pi8zaa.ampr.org>
Subject: Re: FBB and ax25
Date: Sat, 15 Mar 2003 12:24:41 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E730D79.4050503@pi8zaa.ampr.org>
References: <20030218233527.K507@jeroen.pe1rxq.ampr.org> <Pine.LNX.4.44.0302190033590.14956-200000@oh2bns.ampr.org> <20030221103751.GA16223@enc.com.au> <20030221165337.A3524@jeroen.pe1rxq.ampr.org> <20030222110955.GA3467@enc.com.au> <20030225155732.GA2719@leo.tneu.visi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20030225155732.GA2719@leo.tneu.visi.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Neu <tim@tneu.visi.com>
Cc: Linux Hams <linux-hams@vger.kernel.org>

Tim Neu wrote:

>I have set up FBB on my linux box, listening at KC0LQL-3, and have NODE
>also running on KC0LQL-5.     I use FBB for mail and conference, and
>NODE for a database gateway (amoung other things). 
>
>I want to be able to access either from a command prompt on the system,
>however currently I can only get to "node" via "telnet localhost node".
>
>I would like to be able to get to FBB the same way, but it does not
>appear to have the same archietecture. (it runs as a daemon rather than
>using ax25d.conf, and I do not see any listening TCP/IP ports).  How can
>I get to FBB directly? Getting to it is possibe by using "call" to
>digipeat to my host via a local digipeater, but that is a needless waste
>of bandwidth. 
>
There are several ways of getting into fbb from the command line. Sine 
you can already get into node from the command line, then one way of 
getting into fbb is via node.
You could simply connect to  KC0LQL-3 from node.
To do this your machine must listen to 2 netrom callsigns. (both  
KC0LQL-3 and KC0LQL-5)
Let me know if you need more details.

>
>Finally, if I do digi through somewhere else and try to connect, my
>connection is failing if there is already someone connected.  i.e. only
>one person appears to be allowed on at a time.  I think I have something
>set up incorrectly to prevent FBB from allowing multiple connections. 
>
>  
>
This is a setting in  FBB's port.sys file.
This is what I have at the end of that file.

#TNC NbCh Com MultCh Pacln Maxfr NbFwd MxBloc M/P-Fwd Mode Freq
0    0    0    0      0     0     0     0      00/01   ----  File-fwd.
1    15   1   netrom  230   4     5     30     05/60   UXY  netrom
2    5    2   0       250   2     2     10     00/60   TUW  Telnet
3    5    3   0       250   7     2     10     10/60   SU   Pop3

This allows 15 connections on the netrom port, 5 connections via telnet, 
and 5 simultaneous pop3 connections.

-- 
73, PE1ICQ  Arno Verhoeven
--------------------------------
AX.25  pe1icq@pi8zaa.#nbo.nld.eu
smtp   pe1icq@pi8zaa.ampr.org
inet   pe1icq@amsat.org 


