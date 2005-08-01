From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: SSH and the NONE option - more
Date: Mon, 1 Aug 2005 12:34:18 +0100
Message-ID: <20050801113417.GD4205@linux-mips.org>
References: <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com> <20050714075909.GB2932@linux-mips.org> <42D634B6.7050807@home.se> <e524c532050714075327e61990@mail.gmail.com> <20050714152734.GA14641@toontown.erial.nj.us> <407645010507140928bbc8db8@mail.gmail.com> <20050714190202.GB14641@toontown.erial.nj.us> <Pine.SUN.4.58.0507141221440.15964@eskimo.com> <20050714204313.GC14641@toontown.erial.nj.us> <42EAD85D.3010107@jnos.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <42EAD85D.3010107@jnos.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bill - WA7NWP <wa7nwp@jnos.org>
Cc: linux-hams@vger.kernel.org

On Fri, Jul 29, 2005 at 06:31:09PM -0700, Bill - WA7NWP wrote:

> Suppose I captured all the packets of a SSH encrypted exchange.   Would 
> it be possible to decode the contents of the exchange IF one had both 
> the public and private keys?
> 
> If so, then we hams should be able to use SSH for amateur radio 
> operations as long as we publish the keys - no?

ssh uses the Diffie-Hellman algorithm to exchange randomly generated
session keys.  These keys are generated on the fly and destroyed at the
end of the session or replaced after a certain time with new keys.  The
special propertie of the Diffie-Hellman algorithm is that it permits the
secure exchange of the session keys even if the session is being evedropped
uppon.  Diffie-Hellman is vulnerable against a man in the middle attack
however, so the data packets used in the key exchange are secured against
this kind of attach using public key cryptography.  The bottom line of
all this is no, publishing the RSA or DSA public keys is useless as they're
not being used for cryptography nor can their knowledge be used to
decrypt anything.  Ssh is a pretty smart protocol :-)

  Ralf
