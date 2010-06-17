From: Dave Platt <dplatt@radagast.org>
Subject: Re: Linux Packet Interface Hardware
Date: Wed, 16 Jun 2010 17:02:47 -0700
Message-ID: <4C196627.4050709@radagast.org>
References: <AANLkTim2kyUNlW4OOJc42U_CUFzFw1Ox0OhoymamsOTz@mail.gmail.com> <4C183169.3060206@radagast.org> <alpine.LNX.2.00.1006160534330.14107@wapiti.we7u.net> <4C195062.7050401@radagast.org> <alpine.LNX.2.00.1006161618320.23730@wapiti.we7u.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1006161618320.23730@wapiti.we7u.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

> If I remember the spec correctly (have the printed version at home)
> 0 bytes like that aren't allowed between frames, and a single flag
> can delineate two data frames.  

You're correct, and in fact that (one inter-frame FLAG) does seem to
be the transmit-behavior of the TNCs I've looked at.

>                    Don't know whether most TNC's can
> handle that last.  Or soundmodem.  Or AGWPE & friends.

Yes, as far as I can tell, they all do handle this properly...
the arrival of the FLAG at the end of the first frame triggers
the delivery of that frame (assume that the FCS is valid) and
sets the state machine back to the "FLAG has been received, looking
for first byte of the frame" state.

> Check the spec.  I think it says flags only between frames, which
> doesn't give you as good a chance to resync.

Yup (in fact I quoted the spec in my earlier message).  However,
the stated spec is written as a "should", rather than a "shall"...
which means that this behavior is a recommended best practice,
but not obligatory.  As a result, the current soundmodem
implementation isn't an actual violation of the AX.25 spec;
it is just (in my opinion) less compliant than it could be.

The second "fix" I proposed (allowing more zero-bits, and
more than one FLAG between frames) would be equally not-so-good.

The only really compliant fix is to do as my patch did, and
eliminate the extra zeros entirely.  At that point, adding more
FLAGs between frames might or might not help matters under
conditions of channel noise... one would have to do a bunch of
testing to see whether it's a win or a loss.
