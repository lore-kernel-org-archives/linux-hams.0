From: Riley Williams <rhw@InfraDead.Org>
Subject: RE: insmod mkiss
Date: Wed, 29 May 2002 14:09:47 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0205291327200.15697-100000@Consulate.UFP.CX>
References: <Pine.LNX.4.44.0205271336360.2154-100000@oh2bns.ampr.org>
Reply-To: Riley Williams <rhw@InfraDead.Org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0205271336360.2154-100000@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Manninen <tpm@prkele.tky.hut.fi>
Cc: Linux-Hams Mailing List <linux-hams@vger.kernel.org>

Hi Tomi.

>>> Which brings up another point. Why if I include the
>>> ax25/mkiss/netrom modules in /etc/modules.conf don't
>>> they appear when running lsmod after boot up?

>> /etc/modules.conf only states the options to be applied to modules if
>> they get loaded, and not which modules to load. The kernel module daemon
>> kmod is supposed to handle that, but it sounds like either it has
>> problems with the ax.25 modules or you don't have it loaded.

> Of course modules.conf also acts as a "translation table" between
> stuff requested by the kernel and module names. So as an example, if
> you do a "kissattach" you actually request the kernel to set a
> special "line discipline" number 5 to a serial line (tty). The
> kernel checks if it knows how to do that and if the mkiss module is
> not loaded yet it fails. The kernel then asks kmod to do something.
> Kmod runs modprobe with suitable options (something like "modprobe
> -s -k tty-ldisc-5").

> Now it is modprobe that then consults /etc/modules.conf and
> /lib/modules/*/modules.dep to solve what module(s) it should load
> and with what options. And here you must help modprobe. There is no
> way modprobe would know what to do when it is requested to load
> "tty-ldisc-5" and so you must give it a hint:
>
>	alias tty-ldisc-5 mkiss
>	alias tty-ldisc-7 6pack
>
> After that it will know to load the mkiss module (or 6pack module if
> you are doing a "spattach"). The trick is knowing what to put in
> modules.conf as there are various ways the kernel might request the
> service.

I have to admit that I'd forgotten about that aspect of modprobe's
behaviour. However, many of the aliases are already internal to
modprobe, and as a result, don't need adding.

Based on the Red Hat 6.2 system I'm currently on, here's all the alias
definitions I know about, together with their origins, including those
you list in your email:

	alias binfmt-204	binfmt_aout	# modprobe internal
	alias binfmt-263	binfmt_aout	# modprobe internal
	alias binfmt-264	binfmt_aout	# modprobe internal
	alias binfmt-267	binfmt_aout	# modprobe internal
	alias binfmt-387	binfmt_aout	# modprobe internal
	alias binfmt-332	iBCS		# modprobe internal

	alias binfmt--310	binfmt_java	# modprobe internal

	alias block-major-1	rd		# modprobe internal
	alias block-major-2	floppy		# modprobe internal
	alias block-major-3	ide-probe	# modprobe internal
	alias block-major-7	loop		# modprobe internal
	alias block-major-8	sd_mod		# modprobe internal
	alias block-major-9	md		# modprobe internal
	alias block-major-11	sr_mod		# modprobe internal
	alias block-major-13	xd		# modprobe internal
	alias block-major-15	cdu31a		# modprobe internal
	alias block-major-16	gscd		# modprobe internal
	alias block-major-17	optcd		# modprobe internal
	alias block-major-18	sjcd		# modprobe internal
	alias block-major-20	mcdx		# modprobe internal
	alias block-major-22	ide-probe	# modprobe internal
	alias block-major-23	mcd		# modprobe internal
	alias block-major-24	sonycd535	# modprobe internal
	alias block-major-25	sbpcd		# modprobe internal
	alias block-major-26	sbpcd		# modprobe internal
	alias block-major-27	sbpcd		# modprobe internal
	alias block-major-29	aztcd		# modprobe internal
	alias block-major-32	cm206		# modprobe internal
	alias block-major-33	ide-probe	# modprobe internal
	alias block-major-34	ide-probe	# modprobe internal
	alias block-major-37	ide-tape	# modprobe internal
	alias block-major-44	ftl		# modprobe internal
	alias block-major-93	nftl		# modprobe internal

	alias char-major-4	serial		# modprobe internal
	alias char-major-5	serial		# modprobe internal
	alias char-major-6	lp		# modprobe internal
	alias char-major-9	st		# modprobe internal
	alias char-major-10	off		# Placeholder
	alias char-major-10-0	busmouse	# modprobe internal
	alias char-major-10-2	msbusmouse	# modprobe internal
	alias char-major-10-3	atixlmouse	# modprobe internal
	alias char-major-10-130 wdt		# modprobe internal
	alias char-major-10-131 wdt		# modprobe internal
	alias char-major-10-139 openprom	# modprobe internal
	alias char-major-10-144 nvram		# modprobe internal
	alias char-major-10-157 applicom	# modprobe internal
	alias char-major-10-175 agpgart		# modprobe internal
	alias char-major-14	soundcore	# modprobe internal
	alias char-major-19	cyclades	# modprobe internal
	alias char-major-20	cyclades	# modprobe internal
	alias char-major-21	sg		# modprobe internal
	alias char-major-22	pcxx		# modprobe internal
	alias char-major-23	pcxx		# modprobe internal
	alias char-major-27	ftape		# modprobe internal
	alias char-major-34	scc		# modprobe internal
	alias char-major-35	tclmidi		# modprobe internal
	alias char-major-36	netlink		# modprobe internal
	alias char-major-37	ide-tape	# modprobe internal
	alias char-major-48	riscom8		# modprobe internal
	alias char-major-49	riscom8		# modprobe internal
	alias char-major-57	esp 		# modprobe internal
	alias char-major-58	esp 		# modprobe internal
	alias char-major-63	kdebug		# modprobe internal
	alias char-major-90	mtdchar		# modprobe internal
	alias char-major-99	ppdev		# modprobe internal
	alias char-major-107	3dfx		# modprobe internal
	alias char-major-161	ircomm-tty	# modprobe internal

	alias cipcb0		cipcb		# modprobe internal
	alias cipcb1		cipcb		# modprobe internal
	alias cipcb2		cipcb		# modprobe internal
	alias cipcb3		cipcb		# modprobe internal

	alias dos		msdos		# modprobe internal

	alias dummy0		dummy		# modprobe internal
	alias dummy1		dummy		# modprobe internal

	alias iso9660		isofs		# modprobe internal

	alias md-personality-1	linear		# modprobe internal
	alias md-personality-2	raid0		# modprobe internal
	alias md-personality-3	raid1		# modprobe internal
	alias md-personality-4	raid5		# modprobe internal

	alias net-pf-1		unix		# modprobe internal
	alias net-pf-2		ipv4		# modprobe internal
	alias net-pf-3		ax25		# Your email
	alias net-pf-4		ipx		# modprobe internal
	alias net-pf-5		appletalk	# modprobe internal
	alias net-pf-6		netrom		# Your email
	alias net-pf-11 	rose		# Your email
	alias net-pf-17 	af_packet	# modprobe internal

	alias netalias-2	ip_alias	# modprobe internal

	alias parport_lowlevel	parport_pc	# My /etc/modules.conf

	alias plip0		plip		# modprobe internal
	alias plip1		plip		# modprobe internal

	alias ppp0		ppp		# modprobe internal
	alias ppp1		ppp		# modprobe internal

	alias ppp-compress-21	bsd_comp	# modprobe internal
	alias ppp-compress-24	ppp_deflate	# modprobe internal
	alias ppp-compress-26	ppp_deflate	# modprobe internal

	alias slip0		slip		# modprobe internal
	alias slip1		slip		# modprobe internal

	alias tty-ldisc-1	slip		# modprobe internal
	alias tty-ldisc-3	ppp		# modprobe internal
	alias tty-ldisc-5	mkiss		# Your email
	alias tty-ldisc-7	6pack		# Your email
	alias tty-ldisc-11	irtty		# modprobe internal

	alias ax0		ax25		# Your email
	alias nr0		netrom		# Your email
	alias rs0		rose		# Your email

I've never used rose myself, so net-pf-11 and rs0 are new to me, but I'm
used to the others from previous usage. I can add that char-major-10 is
never used as that particular major is a "miscellaneous" one that is
always referred to by major and minor in combination.

> You might want to have in there:
>
>	alias ax0 ax25
>	alias nr0 netrom
>	alias rs0 rose
>
> So that a "ifconfig <name>" ends up loading the proper module. Also
>
>	alias net-pf-3 ax25
>	alias net-pf-6 netrom
>	alias net-pf-11 rose
> 
> could be useful so that any protocol family operation loads the correct 
> protocol module.
>
> To get all those situations right you will need to examine your system
> logs and see if there are messages with "modprobe: Can't locate module
> ..." and then try to figure out what module would solve that failed
> request (/usr/src/linux/Documentation/ _might_ give hints on that).
>
> Also one should read the modprobe(8) and modules.conf(5) manual pages.

The above table may help as well.

Best wishes from Riley.

