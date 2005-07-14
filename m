From: rsnyder@toontown.erial.nj.us (Bob Snyder)
Subject: Re: SSH and the NONE option
Date: Thu, 14 Jul 2005 15:02:02 -0400
Message-ID: <20050714190202.GB14641@toontown.erial.nj.us>
References: <MAEBLGENFLMMCIMBCMPOOEJICKAA.la6gha@robenel.com> <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com> <20050714075909.GB2932@linux-mips.org> <42D634B6.7050807@home.se> <e524c532050714075327e61990@mail.gmail.com> <20050714152734.GA14641@toontown.erial.nj.us> <407645010507140928bbc8db8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <407645010507140928bbc8db8@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Thu, Jul 14, 2005 at 09:28:07AM -0700, Jonathan Lassoff wrote:

> Why not just have a challenge and response design like Andrew Bates
> suggested. For example, what if the server sent a challenge string,

I don't see a problem with challenge/response, since there's no obscured
message there. The only issue I see is that you aren't protecting the
session, so after you authenticate, someone closer/stronger than you
could insert malicious commands into the stream. I've seen details of
man-in-the-middle exploits on the Internet where commands were inserted
in a telnet stream without the connecting station knowing by syncing up
sequence numbers and the like.

IPsec AH would prevent this. SSH might, if it signs the content with
encryption none, but my suspecion is that it doesn't, that it only beats
telnet for this purpose by virtue of allowing more advanced
authentication mechanisms.

Bob N2KGO
