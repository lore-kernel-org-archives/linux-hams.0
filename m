From: Bill Vodall <wa7nwp@jnos.org>
Subject: Re: Installing ham packages
Date: Thu, 23 Feb 2006 08:34:48 -0600 (CST)
Message-ID: <Pine.LNX.4.44.0602230830510.5175-100000@srv01.compumont.com>
References: <20060223131020.GB8873@cloud.net.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20060223131020.GB8873@cloud.net.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Fri, 24 Feb 2006, Hamish Moffatt wrote:

> On Wed, Feb 22, 2006 at 10:55:14PM -0800, Bill Vodall WA7NWP wrote:
> > Ok ---  where do they go.
> > 
> >  conversd goes in /opt/converd/(etc|bin...)
> > 
> > etc?
> [...]
> 
> You, as the system admin, are encouraged to install into /usr/local.
> 
> /usr is reserved for your distribution to use.
> /opt is reserved for third party packages (although your distribution
> might use them too). Or you could use it.
> 
> /usr/local is definitely reserved for you to install things directly
> from source code.

Slowly the light comes through.   This makes sense.  On my own systems
I'd put a package, for example - conversd, in /usr/local/*.   On the
"community Internet packet servers" around the region where I help
out with packet stuff -- then it would be good to use /opt since that
separates what I'm doing from local sys-admin.   Might even make sense
to have a /opt/RADIO (or similar) for these packages..


Thanks Hamish and everybody for your replies.

Bill - WA7NWP

