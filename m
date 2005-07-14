From: "Curt, WE7U" <archer@eskimo.com>
Subject: Re: SSH and the NONE option
Date: Thu, 14 Jul 2005 12:28:02 -0700 (PDT)
Message-ID: <Pine.SUN.4.58.0507141221440.15964@eskimo.com>
References: <MAEBLGENFLMMCIMBCMPOOEJICKAA.la6gha@robenel.com>
 <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com>
 <20050714075909.GB2932@linux-mips.org> <42D634B6.7050807@home.se>
 <e524c532050714075327e61990@mail.gmail.com> <20050714152734.GA14641@toontown.erial.nj.us>
 <407645010507140928bbc8db8@mail.gmail.com> <20050714190202.GB14641@toontown.erial.nj.us>
Reply-To: "Curt Mills, WE7U" <archer@eskimo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050714190202.GB14641@toontown.erial.nj.us>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Snyder <rsnyder@toontown.erial.nj.us>
Cc: linux-hams@vger.kernel.org

On Thu, 14 Jul 2005, Bob Snyder wrote:

> I don't see a problem with challenge/response, since there's no obscured
> message there. The only issue I see is that you aren't protecting the
> session, so after you authenticate, someone closer/stronger than you
> could insert malicious commands into the stream. I've seen details of
> man-in-the-middle exploits on the Internet where commands were inserted
> in a telnet stream without the connecting station knowing by syncing up
> sequence numbers and the like.

While I can see this as possible on amateur radio data streams, I'd
think it unlikely for someone to want to bother with it due to the
speeds we use.  If we're talking 802.11a/b/g/h though it might be of
a bit more interest to the black-hats.  Still, you're usually
talking about hams here, and I'd think few if any would be
interested in doing this sort of attack on RF.

On the internet there are a lot of bored individuals and commercial/
military/ government-sponsored hackers that would be more than happy
to try to mess with you.

If we're talking about packets that gate from RF to the internet
then at least part of the stream is in that no-mans land where
anything goes.  In that case we need as much protection for the
session and for authentication as we can get that is legally allowed
on the RF side of things.

--
Curt, WE7U.   APRS Client Comparisons: http://www.eskimo.com/~archer
"Lotto:    A tax on people who are bad at math." -- unknown
"Windows:  Microsoft's tax on computer illiterates." -- WE7U
"The world DOES revolve around me:  I picked the coordinate system!"
