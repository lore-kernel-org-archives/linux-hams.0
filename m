From: pa3gcu <pa3gcu@zeelandnet.nl>
Subject: Re: Baycom USCC noise
Date: Wed, 29 Oct 2003 18:56:30 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200310291756.30061.pa3gcu@zeelandnet.nl>
References: <200310291150.12893.oyvind@cs.uit.no>
Reply-To: pa3gcu@zeelandnet.nl
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <200310291150.12893.oyvind@cs.uit.no>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?q?=D8yvind=20Hanssen?= <oyvind@cs.uit.no>, linux-hams@vger.kernel.org

On Wednesday 29 October 2003 11:50, =D8yvind Hanssen wrote:
> We are using a Baycom USCC card with DF9IC modem with
> a T7F radio. It works ok, but since the radio is not squelched
> there is a high number of rx interrupts and error rx packets.
>
> Also, some bad packets seems to slip through. Much garbage is
> seen in the mheard list.
>
> Is this normal? Is there a way to workaround this?
>
> 73 de LA7ECA
>
> The sccstat returns (for instance):
> speed       : 9600 baud
> txdelay     : 5

txd of 5 is rather on the short side, you could well do better with it =
set to=20
8 which should suit fine.

> persist     : 64
> slottime    : 8
> txtail      : 8
> fulldup     : 0
> waittime    : 2
> mintime     : 3 sec
> maxkeyup    : 7 sec
> idletime    : 3 sec
> maxdefer    : 120 sec
> group       : 0x00
> txoff       : off
> softdcd     : off
If you dont have a squelched radio why do you have softdcd off.?
Should it not be on otherwise the card will always be in a busy state a=
s per=20
below, IF i remember correctly that is.

> Status:
>
> HDLC                  Z8530           Interrupts         Buffers
> ---------------------------------------------------------------------=
--
> Sent       :  147746  RxOver :     0  RxInts : 30689899  Size    :  3=
84
                                                                       =
                            ^^^^^^^^^^^^
I played with buffersize a lot when i used a scc card (PA0HZP) i found =
that=20
defining the following was best. ( i am presuming one still needs to de=
fine=20
buffers in /etc/z8530drv.conf .
If it is not a option in that file then recompile scc.c with more buffe=
rs=20
defined.
/usr/src/linux/drivers/net/hamradio/scc.c
#define SCC_BUFSIZE     1024 =20

> Received   :  212184  TxUnder:     0  TxInts :  4982360  NoSpace :   =
 0
> RxErrors   : 1804229                  ExInts :  7823901
> TxErrors   :       0                  SpInts :  1006105
> Tx State   :    busy

You will always get a lot of ints without a hardware squelch, every spe=
c of=20
noise is an interrupt.
I had much the same problem with decoding at 4800 baud and a software d=
cd, too=20
many interrupts make bad performance.
However having said that i have not followed or used my scc card for a =
few=20
years now things may well have changed.

>
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
If the Linux community is a bunch of theives because they
try to imitate windows programs, then the Windows community
is built on organized crime.

Regards Richard
pa3gcu@zeelandnet.nl
http://people.zeelandnet.nl/pa3gcu/



-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
