From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: XASTIR cross-port digipeating?
Date: Mon, 21 Jul 2003 09:42:19 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0307210941000.23376-100000@wapiti.tc.fluke.com>
References: <Pine.LNX.4.44.0307202140180.3004-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0307202140180.3004-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Cc: "J. Lance Cotton" <joe@lightningflash.net>, linux-hams@vger.kernel.org

On Sun, 20 Jul 2003, Wilbert Knol wrote:

> > If you turn off the warning and still cannot right-click to bring up the
> > context menu, then I guess your computer thinks NumLock or ScrollLock is on.
>
> Neither are present on this notebook keyboard. Maybe that's why XASTIR
> gets confused.

It would be that the codes getting passed to Xastir from X11 have
modifiers set.  Xastir thinks you have NumLock, ScrollLock or
CapsLock on because X11 is telling it that you do.

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

