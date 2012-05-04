From: Patrick Ouellette <pat@flying-gecko.net>
Subject: Re: Node.js and it's future in debian
Date: Fri, 04 May 2012 10:31:32 -0400
Message-ID: <20120504143132.GA24655@flying-gecko.net>
References: <20120501205524.GI30521@flying-gecko.net>
 <20120501215305.GA1250@burratino> <20120501221659.GA11430@flying-gecko.net>
 <20120502065003.GB2410@burratino> <20120502165031.GC7390@flying-gecko.net>
 <20120502171349.GA23806@burratino> <20120502200426.GF7390@flying-gecko.net>
 <4FA2A557.1080103@trinnet.net> <20120503170521.GD19468@flying-gecko.net>
 <20120504143129.0d9a7955@hw42.dyndns.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-disposition: inline
In-reply-to: <20120504143129.0d9a7955@hw42.dyndns.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: DL1SIG <dl1sig@hw42.dyndns.org>
Cc: Patrick Ouellette <pouelle@debian.org>, David Ranch <linux-hams@trinnet.net>, node@packages.debian.org, nodejs@packages.debian.org, debian-hams@lists.debian.org, linux-hams@vger.kernel.org

On Fri, May 04, 2012 at 02:31:29PM +0200, DL1SIG wrote:
> 
> I think using the alternatives system [1] could be a solution. I guess
> that node.js and axnode is not often used on the same system. Therefore
> in most of the cases the alternatives auto select mechanism will do the
> right thing.
>

While the alternatives system could be used in this manner, we are
back to a policy type issue. From the wiki:

"The Debian alternatives system creates a way for several programs 
that fullfill the same or similar functions to be listed as alternative 
implementations that are installed simultaneously but with one 
particular implementation designated as the default."

The packages in question are worlds apart in what they do.  They are not
alternatives or substitutes.

Pat
