From: Brett Mueller <wa7v@wa7v.com>
Subject: Re: Broadcasting unwanted UDP messages
Date: Wed, 19 Apr 2006 15:11:54 -0700
Message-ID: <4446B5AA.5010308@wa7v.com>
References: <4446AFA2.2090208@irock.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4446AFA2.2090208@irock.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Ken,

On 4/19/2006 14:46, Ken Moore wrote:
> The command
> "iptables -A OUTPUT -i sm0 -p udp --dport 137 -j DROP"       failed but
> "iptables -A OUTPUT -o sm0 -p udp --dport 137 -j DROP"      worked fine.

You can only specify an _output_ interface on the OUTPUT chain, likewise
only an _input_ interface works on the INPUT chain.

> However       "iptables -L OUTPUT"     revealed
> 
> "target     prot     opt    source        destination"
> "DROP       udp      --     anywhere     anywhere         udp
> dpt:netbios-ns"
> 
> this appears to not identify the "sm0" destination specified in the
> APPEND command.

Add a "v" (verbose) to the list command to show interfaces in your rules:
"iptables -vL OUTPUT"

> I guess I need the netbios for communication with Windoz PC's on my
> network so this does not look like fix.

A question I have for you is, are you actually *using* Samba?  Are you
sharing a portion of your Linux filesystem or sharing a printer hanging
off of your Linux box with Windows clients?  If the answer is "no," then
you most likely don't need Samba running at all.

73,

Brett, WA7V

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (MingW32)

iD8DBQFERrWq+/Ps1x4JxWYRAsKKAJ98cFY3RRaBEUbh3vVtSrTCkgB+SgCfQh90
4pFYWiGINzbmqJp503oKKKY=
=zMyQ
-----END PGP SIGNATURE-----
