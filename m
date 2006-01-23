From: Dennis Boone <drb@msu.edu>
Subject: Re: Resource help with Debian
Date: Sun, 22 Jan 2006 20:35:21 -0500
Message-ID: <200601230135.k0N1ZL62015443@yagi.h-net.msu.edu>
References: <9923fd660601221459p6d4d7c8dr5275bf53247ba021@mail.gmail.com>
Return-path: <linux-hams-owner@vger.kernel.org>
In-reply-to: (Your message of Sun, 22 Jan 2006 14:59:41 PST.)
             <9923fd660601221459p6d4d7c8dr5275bf53247ba021@mail.gmail.com> 
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org
Cc: debian-hams@lists.debian.org

Doug,

 >                                   I am at a loss as to where to start,
 > so will need some input from those on this list that can give me
 > some sites that will possibly list tools to configure and make Debian
 > useable for me, a spoiled SuSE user of 6 years, so please be gentle
 > and don't tell me "RTFM will do it all"

I'm not sure you'll find a single wiki-like source of all wisdom, but
I can tackle some of this.

 > I hope to make this my main Amateur radio distro', but am concerned
 > right off the bat because it installed the 2.6.8x kernel (old), but am
 > going to try and keep my mind open to this...  Also I thought the DVD I
 > downloaded was supposed to have the Amateur packages already there, but
 > no such luck, maybe it was on DVD#2, which I haven't downloaded yet...

Debian does package quite a few ham tools.  Is installing additional
packages from the network out of the question for you (i.e. dialup
or some such)?  You really should apply updates anyway.

In theory, it should be fairly straightforward to take the newest kernel
tarball and use the standard Debian tools to build a kernel Debian-style.
You'll probably end up having to entertain this idea, as the AX.25 stack
has had a fair amount of work done recently, and Debian tends to be pretty
conservative about shipping updates.

 > Maybe a list of apt repositories for amateur packages would be nice,
 > since it doesn't seem to list any with the default install...

Once you have the second DVD, or network install configured, you can use
the command:

	apt-cache search <searchstring>

to look through package descriptions.

There's an additional mailing list, debian-hams@lists.debian.org, which
would be a better place to ask these questions.  There is also some useful
documentation at:

	http://www.debian.org/doc/

You might start with the APT HOWTO, and the dselect documentation.

Keep asking questions -- Debian is worth the effort.

Dennis Boone
KB8ZQZ
