From: "Curt Mills, WE7U" <hacker@tc.fluke.com>
Subject: Re: Writing AX.25 Server Progie
Date: Tue, 31 Dec 2002 15:43:51 -0800 (PST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0212311526080.8587-100000@wapiti.tc.fluke.com>
References: <3E1224B1.EF59C889@gelm.net>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3E1224B1.EF59C889@gelm.net>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chuck Gelm <nc8q@gelm.net>
Cc: linux-hams@vger.kernel.org

On Tue, 31 Dec 2002, Chuck Gelm wrote:

> Howdy, Y'all:
>
>  IMHO, from what I can tell after subscribing to the Xastir list
> for several weeks, is that
> the code is development or prototype rather than
> stable.

Funny!  That's the nature of open-source:  It'll constantly be in
development because we're constantly improving it, not because it's
buggy.  With ten developers and 100's of things we want to add,
we'll never be done.  If we suddenly implemented everything on the
feature request list, the users would come up with another 200
things they'd want.  Overnight!

If you saw little development activity, no discussion on the mailing
lists, and no new releases coming out of the project, that's when
you'd know the project is getting stale and might come to a complete
halt.  Those are the warning signs of a dying open-source project.

The nature of coding though is that when you add new code, you add
new bugs.  Each new feature requires a few days to fix the new bugs
introduced.  Typically these are very minor and don't affect much
more than the new feature itself.  We just went through a period
where we were rather active at adding new features, and we're just
getting to the end of the debug period.

Other things you've probably read about are cases where a new Linux
distribution comes out and the distribution is not done correctly.
When users try to compile/run Xastir on them, Xastir shows off the
problems in the distribution.  In this case we can kick
SuSE/RedHat/Mandrake/etc in the behind and tell them to fix up their
distributions.

Try it out and tell us how often Xastir falls over, then try one of
the Windows programs and see how long they last.  In fact, try
both of them hooked up to the full firenet feed for a week (you'll
get around 20,000 objects on your screen).  Most of the Windows APRS
apps will croak, and croak quickly.

Xastir "development" versions are much more bug-free than the last
"stable" release (from last February).  New "development" versions
come out about every two weeks.  We're about due for another one.

Users who don't want to participate in the development will
typically run the development releases or the "stable" release if
they don't know any better.  User's that want to try out all the new
features the second they're added run the CVS version and update
often (every day works reasonably well).  CVS makes this easy/fast
to do.


That was fun.  Where else can I cause trouble now?

-- 
Curt Mills, WE7U                    hacker_NO_SPAM_@tc.fluke.com
Senior Methods Engineer/SysAdmin
"Lotto:    A tax on people who are bad at math!"
"Windows:  Microsoft's tax on computer illiterates!" -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"

