From: Ken Koster <n7ipb@algedi.wetnet.net>
Subject: Re: Success! TWO questions remain
Date: Thu, 12 Dec 2002 09:34:49 -0800
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200212120934.49608.n7ipb@koster.seatcp.net>
References: <Pine.LNX.4.44.0212111645150.1297-100000@jeeves.mvw.net> <20021212132801.GA9699@silly.cloud.net.au> <3DF8AA6B.6000303@voicenet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3DF8AA6B.6000303@voicenet.com>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: linux-hams@vger.kernel.org

On Thursday 12 December 2002 07:25, Margaret Leber wrote:
> Hamish Moffatt wrote:
> > Compression is still hiding the data and I would say breaks the rules.

Compression is not breaking the rules and hasn't been for a long time.
NOS, JNOS, FBB and others all use compression for forwarding mail and
it's perfectly legal.  We've been doing this now for more than a decade.

> > Better solution: use SSH. You can have public key authentication (no
> > cleartext passwords) without any encryption or compression.

SSH does do encryption and optionally can do compression as well.  From
the SSH man page " It (ssh) is intended to replace rlogin and rsh, and 
provide secure encrypted communications between two untrusted hosts over an 
insecure network."

> Is encrypting even a password permitted outside of control of space
> stations?

Passwords for the purpose of remote control (repeaters, remote packet 
systems etc.) have been legally used for a long time.  With the advent of
Linux lots of us have been using SSH to control and administer remote
packet sites.  While the fact that SSH also encrypts the rest of your 
communication besides the password might be considered by some to be
a violation, most of us consider that traffic to also be part of 'control' 
and in all the years we've been doing this the FCC has never disabused
any of us of that idea. :-)

>
>   73 de Maggie K3XS

Ken,  N7IPB
http://wetnet.net
