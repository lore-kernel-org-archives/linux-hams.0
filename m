From: Thomas Osterried <thomas@osterried.de>
Subject: Re: Regression in "ax25: Fix UAF bugs in ax25 timers", patch
 82e31755e55fbcea6a9dfaae5fe4860ade17cbc0
Date: Mon, 23 May 2022 20:53:33 +0200
Message-ID: <YovYLRTLOJnVW4GP@x-berg.in-berlin.de>
References: <283773C4-71DA-4631-B7B3-19497DA9D77A@osterried.de>
 <57922f90.2c358.180f13e25f0.Coremail.duoming@zju.edu.cn>
 <4e38f3dc-88f5-1df9-bdd4-f1d169d67439@blackspace.at>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4e38f3dc-88f5-1df9-bdd4-f1d169d67439@blackspace.at>
Sender: Thomas Osterried <thomas@x-berg.in-berlin.de>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roland Schwarz <roland.schwarz@blackspace.at>
Cc: duoming@zju.edu.cn, Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org

On Mon, May 23, 2022 at 06:05:47PM +0200, Roland Schwarz wrote:
> 
> 
> On 23.05.22 at 16:07 wrote duoming@zju.edu.cn:
> ...>
> > Is there any ways to reproduce this problem?
> > 
> 
> As I understand it, the stuck LISTEN state is the
> infamous long-standing "stuck sockets" bug which
> Dave was pointing at in his mail "Status of the
> stuck sockets bugs" from 2021-06-29.

No, this is a new cause, resulting to the same
symtom (listening state ex-connected sessions).

As said, of you stop timers in cases you don't need
to, nothing tidies up (and nothing honors
the ax25 state machine).


There had been cases observed (since a few years).
I've seen such a case and have a fix I'll present
later. But let's resolve one after another,
not in parallel.

vy 73,
  - Thomas  dl9sau
