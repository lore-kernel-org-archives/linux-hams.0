From: Thomas Sailer <t.sailer@alumni.ethz.ch>
Subject: Re: soundmodem patches for various distros?
Date: Sun, 14 Dec 2008 17:22:22 +0100
Message-ID: <1229271742.29241.5.camel@localhost.localdomain>
References: <49445246.4050104@columbia.edu>
	 <20081214010857.GP30968@mea-ext.zmailer.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20081214010857.GP30968@mea-ext.zmailer.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matti Aarnio <oh2mqk@sral.fi>
Cc: Alan Crosswell <alan@columbia.edu>, linux-hams@vger.kernel.org

On Sun, 2008-12-14 at 03:08 +0200, Matti Aarnio wrote:

> No, they are not.   If Tom does not collect updates, then they
> have divergent evolution..

Ok, a first attempt at collecting patches (from debian and fedora)
http://www.baycom.org/~tom/ham/soundmodem/soundmodem-0.11.tar.gz

> If you have to have some "standard way" to configure, try Java Properties,
> which are lines like this:
> 
>         keyword  \s+  parameters

How exactly would you represent a tree in a non sucking way with this
format?

soundmodem is essentially a tree where each node (not only leaves) can
have properties - sounds like xml to me. And it's not that xml cannot be
typed into a standard text editor...

Also, the graphical configurator is not only a configurator, it allows
you to also display scope like curves. For this, X seems natural - I'm
not going to port this to aalib 8-)

73, Tom


