From: "Klaus Rueping" <zuhause@netsurf.de>
Subject: Re: 4 port serial card.
Date: Mon, 13 Jan 2003 02:08:06 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <003301c2baa0$3b47a540$033ca8c0@dbx989>
References: <3E20FF68.000003.11949@gizmo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


----- Original Message -----
From: "Ray Wells" <mvc@dodo.com.au>
To: <linux-hams@vger.kernel.org>
Sent: Sunday, January 12, 2003 6:38 AM
Subject: 4 port serial card.


> Hi All,
>
> This enquiry relates to a four-port serial card for a Linux BBS so I hope
it
> s directed to the right place.
>
> I acquired a four-port serial card that I'm trying to identify.
>
> I've checked out the latest serial-howto but to no avail so I'm hoping
> someone on this list may be able to assist.
>
> The card in question was made in Australia about 1992 (copyright allaw
1992)
> and carries the identification COM-4 (a brand name ??).
>
> It has four 16550 UARTS and individual jumpers for each port to set
comport
> number and IRQ. Additionally, there is an 8 way DIP switch which permits
> selection of operation under a single IRQ, among other things.
>
> The documentation says that Windows, Pick, Xenix, Unix, Concurrent DOS and
> DOS are supported.
>
> I don't have the drivers :-(
>
> Does anyone know anything about this card? My BBS is crying out for it for
> additional radio ports :-)

Hi,
I have SuSE Linux 7.0 running with a four port serial card. All 4 ports
running
additional to the standard serial ports /dev/ttyS0 and /dev/ttyS1.
The fourport card uses ONE IRQ and it runs fine. The Linux PC has 6 serial
ports
now. Try out the following:
Check if there is a mode available, where the I/O address is settable to
0x1a0 to 0x1b8
or anything else, may be settable from the DIP switches.
Find one free IRQ on your machine and set the operation of your card to this
singe IRQ,
settable by DIP switches.
The setup of your linux OS depends on your distribution.
For SuSE 6.0 to SuSE 7.3 you found it at /sbin/init.d/seial
You may edit this file and add the following lines (I think, this is for
SuSE only):
    run_setserial /dev/ttyS4 uart 16550 port 0x1A0 irq 7 fourport
    run_setserial /dev/ttyS5 uart 16550 port 0x1A8 irq 7 fourport
    run_setserial /dev/ttyS6 uart 16550 port 0x1B0 irq 7 fourport
    run_setserial /dev/ttyS7 uart 16550 port 0x1B8 irq 7 fourport
Be shure, the entries for IO Adress and IRQ are correct. This is the
configuration of my card :)

There is one important thing - Look at your card and see, if you have 16550
UARTs or
16550A UARTs ! If you have 16550A UARTs, the entry at the config file have
to be
16550A ...

Good luck - Please make a backup of your hardware settings and software
configuration
before you try it out...

Regards, Klaus.

