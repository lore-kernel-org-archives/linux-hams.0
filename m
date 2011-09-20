From: Ben Stienstra <b.stienstra@xs4all.nl>
Subject: Re: conversd-saupp
Date: Tue, 20 Sep 2011 13:33:06 +0200 (CEST)
Message-ID: <alpine.LNX.2.02.1109201317070.2190@archlinux.home>
References: <1990DAF0-D2C0-4DFF-89F2-E3099F8A7010@xs4all.nl> <alpine.DEB.1.10.1109201006490.25239@nagano.cz> <alpine.LNX.2.02.1109201106030.2190@archlinux.home> <alpine.LNX.2.02.1109201202440.2190@archlinux.home> <4E786F04.6020107@comcast.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4E786F04.6020107@comcast.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Willie Hein WJ3G <wj3g@comcast.net>
Cc: linux-hams@vger.kernel.org

> What's your line in ax25d.conf to launch the client? It may not be logging in 
> on connection.

I'm not using ax25d (hope thats not part of the problem). I have 
configured conversd to listen to the AX.25 port itself:

/usr/local/etc/conversd/conversd.conf
Listeners       ax25:pd0b-13,pd0b-1


Device ax0 is configured with name pd0b-1. It is a working AX.25 port. I 
can connect to it etc.

Netstat shows:
Active AX.25 sockets
Dest       Source     Device  State        Vr/Vs    Send-Q  Recv-Q
*          PD0B-13    ax0     LISTENING    000/000  0       0



