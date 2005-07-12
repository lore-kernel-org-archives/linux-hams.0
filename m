From: Bill Vodall <wa7nwp@jnos.org>
Subject: Re: SSH and the NONE option
Date: Tue, 12 Jul 2005 12:02:16 -0500 (CDT)
Message-ID: <Pine.LNX.4.44.0507121200340.19475-100000@srv01.compumont.com>
References: <20050712165558.GF2849@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050712165558.GF2849@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org


> > While I'm at it and on to a totally separate topic -- is anybody here
> > acquainted with the folks at the openSsh project?
> > 
> > SSH (and all the 's' tools such as scp) used to have a valid encryption
> > option of "none" which I believe has been removed.
> > 
> > It would be very good for us amateurs (at least we Americans living
> > with regulations from the dark ages) if the "none" option on encryption
> > was still available.   One of these days I plan to contact the openSSH
> > folks with this request -- unless somebody here has a better
> > idea.
> 
> Last I checked available algorithems were a compile time option; it's
> also possible to further restrict the available cyphers on the server
> side in sshd_config.

When I first looked at this, about 3 years ago???, type NONE was
a compile time option.  Last I looked, it seems to have disappeared
from the available choices.

Maybe we need to pull an really old version for our over the air use.  I'd
hate to do that as we'd lose bug fixes and other improvements.

73,
Bill

