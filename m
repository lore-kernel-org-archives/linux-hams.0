From: "Ray Wells" <mvc@dodo.com.au>
Subject: Re: 4 port serial card.
Date: Mon, 13 Jan 2003 18:19:12 +1100 (AUS Eastern Daylight Time)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E226870.00000E.40999@gizmo>
References: <3E20FF68.000003.11949@gizmo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-hams@vger.kernel.org


Hi All,

Lots of help resulting from my enquiry - thanks to everyone for their input.
I will respond privately to your answers/questions.

To summarise, the card is an ISA card using 16550 (not 16550A) UARTS and it
appears it might be a clone of an AST card.

The card supports a single IRQ (or individual IRQ's per port), and
independant I/O addresses for each port. It may be addressable with
appropriate parameters in setserial.

I need to run a single IRQ for the card because I'm out of IRQ's. Can get
IRQ 7 (might be 5, can't remember) back by recompiling the kernel without
parallel port support.

The Linux distribution in use is Debian Potato v 2.2 r0 with kernel 2.2.20.

The information received has given me a much better insight into what I am
(might be?) dealing with and I feel confident I will achieve success.

Regards ... Ray Wells VK2TV

-------Original Message-------

From: Ray Wells
Date: Sunday, 12 January 2003 04:36:29 PM
To: linux-hams@vger.kernel.org
Subject: 4 port serial card.

Hi All,

This enquiry relates to a four-port serial card for a Linux BBS so I hope it
s directed to the right place.

I acquired a four-port serial card that I'm trying to identify. 

I've checked out the latest serial-howto but to no avail so I'm hoping
someone on this list may be able to assist.

The card in question was made in Australia about 1992 (copyright allaw 1992)
and carries the identification COM-4 (a brand name ??). 

It has four 16550 UARTS and individual jumpers for each port to set comport
number and IRQ. Additionally, there is an 8 way DIP switch which permits
selection of operation under a single IRQ, among other things.

The documentation says that Windows, Pick, Xenix, Unix, Concurrent DOS and
DOS are supported.

I don't have the drivers :-(

Does anyone know anything about this card? My BBS is crying out for it for
additional radio ports :-)

TIA

Ray Wells VK2TV
-
To unsubscribe from this list: send the line "unsubscribe linux-hams" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at http://vger.kernel.org/majordomo-info.html

. 
