From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: XASTIR cross-port digipeating?
Date: Mon, 21 Jul 2003 09:40:20 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0307210930510.23376-100000@wapiti.tc.fluke.com>
References: <Pine.LNX.4.44.0307191408120.15342-100000@zl2bsj.ampr.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0307191408120.15342-100000@zl2bsj.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wilbert Knol <zl2bsj@zl2tze.ath.cx>
Cc: "J. Lance Cotton" <joe@lightningflash.net>, linux-hams@vger.kernel.org

On Sat, 19 Jul 2003, Wilbert Knol wrote:

>
> Thanks, Lance, for the info.
>
> > Xastir doesn't digipeat, except for RELAY digipeating that home stations
> > should do.
>
> That's what I want: relay something I have heard on 2 m on the 70 cm port.
> Maybe an idea for a new feature.

It's on our feature request list, but it's unlikely that we'll get
to that anytime soon.


> > > A separate question: XASTIR 1.2.1 complains about NUM/SCROLL/CAPSLOCK
> > > being engaged when I right-click the desktop. My notebook keyboard only
> > > has a CAPSLOCK, and it is off. Is there a work-around for this?
> >
> > Xastir doesn't yet do the right filtering to determine if key modifiers like
> > those listed above are enabled, which in some cases (with LessTif, I think)
> > causes Xastir not to process those clicks. Look in the menu
> > File->Configure->Defaults and un-check "Warn if modifier keys". That will
> > disable the message.
>
> What I meant was: a work-around to give me right-click functionality :-)
> (which worked in earlier versions of XASTIR). I'll have a play with a
> PS/2 full-size external keyboard.

I believe that depends on your version of Lesstif/Motif/OpenMotif.
They behave differently with respect to the mouse/keyboard
modifiers.  Other people in the past have had trouble getting the
right mouse button to function properly.  That was a while back
though.  Perhaps you're running an old distribution where the
problem showed up?

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

