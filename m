From: "J. Lance Cotton" <joe@lightningflash.net>
Subject: Re: XASTIR cross-port digipeating?
Date: Sat, 19 Jul 2003 16:38:28 -0500
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200307191638.28825.joe@lightningflash.net>
References: <Pine.LNX.4.44.0307181818460.5497-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0307181818460.5497-100000@zl2bsj.ampr.org>
Content-Disposition: inline
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wilbert Knol <zl2bsj@zl2tze.ath.cx>, linux-hams@vger.kernel.org

On Saturday 19 July 2003 01:35, Wilbert Knol wrote:
> Thanks for reading this message. I am running (amongst other things)
> XASTIR on a small, two-port packet system. Is it possible to get XASTIR to
> digipeat on one port APRS broadcasts heard on another? Or do I need the
> separate 'aprsdigi' mentioned recently? (I have same-port digipeating
> working successfully)

Xastir doesn't digipeat, except for RELAY digipeating that home stations 
should do. You would need aprsdigi or digi_ned to do any further digipeating.

> Similarly, are there any Internet based APRS servers (preferably in
> VK/ZL). Will XASTIR re-transmit on any of the RF ports broadcasts heard on
> the Internet interface, and vice versa?

What is meant by "broadcasts"? Right now, Xastir will only dump from INET->RF 
messages intended for stations heard locally, their related position packets, 
and any NWS (US National Weather Service) packets that match callsigns listed 
in ~/.xastir/data/nws-stations.txt (only NWS weather report packets are gated 
to RF, so putting any callsign in nws-stations.txt won't cause Xastir to gate 
any matching packet).

> A separate question: XASTIR 1.2.1 complains about NUM/SCROLL/CAPSLOCK
> being engaged when I right-click the desktop. My notebook keyboard only
> has a CAPSLOCK, and it is off. Is there a work-around for this?

Xastir doesn't yet do the right filtering to determine if key modifiers like 
those listed above are enabled, which in some cases (with LessTif, I think) 
causes Xastir not to process those clicks. Look in the menu 
File->Configure->Defaults and un-check "Warn if modifier keys". That will 
disable the message.

> Wilbert, ZL2BSJ

-- 
J. Lance Cotton, KJ5O
joe@lightningflash.net
Three Step Plan: 1. Take over the world. 2. Get a lot of cookies. 3. Eat the 
cookies.
