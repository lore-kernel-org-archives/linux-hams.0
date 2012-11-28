From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Bug in ax25-apps "call" program
Date: Wed, 28 Nov 2012 10:31:24 +0100
Message-ID: <607FF204-48DE-497F-9244-A695C84A4FB2@osterried.de>
References: <alpine.DEB.2.00.1211272105230.5105@excalibur.caerleon.us>
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
Content-Transfer-Encoding: 8BIT
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1211272105230.5105@excalibur.caerleon.us>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Brian Smith <avalon73@caerleon.us>
Cc: "ralf@linux-mips.org Baechle" <ralf@linux-mips.org>, linux-hams@vger.kernel.org, debian-hams@lists.debian.org

Hello,

i think this bug has been already fixed a 4 weeks ago.

Visit http://www.linux-ax25.org/cvsweb/ax25-apps/call/

This is the patch:
  http://www.linux-ax25.org/cvsweb/ax25-apps/call/call.c.diff?r1=1.25;r2=1.26;f=h

Perhaps it could be a good idea to submit a bug report in ubuntu's bug tracking system, mentioning that there's an upstream fix available. This helps other users, and it helps the package maintainer.
If no one documents, no one finds it in the web. The submitter 4 weeks ago was also an ubuntu user.

Btw, the bug is more than 10 years old (older than the cvs repository). The interesting thing is, that it did not occur (or did not often occur); newer C compilers produce other code and better checks. I use call quite often - but without ncurses gui, and mostly in my scripts; the bug is in the curses part.

I do CC to the linux-hams and debian-hams mailing-list, so it should be found better now.

vy 73,
	- Thomas  dl9sau

On 28.11.2012 um 03:15 Brian Smith wrote:

> In the call program, there's a buffer overflow condition in the start_screen function (call.c) if the call sign is 6 characters long and the SSID is 10 or higher.  I don't know if you've already fixed it, but it didn't seem like it was fixed in the version of 0.0.8 that Ubuntu is including in its "quantal" distribution.
> 
> I would have included a patch in this email, but that patch is on a different machine.  The fix is an easy one, though.  I increased the ID string buffer in the start_screen function (call.c) and the format string for the sprintf call by one character.  Everything else seems to work quite well.

