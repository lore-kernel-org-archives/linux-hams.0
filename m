From: Jonathan Lassoff <jlassoff@gmail.com>
Subject: Re: SSH and the NONE option
Date: Thu, 14 Jul 2005 09:28:07 -0700
Message-ID: <407645010507140928bbc8db8@mail.gmail.com>
References: <MAEBLGENFLMMCIMBCMPOOEJICKAA.la6gha@robenel.com>
	 <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com>
	 <20050714075909.GB2932@linux-mips.org> <42D634B6.7050807@home.se>
	 <e524c532050714075327e61990@mail.gmail.com>
	 <20050714152734.GA14641@toontown.erial.nj.us>
Reply-To: Jonathan Lassoff <jlassoff@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050714152734.GA14641@toontown.erial.nj.us>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

On 14/07/05, Bob Snyder <rsnyder@toontown.erial.nj.us> wrote:
> Don't forget that (at least in the US) the rules state you cannot
> obscure the meaning...
> 
> Section 97.113 (4) "...messages in codes or ciphers intended to
> obscure the meaning thereof, except as otherwise provided herein..."
> Bob N2KGO

Why not just have a challenge and response design like Andrew Bates
suggested. For example, what if the server sent a challenge string,
and the user concatenated their authentication string to the challenge
and then made an md5 hash of the whole string and sent it for
authentication. The server would then do the same and compare the
strings. It's kind of how APOP and Yahoo! mail work. But, to any
monitoring party, how would they know weather or not the md5 hash is
your password, or a crypted authentication response? I'm not sure what
obscuring the meaning really means. Since the user really means the
md5sum to be sent, is that hiding the underlying authentication
scheme?
Isn't phone and CW communication really obscuring what an operator
means. When speaking over the radio, my brain takes concepts and
expresses them in a crypted fashion called "language". To me, this is
a more complex issue that isn't really explained well enough in
97.113(4). I think that, on a more ethical level, by using crypted
authentication, nothing is really being hidden. It's just overhead
data in the protocol. In which case, isn't AX.25 just crypted OSI
layer 1 and 2 traffic? It's accepted because the standard is readily
available to the public. So why couldn't a challenge and response
authentication scheme that is available to the public be accepted as
well?
Just my two cents.

Jonathan Lassoff (KG6THI)
