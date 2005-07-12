From: Jonathan Lassoff <jlassoff@gmail.com>
Subject: Re: SSH and the NONE option
Date: Tue, 12 Jul 2005 18:04:34 +0000 (UTC)
Message-ID: <loom.20050712T200240-877@post.gmane.org>
References: <MAEBLGENFLMMCIMBCMPOOEJICKAA.la6gha@robenel.com> <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Bill Vodall <wa7nwp <at> jnos.org> writes:
> It would be very good for us amateurs (at least we Americans living
> with regulations from the dark ages) if the "none" option on encryption
> was still available.   One of these days I plan to contact the openSSH
> folks with this request -- unless somebody here has a better
> idea.
> 
> 73,
> Bill - WA7NWP

Why not just use something like gzip on the standard output and pipe it over 
the network with netcat? I don't think something as robust and clunky (sort of) 
as ssh would be needed for copying files over the air where length is more 
important.
Just a thought.

Jonathan Lassoff (KG6THI)

