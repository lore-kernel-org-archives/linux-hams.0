From: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Subject: Re: XASTIR cross-port digipeating?
Date: Mon, 21 Jul 2003 23:43:35 -1200 (GMT+12)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.44.0307212332100.3897-100000@zl2bsj.ampr.org>
References: <Pine.LNX.4.33.0307210941000.23376-100000@wapiti.tc.fluke.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.33.0307210941000.23376-100000@wapiti.tc.fluke.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Cc: "J. Lance Cotton" <joe@lightningflash.net>, linux-hams@vger.kernel.org



On Mon, 21 Jul 2003, Curt Mills, WE7U wrote:
>
> It would be that the codes getting passed to Xastir from X11 have
> modifiers set.  Xastir thinks you have NumLock, ScrollLock or
> CapsLock on because X11 is telling it that you do.

I changed in the file /etc/sysconfig/keyboard:

   KBD_NUMLOCK="bios"

into

   KDB_NUMLOCK="no"

...and right-clicking now works! Apologies for the mis-directed 'bug'
comment :-)


Wilbert, ZL2BSJ



