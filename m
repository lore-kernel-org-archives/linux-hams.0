From: Andrew Bates <abates@omeganetserv.com>
Subject: Re: SSH and the NONE option
Date: Thu, 14 Jul 2005 13:51:45 -0600
Message-ID: <1121370706.6147.5.camel@localhost>
References: <MAEBLGENFLMMCIMBCMPOOEJICKAA.la6gha@robenel.com>
 <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com>
 <20050714075909.GB2932@linux-mips.org> <42D634B6.7050807@home.se>
 <e524c532050714075327e61990@mail.gmail.com>
 <20050714152734.GA14641@toontown.erial.nj.us>
 <407645010507140928bbc8db8@mail.gmail.com>
 <20050714190202.GB14641@toontown.erial.nj.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: <20050714190202.GB14641@toontown.erial.nj.us>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Snyder <rsnyder@toontown.erial.nj.us>
Cc: linux-hams@vger.kernel.org

> could insert malicious commands into the stream. I've seen details of
> man-in-the-middle exploits on the Internet where commands were inserted
> in a telnet stream without the connecting station knowing by syncing up
> sequence numbers and the like.

Yes, this would be possible without having some sort of validation to
ensure the packet is from the actual sender (like what IPsec offers).
However, if this is happening then you have dishonest hams in your area,
fox hunt them and report them to the FCC.  We are self policing,
remember?

I couldn't say as to the last time my netrom routing table was poisoned
from a malicious radio operator.

Andrew

