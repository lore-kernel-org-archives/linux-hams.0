From: Matti Aarnio <oh2mqk@sral.fi>
Subject: Re: soundmodem patches for various distros?
Date: Sun, 14 Dec 2008 03:08:57 +0200
Message-ID: <20081214010857.GP30968@mea-ext.zmailer.org>
References: <49445246.4050104@columbia.edu>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49445246.4050104@columbia.edu>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Crosswell <alan@columbia.edu>
Cc: linux-hams@vger.kernel.org

On Sat, Dec 13, 2008 at 07:24:38PM -0500, Alan Crosswell wrote:
> Are soundmodem patches for various distros being kept in sync?  I
> experienced a known bug with Tx switching in ALSA mode which is patched
> in debian 0.10-6 but I don't see it patched in Fedora yet, nor at Tom's
> baycom home page.  I guess that means there's a fair amount of duplicate
> effort.....
> /a

No, they are not.   If Tom does not collect updates, then they
have divergent evolution..

If you have time, do push things to Tom, and get things distributed.

And while you are at it, do get rid of the graphical configurator,
and the whole package of XML configuration.  Just unnecessary junk.

If you have to have some "standard way" to configure, try Java Properties,
which are lines like this:

        keyword  \s+  parameters

(of course those configuration statements are of much older origin than Java,
but for people with excessive modernity fixations, it is nice to be able to
claim otherwise...)

73 de Matti, OH2MQK
