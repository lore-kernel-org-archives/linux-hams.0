From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: 6PACK - Another question
Date: Wed, 2 Nov 2005 09:13:57 +0000
Message-ID: <20051102091357.GA2703@linux-mips.org>
References: <4368510E.7090006@midcoast.com.au>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4368510E.7090006@midcoast.com.au>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ray Wells <mvc@midcoast.com.au>
Cc: linux-hams@vger.kernel.org

On Wed, Nov 02, 2005 at 04:39:26PM +1100, Ray Wells wrote:

> In the documentation /.../6pack.txt, the author says the driver has only 
> been tested as a module and not built-in to the kernel.
> 
> Has anyone on this list used the 6pack driver in the built-in version 
> with kernel 2.2.20?

Linux 2.2, that's extremly old - ages from before I took over it's
maintainership.  But the code actually looks okay.  Sure you don't want
to upgrade to a piece of software from this decade?

> I always opt for built-in drivers for stuff I know I'll use and maybe 
> this has been my downfall in this case :-(

For custom kernels that will save a tiny amount of memory and give a small,
almost unmeassurable performance gain.  You lose the advantage of for
example being able to re-initialize a subsystem by unloading and reloading
it's module.

Given all that what learned about problems with the 2.2 module loader we
can probably declare it a buggy horror trip from today's perspective.

> No drama, of course, to recompile the kernel with the driver as a module 
> but I may as well test the waters first :-)

The 2.2 6pack driver looks ok, certainly up to the standards of those days
and I wouldn't expect any problems with it from linking it.

73 de DL5RB op Ralf

--
Loc. JN47BS / CQ 14 / ITU 28 / DOK A21
