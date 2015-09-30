From: Thomas Osterried <thomas@osterried.de>
Subject: Re: AX25 mkiss interface not deleted when the serial port is removed
Date: Wed, 30 Sep 2015 22:22:38 +0200
Message-ID: <2A123A0E-5F98-44BE-AC11-23B96B7F8925@osterried.de>
References: <5605828E.5010104@eclis.ch> <20150929153129.GA31429@linux-mips.org> <560B2CEF.4060209@eclis.ch>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <560B2CEF.4060209@eclis.ch>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Jean-Christian de Rivaz <jc@eclis.ch>, David Ranch <dranch@trinnet.net>
Cc: Ralf Baechle DL5RB <ralf@linux-mips.org>, linux-hams@trinnet.net, linux-hams@vger.kernel.org

Hello,

> Unfortunately the kernel 4.3.0-rc3+ crash the same way. I suspect tha=
t the real question is: what in ax25/mkiss make tty_ldisc_hangup() call=
ing tty_ldisc_open() on a serial port that no longer exists, and how to=
 avoid this ?

that=92s a good question ;)

We had a long debug sessions today.

tty_ldisc_hangup() always calls tty_ldisc_reinit(tty, N_TTY)) and tty_l=
disc_open(tty, tty->ldisc)).

mkiss_close() is supposed to be called, because the old interface disap=
peared (we have the same number of ax25-interfaces bevor and after the =
plug).
After the plug, mkiss_open() is called again, because the ldisc defines=
:
static struct tty_ldisc_ops ax_ldisc =3D { =85         .open           =
=3D mkiss_open, =85}

mkiss_open() pre-initializes the =84new=93 interface with defaults. It =
has no callsign, no broadcast address, the netrom-compatible MTU, and t=
he IP address configuration has lost. Also, the interface has the state=
 =84DOWN=93.
Another indicator that the old interface has been removed and the new h=
as disappeared is the interface identifier number which you could see w=
ith =84ip addr=93 (use this command before and after the plug - and min=
d the gap ;)

Then we thought about what happens to slip interfaces if the usbserial-=
adapter is plugged off? The answer is: it has the same issue.

kissattach and slattach do not get notified by the kernel: I strace=92d=
 them, but they did not get informed by signal.
This would not solve the problem, but if it would have terminated, the =
bug would not have been triggered. And it=92s easier to observe (while =
true; do kissattach =85  || echo mailx -s =84kissattach has died - plea=
se plug in your usb-serial adapter=93; sleep 10; done ).

In my tests, the kernel did not panic automatically. The new interface =
had no IP Address. The bug is in the handler where an IP packet (i.E. a=
 broadcast, arp, avahi, etc..) goes to the interface. In our case, the =
interface has lost the IP configuration and furthermore, it is down.
But right after ifconfig ax0 44.128.128.1, my avahid on my test-system =
greeted the new world and the kernel panic=92ed.

The bug is in triggered in net/ax25/ax25_ip.c in ax25_hard_header(), wh=
ere the driver adds the inteeface=92s src- and dst/broadcast-address to=
 the ip-packet it should send. It get=92s the skb containing the data a=
nd reserves with skb_push room to place the ax25-header before.
This always works under normal conditions, but it fails if the device i=
s unplugged.

The great question is: what happened to the skb?
My trace showed me the output of skb_panic(), called by skb_under_panic=
, called by our skb_push().
skb->head is a normal address (and it changed through my reboot experim=
ents).
skb->data was indeed < than skb->head: off-by-one (it=92s one byte lowe=
r).

What causes the off-by-one? I still don=92t know. Why it does work unde=
r normal conditions? Was the skb large enough and had enough space to t=
he left?
Currently, I assume the problem is caused due to the re-initialization.=
 mkiss_setup() was called. It does some basic setup, and initializes ad=
dre_len and hard_header_len to 0. But in a normal initialization via ki=
ssattach, afterwards ioctl(=85SIOCSIFENCAP =85) is called. It fine-tune=
s addr_len and hard_header_len. I=92m not sure, but perhaps something t=
hat passes the skb with the ip packet along honors the hard_header_len =
and the skb has enough room.

The slip-Test does not cause a kernel panic (I tried sending pings via =
the re-initialized iface after plug-off the usb-serial adapter). This i=
s, because slip does not have any lower hardware-layer, and thus there=92=
s no code like our ax25_hard_header().


My resume:
1. I=92d like to understand why ax25_hard_header()=92s skb_push() fails=
 on the new device. This should be fixed, but it does not fix the whole=
 problem.
2. I wonder why spattach and kissattach should not be signaled that the=
re=92s a problem with the tty. And I wonder, why nobody implemented it =
before.
3. Obviously, we find the re-open-Problematic also for slip devices. Wh=
o likes to test it with ppp? ;) I argue, it=92s a very old bug and nobo=
dy has wondered about. The only thing is you have an interface that doe=
s not work anymore and that has lost it=92s traffic statistic..
   PS: my next test on this is 6pack - I accept a bet ;))


vy 73,
	- Thomas  dl9sau





--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
