From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: Qsl.net availability
Date: Thu, 15 Apr 2004 14:02:09 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040415120209.GA28724@linux-mips.org>
References: <20040414192725.482d515a.john@jcoppens.com> <200404141756.49709.hotrodder@softhome.net> <20040415040055.GI63614@laptop.lambertfam.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040415040055.GI63614@laptop.lambertfam.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Lambert <lambert@lambertfam.org>
Cc: linux-hams@vger.kernel.org

On Thu, Apr 15, 2004 at 12:00:55AM -0400, Scott Lambert wrote:

> > They had some problems with some hackers from Brazil so they blocked a bunch 
> > of Brazilian IP's. I'll bet you got caught up in that.
> > 
> > here's a thread on qrz.com about it
> > 
> > http://www.qrz.com/cgi-bin/ikonboard.cgi?s=407dc024199effff;act=ST;f=7;t=59541
> 
> If it turns out not to be a firewall issue, check your MTU.

The MTU problem would hit only after the connection is established.
Typically that is caused by clueless admin blocking all ICMP, including
icmp_fragmentation_needed packets which are required for PMTU discovery.

73 de DL5RB / ZZ5ZRB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
