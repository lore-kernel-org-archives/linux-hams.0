From: csmall@enc.com.au (Craig Small)
Subject: Re: ax25 in sparc/solaris OE ?
Date: Tue, 25 Mar 2003 14:54:22 +1100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20030325035422.GA10640@enc.com.au>
References: <000501c2f26d$2fff6920$0600a8c0@hal2000>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000501c2f26d$2fff6920$0600a8c0@hal2000>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dale Osborn <osbornd@starband.net>
Cc: linux-hams@vger.kernel.org

On Mon, Mar 24, 2003 at 08:23:44PM -0500, Dale Osborn wrote:
> In the past, I have run ax25 in x86 debian GNU/Linux operating environment
> (OE) with positive results. Since I am in possession of a number of sparc
> workstations, I am interested in making ax25 work on them. However, I am by
> no means an engineer. But am willing to put in an hour or two a day to learn
> how to port it over. I've been self-teaching C, C++, and perl off and on for
> a few years from O'Reilly books. Am a military certified sysadmin on Solaris
> and HPUX (which means I was never formally trained how to program except
> shell scripting!) Am retired with some spare time on my hands.  I understand
> there are Linux ports available for the sparc architecture, is there any
> experience in this regard here? I would prefer to make it work in the
> Solaris OE using gnu tools. Any ideas where to start?


I got a bunch of T1 and X1 Sun sparc servers running Linux.  You will
get some funnies, mainly to do with programmers expecting a certain
endianism and CPU bit width, but they are mostly solveable.

That would certainly be easier than porting the ax25 code over to
Solaris.  Of course if you want to do it for fun then it is quite
possible.  Remember that the sort of work involved is a lot harder to do
than just normal userland type programs.

  - Craig
-- 
Craig Small VK2XLZ  GnuPG:1C1B D893 1418 2AF4 45EE  95CB C76C E5AC 12CA DFA5
Eye-Net Consulting http://www.enc.com.au/                <csmall@enc.com.au>
MIEEE <csmall@ieee.org>                 Debian developer <csmall@debian.org>
