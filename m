From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: Just installed RedHat 9
Date: Fri, 9 Jul 2004 22:23:50 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040709222350.B25769@pull.privacy.nb.ca>
References: <1223.192.168.1.117.1089178842.squirrel@gateway> <200407071710.47138.pa3gcu@zeelandnet.nl> <2498.192.168.1.117.1089215964.squirrel@gateway> <002801c4644c$0f62ecd0$6401a8c0@jeremiel>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <002801c4644c$0f62ecd0$6401a8c0@jeremiel>; from jemontanez@knology.net on Wed, Jul 07, 2004 at 12:58:47PM -0500
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Montanez <jemontanez@knology.net>
Cc: linux-hams@vger.kernel.org

On Wed, Jul 07, 2004 at 12:58:47PM -0500, John Montanez wrote:
> Hello,
> 
> I just installed RedHat 9, and am trying to recompile the kernel to include
> support for amateur radio.  I get a message telling me that the kernel is to
> big to be able to make a boot disk.  Can anyone tell me what sort of things
> I can safely leave out when I configure the kernel to make it smaller.  It's

Anything you don't need. :-) Don't include drivers for hardware you don't
have. But I suspect it may be hard to fit on a floppy.

I suspect that you need to do 'make bzdisk', in case you are trying to
use 'make zdisk'.

