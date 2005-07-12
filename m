From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: SSH and the NONE option
Date: Tue, 12 Jul 2005 17:55:58 +0100
Message-ID: <20050712165558.GF2849@linux-mips.org>
References: <MAEBLGENFLMMCIMBCMPOOEJICKAA.la6gha@robenel.com> <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill Vodall <wa7nwp@jnos.org>
Cc: linux-hams@vger.kernel.org

On Tue, Jul 12, 2005 at 10:22:22AM -0500, Bill Vodall wrote:

> > scp could handle the file transfer and compression in one step.
> 
> While I'm at it and on to a totally separate topic -- is anybody here
> acquainted with the folks at the openSsh project?
> 
> SSH (and all the 's' tools such as scp) used to have a valid encryption
> option of "none" which I believe has been removed.
> 
> It would be very good for us amateurs (at least we Americans living
> with regulations from the dark ages) if the "none" option on encryption
> was still available.   One of these days I plan to contact the openSSH
> folks with this request -- unless somebody here has a better
> idea.

Last I checked available algorithems were a compile time option; it's
also possible to further restrict the available cyphers on the server
side in sshd_config.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
