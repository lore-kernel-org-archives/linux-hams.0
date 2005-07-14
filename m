From: rsnyder@toontown.erial.nj.us (Bob Snyder)
Subject: Re: SSH and the NONE option
Date: Thu, 14 Jul 2005 11:27:34 -0400
Message-ID: <20050714152734.GA14641@toontown.erial.nj.us>
References: <MAEBLGENFLMMCIMBCMPOOEJICKAA.la6gha@robenel.com> <Pine.LNX.4.44.0507121017130.16595-100000@srv01.compumont.com> <20050714075909.GB2932@linux-mips.org> <42D634B6.7050807@home.se> <e524c532050714075327e61990@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e524c532050714075327e61990@mail.gmail.com>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On Thu, Jul 14, 2005 at 09:53:01AM -0500, Jim Bayer wrote:

> Everything in Amature Radio is clear text, so any protocol for
> authentication has to be OK.  Your ID and password comes along in
> clear text and that's that.  I guess frequent password changes are the
> only answer to comfort with security.

Don't forget that (at least in the US) the rules state you cannot
obscure the meaning...

Section 97.113 (4) "...messages in codes or ciphers intended to
obscure the meaning thereof, except as otherwise provided herein..."

The reason people are interested in ssh with "none" encryption is that
it can authenticate a session securely without passing the password in
plaintext. With public key cryptography, the authentication shouldn't
present a problem, since authentication is generally done by one side
sending over some random data as a token (which is plaintext; it means
what it is) and the other side encrypts it with their private key and
sends it back.  Everyone listening knows a) the plain-text that is being
encrypted, and b) the public key can be public, so anyone can decrypt
it.

I'm not sure ssh signs the packets after the initial authentication when
using none encryption. An alternative might be the Authentication Header
portion of IPsec, which is designed for the case where you need to
authenticate the validity of a packet without encrypting it. However,
setting up IPsec AH is at least an order of magnitude harder than using
ssh/none though.

Here's an interesting URL discussing some of the issues around ham
authentication:
http://www.cc.gatech.edu/ugrads/r/rietta/AuthRadio/authenticated-radio-article.html


Bob N2KGO
