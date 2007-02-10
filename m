From: "bud Thompson" <budt@cfl.rr.com>
Subject: Re: Trouble connecting to KPC3P-8.3-HM$
Date: Sat, 10 Feb 2007 16:39:51 -0500
Message-ID: <0e0301c74d5c$02320130$687ba8c0@COMPAQ>
References: <20070209220235.GA8814@reid1.localdomain> <20070210164708.GA11043@reid1.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: don <don_reid@comcast.net>
Cc: linux-hams <linux-hams@vger.kernel.org>

Don - On 1200b VHF packet 500ms is quite long for a TXD.  When used with a 
firmware-based TNC such as a KPC3 such long TXD values are only required by 
the oldest of old radios with coil/armature relays for change-over from 
TX/RX on one end or the other of the link.

If the two radios on the link are more modern with solid state change over 
(or even more modern fast-switching relays - such as reeds, etc.) then 500ms 
TXD is wasting a lot of channel time in terms of optimization.

Keeping in mind that I've had zero experience with sound card packet -

If the radios on the link are modern - no T/R relays, etc, - then the need 
for such a long TXD may be a function of the sound card interface, or the 
relationship between the sound card packet program and the processor speed - 
The "buzzzzzzzsqwak" is the "diddle" (alternating 1s and 0s) being sent 
prior to data being sent so that (1) the TX can come up to full power, and 
(2) the receiver end can be changed from TX to RX and the link get 
synchronized.)

At 1200b with modern radios and firmware-based TNCs a TXD > 250ms is seldom 
required.  TXD of 200-250 is often realized where S/N is good.

73,

bud N0IA



----- Original Message ----- 
From: "don" <don_reid@comcast.net>
To: <linux-hams@vger.kernel.org>
Sent: Saturday, February 10, 2007 11:47
Subject: Re: Trouble connecting to KPC3P-8.3-HM$


> The Ctrl. Op. figured it out by listening to my signal.  The default
> soundmodem.conf has txdelay=150 (ms).  Apparently this is too short at
> least for local systems.  Increasing it to 500 fixed things nicely.
>
> He said you should be able to hear a distinct start up part of the
> transmission "buzzzzzzzsqwak".
>
> -- 
> Don
> -
> To unsubscribe from this list: send the line "unsubscribe linux-hams" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

