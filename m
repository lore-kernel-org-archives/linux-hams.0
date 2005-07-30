From: Robert Snyder <rsnyder@toontown.erial.nj.us>
Subject: Re: SSH and the NONE option - more
Date: Sat, 30 Jul 2005 04:19:50 -0400
Message-ID: <42EB3826.9060500@toontown.erial.nj.us>
References: <MAEBLGENFLMMCIMBCMPOOEJICKAA.la6gha@robenel.com> <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com> <20050714075909.GB2932@linux-mips.org> <42D634B6.7050807@home.se> <e524c532050714075327e61990@mail.gmail.com> <20050714152734.GA14641@toontown.erial.nj.us> <407645010507140928bbc8db8@mail.gmail.com> <20050714190202.GB14641@toontown.erial.nj.us> <Pine.SUN.4.58.0507141221440.15964@eskimo.com> <20050714204313.GC14641@toontown.erial.nj.us> <42EAD85D.3010107@jnos.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <42EAD85D.3010107@jnos.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams@vger.kernel.org

Bill - WA7NWP wrote:
> 
> Suppose I captured all the packets of a SSH encrypted exchange.   Would 
> it be possible to decode the contents of the exchange IF one had both 
> the public and private keys?

If you published both, then yes, you could decrypt the exchange I 
believe. That's not what you want to do generally, since it negates the 
whole purpose of using it. With both keys public knowledge, then anyone 
could fake a session using them.

What was being discussed (I thought) was having the public key public 
and the private key, well, private. If you do a digital signature on 
packet/SSH rather then encryption by making a hash of the contents of 
the packet and encrypting it with your private key, then anyone can 
decrypt the hash to verify it came from the private key in question, but 
no one can duplicate it for any arbitrary packet.

This should be fine on two counts. a) The hash can be decrypted with a 
known key, and b) The contents of the hash can be computed by running 
the hash algorithm over the information in question. This is in fact how 
you verify the information: you compute the hash yourself, decrypt the 
one signed by the public key, and verify they are identical.

Bob N2KGO
