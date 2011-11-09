From: Tomi Manninen <tomi.manninen@saunalahti.fi>
Subject: Re: Compiling FBB
Date: Wed, 9 Nov 2011 11:14:04 +0200 (EET)
Message-ID: <21529178.3342991320830044996.JavaMail.tomi.manninen@saunalahti.fi>
Reply-To: oh2bns@sral.fi
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="Flowed"
To: David Ranch <linux-hams@trinnet.net>, Patrick Ouellette <pouelle@debian.org>
Cc: "Bernard, f6bvp" <f6bvp@free.fr>, Thomas Osterried <thomas@x-berg.in-berlin.de>, kd1zd@rtcubed.org, linux-hams <linux-hams@vger.kernel.org>, ralf@linux-mips.org

David Ranch [linux-hams@trinnet.net] kirjoitti: 

> Thanks for willing to take this back on!  One thing to regarding the 
> node binary. The old "Linux Node" software evidently has several major 
> security vulnerabilities in it that were resolved in a fork called 
> Uronode.  See the Unode release nodes below for more details.

I took a quick look, and the only security related thing I found was
in the CHANGES file where Morgan, SM6TKY's report was mentioned.

Most of those vulnerabilities were only present in AWZnode and UROnode. 
The ones in LinuxNode were fixed in version 0.3.2 that was released
23 Aug 2003, one day after Morgan's private report.

Also I remember that I fixed a *major* vulnerability in 0.2.6 (released 1999)
This one I noticed myself, it was a "brown paper bag" kind of a thing...

I don't know if that one is fixed in UROnode (which was forked from
AWZnode which was forked from LinuxNode -- but when, I don't know).

Other than those two, I'm not aware of any security vulnerabilities in
the original LinuxNode code. If there are any, they were simply never
reported to me.

> The HAM that wrote Uronode  has seemingly dropped of the map as all his 
> domains no longer work, etc.  A different HAM (KD1ZD) has reposted that 
> work as a new fork called Unode.   I would argue that the original Linux 
> node software should be patched to be secure or better yet, be DROPPED 
> from the ax25 suite in favor of this new Unode software which is "more" 
> secure, has some additional features, etc.

Well, LinuxNode has been a separate package at least since 1999, version
0.3.0, so I don't know about that "dropping". However I have no objections
to anyone using Unode or it becoming the "standard", so just go ahead.


/Tomi, oh2bns

PS. Patrick, I was made aware about that node/node.js clash by someone
reading the debian mailing list but I never got around to participating in the
debate. :-/ To me it's completely ok if you rename the binary in the debian
package to axnode, ax25-node or whatever. It was quite braindead from
me to use such a generic name, even though it was back in 1994 and
something aimed for a fairly closed audience. Altogether another issue is
how someone managed to do that again more than a decade later and with
a name that was already "reserved"... :)

