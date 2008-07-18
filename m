From: David Robb <ender@paradise.gen.nz>
Subject: baycom_ser_fdx - fixed under 2.6
Date: Sat, 19 Jul 2008 10:50:51 +1200 (NZST)
Message-ID: <alpine.DEB.1.10.0807191042050.21295@tombstone.paradise.gen.nz>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

So it seems that I might be the only person in the world who's still 
attempting to use a Baycom bp-1 pocket modem under Linux, but oh well..

As a number of people noticed back in about 2005 (and some even earlier), 
the baycom_ser_fdx driver hasn't worked under Linux 2.6 for a few 
years (possibly ever).

Various people poked around 
(http://osdir.com/ml/hams/2005-05/msg00022.html) and determined that there 
was some kind of packet corruption going on, and that the CRC was mangled.

Well, after bashing my head against it a few times over the last few 
months (I guess I was bored), and finally thinking that it mightn't be in 
the baycom_ser_fdx driver that the problem actually was, I tracked it down 
to the hdlcdrv code instead...

Someone called Micah actually figured this out in 2004, and submitted a 
patch, but it never made it into the kernel (at least in my 2.6.25.7 it's 
still broken):

http://linux.derkeiler.com/Mailing-Lists/Kernel/2004-11/2929.html

The CRC's overwriting some of the packet...

So anyway, applying the patch listed at that URL (1 line! Just one little 
line!) my BP-1 now works again under 2.6.25.

Perhaps I'm strange for wanting this working in these days of high speed 
links, but hey... it seems sad to have broken code and no support where 
there used to be a functional device.

Anyway, share and enjoy.

--David ZL3UDR
