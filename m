From: Steven Whitehouse <steve@gw.chygwyn.com>
Subject: Re: AX.25 in kernel 2.5 status?
Date: Fri, 11 Oct 2002 14:47:36 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200210111347.OAA20311@gw.chygwyn.com>
References: <20021011150339.A15592@linux-mips.org>
Reply-To: Steve Whitehouse <Steve@ChyGwyn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20021011150339.A15592@linux-mips.org> from "Ralf Baechle DO1GRB" at Oct 11, 2002 03:03:40 PM
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralf Baechle DO1GRB <ralf@linux-mips.org>
Cc: M Taylor <mctylr@privacy.nb.ca>, linux-hams@vger.kernel.org

Hi,

[snip]
> 
> I yesterday published my changes to redo the /proc files for AX.25,
> NET/ROM and ROSE with the seq_file stuff.  As usually these changesets
> are available at http://linux-ham.bkbits.net/linux-2.5.
> 
> 73 de DO1GRB op Ralf

It seems you beat me to it :-) though there is one extra thing that still needs
to be fixed in the uid code from my patch where ax25_findbyuid() returns
a pointer to a structure which might disappear at any time. Its only use
is to check permissions at bind time, so I just moved the check under
the lock,

Steve.

