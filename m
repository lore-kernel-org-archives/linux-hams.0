From: M Taylor <mctylr@privacy.nb.ca>
Subject: Re: axspawn and security on the air
Date: Wed, 28 May 2003 17:00:55 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030528170055.A21230@pull.privacy.nb.ca>
References: <3ED4C9DA.6070108@lightningflash.net> <20030528150112.GA19391@leo.tneu.visi.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20030528150112.GA19391@leo.tneu.visi.com>; from tim@tneu.visi.com on Wed, May 28, 2003 at 10:01:12AM -0500
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Neu <tim@tneu.visi.com>
Cc: Linux-Hams <linux-hams@vger.kernel.org>

On Wed, May 28, 2003 at 10:01:12AM -0500, Tim Neu wrote:
> On Wed, May 28, 2003 at 09:38:18AM -0500, J. Lance Cotton wrote:

> > The background to my question is this: If I leave the password for an admin 
> > user blank, some rogue user could easily change their TNC to use an admin 
> > callsign and wreak havoc. If I require a password for user login, the 
> > password is transmitted plaintext, right? Same situation as before.
> > 
> > This machine will hopefully, eventually be connected to the Internet, where 
> > ssh connections are more bandwidth-appropriate, but I want to have the 
> 
> A number of other programs use a math challenge. 
> 
> There may be other ways of using one-time passwords. 

Public Key cryptography (PKC) that uses DSA (digital signature
algorithm) rather than RSA for authenication, with no (bulk) transport
encryption may be within the spirit of not obscuring the message,
as DSA is designed to be usable for digital signatures, not for
(message) encryption there is little chance that such packets
are possibly anything else.

So ssh with DSA public keys, and no (NULL) transport encryption may
fall within allowable by the rules of FCC (and perhaps other countries).
You may need to recompile openssh/openssl to enable NULL encryption.

I have not had time to take this to RAC and Industry Canada for guidence
for use in Canada.

The safest method that should is legal is to use a one-time password
method, there are some debain packages available (maybe named S/Key).
You send the password in the clear, but after it is used, it is not
longer valid. The next time you would login using the next password
from either a calculator or from a pre-generated list.

-ve1mct

