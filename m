From: Henning Makholm <henning@makholm.net>
Subject: Re: make-3.79.1 bug breaks linux-2.5.24/drivers/net/hamradio/soundmodem
Date: 22 Jun 2002 15:51:24 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <yahadpnifqb.fsf@pc-043.diku.dk>
References: <200206220657.XAA21563@adam.yggdrasil.com>
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: "Adam J. Richter"'s message of "Fri, 21 Jun 2002 23:57:38 -0700"
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: "Adam J. Richter" <adam@yggdrasil.com>
Cc: bug-make@gnu.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, sailer@ife.ee.ethz.ch

Scripsit "Adam J. Richter" <adam@yggdrasil.com>

[Warning: I am not the make maintainer; I just lurk on bug-make]

> $(obj)/sm_tbl_%: $(obj)/gentbl
>         $<

> 	obj was set to "." /usr/src/linux/Rules.make, which was included
> earlier in the Makefile.

> 	Until the make bug is fixed, I have worked around the problem
> by replacing the rule with:

> $(obj)/sm_tbl_%: $(obj)/gentbl
>         PATH=$(obj):$$PATH $<

That looks like an excessively complicated workaround. Why not just

$(obj)/sm_tbl_%: $(obj)/gentbl
	$(obj)/gentbl

?

I'm not sure this is really a bug either. It is a Good Thing that make
tries to normalize the names of targets and dependencies internally,
lest the build may be incomplete or redundant if make does not realize
that foo.bar and ./foo.bar is the same file. It is quite reasonable
for $< to unfold to the *canonical* name of the file in question, I
think.

If one absolutely wants the command to use the exact form of the
dependency that's used in the dependency list, it's easy to simply
reproduce that form, replacing the % by $*

-- 
Henning Makholm                                "You are in a little twisting
                                            maze of passages, all different"
