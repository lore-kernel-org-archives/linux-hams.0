From: "gel2256@dnaco" <gelmce@dnaco.net>
Subject: Re: ? wireless 802.11b, D-Link DWL-520
Date: Mon, 22 Apr 2002 14:42:20 -0400
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <aa1lr4$utt$2@main.gmane.org>
References: <F182IyDPxcgiKMXNaGf0001b276@hotmail.com> <02042107041801.00604@unix.pa3gcu> <3CC2F39D.AC66E99C@gelm.net> <02042119580302.00604@unix.pa3gcu>
Reply-To: nc8q@gelm.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: chuck@gelm.net

11 megabit radio modem, $100USD

> > http://www.linux-wlan.org/ and linux driver
> > ftp://ftp.linux-wlan.org/pub/linux-wlan-ng/ \
> > linux-wlan-ng-0.1.14-pre2.tar.gz

I've gotten it working with a K6/266 MB and
a K6-2/500 MB:

 I edited wlan.conf (adhoc=y) and moved it to
/etc/wlan.conf
 and moved rc.wlan to
/etc/rc.d/rc.wlan
 The 'make install' didn't place them for me, as advertised. :-|

 Ran
#modprobe prism2_pci
#ifconfig wlan0 up
#/etc/rc.d/rc.wlan start
#ifconfig wlan0 192.168.1.1
/* I'm not to sure of the order :-| */

 I pinged this host from a Win2kpro host:
c:\> ping -n 99 -l 32760 192.168.1.1
 and it indicated an 11 Megabit link with
 ~65k bytes/second.

 I'm wanting to create a community wireless LAN using a water tower
as a passive reflector and hoping for ~5 mile radius of the water
tower.  I am also wanting to use the minimum CPU horsepower for the
wireless<>internet gateway. This is why I'm trying to get a wireless
device working in my old 80586x120. ;-)

Chuck nc8q
