From: Rodolfo Brasnarof <rodob@datafull.com>
Subject: Re: Soundmodem
Date: Fri, 29 Oct 2004 11:59:38 -0300
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20041029115938.2efb5ea5.rodob@datafull.com>
References: <200410291617.26097.anespo1@virgilio.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <200410291617.26097.anespo1@virgilio.it>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org
Cc: anespo1@virgilio.it

On Fri, 29 Oct 2004 16:17:26 +0200
iw2esa <anespo1@virgilio.it> wrote:

> Hello,
> I've a little trouble using the ax25 soundmodem. Here is my
> conditions:
> 
> Slackware 9.1
> Kernel 2.4.22 with ax25 e soundmodem modules compiled

First of all. Are you using kernel soundmodem, or userspace soundmodem?
With userspace soundmodem you do not need soundmodem modules.

> Soundcard integrated in a MB Asus I810
> 
> This is the output at boot:
> =================================================
> Intel 810 + AC97 Audio, version 0.24, 17:25:27 Oct 24 2004
> i810: SiS 7012 found at IO 0xb000 and 0xac00, MEM 0x0000 and 0x0000,
> IRQ 18 i810_audio: Audio Controller supports 6 channels.
> i810_audio: Defaulting to base 2 channel mode.
> i810_audio: Resetting connection 0
> ac97_codec: AC97 Audio codec, id: ALG16 (ALC200/200P)
> i810_audio: AC'97 codec 0 supports AMAP, total channels = 2
> es1371: version v0.32 time 17:25:30 Oct 24 2004
> AX.25: Z8530 SCC driver version 3.0.dl1bke
> mkiss: AX.25 Multikiss, Hans Albas PE1AYX
> AX.25: 6pack driver, Revision: 0.3.0 (dynamic channels, max=31)
> AX.25: bpqether driver version 004
> baycom_ser_fdx: (C) 1996-2000 Thomas Sailer, HB9JNX/AE4WA
> baycom_ser_fdx: version 0.10 compiled 17:25:06 Oct 24 2004
> hdlcdrv: (C) 1996-2000 Thomas Sailer HB9JNX/AE4WA
> hdlcdrv: version 0.8 compiled 17:25:07 Oct 24 2004
> baycom_ser_hdx: (C) 1996-2000 Thomas Sailer, HB9JNX/AE4WA
> baycom_ser_hdx: version 0.10 compiled 17:25:07 Oct 24 2004
> usb.c: registered new driver hub
> host/uhci.c: USB Universal Host Controller Interface driver v1.1
> Initializing USB Mass Storage driver...
> usb.c: registered new driver usb-storage
> USB Mass Storage support registered.
> NET4: Linux TCP/IP 1.0 for NET4.0
> IP Protocols: ICMP, UDP, TCP, IGMP
> IP: routing cache hash table of 4096 buckets, 32Kbytes
> TCP: Hash tables configured (established 32768 bind 32768)
> IPv4 over IPv4 tunneling driver
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> G4KLX NET/ROM for Linux. Version 0.7 for AX25.037 Linux 2.4
> F6FBB/G4KLX ROSE for Linux. Version 0.64 for AX25.037 Linux 2.4
> NET4: G4KLX/GW4PTS AX.25 for Linux. Version 0.37 for Linux NET4.0
> kissparms uses obsolete (PF_INET,SOCK_PACKET)
> xfbbd uses old SIOCAX25GETINFO
> ============================================
> 
> The soundcard works well and I listen the system sounds of kde or
> music, but is impossible to work in soundmodem. Here is the errors:
> 
> Running soundmodem
> ===============
> soundmodem: error while loading shared libraries: libxml.so.1: cannot
> open shared object file: No such file or directory

This is a known problem. This package is missing in Slackware
9.1. Get if from Slackware 8.1 cd or mirror, install it, and
that's it.

Anyway, I've seen some problems with the soundmodem package built in
Slack 9.1. If you have some problems, try compiling it yourself, or I
can send you a binary file that works fine (at least for me).
