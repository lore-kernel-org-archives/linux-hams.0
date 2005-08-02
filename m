From: Bill Vodall <wa7nwp@jnos.org>
Subject: Re: SSH and the NONE option - more
Date: Tue, 2 Aug 2005 08:20:23 -0500 (CDT)
Message-ID: <Pine.LNX.4.44.0508020818350.29665-100000@srv01.compumont.com>
References: <20050801113417.GD4205@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20050801113417.GD4205@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Mon, 1 Aug 2005, Ralf Baechle DL5RB wrote:

> On Fri, Jul 29, 2005 at 06:31:09PM -0700, Bill - WA7NWP wrote:
> 
> > Suppose I captured all the packets of a SSH encrypted exchange.   Would 
> > it be possible to decode the contents of the exchange IF one had both 
> > the public and private keys?
> 
> ssh uses the Diffie-Hellman algorithm to exchange randomly generated
> session keys.  These keys are generated on the fly and destroyed at the
> end of the session or replaced after a certain time with new keys.  The
> special propertie of the Diffie-Hellman algorithm is that it permits the
> secure exchange of the session keys even if the session is being evedropped
> uppon.  Diffie-Hellman is vulnerable against a man in the middle attack
> however, so the data packets used in the key exchange are secured against
> this kind of attach using public key cryptography.  The bottom line of
> all this is no, publishing the RSA or DSA public keys is useless as they're
> not being used for cryptography nor can their knowledge be used to
> decrypt anything.  Ssh is a pretty smart protocol :-)

Thanks Ralf.  It looks like it's back to getting encryption type NONE going
in SSH for our amatuer activities.

It was a good try.

73,
Bill - WA7NWP

