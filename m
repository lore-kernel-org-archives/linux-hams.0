From: Wilbert Knol <w.knol@niwa.co.nz>
Subject: Re: ax25/netrom/crashes?
Date: Tue, 5 Aug 2003 10:25:37 +1200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200308051025.37476.w.knol@niwa.co.nz>
References: <000301c35acb$5f8c5880$0a01a8c0@john> <200308042323.26500.sm6rpz@home.se>
Reply-To: w.knol@niwa.co.nz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200308042323.26500.sm6rpz@home.se>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


Using a standard 2.4.21 kernel, there are no problems with AX25.

But the system sometimes crashes the moment I disconnect from a netrom 
node that I have previously connected to.

I tried the 9A4GL patch that was posted recently, but it wouldn't 
apply against the 2.4.21 kernel. Has anyone successfully done this?

The only other problem I have is, that the parallel port Baycom driver 
('picpar') cannot be removed without a kernel panic. So, when I need 
the parallel port for something else, it requires the "Microsoft 
Soulution" (a reboot).

Wilbert, ZL2BSJ


On Tuesday 05 August 2003 09:23 am, Lars E. Pettersson wrote:
> On Monday 04 August 2003 22:59, John Buttery wrote:
<snip>
> > When I was using RedHat 7.2 I was having crashes once or twice a
> > day. The majority of them were after a NetRom disconnect.  I have
<snip>
> 7.3 on the other hand crashes, sometimes, on netrom and ax25
> disconnects.


