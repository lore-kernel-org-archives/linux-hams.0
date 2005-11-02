From: Bob Brose N0QBJ <linuxhams@n0qbj-11.ampr.org>
Subject: Re: [PATCH] ax25 fix char type assumption in ax25_digi structure
Date: 2 Nov 2005 05:30:48 -0000
Message-ID: <20051102053048.30592.qmail@kunk.qbjnet.com>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

Ralf said:
> FYI, your patch is on the way to Linus and will hopefully make it into
> 2.6.14.  It turned out that this bug did actually exist since day one
> of the AX.25 history, that is it's present in 2.2 and 2.4 as well.

Thanks!
 
> Took me a little while to figure out why 2.4 was ever working for you;
> the reason is that PPC in 2.2 and PPC and PPC64 in 2.4 compile the
> kernel with -fsigned-char but no longer in 2.6.

Great detective work. It was amusing to see my coworkers try to find
a copy of K&R to look up the proper behavior.
 
> Thanks for tracking this one down!

Thanks very much to you for working on the ax25 code. It's good 
to know someone is maintaining and repairing it. It was starting
to seem pretty marginal...

73,
Bob
