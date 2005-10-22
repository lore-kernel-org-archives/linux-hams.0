From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: 2.6.14-r4 crashing
Date: Sat, 22 Oct 2005 13:52:27 +0100
Message-ID: <20051022125226.GB3951@linux-mips.org>
References: <61062.192.168.1.2.1129943887.squirrel@192.168.1.12> <200510221152.22492.oh1mrr@nic.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200510221152.22492.oh1mrr@nic.fi>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: jarmo <oh1mrr@nic.fi>
Cc: linux-hams@vger.kernel.org

On Sat, Oct 22, 2005 at 11:52:22AM +0300, jarmo wrote:

> aa6qn@aa6qn.sytes.net wrote (l=E4hetysaika lauantai 22 lokakuu 2005 0=
4:18):
> > I could use some guidence here to stabelize the system. It crashes
> > serveral times a day and it looks like a IRQ syncing problem. This =
only
> > happens when I load ax25 and its associated modules. I am not sure =
if I
> > missed something in the kernel configuration so I am grasping at st=
raws at
> > the moment.
>=20
> Hi Ralf
> Remember my similar problems with earlier kernels?
> I haven't tested 14 series yet in RBF. Waiting stable.

I believe your problems are actually related to NET/ROM.  Pure AX.25,
IP-over-AX.25, mkiss and 6pack running the usual Linux AX.25 apps and
Wampes has turned out to be reasonably solid:

[ralf@dea ~]$ ssh db0fhn.efi.fh-nuernberg.de "uptime; uname -a"
 14:50:55 up 25 days, 23:12, 11 users,  load average: 0.40, 0.31, 0.35
Linux db0fhn 2.6.13 #8 Mon Sep 26 15:04:42 CEST 2005 i686 GNU/Linux
[ralf@dea ~]$

This is running a 2.6.13 kernel including all the patches which I also
put into the 2.6.14-rc.

  Ralf
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
