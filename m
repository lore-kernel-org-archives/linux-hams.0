From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: CF Speicherkarte
Date: Wed, 19 Nov 2003 21:22:52 +1200 (GMT-12)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0311192106590.2337-100000@zl2bsj.ampr.org>
References: <200311151048.25360.pa3gcu@zeelandnet.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200311151048.25360.pa3gcu@zeelandnet.nl>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-hams@vger.kernel.org



On Sat, 15 Nov 2003, pa3gcu wrote:

> On Friday 14 November 2003 22:40, Wilbert Knol wrote:
> > On Fri, 14 Nov 2003, Klaus Heintzenberg wrote:
> > > Als User kann ich zwar Daten von der Karte lesen, kann aber nicht=
 darauf
> > > schreiben (l=F6schen)
> > >
> > > Als root jedoch lassen sich die Karten lesen und schreiben.
> >
> > I have exactly that problem with a USB memory stick (aka 'removable
> > drive'). Any pointers appreciated.
>
> Permissisons for devices need to be changed accordingly i belive;


The raw device file looks like this:

zl2bsj@zl2bsj:~> ls -l  /dev | grep sda1
brwxrwxrwx    1 root     disk       8,   1 2002-09-10 08:24 sda1

The mount point:
zl2bsj@zl2bsj:~> ls -l /media | grep sda1
drwxrwxrwx    2 root     root          160 2003-11-19 20:59 sda1

The /etc/fstab entry doesn't exist. It is created by the USB hotplug
agent. When it loads, the USB hot-plug agent alters the permissions
on the mount point such that only root has write access to the device.

I have by-passed /etc/fstab by spelling out the 'mount' command (with t=
he
'user' option)  and it made no difference: I *must* be root to be able =
to
write to the USB removable drive :-(

Anyway, I probably shouldn't bore the Reflector users with this, as
it is not a ham issue, but it is something that has bugged me for a
long time. Reading Klaus's query prompted me.



Wilbert, ZL2BSJ



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
