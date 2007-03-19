From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Document request - ROSE protocol specification
Date: Mon, 19 Mar 2007 04:25:20 +0000
Message-ID: <20070319042520.GB25380@linux-mips.org>
References: <45F87682.8010206@rns-stearn.demon.co.uk> <620c90570703141711v444bd67dqd9cf8e86a6fc1b54@mail.gmail.com> <45F92C62.2030707@ccr.jussieu.fr>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <45F92C62.2030707@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: Chuck Hast <wchast@gmail.com>, Richard Stearn <richard@rns-stearn.demon.co.uk>, linux-hams@vger.kernel.org

On Thu, Mar 15, 2007 at 12:22:10PM +0100, Bernard Pidoux wrote:

> > Also perhaps Bernard F6BVP can provide you information or Jean-Paul
> 
> ROSE adressing follows the X.121 specs and uses 14 digits.
> 
> There is a good description here :
> http://www.rhyshaden.com/x25.htm
> 
> Linux kernel source provides diagnostic codes and specs.
> For example in /linux/include/net/rose.h :

I would warn to take the Linux kernel code as a proper definition of the
ROSE protocol.  While Linux may be the dominant ROSE implementation today
the protocol code contains quite a few oddities that make me scratch the
head to say the least.

   Ralf
