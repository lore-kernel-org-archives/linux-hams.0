From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: Poor eth0 through put
Date: Mon, 14 Oct 2002 22:31:55 +1300 (NZDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0210142211530.2762-100000@zl2bsj.ampr.org>
References: <4.3.2.7.2.20021013172543.00acce70@pop3.norton.antivirus>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4.3.2.7.2.20021013172543.00acce70@pop3.norton.antivirus>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John J. Bauerly" <jbauerly@grapevine.net>
Cc: linux-hams@vger.kernel.org

On Sun, 13 Oct 2002, John J. Bauerly wrote:

> transfer using ftp. I pinged the machines found a high error rate between 
> the 2 machines. I brought a third on line and both will work fine to it 

Another thing to look out for is that you are using the latest driver for 
the network card. I had similar problems with (from memory) a Tulip card, 
at work, also on a RH distro, and, after a quick web search, found a 
much later driver, which cured it.

Have a look in /usr/src/linux/Documentation/networking for the
info file on your card. You may be able to turn off DMA on the NIC, which 
could make a difference if there is a DMA conflict.

if the machine is dual-bootable, another trick is to look at the resources 
for the card under Windows (DMA, IRQ etc), and compare them to those 
Linux. You could then fix them the same under Linux (turn PnP off)

if your LAN is ethernet coax, you did remember to put the terminating 
resistors on the Tees, didn't you??

> file transfer are ok if one or both are running windows. Don't want to run 
> windows. 

Too right.

A collegue gave me a demo of the Cross-over Wine package the other day: he 
fired up Internet Explorer on his KDE desktop <grin>


Wilbert, ZL2BSJ


